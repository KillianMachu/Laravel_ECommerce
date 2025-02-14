<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProductResource\Pages;
use App\Filament\Resources\ProductResource\RelationManagers;
use App\Filament\Resources\ProductResource\RelationManagers\ProductImagesRelationManager;
use App\Models\Product;
use Filament\Forms;
use Filament\Forms\Components\Section;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(191),
                Forms\Components\Textarea::make('description')
                    ->required()
                    ->columnSpanFull(),
                Forms\Components\TextInput::make('price')
                    ->required()
                    ->numeric()
                    ->prefix('€'),
                Forms\Components\TextInput::make('stock')
                    ->required()
                    ->numeric()
                    ->default(0),
                Forms\Components\Toggle::make('is_active')
                    ->required(),
                Forms\Components\TextInput::make('slug')
                    ->required()
                    ->maxLength(191),
                Forms\Components\Select::make('categories')
                    ->relationship('categories', 'name')
                    ->multiple(),
                Forms\Components\Repeater::make('Images')
                    ->relationship('images')
                    ->schema([
                        Forms\Components\FileUpload::make('image_url') // Doit correspondre à la colonne dans product_images
                            ->image()
                            ->imageEditor()
                            ->directory('products')
                            ->required(),
                        Forms\Components\Toggle::make('is_primary')
                            ->label('Image par défaut')
                            ->default(false)
                            ->reactive()
                            ->afterStateUpdated(fn ($state, callable $set, callable $get, $record) => 
                                self::setDefaultImage($state, $record)
                            ),
                    ])
                    ->orderColumn('position')
                    ->defaultItems(0)
                    ->maxItems(5)
                    ->columnSpanFull()
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('price')
                    ->money('EUR')
                    ->sortable(),
                Tables\Columns\TextColumn::make('stock')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_active')
                    ->boolean(),
                Tables\Columns\TextColumn::make('slug')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\ImageColumn::make('images.image_url')
                    ->label('Image')
                    ->defaultImageUrl(fn ($record) => $record->images()->first()?->image_url)
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProducts::route('/'),
            'create' => Pages\CreateProduct::route('/create'),
            'edit' => Pages\EditProduct::route('/{record}/edit'),
        ];
    }

    public static function setDefaultImage($state, $record)
    {
        if ($state && $record) {
            // Récupérer le produit depuis l’image
            $product = $record->product ?? $record->getModel()->product;
    
            if ($product) {
                // Désélectionner toutes les autres images
                $product->images()->update(['is_primary' => false]);
    
                // Mettre l’image actuelle comme par défaut
                $record->update(['is_primary' => true]);
            }
        }
    }
}
