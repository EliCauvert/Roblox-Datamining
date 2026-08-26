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
	local var1 = useStyle()
	local var2 = if fFlagEnableAppChatSnoozeMenuFocus then useTokens() else nil
	local var3 = useLocalization(cryo.Dictionary.union(t_1, {
		fifteenMinutes = "Feature.Notifications.Action.SnoozeFifteenMinutes",
		fourHours = "Feature.Notifications.Action.SnoozeFourHours",
		oneDay = "Feature.Notifications.Action.SnoozeOneDay",
		oneHour = "Feature.Notifications.Action.SnoozeOneHour",
		untilITurnItBackOn = "Feature.Notifications.Action.UntilITurnItBackOn",
		snoozeFeedback = "Feature.Notifications.Heading.SnoozeFeedback"
	}))
	local var4, var5 = react.useState(false)
	local var6, var7 = react.useState({})
	local var8 = react.useCallback(function()
		-- upvalues: var5 (ref)
		var5(false)
	end, { var5 })
	react.useEffect(function()
		-- upvalues: showNotificationSnoozeMenuSignal (copy), var7 (ref), var5 (ref), getFFlagAppChatInExpToastSnoozeMenuDismissFix (copy), dismissNotificationSnoozeMenuSignal (copy), var8 (ref)
		local _ = nil
		local var9 = showNotificationSnoozeMenuSignal:connect(function(p1)
			-- upvalues: var7 (copy), var5 (copy)
			var7(p1)
			var5(true)
		end)
		local var10 = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then dismissNotificationSnoozeMenuSignal:connect(function()
			-- upvalues: var8 (copy)
			var8()
		end) else nil
		
		return function()
			-- upvalues: var9 (write), getFFlagAppChatInExpToastSnoozeMenuDismissFix (copy), var10 (write)
			var9:disconnect()
			
			if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then
				var10:disconnect()
			end
		end
	end, { var5 })
	local var9 = nil
	
	if fFlagEnableAppChatSnoozeMenuFocus then
		var9 = react.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var8 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p1)
						-- upvalues: var8 (copy)
						var8()
						p1:cancel()
					end)
				}
			}
		end, { var8 })
		react.useEffect(function()
			-- upvalues: notificationSnoozeMenuVisibleSignal (copy), var4 (ref)
			notificationSnoozeMenuVisibleSignal:fire({ visible = var4 })
		end, { var4 })
	end
	local var10 = if fFlagEnableAppChatSnoozeMenuFocus then useCursor() else nil
	
	return if var4 then react.createElement(interactable, {
		Size = UDim2.fromScale(1, 1),
		AutoButtonColor = false,
		BackgroundColor3 = colors.Black,
		BackgroundTransparency = 0.6,
		onStateChanged = function() end,
		[react.Event.Activated] = var8
	}, {
		SnoozeMenu = react.createElement(if fFlagEnableAppChatSnoozeMenuFocus then focusRoot else interactable, if fFlagEnableAppChatSnoozeMenuFocus then {
			isAutoFocusRoot = true,
			isIsolated = true,
			eventHandlers = var9,
			eventMap = t,
			frameProps = {
				AnchorPoint = Vector2.new(0.5, 0.5),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = var1.Theme.BackgroundDefault.Color,
				BackgroundTransparency = var1.Theme.BackgroundDefault.Transparency,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, -var2.Padding.Small * 2, 0, 0)
			},
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
		} else {
			AutoButtonColor = false,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, -16, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = var1.Theme.BackgroundDefault.Color,
			BackgroundTransparency = var1.Theme.BackgroundDefault.Transparency,
			onStateChanged = function() end
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Tokens.Radius.Large) }),
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
					PaddingBottom = UDim.new(0, if fFlagEnableAppChatSnoozeMenuFocus then var2.Padding.XLarge else 20),
					PaddingRight = UDim.new(0, if fFlagEnableAppChatSnoozeMenuFocus then var2.Padding.XXLarge else 24),
					PaddingTop = UDim.new(0, if fFlagEnableAppChatSnoozeMenuFocus then var2.Padding.XLarge else 20),
					PaddingLeft = if fFlagEnableAppChatSnoozeMenuFocus then UDim.new(0, var2.Padding.XXLarge) else nil
				}),
				Title = react.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					TextWrapped = true,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = var1.Font.Body.Font,
					Text = var6.title or "",
					TextSize = var1.Font.Body.RelativeSize * var1.Font.BaseSize,
					TextColor3 = colors.White,
					TextXAlignment = if snoozeMenuTextXAlignment then Enum.TextXAlignment.Left else nil
				}),
				Description = if var6 and var6.description and var6.description ~= "" then react.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = var1.Font.CaptionBody.Font,
					Text = var6.description or "",
					TextSize = var1.Font.CaptionBody.RelativeSize * var1.Font.BaseSize,
					TextColor3 = var1.Theme.TextDefault.Color
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
					-- upvalues: t_2 (copy), react (copy), fFlagEnableAppChatSnoozeMenuFocus (copy), var2 (ref), var1 (ref), var10 (ref), var3 (ref), colors (copy), var6 (ref), default (copy), var5 (ref)
					local t = {}
					
					for i, v in ipairs(t_2) do
						table.insert(t, react.createElement("TextButton", {
							Size = UDim2.new(1, 0, 0, if fFlagEnableAppChatSnoozeMenuFocus then var2.Size.Size_1400 else 56),
							BackgroundTransparency = 1,
							Font = var1.Font.Header2.Font,
							LayoutOrder = i,
							SelectionImageObject = var10,
							Text = var3[v.textKey],
							TextSize = var1.Font.Header2.RelativeSize * var1.Font.BaseSize,
							TextColor3 = colors.White,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Center,
							[react.Event.Activated] = function()
								-- upvalues: var6 (copy), default (copy), v (ref), var3 (copy), var5 (copy)
								if var6.notificationType then
									default:snoozeNotification({
										context = var6.context,
										notificationType = var6.notificationType,
										durationMinutes = v.durationMinutes,
										modalMessage = var3.snoozeFeedback:gsub("{title}", var3[if type(var6.notificationType) == "table" then var6.notificationType[1] else var6.notificationType] or ""):gsub("{duration}", var3[v.textKey])
									})
								end
								var5(false)
							end
						}, {
							UIPadding = if fFlagEnableAppChatSnoozeMenuFocus then react.createElement("UIPadding", {
								PaddingLeft = UDim.new(0, var2.Padding.XXLarge),
								PaddingRight = UDim.new(0, var2.Padding.XXLarge)
							}) else nil,
							Border = react.createElement("Frame", {
								BackgroundTransparency = 0.8,
								Size = if fFlagEnableAppChatSnoozeMenuFocus then UDim2.new(1, var2.Padding.XXLarge, 0, 1) else UDim2.new(1, 0, 0, 1),
								BackgroundColor3 = colors.White,
								LayoutOrder = i
							})
						}))
						i += 1
					end
					return t
				end, { var6 }))
			})
		})
	}) else nil
end