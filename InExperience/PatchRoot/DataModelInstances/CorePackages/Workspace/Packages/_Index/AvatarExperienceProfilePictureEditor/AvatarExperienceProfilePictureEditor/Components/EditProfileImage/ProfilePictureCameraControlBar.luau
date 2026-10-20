local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local IconOnlyMenuModule = require(Parent.AvatarExperienceControlBar.IconOnlyMenu)
local _ = require(Parent.AvatarExperienceControlBar.ControlBarTypes)
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), IconName (copy), View (copy), IconOnlyMenuModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromOffset(0, 0))
	local OnZoomIn = p1.onZoomIn
	local OnZoomOut = p1.onZoomOut
	local OnRotateLeft = p1.onRotateLeft
	local OnRotateRight = p1.onRotateRight
	
	return ReactModule.createElement(View, {
		tag = "position-top-left auto-xy",
		testId = "profile-picture-camera-control-bar",
		padding = {
			top = UDim.new(0, p1.topOffset or 0),
			left = UDim.new(0, UseTokensResult.Padding.XLarge)
		},
		ZIndex = p1.zIndex
	}, {
		Rail = ReactModule.createElement(View, {
			tag = "no-clip",
			Size = UseBindingResult,
			selectionGroup = {
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			}
		}, {
			Menu = ReactModule.createElement(IconOnlyMenuModule, {
				activeItemId = "",
				items = ReactModule.useMemo(function()
					-- upvalues: IconName (upval), OnZoomIn (copy), OnZoomOut (copy), OnRotateLeft (copy), OnRotateRight (copy)
					return {
						{
							type = "icon",
							id = "zoom-in",
							isActive = false,
							icon = IconName.PlusLarge,
							onActivated = OnZoomIn
						},
						{
							type = "icon",
							id = "zoom-out",
							isActive = false,
							icon = IconName.Minus,
							onActivated = OnZoomOut
						},
						{ type = "divider", id = "zoom-rotate-divider" },
						{
							type = "icon",
							id = "rotate-left",
							isActive = false,
							icon = IconName.ArrowSpinCounterClockwise,
							onActivated = OnRotateLeft
						},
						{
							type = "icon",
							id = "rotate-right",
							isActive = false,
							icon = IconName.ArrowSpinClockwise,
							onActivated = OnRotateRight
						}
					}
				end, { OnZoomIn, OnZoomOut, OnRotateLeft, OnRotateRight }),
				onAbsoluteSizeChanged = function(Frame: Frame)
					-- upvalues: UseBindingResult2 (copy)
					UseBindingResult2(UDim2.fromOffset(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y))
				end
			})
		})
	})
end