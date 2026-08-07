local collectionViewTypesModule = require(script.CollectionViewTypes)
local calculateSpanAwareGridsModule = require(script.calculateSpanAwareGrids)

return {
	["jest.config"] = script["jest.config"],
	CollectionCarousel = require(script.Carousel.CollectionCarousel),
	CollectionGrid = require(script.Grid.CollectionGrid),
	CollectionViewTypes = collectionViewTypesModule,
	CollectionLayoutCalculators = require(script.CollectionLayoutCalculators),
	calculateItemWidth = require(script.calculateItemWidth),
	calculateNumColumns = require(script.calculateNumColumns),
	useCollectionLayoutParams = require(script.useCollectionLayoutParams),
	useCollectionLayoutConfig = if require(script.Parent.SharedFlags).FFlagLuaAppLayoutParamsInContext then require(script.useCollectionLayoutConfig) else nil,
	useCollectionImpressionsSignal = require(script.useCollectionImpressionsSignal),
	usePageSideMargin = require(script.usePageSideMargin),
	useCollectionSizeBindings = require(script.useCollectionSizeBindings),
	maybeForceDarkTheme = require(script.maybeForceDarkTheme),
	CarouselScrollButtons = require(script.Carousel.CarouselScrollButtons),
	CollectionHeader = require(script.CollectionHeader),
	checkAndFormatPossibleLink = require(script.checkAndFormatPossibleLink),
	CollectionItemSize = collectionViewTypesModule.CollectionItemSize,
	useCollectionLayout = require(script.CollectionLayoutStore.useCollectionLayout),
	CollectionLayoutStoreProvider = require(script.CollectionLayoutStore.CollectionLayoutStoreProvider),
	CollectionLayoutStoreContext = require(script.CollectionLayoutStore.CollectionLayoutStoreContext),
	getItemsPerRow = require(script.CollectionLayoutStore.CollectionBreakpointConfig).getItemsPerRow,
	getMainCollectionLayoutStore = require(script.CollectionLayoutStore.getMainCollectionLayoutStore),
	calculateSpanAwareGrids = calculateSpanAwareGridsModule.calculateSpanAwareGrids,
	processOneGrid = calculateSpanAwareGridsModule.processOneGrid
}