local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent.InputHandlers)
local FFlagEnableLeftNavOnConsole = require(Parent.SharedFlags).FFlagEnableLeftNavOnConsole
local DisplayModule = require(Parent.Display)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local View = require(Parent.Foundation).View

return function(p1)
	-- upvalues: UseStyleFunction (copy), FFlagEnableLeftNavOnConsole (copy), UseSignalStateFunction (copy), DisplayModule (copy), ReactModule (copy), InputHandlersModule (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy), View (copy)
	local UseStyleResult = UseStyleFunction()
	local UseSignalStateResult = if FFlagEnableLeftNavOnConsole then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return ReactModule.createElement("ImageButton", {
		Position = if FFlagEnableLeftNavOnConsole then UDim2.fromOffset(0, -UseSignalStateResult.top) else nil,
		Size = if FFlagEnableLeftNavOnConsole then UDim2.new(1, UseSignalStateResult.right, 1, UseSignalStateResult.top + UseSignalStateResult.bottom) else UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = UseStyleResult.Theme.Overlay.Transparency,
		BackgroundColor3 = UseStyleResult.Theme.Overlay.Color,
		Active = true,
		AutoButtonColor = false,
		[ReactModule.Event.Activated] = p1.navigateBack
	}, {
		ProfileWindow = ReactModule.createElement(FocusNavigableSurfaceWrapper, {
			isIsolated = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			frameProps = {
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.fromScale(1, 0),
				Size = UDim2.new(0, p1.viewWidth, 1, 0),
				BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
				BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
			},
			customEventHandlers = {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = ReactModule.useMemo(function()
						-- upvalues: InputHandlersModule (upval), p1 (copy)
						return InputHandlersModule.onRelease(function(p2)
							-- upvalues: p1 (upval)
							p2:cancel()
							p1.navigateBack()
						end)
					end, { p1.navigateBack })
				}
			}
		}, {
			ReactModule.useCallback(function(p2)
				-- upvalues: ReactModule (upval)
				return ReactModule.createElement("TextButton", {
					BackgroundTransparency = 1,
					Text = "",
					Selectable = false,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0, 0)
				}, { p2 })
			end)({
				ProfileTopBarContainer = ReactModule.createElement(View, {
					tag = "position-top-left",
					ZIndex = 100,
					Size = UDim2.new(1, 0, 0, 56)
				}, { ProfileTopBar = p1.renderTopBar() }),
				PeekViewContainer = ReactModule.createElement("ScrollingFrame", {
					BackgroundTransparency = 1,
					ScrollBarThickness = 0,
					Selectable = false,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					Size = UDim2.new(1, 1, 1, 0),
					Position = UDim2.new(0, 0, 0, 0),
					CanvasSize = UDim2.new(1, 0, 0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y
				}, { Content = p1.renderContent() })
			})
		})
	})
end