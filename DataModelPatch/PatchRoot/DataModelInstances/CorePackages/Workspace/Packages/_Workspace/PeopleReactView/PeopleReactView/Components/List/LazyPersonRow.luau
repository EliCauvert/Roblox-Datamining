local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local UseDeviceOrientationFunction = require(Parent.RobloxAppHooks).useDeviceOrientation
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local _ = require(PeopleReactView.Stores.GetScrollingFrameStore)
local PersonRowModule = require(PeopleReactView.Components.List.PersonRow)
local LazyScrollingComponentModule = require(PeopleReactView.Components.Common.LazyScrollingComponent)
local FlagsService = require(Parent.PeopleService).getService("Flags")
local FFlagPeoplePageRemoveSkeletons = FlagsService.FFlagPeoplePageRemoveSkeletons
local FFlagPeoplePageRemoveUseMemoElements = FlagsService.FFlagPeoplePageRemoveUseMemoElements
local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), FFlagPeoplePageRemoveSkeletons (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	
	return if FFlagPeoplePageRemoveSkeletons then ReactModule.createElement(View, {
		tag = {
			["bg-surface-200 radius-medium"] = true,
			["size-full-2600"] = p1.isPortrait,
			["size-full-1500"] = not p1.isPortrait
		}
	}) else ReactModule.createElement(View, {
		tag = {
			["row bg-surface-200 gap-medium padding-small radius-medium"] = true,
			["size-full-2600"] = p1.isPortrait,
			["size-full-1500"] = not p1.isPortrait
		}
	}, {
		ThumbnailContainer = ReactModule.createElement(View, { tag = "size-1200", LayoutOrder = 1 }, {
			ThumbnailSkeleton = ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1), radius = Radius.Circle })
		}),
		Details = ReactModule.createElement(View, { tag = "col grow size-0-full gap-medium", LayoutOrder = 2 }, {
			NameSkeleton = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.9, 0, 0, UseTokensResult.Size.Size_350),
				radius = Radius.Small
			}),
			HandleSkeleton = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.6, 0, 0, UseTokensResult.Size.Size_350),
				radius = Radius.Small
			})
		})
	})
end)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseDeviceOrientationFunction (copy), RobloxAppEnumsModule (copy), FFlagPeoplePageRemoveUseMemoElements (copy), ReactModule (copy), PersonRowModule (copy), MemoResult (copy), FFlagPeoplePageRemoveSkeletons (copy), View (copy), Skeleton (copy), Radius (copy), LazyScrollingComponentModule (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseDeviceOrientationResultMatch = UseDeviceOrientationFunction() == RobloxAppEnumsModule.DeviceOrientationMode.Portrait
	local Element = if FFlagPeoplePageRemoveUseMemoElements then ReactModule.createElement(PersonRowModule, { person = p1.person, layoutOrder = p1.layoutOrder }) else ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), PersonRowModule (upval), p1 (copy)
		return ReactModule.createElement(PersonRowModule, { person = p1.person, layoutOrder = p1.layoutOrder })
	end, { p1.person, p1.layoutOrder })
	local Element1 = if FFlagPeoplePageRemoveUseMemoElements then ReactModule.createElement(MemoResult, { isPortrait = IsUseDeviceOrientationResultMatch }) else ReactModule.useMemo(function()
		-- upvalues: FFlagPeoplePageRemoveSkeletons (upval), ReactModule (upval), View (upval), IsUseDeviceOrientationResultMatch (copy), Skeleton (upval), Radius (upval), UseTokensResult (copy)
		return if FFlagPeoplePageRemoveSkeletons then ReactModule.createElement(View, {
			tag = {
				["bg-surface-200 radius-medium"] = true,
				["size-full-2600"] = IsUseDeviceOrientationResultMatch,
				["size-full-1500"] = not IsUseDeviceOrientationResultMatch
			}
		}) else ReactModule.createElement(View, {
			tag = {
				["row bg-surface-200 gap-medium padding-small radius-medium"] = true,
				["size-full-2600"] = IsUseDeviceOrientationResultMatch,
				["size-full-1500"] = not IsUseDeviceOrientationResultMatch
			}
		}, {
			ThumbnailContainer = ReactModule.createElement(View, { tag = "size-1200", LayoutOrder = 1 }, {
				ThumbnailSkeleton = ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1), radius = Radius.Circle })
			}),
			Details = ReactModule.createElement(View, { tag = "col grow size-0-full gap-medium", LayoutOrder = 2 }, {
				NameSkeleton = ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.9, 0, 0, UseTokensResult.Size.Size_350),
					radius = Radius.Small
				}),
				HandleSkeleton = ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(0.6, 0, 0, UseTokensResult.Size.Size_350),
					radius = Radius.Small
				})
			})
		})
	end, { IsUseDeviceOrientationResultMatch, UseTokensResult })
	
	return if p1.scrollingFrameStore then ReactModule.createElement(LazyScrollingComponentModule, {
		scrollingFrameAbsolutePositionY = p1.scrollingFrameStore.getAbsolutePositionY,
		scrollingFrameAbsoluteSizeY = p1.scrollingFrameStore.getAbsoluteSizeY,
		scrollingFrameCanvasPositionY = p1.scrollingFrameStore.getCanvasPositionY,
		placeholder = Element1,
		placeholderLayoutOrder = p1.layoutOrder
	}, { PersonRow = Element }) else Element
end)