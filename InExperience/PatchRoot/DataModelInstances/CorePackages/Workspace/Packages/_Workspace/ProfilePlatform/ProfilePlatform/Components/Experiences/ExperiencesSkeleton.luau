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

local function _(p0) --[[ line: 23 | named "getTextSizeAdjustedSquareExperienceTileHeight" ]]
	return function(p1) --[[ line: 24 ]]
		-- upvalues: p0 (ref)
		return p1 + 80 + p0 * 3
	end
end

return function(p2) --[[ line: 29 | named "ExperiencesSkeleton" ]]
	-- upvalues: useLocalization (ref), textKeysModule (ref), useTextSizeOffset (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), squareCollectionGridViewModule (ref), t (ref)
	local var6 = useLocalization({ experiences = textKeysModule.Experiences })
	local _ = nil
	local _ = nil
	local var7 = useTextSizeOffset()
	
	return reactModule.createElement(squareCollectionGridViewModule, {
		layoutOrder = p2.layoutOrder,
		items = reactModule.useMemo(function() --[[ line: 65 ]]
			-- upvalues: p2 (ref)
			local t = {}
			
			for i = 1, p2.numSkeletons do
				table.insert(t, i)
			end
			return t
		end, { p2.numSkeletons }),
		renderItem = reactModule.useCallback(function(_, p3, p4) --[[ line: 40 ]]
			-- upvalues: reactModule (copy), view (copy), skeleton (copy), radius (copy)
			return reactModule.createElement(view, {
				tag = "col gap-small radius-medium",
				LayoutOrder = p3,
				Size = p4
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
		getItemHeight = reactModule.useMemo(function() --[[ line: 36 ]]
			-- upvalues: var7 (write)
			return function(p5) --[[ line: 24 ]]
				-- upvalues: var7 (ref)
				return p5 + 80 + var7 * 3
			end
		end, { var7 }),
		title = var6.experiences,
		overrides = t
	})
end