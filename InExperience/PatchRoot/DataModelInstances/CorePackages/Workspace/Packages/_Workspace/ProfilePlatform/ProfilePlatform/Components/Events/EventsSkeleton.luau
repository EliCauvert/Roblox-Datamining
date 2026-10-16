local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local FoundationModule = require(Parent.Foundation)
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local View = FoundationModule.View
local UseTextSizeOffsetFunction = FoundationModule.Hooks.useTextSizeOffset
local CollectionCarousel = require(Parent.CollectionViews).CollectionCarousel
local UseGetGameTileHeightFunction = require(Parent.GameCollections).useGetGameTileHeight
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

return function(p1) --[[ Line: 21 | Named "EventsSkeleton" ]]
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), UseTextSizeOffsetFunction (copy), UseDesignTokensFunction (copy), UseGetGameTileHeightFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), CollectionCarousel (copy)
	local UseLocalizationResult = UseLocalizationFunction({ events = TextKeysModule.EventsListTitle })
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement(CollectionCarousel, {
		scrollingFrameRef = nil,
		hideHeaderButton = true,
		numColumns = 1,
		fractionalItemAmount = 0.33,
		sideMargin = 0,
		title = UseLocalizationResult.events,
		items = ReactModule.useMemo(function() --[[ Line: 63 ]]
			-- upvalues: p1 (copy)
			local List = {}
			
			for i = 1, p1.numSkeletons do
				table.insert(List, i)
			end
			return List
		end, { p1.numSkeletons }),
		renderItem = ReactModule.useCallback(function(_, LayoutOrder, Size) --[[ Line: 38 ]]
			-- upvalues: ReactModule (upval), View (upval), Skeleton (upval), Radius (upval)
			return ReactModule.createElement(View, {
				tag = "col gap-medium radius-medium",
				LayoutOrder = LayoutOrder,
				Size = Size
			}, {
				ThumbnailSkeleton = ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0.6),
					radius = Radius.Medium
				}),
				NameSkeleton = ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromScale(0.8, 0.15),
					radius = Radius.Medium
				}),
				ButtonSkeleton = ReactModule.createElement(Skeleton, {
					LayoutOrder = 3,
					Size = UDim2.fromScale(1, 0.1),
					radius = Radius.Medium
				})
			}), "Skeleton_" .. LayoutOrder
		end, {}),
		getItemHeight = UseGetGameTileHeightFunction(false, "Event", true, false, false, UseTextSizeOffsetResult, UseDesignTokensResult.Size.Size_700 + UseDesignTokensResult.Size.Size_200),
		columnGap = UseDesignTokensResult.Size.Size_300
	})
end