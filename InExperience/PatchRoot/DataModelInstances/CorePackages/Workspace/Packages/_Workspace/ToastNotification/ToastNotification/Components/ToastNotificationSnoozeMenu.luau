local parent = script.Parent.Parent
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local notificationTypeEnum = require(parent.type).NotificationTypeEnum
local showNotificationSnoozeMenuSignal = require(parent.Signals).ShowNotificationSnoozeMenuSignal
local dismissNotificationSnoozeMenuSignal = require(parent.Signals).DismissNotificationSnoozeMenuSignal
local notificationSnoozeMenuVisibleSignal = require(parent.Signals).NotificationSnoozeMenuVisibleSignal
local default = require(parent.ToastNotificationSnoozeManager).default
local useTokens = require(parent_1.Foundation).Hooks.useTokens
local cryo = dependenciesModule.Cryo
local localization = dependenciesModule.Localization
local react = dependenciesModule.React
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local useLocalization = localization.Hooks.useLocalization
local colors = UIBlox.App.Style.Colors
local interactable = UIBlox.Core.Control.Interactable
local useCursor = UIBlox.App.SelectionCursor.useCursor
local useStyle = UIBlox.Core.Style.useStyle
local focusNavigationUtilsModule = require(parent_1.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local focusRoot = focusNavigationUtilsModule.FocusRoot
local inputHandlersModule = require(parent_1.InputHandlers)
local _ = require(parent_1.ReactFocusNavigation)
local fFlagEnableAppChatSnoozeMenuFocus = require(parent_1.SharedFlags).FFlagEnableAppChatSnoozeMenuFocus
local getFFlagAppChatInExpToastSnoozeMenuDismissFix = require(parent_1.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local getFFlagIsSquadEnabled = require(parent_1.SharedFlags).GetFFlagIsSquadEnabled
local snoozeMenuTextXAlignment = game:DefineFastFlag("SnoozeMenuTextXAlignment", false)
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}
local t_1 = {
	[notificationTypeEnum.ChatNewMessage] = if require(parent_1.SocialExperiments).ArgoPartyExperimentation.getIsRenameEnabled() then if require(parent_1.UniversalAppPolicy).getAppFeaturePolicies().getCanSeeChatTerminology() then "CommonUI.Features.Label.Chat" else "Feature.Squads.Label.Party" elseif getFFlagIsSquadEnabled() then "Feature.Squads.Label.Party" else "Feature.Chat.Action.StartChatWithFriends"
}
local _ = nil
local t_2 = {
	[1] = { textKey = "fifteenMinutes", durationMinutes = 15 },
	[2] = { textKey = "fourHours", durationMinutes = 240 },
	[3] = { textKey = "oneDay", durationMinutes = 1440 },
	[4] = { textKey = "untilITurnItBackOn", durationMinutes = -1 }
}

return function()
	-- upvalues: useStyle (ref), fFlagEnableAppChatSnoozeMenuFocus (ref), useTokens (ref), useLocalization (ref), cryo (ref), t_1 (ref), react (ref), showNotificationSnoozeMenuSignal (ref), getFFlagAppChatInExpToastSnoozeMenuDismissFix (ref), dismissNotificationSnoozeMenuSignal (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), notificationSnoozeMenuVisibleSignal (ref), useCursor (ref), t_2 (write), colors (ref), default (ref), interactable (ref), focusRoot (ref), t (ref), focusNavigableSurfaceIdentifierEnum (ref), snoozeMenuTextXAlignment (ref), roact (ref)
	local var7 = useStyle()
	local var8 = if fFlagEnableAppChatSnoozeMenuFocus then useTokens() else nil
	local var9 = useLocalization(cryo.Dictionary.union(t_1, {
		fifteenMinutes = "Feature.Notifications.Action.SnoozeFifteenMinutes",
		fourHours = "Feature.Notifications.Action.SnoozeFourHours",
		oneDay = "Feature.Notifications.Action.SnoozeOneDay",
		oneHour = "Feature.Notifications.Action.SnoozeOneHour",
		untilITurnItBackOn = "Feature.Notifications.Action.UntilITurnItBackOn",
		snoozeFeedback = "Feature.Notifications.Heading.SnoozeFeedback"
	}))
	local var10, var11 = react.useState(false)
	local var12, var13 = react.useState({})
	local var14 = react.useCallback(function()
		-- upvalues: var11 (ref)
		var11(false)
	end, { var11 })
	react.useEffect(function()
		-- upvalues: showNotificationSnoozeMenuSignal (copy), var13 (ref), var11 (ref), getFFlagAppChatInExpToastSnoozeMenuDismissFix (copy), dismissNotificationSnoozeMenuSignal (copy), var14 (ref)
		local _ = nil
		local var17 = showNotificationSnoozeMenuSignal:connect(function(p0)
			-- upvalues: var13 (copy), var11 (copy)
			var13(p0)
			var11(true)
		end)
		local var18 = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then dismissNotificationSnoozeMenuSignal:connect(function()
			-- upvalues: var14 (copy)
			var14()
		end) else nil
		
		return function()
			-- upvalues: var17 (write), getFFlagAppChatInExpToastSnoozeMenuDismissFix (copy), var18 (write)
			var17:disconnect()
			
			if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then
				var18:disconnect()
			end
		end
	end, { var11 })
	local var15 = nil
	
	if fFlagEnableAppChatSnoozeMenuFocus then
		var15 = react.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var14 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p1)
						-- upvalues: var14 (copy)
						var14()
						p1:cancel()
					end)
				}
			}
		end, { var14 })
		react.useEffect(function()
			-- upvalues: notificationSnoozeMenuVisibleSignal (copy), var10 (ref)
			notificationSnoozeMenuVisibleSignal:fire({ visible = var10 })
		end, { var10 })
	end
	local var16 = if fFlagEnableAppChatSnoozeMenuFocus then useCursor() else nil
	
	return if var10 then react.createElement(interactable, {
		Size = UDim2.fromScale(1, 1),
		AutoButtonColor = false,
		BackgroundColor3 = colors.Black,
		BackgroundTransparency = 0.6,
		onStateChanged = function() end,
		[react.Event.Activated] = var14
	}, {
		SnoozeMenu = react.createElement(if fFlagEnableAppChatSnoozeMenuFocus then focusRoot else interactable, if fFlagEnableAppChatSnoozeMenuFocus then {
			isAutoFocusRoot = true,
			isIsolated = true,
			eventHandlers = var15,
			eventMap = t,
			frameProps = {
				AnchorPoint = Vector2.new(0.5, 0.5),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = var7.Theme.BackgroundDefault.Color,
				BackgroundTransparency = var7.Theme.BackgroundDefault.Transparency,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, -var8.Padding.Small * 2, 0, 0)
			},
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
		} else {
			AutoButtonColor = false,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, -16, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = var7.Theme.BackgroundDefault.Color,
			BackgroundTransparency = var7.Theme.BackgroundDefault.Transparency,
			onStateChanged = function() end
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, var7.Tokens.Radius.Large) }),
			UIListLayout = react.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			UIPadding = if fFlagEnableAppChatSnoozeMenuFocus then nil else react.createElement("UIPadding", { PaddingLeft = UDim.new(0, 24) }),
			UISizeConstraint = react.createElement("UISizeConstraint", { MaxSize = Vector2.new(400, 1e999) }),
			TitleContainer = react.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = react.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				UIPadding = react.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, if fFlagEnableAppChatSnoozeMenuFocus then var8.Padding.XLarge else 20),
					PaddingRight = UDim.new(0, if fFlagEnableAppChatSnoozeMenuFocus then var8.Padding.XXLarge else 24),
					PaddingTop = UDim.new(0, if fFlagEnableAppChatSnoozeMenuFocus then var8.Padding.XLarge else 20),
					PaddingLeft = if fFlagEnableAppChatSnoozeMenuFocus then UDim.new(0, var8.Padding.XXLarge) else nil
				}),
				Title = react.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					TextWrapped = true,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = var7.Font.Body.Font,
					Text = var12.title or "",
					TextSize = var7.Font.Body.RelativeSize * var7.Font.BaseSize,
					TextColor3 = colors.White,
					TextXAlignment = if snoozeMenuTextXAlignment then Enum.TextXAlignment.Left else nil
				}),
				Description = if var12 and var12.description and var12.description ~= "" then react.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = var7.Font.CaptionBody.Font,
					Text = var12.description or "",
					TextSize = var7.Font.CaptionBody.RelativeSize * var7.Font.BaseSize,
					TextColor3 = var7.Theme.TextDefault.Color
				}) else nil
			}),
			SnoozeOptions = react.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = react.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				SnoozeOptions = roact.createFragment(react.useMemo(function()
					-- upvalues: t_2 (copy), react (copy), fFlagEnableAppChatSnoozeMenuFocus (copy), var8 (ref), var7 (ref), var16 (ref), var9 (ref), colors (copy), var12 (ref), default (copy), var11 (ref)
					local t = {}
					
					for i, v in ipairs(t_2) do
						table.insert(t, react.createElement("TextButton", {
							Size = UDim2.new(1, 0, 0, if fFlagEnableAppChatSnoozeMenuFocus then var8.Size.Size_1400 else 56),
							BackgroundTransparency = 1,
							Font = var7.Font.Header2.Font,
							LayoutOrder = i,
							SelectionImageObject = var16,
							Text = var9[v.textKey],
							TextSize = var7.Font.Header2.RelativeSize * var7.Font.BaseSize,
							TextColor3 = colors.White,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Center,
							[react.Event.Activated] = function()
								-- upvalues: var12 (copy), default (copy), v (ref), var9 (copy), var11 (copy)
								if var12.notificationType then
									default:snoozeNotification({
										context = var12.context,
										notificationType = var12.notificationType,
										durationMinutes = v.durationMinutes,
										modalMessage = var9.snoozeFeedback:gsub("{title}", var9[if type(var12.notificationType) == "table" then var12.notificationType[1] else var12.notificationType] or ""):gsub("{duration}", var9[v.textKey])
									})
								end
								var11(false)
							end
						}, {
							UIPadding = if fFlagEnableAppChatSnoozeMenuFocus then react.createElement("UIPadding", {
								PaddingLeft = UDim.new(0, var8.Padding.XXLarge),
								PaddingRight = UDim.new(0, var8.Padding.XXLarge)
							}) else nil,
							Border = react.createElement("Frame", {
								BackgroundTransparency = 0.8,
								Size = if fFlagEnableAppChatSnoozeMenuFocus then UDim2.new(1, var8.Padding.XXLarge, 0, 1) else UDim2.new(1, 0, 0, 1),
								BackgroundColor3 = colors.White,
								LayoutOrder = i
							})
						}))
						i += 1
					end
					return t
				end, { var12 }))
			})
		})
	}) else nil
end