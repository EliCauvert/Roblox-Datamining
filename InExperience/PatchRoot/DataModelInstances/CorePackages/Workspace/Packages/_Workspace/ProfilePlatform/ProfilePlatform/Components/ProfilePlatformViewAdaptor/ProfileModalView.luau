local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local inputHandlersModule = require(parent.InputHandlers)
local fFlagEnableLeftNavOnConsole = require(parent.SharedFlags).FFlagEnableLeftNavOnConsole
local displayModule = require(parent.Display)
local useSignalState = require(parent.SignalsReact).useSignalState
local view = require(parent.Foundation).View

return function(p0) --[[ line: 30 ]]
	-- upvalues: useStyle (ref), fFlagEnableLeftNavOnConsole (ref), useSignalState (ref), displayModule (ref), reactModule (ref), inputHandlersModule (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), view (ref)
	local var4 = useStyle()
	local var5 = if fFlagEnableLeftNavOnConsole then useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return reactModule.createElement("ImageButton", {
		Position = if fFlagEnableLeftNavOnConsole then UDim2.fromOffset(0, -var5.top) else nil,
		Size = if fFlagEnableLeftNavOnConsole then UDim2.new(1, var5.right, 1, var5.top + var5.bottom) else UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = var4.Theme.Overlay.Transparency,
		BackgroundColor3 = var4.Theme.Overlay.Color,
		Active = true,
		AutoButtonColor = false,
		[reactModule.Event.Activated] = p0.navigateBack
	}, {
		ProfileWindow = reactModule.createElement(focusNavigableSurfaceWrapper, {
			isIsolated = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
			frameProps = {
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.fromScale(1, 0),
				Size = UDim2.new(0, p0.viewWidth, 1, 0),
				BackgroundTransparency = var4.Theme.BackgroundDefault.Transparency,
				BackgroundColor3 = var4.Theme.BackgroundDefault.Color
			},
			customEventHandlers = {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = reactModule.useMemo(function() --[[ line: 59 ]]
						-- upvalues: inputHandlersModule (copy), p0 (ref)
						return inputHandlersModule.onRelease(function(p1) --[[ line: 60 ]]
							-- upvalues: p0 (copy)
							p1:cancel()
							p0.navigateBack()
						end)
					end, { p0.navigateBack })
				}
			}
		}, {
			reactModule.useCallback(function(p2) --[[ line: 49 ]]
				-- upvalues: reactModule (copy)
				return reactModule.createElement("TextButton", {
					BackgroundTransparency = 1,
					Text = "",
					Selectable = false,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0, 0)
				}, { p2 })
			end)({
				ProfileTopBarContainer = reactModule.createElement(view, {
					tag = "position-top-left",
					ZIndex = 100,
					Size = UDim2.new(1, 0, 0, 56)
				}, { ProfileTopBar = p0.renderTopBar() }),
				PeekViewContainer = reactModule.createElement("ScrollingFrame", {
					BackgroundTransparency = 1,
					ScrollBarThickness = 0,
					Selectable = false,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					Size = UDim2.new(1, 1, 1, 0),
					Position = UDim2.new(0, 0, 0, 0),
					CanvasSize = UDim2.new(1, 0, 0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y
				}, { Content = p0.renderContent() })
			})
		})
	})
end