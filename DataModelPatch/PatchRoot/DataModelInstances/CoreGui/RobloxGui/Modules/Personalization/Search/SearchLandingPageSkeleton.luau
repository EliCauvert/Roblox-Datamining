local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseTextSizeOffsetFunction = require(CorePackages.Packages.UIBlox).Core.Style.useTextSizeOffset
local GameTileModule = require(CorePackages.Workspace.Packages.GameTile)
local GameTileConstants = GameTileModule.GameTileConstants
local GameCollectionsModule = require(CorePackages.Workspace.Packages.GameCollections)
local UseGameCollectionLayoutParamsFunction = GameCollectionsModule.useGameCollectionLayoutParams
local UseGetGameTileHeightFunction = GameCollectionsModule.useGetGameTileHeight
local UseCollectionSizeBindingsFunction = require(CorePackages.Workspace.Packages.CollectionViews).useCollectionSizeBindings
local FIntSearchLandingPageSideMargin = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.Search.FIntSearchLandingPageSideMargin
local GAMECAROUSELSIDECOMPACTPADDING = require(CorePackages.Workspace.Packages.DiscoveryTypes).Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING

function SearchLandingPageSkeleton(Frame)
	-- upvalues: ReactModule (copy), UseTextSizeOffsetFunction (copy), UseTokensFunction (copy), GameTileModule (copy), GameTileConstants (copy), UseGetGameTileHeightFunction (copy), GAMECAROUSELSIDECOMPACTPADDING (copy), FIntSearchLandingPageSideMargin (copy), UseGameCollectionLayoutParamsFunction (copy), UseCollectionSizeBindingsFunction (copy), View (copy), Skeleton (copy), Radius (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseTokensResult = UseTokensFunction()
	local Narrow = GameTileModule.GameTileTypes.GameTileLayoutType.Narrow
	local UseGetGameTileHeightResult = UseGetGameTileHeightFunction(true, Narrow, false, false, false, UseTextSizeOffsetResult, nil, GameTileConstants.TileTextLines[Narrow] and GameTileConstants.TileTextLines[Narrow].titleTextLines)
	local GAMECAROUSELSIDECOMPACTPADDING1 = if Frame.isCompactView then GAMECAROUSELSIDECOMPACTPADDING else FIntSearchLandingPageSideMargin
	local UseGameCollectionLayoutParamsResult = UseGameCollectionLayoutParamsFunction(Narrow, UseStateResult, false, { sideMargin = GAMECAROUSELSIDECOMPACTPADDING1 }, Frame.defaultContainerSize)
	local UseCollectionSizeBindingsResult, _, UseCollectionSizeBindingsResult3, UseCollectionSizeBindingsResult4 = UseCollectionSizeBindingsFunction(UseGameCollectionLayoutParamsResult.numColumns, UseGameCollectionLayoutParamsResult.columnGap, UseGameCollectionLayoutParamsResult.sideMargin, UseGameCollectionLayoutParamsResult.fractionalItemAmount, UseGetGameTileHeightResult, nil)
	
	return ReactModule.createElement(View, {
		ClipsDescendants = true,
		ref = function(p1)
			-- upvalues: UseStateResult2 (copy), UseCollectionSizeBindingsResult4 (copy)
			UseStateResult2(p1)
			UseCollectionSizeBindingsResult4(p1)
		end,
		LayoutOrder = Frame.LayoutOrder,
		Size = Frame.Size,
		onAbsoluteSizeChanged = UseCollectionSizeBindingsResult3
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			[ReactModule.Change.AbsoluteContentSize] = Frame.onAbsoluteContentSizeChanged
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, GAMECAROUSELSIDECOMPACTPADDING1),
			PaddingRight = UDim.new(0, GAMECAROUSELSIDECOMPACTPADDING1)
		}),
		TopPadding = ReactModule.createElement(View, {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, Frame.topPadding or 0)
		}),
		TitleSkeleton = ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			Size = UDim2.new(0, UseTokensResult.Size.Size_3000, 0, UseTokensResult.Typography.HeadingSmall.FontSize)
		}),
		PaddingBetweenHeaderAndItems = ReactModule.createElement(View, {
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, UseTokensResult.Padding.Large)
		}),
		CarouselSkeleton = ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 4 }, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, UseGameCollectionLayoutParamsResult.columnGap)
			})
		}, (ReactModule.useMemo(function()
			-- upvalues: UseGameCollectionLayoutParamsResult (copy), ReactModule (upval), View (upval), UseCollectionSizeBindingsResult (copy), Skeleton (upval), Radius (upval), UseTokensResult (copy)
			local Elements = {}
			
			for i = 1, UseGameCollectionLayoutParamsResult.numColumns + math.ceil(UseGameCollectionLayoutParamsResult.fractionalItemAmount) do
				Elements[`GameTileSkeleton_{i}`] = ReactModule.createElement(View, {
					tag = "col flex-y-between",
					Size = UseCollectionSizeBindingsResult:map(function(Vector): UDim2
						return UDim2.new(0, Vector.X, 0, Vector.Y)
					end),
					LayoutOrder = i
				}, {
					MainView = ReactModule.createElement(View, {
						tag = "col align-x-left size-full-0 auto-y",
						LayoutOrder = 1
					}, {
						Icon = ReactModule.createElement(View, {
							LayoutOrder = 1,
							Size = UseCollectionSizeBindingsResult:map(function(Vector): UDim2
								return UDim2.fromOffset(Vector.X, Vector.X)
							end)
						}, {
							IconSkeleton = ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1), radius = Radius.Medium })
						}),
						PaddingBetweenIconAndTitle = ReactModule.createElement(View, {
							LayoutOrder = 2,
							Size = UDim2.new(1, 0, 0, UseTokensResult.Padding.Medium)
						}),
						FirstTitleLine = ReactModule.createElement(Skeleton, {
							LayoutOrder = 3,
							Size = UDim2.new(1, 0, 0, UseTokensResult.Typography.BodyMedium.FontSize)
						}),
						PaddingBetweenTitleLines = ReactModule.createElement(View, {
							LayoutOrder = 4,
							Size = UDim2.new(1, 0, 0, UseTokensResult.Typography.BodyMedium.LineHeight)
						}),
						SecondTitleLine = ReactModule.createElement(Skeleton, {
							LayoutOrder = 5,
							Size = UDim2.new(0.7, 0, 0, UseTokensResult.Typography.BodyMedium.FontSize)
						})
					}),
					Rating = ReactModule.createElement(Skeleton, {
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_500)
					})
				})
			end
			return Elements
		end, {
			UseGameCollectionLayoutParamsResult.numColumns,
			UseGameCollectionLayoutParamsResult.fractionalItemAmount,
			UseTokensResult.Typography.BodyMedium.FontSize, UseTokensResult.Padding.Small,
			UseTokensResult.Padding.Medium, UseTokensResult.Size.Size_500,
			UseTokensResult.Typography.BodyMedium.LineHeight, UseStateResult
		}))),
		BottomPadding = ReactModule.createElement(View, {
			LayoutOrder = 5,
			Size = UDim2.new(1, 0, 0, Frame.bottomPadding or 0)
		})
	})
end

return SearchLandingPageSkeleton