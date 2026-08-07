local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local useDeviceOrientation = require(parent.RobloxAppHooks).useDeviceOrientation
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local peopleServiceModule = require(parent.PeopleService)
local _ = require(peopleReactView.Stores.GetScrollingFrameStore)
local personRowModule = require(peopleReactView.Components.List.PersonRow)
local lazyScrollingComponentModule = require(peopleReactView.Components.Common.LazyScrollingComponent)
local flags = peopleServiceModule.getService("Flags")
local fFlagPeoplePageRemoveSkeletons = flags.FFlagPeoplePageRemoveSkeletons
local fFlagPeoplePageRemoveUseMemoElements = flags.FFlagPeoplePageRemoveUseMemoElements
local var8 = reactModule.memo(function(p0) --[[ line: 33 ]]
	-- upvalues: useTokens (ref), fFlagPeoplePageRemoveSkeletons (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local var9 = useTokens()
	
	return if fFlagPeoplePageRemoveSkeletons then reactModule.createElement(view, {
		tag = {
			["bg-surface-200 radius-medium"] = true,
			["size-full-2600"] = p0.isPortrait,
			["size-full-1500"] = not p0.isPortrait
		}
	}) else reactModule.createElement(view, {
		tag = {
			["row bg-surface-200 gap-medium padding-small radius-medium"] = true,
			["size-full-2600"] = p0.isPortrait,
			["size-full-1500"] = not p0.isPortrait
		}
	}, {
		ThumbnailContainer = reactModule.createElement(view, { tag = "size-1200", LayoutOrder = 1 }, {
			ThumbnailSkeleton = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Circle })
		}),
		Details = reactModule.createElement(view, { tag = "col grow size-0-full gap-medium", LayoutOrder = 2 }, {
			NameSkeleton = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.9, 0, 0, var9.Size.Size_350),
				radius = radius.Small
			}),
			HandleSkeleton = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.6, 0, 0, var9.Size.Size_350),
				radius = radius.Small
			})
		})
	})
end)

return reactModule.memo(function(p1) --[[ line: 88 ]]
	-- upvalues: useTokens (ref), useDeviceOrientation (ref), robloxAppEnumsModule (ref), fFlagPeoplePageRemoveUseMemoElements (ref), reactModule (ref), personRowModule (ref), var8 (ref), fFlagPeoplePageRemoveSkeletons (ref), view (ref), skeleton (ref), radius (ref), lazyScrollingComponentModule (ref)
	local var10 = useTokens()
	local var11 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait
	local var12 = if fFlagPeoplePageRemoveUseMemoElements then reactModule.createElement(personRowModule, { person = p1.person, layoutOrder = p1.layoutOrder }) else reactModule.useMemo(function() --[[ line: 100 ]]
		-- upvalues: reactModule (copy), personRowModule (copy), p1 (ref)
		return reactModule.createElement(personRowModule, { person = p1.person, layoutOrder = p1.layoutOrder })
	end, { p1.person, p1.layoutOrder })
	
	return if p1.scrollingFrameStore then reactModule.createElement(lazyScrollingComponentModule, {
		scrollingFrameAbsolutePositionY = p1.scrollingFrameStore.getAbsolutePositionY,
		scrollingFrameAbsoluteSizeY = p1.scrollingFrameStore.getAbsoluteSizeY,
		scrollingFrameCanvasPositionY = p1.scrollingFrameStore.getCanvasPositionY,
		placeholder = if fFlagPeoplePageRemoveUseMemoElements then reactModule.createElement(var8, { isPortrait = var11 }) else reactModule.useMemo(function() --[[ line: 116 ]]
			-- upvalues: fFlagPeoplePageRemoveSkeletons (copy), reactModule (copy), view (copy), var11 (ref), skeleton (copy), radius (copy), var10 (ref)
			return if fFlagPeoplePageRemoveSkeletons then reactModule.createElement(view, {
				tag = {
					["bg-surface-200 radius-medium"] = true,
					["size-full-2600"] = var11,
					["size-full-1500"] = not var11
				}
			}) else reactModule.createElement(view, {
				tag = {
					["row bg-surface-200 gap-medium padding-small radius-medium"] = true,
					["size-full-2600"] = var11,
					["size-full-1500"] = not var11
				}
			}, {
				ThumbnailContainer = reactModule.createElement(view, { tag = "size-1200", LayoutOrder = 1 }, {
					ThumbnailSkeleton = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Circle })
				}),
				Details = reactModule.createElement(view, { tag = "col grow size-0-full gap-medium", LayoutOrder = 2 }, {
					NameSkeleton = reactModule.createElement(skeleton, {
						LayoutOrder = 1,
						Size = UDim2.new(0.9, 0, 0, var10.Size.Size_350),
						radius = radius.Small
					}),
					HandleSkeleton = reactModule.createElement(skeleton, {
						LayoutOrder = 2,
						Size = UDim2.new(0.6, 0, 0, var10.Size.Size_350),
						radius = radius.Small
					})
				})
			})
		end, { var11, var10 }),
		placeholderLayoutOrder = p1.layoutOrder
	}, { PersonRow = var12 }) else var12
end)