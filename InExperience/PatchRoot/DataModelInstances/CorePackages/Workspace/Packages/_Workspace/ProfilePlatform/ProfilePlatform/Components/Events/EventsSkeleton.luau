local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local foundationModule = require(parent.Foundation)
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local view = foundationModule.View
local useTextSizeOffset = foundationModule.Hooks.useTextSizeOffset
local collectionCarousel = require(parent.CollectionViews).CollectionCarousel
local useGetGameTileHeight = require(parent.GameCollections).useGetGameTileHeight
local useDesignTokens = require(parent.Style).useDesignTokens

return function(p0)
	-- upvalues: useLocalization (ref), textKeysModule (ref), useTextSizeOffset (ref), useDesignTokens (ref), useGetGameTileHeight (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), collectionCarousel (ref)
	local var4 = useDesignTokens()
	
	return reactModule.createElement(collectionCarousel, {
		scrollingFrameRef = nil,
		hideHeaderButton = true,
		numColumns = 1,
		fractionalItemAmount = 0.33,
		sideMargin = 0,
		title = useLocalization({ events = textKeysModule.EventsListTitle }).events,
		items = reactModule.useMemo(function()
			-- upvalues: p0 (ref)
			local t = {}
			
			for i = 1, p0.numSkeletons do
				table.insert(t, i)
			end
			return t
		end, { p0.numSkeletons }),
		renderItem = reactModule.useCallback(function(_, p1, p2)
			-- upvalues: reactModule (copy), view (copy), skeleton (copy), radius (copy)
			return reactModule.createElement(view, {
				tag = "col gap-medium radius-medium",
				LayoutOrder = p1,
				Size = p2
			}, {
				ThumbnailSkeleton = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0.6),
					radius = radius.Medium
				}),
				NameSkeleton = reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromScale(0.8, 0.15),
					radius = radius.Medium
				}),
				ButtonSkeleton = reactModule.createElement(skeleton, {
					LayoutOrder = 3,
					Size = UDim2.fromScale(1, 0.1),
					radius = radius.Medium
				})
			}), "Skeleton_" .. p1
		end, {}),
		getItemHeight = useGetGameTileHeight(false, "Event", true, false, false, useTextSizeOffset(), var4.Size.Size_700 + var4.Size.Size_200),
		columnGap = var4.Size.Size_300
	})
end