local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local squareCollectionGridViewModule = require(profilePlatform.BaseComponents.CollectionGridViews.SquareCollectionGridView)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local foundationModule = require(parent.Foundation)
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local view = foundationModule.View

local var5 = function(p0) --[[ line: 21 ]]
	return p0 + 49
end

return function(p1) --[[ line: 25 | named "StoreGridSkeleton" ]]
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), squareCollectionGridViewModule (ref), var5 (ref)
	return reactModule.createElement(squareCollectionGridViewModule, {
		layoutOrder = p1.layoutOrder,
		items = reactModule.useMemo(function() --[[ line: 55 ]]
			-- upvalues: p1 (ref)
			local t = {}
			
			for i = 1, p1.numSkeletons do
				table.insert(t, i)
			end
			return t
		end, { p1.numSkeletons }),
		renderItem = reactModule.useCallback(function(_, p2, p3) --[[ line: 30 ]]
			-- upvalues: reactModule (copy), view (copy), skeleton (copy), radius (copy)
			return reactModule.createElement(view, {
				tag = "col gap-small radius-medium",
				LayoutOrder = p2,
				Size = p3
			}, {
				ThumbnailSkeleton = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0.7),
					radius = radius.Medium
				}),
				NameSkeleton = reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromScale(0.8, 0.09),
					radius = radius.Medium
				}),
				ButtonSkeleton = reactModule.createElement(skeleton, {
					LayoutOrder = 3,
					Size = UDim2.fromScale(0.6, 0.09),
					radius = radius.Medium
				})
			}), "Skeleton_" .. p2
		end, {}),
		getItemHeight = var5,
		title = useLocalization({ store = textKeysModule.Store }).store,
		overrides = { numColumns = p1.numColumns or 3 }
	})
end