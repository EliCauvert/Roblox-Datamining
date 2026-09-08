local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local iconOnlyMenuModule = require(parent.AvatarExperienceControlBar.IconOnlyMenu)
local _ = require(parent.AvatarExperienceControlBar.ControlBarTypes)
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), iconName (ref), view (ref), iconOnlyMenuModule (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useBinding(UDim2.fromOffset(0, 0))
	local onZoomIn = p1.onZoomIn
	local onZoomOut = p1.onZoomOut
	local onRotateLeft = p1.onRotateLeft
	local onRotateRight = p1.onRotateRight
	
	return reactModule.createElement(view, {
		tag = "position-top-left auto-xy",
		testId = "profile-picture-camera-control-bar",
		padding = {
			top = UDim.new(0, p1.topOffset or 0),
			left = UDim.new(0, var1.Padding.XLarge)
		},
		ZIndex = p1.zIndex
	}, {
		Rail = reactModule.createElement(view, {
			tag = "no-clip",
			Size = var2,
			selectionGroup = {
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			}
		}, {
			Menu = reactModule.createElement(iconOnlyMenuModule, {
				activeItemId = "",
				items = reactModule.useMemo(function()
					-- upvalues: iconName (copy), onZoomIn (ref), onZoomOut (ref), onRotateLeft (ref), onRotateRight (ref)
					return {
						{
							type = "icon",
							id = "zoom-in",
							isActive = false,
							icon = iconName.PlusLarge,
							onActivated = onZoomIn
						},
						{
							type = "icon",
							id = "zoom-out",
							isActive = false,
							icon = iconName.Minus,
							onActivated = onZoomOut
						},
						{ type = "divider", id = "zoom-rotate-divider" },
						{
							type = "icon",
							id = "rotate-left",
							isActive = false,
							icon = iconName.ArrowSpinCounterClockwise,
							onActivated = onRotateLeft
						},
						{
							type = "icon",
							id = "rotate-right",
							isActive = false,
							icon = iconName.ArrowSpinClockwise,
							onActivated = onRotateRight
						}
					}
				end, { onZoomIn, onZoomOut, onRotateLeft, onRotateRight }),
				onAbsoluteSizeChanged = function(value)
					-- upvalues: var3 (ref)
					var3(UDim2.fromOffset(value.AbsoluteSize.X, value.AbsoluteSize.Y))
				end
			})
		})
	})
end