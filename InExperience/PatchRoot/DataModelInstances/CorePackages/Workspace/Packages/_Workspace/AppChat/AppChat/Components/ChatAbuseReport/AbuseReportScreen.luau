local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local frameModule = require(appChat.Components.Common.Frame)
local chatAbuseReportModule = require(script.Parent.ChatAbuseReport)
local inputHandlersModule = require(parent.InputHandlers)
local _ = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local appFocusRoot = focusNavigationUtilsModule.AppFocusRoot
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum

return function(p0)
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), frameModule (ref), chatAbuseReportModule (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local navigation = p0.navigation
	
	return reactModule.createElement(appFocusRoot, {
		isIsolated = true,
		isAutoFocusRoot = true,
		isFocusable = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), navigation (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p1)
						-- upvalues: navigation (copy)
						navigation.pop()
						p1:cancel()
					end)
				}
			}
		end, { navigation })
	}, {
		reactModule.createElement(frameModule, {
			horizontalAlignment = Enum.HorizontalAlignment.Center,
			verticalAlignment = Enum.VerticalAlignment.Center,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			constraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(800, 450) }),
			padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12)
			}),
			abuseReportFlow = reactModule.createElement(chatAbuseReportModule, {
				conversationId = navigation.getParam("conversationId", nil),
				participantId = navigation.getParam("participantId", nil),
				onAbandon = navigation.pop,
				onComplete = navigation.pop
			})
		})
	})
end