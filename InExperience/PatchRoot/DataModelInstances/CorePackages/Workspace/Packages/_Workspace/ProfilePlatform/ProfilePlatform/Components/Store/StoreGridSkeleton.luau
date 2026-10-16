local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local SquareCollectionGridViewModule = require(ProfilePlatform.BaseComponents.CollectionGridViews.SquareCollectionGridView)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local FoundationModule = require(Parent.Foundation)
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local View = FoundationModule.View

local function GetItemHeight(p1: number): number --[[ Line: 21 ]]
	return p1 + 49
end

return function(p1) --[[ Line: 25 | Named "StoreGridSkeleton" ]]
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), SquareCollectionGridViewModule (copy), GetItemHeight (copy)
	return ReactModule.createElement(SquareCollectionGridViewModule, {
		layoutOrder = p1.layoutOrder,
		items = ReactModule.useMemo(function() --[[ Line: 55 ]]
			-- upvalues: p1 (copy)
			local List = {}
			
			for i = 1, p1.numSkeletons do
				table.insert(List, i)
			end
			return List
		end, { p1.numSkeletons }),
		renderItem = ReactModule.useCallback(function(_, LayoutOrder, Size) --[[ Line: 30 ]]
			-- upvalues: ReactModule (upval), View (upval), Skeleton (upval), Radius (upval)
			return ReactModule.createElement(View, {
				tag = "col gap-small radius-medium",
				LayoutOrder = LayoutOrder,
				Size = Size
			}, {
				ThumbnailSkeleton = ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0.7),
					radius = Radius.Medium
				}),
				NameSkeleton = ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromScale(0.8, 0.09),
					radius = Radius.Medium
				}),
				ButtonSkeleton = ReactModule.createElement(Skeleton, {
					LayoutOrder = 3,
					Size = UDim2.fromScale(0.6, 0.09),
					radius = Radius.Medium
				})
			}), "Skeleton_" .. LayoutOrder
		end, {}),
		getItemHeight = GetItemHeight,
		title = UseLocalizationFunction({ store = TextKeysModule.Store }).store,
		overrides = { numColumns = p1.numColumns or 3 }
	})
end