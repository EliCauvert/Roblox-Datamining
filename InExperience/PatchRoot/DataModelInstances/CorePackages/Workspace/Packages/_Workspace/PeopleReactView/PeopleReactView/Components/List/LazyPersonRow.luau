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
local var1 = reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), fFlagPeoplePageRemoveSkeletons (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local var2 = useTokens()
	
	return if fFlagPeoplePageRemoveSkeletons then reactModule.createElement(view, {
		tag = {
			["bg-surface-200 radius-medium"] = true,
			["size-full-2600"] = p1.isPortrait,
			["size-full-1500"] = not p1.isPortrait
		}
	}) else reactModule.createElement(view, {
		tag = {
			["row bg-surface-200 gap-medium padding-small radius-medium"] = true,
			["size-full-2600"] = p1.isPortrait,
			["size-full-1500"] = not p1.isPortrait
		}
	}, {
		ThumbnailContainer = reactModule.createElement(view, { tag = "size-1200", LayoutOrder = 1 }, {
			ThumbnailSkeleton = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Circle })
		}),
		Details = reactModule.createElement(view, { tag = "col grow size-0-full gap-medium", LayoutOrder = 2 }, {
			NameSkeleton = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.9, 0, 0, var2.Size.Size_350),
				radius = radius.Small
			}),
			HandleSkeleton = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.6, 0, 0, var2.Size.Size_350),
				radius = radius.Small
			})
		})
	})
end)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useDeviceOrientation (ref), robloxAppEnumsModule (ref), fFlagPeoplePageRemoveUseMemoElements (ref), reactModule (ref), personRowModule (ref), var1 (ref), fFlagPeoplePageRemoveSkeletons (ref), view (ref), skeleton (ref), radius (ref), lazyScrollingComponentModule (ref)
	local var2 = useTokens()
	local var3 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait
	local var4 = if fFlagPeoplePageRemoveUseMemoElements then reactModule.createElement(personRowModule, { person = p1.person, layoutOrder = p1.layoutOrder }) else reactModule.useMemo(function()
		-- upvalues: reactModule (copy), personRowModule (copy), p1 (ref)
		return reactModule.createElement(personRowModule, { person = p1.person, layoutOrder = p1.layoutOrder })
	end, { p1.person, p1.layoutOrder })
	
	return if p1.scrollingFrameStore then reactModule.createElement(lazyScrollingComponentModule, {
		scrollingFrameAbsolutePositionY = p1.scrollingFrameStore.getAbsolutePositionY,
		scrollingFrameAbsoluteSizeY = p1.scrollingFrameStore.getAbsoluteSizeY,
		scrollingFrameCanvasPositionY = p1.scrollingFrameStore.getCanvasPositionY,
		placeholder = if fFlagPeoplePageRemoveUseMemoElements then reactModule.createElement(var1, { isPortrait = var3 }) else reactModule.useMemo(function()
			-- upvalues: fFlagPeoplePageRemoveSkeletons (copy), reactModule (copy), view (copy), var3 (ref), skeleton (copy), radius (copy), var2 (ref)
			return if fFlagPeoplePageRemoveSkeletons then reactModule.createElement(view, {
				tag = {
					["bg-surface-200 radius-medium"] = true,
					["size-full-2600"] = var3,
					["size-full-1500"] = not var3
				}
			}) else reactModule.createElement(view, {
				tag = {
					["row bg-surface-200 gap-medium padding-small radius-medium"] = true,
					["size-full-2600"] = var3,
					["size-full-1500"] = not var3
				}
			}, {
				ThumbnailContainer = reactModule.createElement(view, { tag = "size-1200", LayoutOrder = 1 }, {
					ThumbnailSkeleton = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Circle })
				}),
				Details = reactModule.createElement(view, { tag = "col grow size-0-full gap-medium", LayoutOrder = 2 }, {
					NameSkeleton = reactModule.createElement(skeleton, {
						LayoutOrder = 1,
						Size = UDim2.new(0.9, 0, 0, var2.Size.Size_350),
						radius = radius.Small
					}),
					HandleSkeleton = reactModule.createElement(skeleton, {
						LayoutOrder = 2,
						Size = UDim2.new(0.6, 0, 0, var2.Size.Size_350),
						radius = radius.Small
					})
				})
			})
		end, { var3, var2 }),
		placeholderLayoutOrder = p1.layoutOrder
	}, { PersonRow = var4 }) else var4
end)