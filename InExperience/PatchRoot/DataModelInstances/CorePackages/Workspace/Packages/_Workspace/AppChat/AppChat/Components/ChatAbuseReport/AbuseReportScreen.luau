local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FrameModule = require(AppChat.Components.Common.Frame)
local ChatAbuseReportModule = require(script.Parent.ChatAbuseReport)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.ReactFocusNavigation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local AppFocusRoot = FocusNavigationUtilsModule.AppFocusRoot
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum

return function(p1)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FrameModule (copy), ChatAbuseReportModule (copy), AppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local Navigation = p1.navigation
	
	return ReactModule.createElement(AppFocusRoot, {
		isIsolated = true,
		isAutoFocusRoot = true,
		isFocusable = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Navigation (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: Navigation (upval)
						Navigation.pop()
						p2:cancel()
					end)
				}
			}
		end, { Navigation })
	}, {
		(ReactModule.createElement(FrameModule, {
			horizontalAlignment = Enum.HorizontalAlignment.Center,
			verticalAlignment = Enum.VerticalAlignment.Center,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			constraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(800, 450) }),
			padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12)
			}),
			abuseReportFlow = ReactModule.createElement(ChatAbuseReportModule, {
				conversationId = Navigation.getParam("conversationId", nil),
				participantId = Navigation.getParam("participantId", nil),
				onAbandon = Navigation.pop,
				onComplete = Navigation.pop
			})
		}))
	})
end