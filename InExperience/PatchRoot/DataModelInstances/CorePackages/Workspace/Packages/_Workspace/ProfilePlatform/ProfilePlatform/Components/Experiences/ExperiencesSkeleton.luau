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
local useTextSizeOffset = foundationModule.Hooks.useTextSizeOffset
local t = { numColumns = 3 }

local function _(p1)
	return function(p2)
		-- upvalues: p1 (ref)
		return p2 + 80 + p1 * 3
	end
end

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), useTextSizeOffset (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), squareCollectionGridViewModule (ref), t (ref)
	local var1 = useLocalization({ experiences = textKeysModule.Experiences })
	local _ = nil
	local _ = nil
	local var2 = useTextSizeOffset()
	
	return reactModule.createElement(squareCollectionGridViewModule, {
		layoutOrder = p1.layoutOrder,
		items = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			local t = {}
			
			for i = 1, p1.numSkeletons do
				table.insert(t, i)
			end
			return t
		end, { p1.numSkeletons }),
		renderItem = reactModule.useCallback(function(_, p2, p3)
			-- upvalues: reactModule (copy), view (copy), skeleton (copy), radius (copy)
			return reactModule.createElement(view, {
				tag = "col gap-small radius-medium",
				LayoutOrder = p2,
				Size = p3
			}, {
				ThumbnailSkeleton = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0.6),
					radius = radius.Medium
				}),
				NameSkeleton = reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromScale(0.8, 0.18),
					radius = radius.Medium
				}),
				ButtonSkeleton = reactModule.createElement(skeleton, {
					LayoutOrder = 3,
					Size = UDim2.fromScale(0.6, 0.08),
					radius = radius.Medium
				})
			}), "Skeleton_" .. p3
		end, {}),
		getItemHeight = reactModule.useMemo(function()
			-- upvalues: var2 (write)
			return function(p2)
				-- upvalues: var2 (ref)
				return p2 + 80 + var2 * 3
			end
		end, { var2 }),
		title = var1.experiences,
		overrides = t
	})
end