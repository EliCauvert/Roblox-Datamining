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
local UseTextSizeOffsetFunction = FoundationModule.Hooks.useTextSizeOffset
local Overrides = { numColumns = 3 }

local function _(p1)
	return function(p2: number): number
		-- upvalues: p1 (copy)
		return p2 + 80 + p1 * 3
	end
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), UseTextSizeOffsetFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), SquareCollectionGridViewModule (copy), Overrides (copy)
	local UseLocalizationResult = UseLocalizationFunction({ experiences = TextKeysModule.Experiences })
	local UseTextSizeOffsetResult = nil
	UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	
	return ReactModule.createElement(SquareCollectionGridViewModule, {
		layoutOrder = p1.layoutOrder,
		items = ReactModule.useMemo(function()
			-- upvalues: p1 (copy)
			local List = {}
			
			for i = 1, p1.numSkeletons do
				table.insert(List, i)
			end
			return List
		end, { p1.numSkeletons }),
		renderItem = ReactModule.useCallback(function(_, LayoutOrder, Size)
			-- upvalues: ReactModule (upval), View (upval), Skeleton (upval), Radius (upval)
			return ReactModule.createElement(View, {
				tag = "col gap-small radius-medium",
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
					Size = UDim2.fromScale(0.8, 0.18),
					radius = Radius.Medium
				}),
				ButtonSkeleton = ReactModule.createElement(Skeleton, {
					LayoutOrder = 3,
					Size = UDim2.fromScale(0.6, 0.08),
					radius = Radius.Medium
				})
			}), "Skeleton_" .. LayoutOrder
		end, {}),
		getItemHeight = ReactModule.useMemo(function()
			-- upvalues: UseTextSizeOffsetResult (ref)
			local UseTextSizeOffsetResult1 = UseTextSizeOffsetResult
			
			return function(p2: number): number
				-- upvalues: UseTextSizeOffsetResult1 (copy)
				return p2 + 80 + UseTextSizeOffsetResult1 * 3
			end
		end, { UseTextSizeOffsetResult }),
		title = UseLocalizationResult.experiences,
		overrides = Overrides
	})
end