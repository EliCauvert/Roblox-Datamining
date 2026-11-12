local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local ShowNotificationSnoozeMenuSignal = require(Parent.Signals).ShowNotificationSnoozeMenuSignal
local DismissNotificationSnoozeMenuSignal = require(Parent.Signals).DismissNotificationSnoozeMenuSignal
local NotificationSnoozeMenuVisibleSignal = require(Parent.Signals).NotificationSnoozeMenuVisibleSignal
local Default = require(Parent.ToastNotificationSnoozeManager).default
local FoundationModule = require(Parent1.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local Cryo = DependenciesModule.Cryo
local React = DependenciesModule.React
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local Colors = UIBlox.App.Style.Colors
local Interactable = UIBlox.Core.Control.Interactable
local UseCursorFunction = UIBlox.App.SelectionCursor.useCursor
local UseStyleFunction = UIBlox.Core.Style.useStyle
local FocusNavigationUtilsModule = require(Parent1.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local InputHandlersModule = require(Parent1.InputHandlers)
local _ = require(Parent1.ReactFocusNavigation)
local FFlagEnableAppChatSnoozeMenuFocus = require(Parent1.SharedFlags).FFlagEnableAppChatSnoozeMenuFocus
local GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction = require(Parent1.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local SnoozeMenuTextXAlignment = game:DefineFastFlag("SnoozeMenuTextXAlignment", false)
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}
local config = {
	[require(Parent.type).NotificationTypeEnum.ChatNewMessage] = if require(Parent1.UniversalAppPolicy).getAppFeaturePolicies().getCanSeeChatTerminology() then "CommonUI.Features.Label.Chat" else "Feature.Squads.Label.Party"
}
local config1 = nil
config1 = {
	[1] = { textKey = "fifteenMinutes", durationMinutes = 15 },
	[2] = { textKey = "fourHours", durationMinutes = 240 },
	[3] = { textKey = "oneDay", durationMinutes = 1440 },
	[4] = { textKey = "untilITurnItBackOn", durationMinutes = -1 }
}

return function()
	-- upvalues: UseStyleFunction (copy), FFlagEnableAppChatSnoozeMenuFocus (copy), FoundationFontFaceMigration (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), Cryo (copy), config (copy), React (copy), ShowNotificationSnoozeMenuSignal (copy), GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction (copy), DismissNotificationSnoozeMenuSignal (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), NotificationSnoozeMenuVisibleSignal (copy), UseCursorFunction (copy), config1 (ref), NormalizeFontFaceFunction (copy), Colors (copy), Default (copy), Interactable (copy), FocusRoot (copy), EventMap (copy), FocusNavigableSurfaceIdentifierEnum (copy), SnoozeMenuTextXAlignment (copy), Roact (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = if FFlagEnableAppChatSnoozeMenuFocus or FoundationFontFaceMigration then UseTokensFunction() else nil
	local UseLocalizationResult = UseLocalizationFunction((Cryo.Dictionary.union(config, {
		fifteenMinutes = "Feature.Notifications.Action.SnoozeFifteenMinutes",
		fourHours = "Feature.Notifications.Action.SnoozeFourHours",
		oneDay = "Feature.Notifications.Action.SnoozeOneDay",
		oneHour = "Feature.Notifications.Action.SnoozeOneHour",
		untilITurnItBackOn = "Feature.Notifications.Action.UntilITurnItBackOn",
		snoozeFeedback = "Feature.Notifications.Heading.SnoozeFeedback"
	})))
	local UseStateResult, UseStateResult2 = React.useState(false)
	local UseStateResult1, UseStateResult2_1 = React.useState({})
	local UseResult = React.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { UseStateResult2 })
	React.useEffect(function()
		-- upvalues: ShowNotificationSnoozeMenuSignal (upval), UseStateResult2_1 (copy), UseStateResult2 (copy), GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction (upval), DismissNotificationSnoozeMenuSignal (upval), UseResult (copy)
		local Connection = nil
		Connection = ShowNotificationSnoozeMenuSignal:connect(function(p1)
			-- upvalues: UseStateResult2_1 (upval), UseStateResult2 (upval)
			UseStateResult2_1(p1)
			UseStateResult2(true)
		end)
		local Connection1 = if GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction() then DismissNotificationSnoozeMenuSignal:connect(function()
			-- upvalues: UseResult (upval)
			UseResult()
		end) else nil
		
		return function()
			-- upvalues: Connection (ref), GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction (upval), Connection1 (ref)
			Connection:disconnect()
			
			if GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction() then
				Connection1:disconnect()
			end
		end
	end, { UseStateResult2 })
	local UseMemoResult = nil
	
	if FFlagEnableAppChatSnoozeMenuFocus then
		UseMemoResult = React.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p1)
						-- upvalues: UseResult (upval)
						UseResult()
						p1:cancel()
					end)
				}
			}
		end, { UseResult })
		React.useEffect(function()
			-- upvalues: NotificationSnoozeMenuVisibleSignal (upval), UseStateResult (copy)
			NotificationSnoozeMenuVisibleSignal:fire({ visible = UseStateResult })
		end, { UseStateResult })
	end
	local UseCursorResult = if FFlagEnableAppChatSnoozeMenuFocus then UseCursorFunction() else nil
	local UseMemoResult1 = React.useMemo(function()
		-- upvalues: config1 (upval), React (upval), FFlagEnableAppChatSnoozeMenuFocus (upval), UseTokensResult (copy), FoundationFontFaceMigration (upval), UseStyleResult (copy), NormalizeFontFaceFunction (upval), UseCursorResult (copy), UseLocalizationResult (copy), Colors (upval), UseStateResult1 (copy), Default (upval), UseStateResult2 (copy)
		local List = {}
		
		for LayoutOrder, value in ipairs(config1) do
			table.insert(List, React.createElement("TextButton", {
				Size = UDim2.new(1, 0, 0, if FFlagEnableAppChatSnoozeMenuFocus then UseTokensResult.Size.Size_1400 else 56),
				BackgroundTransparency = 1,
				Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Header2.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.TitleLarge.Font) else nil,
				LayoutOrder = LayoutOrder,
				SelectionImageObject = UseCursorResult,
				Text = UseLocalizationResult[value.textKey],
				TextSize = UseStyleResult.Font.Header2.RelativeSize * UseStyleResult.Font.BaseSize,
				TextColor3 = Colors.White,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				[React.Event.Activated] = function()
					-- upvalues: UseStateResult1 (upval), Default (upval), value (copy), UseLocalizationResult (upval), UseStateResult2 (upval)
					if UseStateResult1.notificationType then
						Default:snoozeNotification({
							context = UseStateResult1.context,
							notificationType = UseStateResult1.notificationType,
							durationMinutes = value.durationMinutes,
							modalMessage = UseLocalizationResult.snoozeFeedback:gsub("{title}", UseLocalizationResult[if type(UseStateResult1.notificationType) == "table" then UseStateResult1.notificationType[1] else UseStateResult1.notificationType] or ""):gsub("{duration}", UseLocalizationResult[value.textKey])
						})
					end
					UseStateResult2(false)
				end
			}, {
				UIPadding = if FFlagEnableAppChatSnoozeMenuFocus then React.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UseTokensResult.Padding.XXLarge),
					PaddingRight = UDim.new(0, UseTokensResult.Padding.XXLarge)
				}) else nil,
				Border = React.createElement("Frame", {
					BackgroundTransparency = 0.8,
					Size = if FFlagEnableAppChatSnoozeMenuFocus then UDim2.new(1, UseTokensResult.Padding.XXLarge, 0, 1) else UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = Colors.White,
					LayoutOrder = LayoutOrder
				})
			}))
			local _ = LayoutOrder + 1
		end
		return List
	end, {
		UseStateResult1,
		if FoundationFontFaceMigration then UseTokensResult.Typography.TitleLarge.Font else nil
	})
	
	return if UseStateResult then React.createElement(Interactable, {
		Size = UDim2.fromScale(1, 1),
		AutoButtonColor = false,
		BackgroundColor3 = Colors.Black,
		BackgroundTransparency = 0.6,
		onStateChanged = function() end,
		[React.Event.Activated] = UseResult
	}, {
		SnoozeMenu = React.createElement(if FFlagEnableAppChatSnoozeMenuFocus then FocusRoot else Interactable, if FFlagEnableAppChatSnoozeMenuFocus then {
			isAutoFocusRoot = true,
			isIsolated = true,
			eventHandlers = UseMemoResult,
			eventMap = EventMap,
			frameProps = {
				AnchorPoint = Vector2.new(0.5, 0.5),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
				BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, -UseTokensResult.Padding.Small * 2, 0, 0)
			},
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
		} else {
			AutoButtonColor = false,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, -16, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
			BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
			onStateChanged = function() end
		}, {
			UICorner = React.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseStyleResult.Tokens.Radius.Large)
			}),
			UIListLayout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			UIPadding = if FFlagEnableAppChatSnoozeMenuFocus then nil else React.createElement("UIPadding", { PaddingLeft = UDim.new(0, 24) }),
			UISizeConstraint = React.createElement("UISizeConstraint", { MaxSize = Vector2.new(400, 1e999) }),
			TitleContainer = React.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = React.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				UIPadding = React.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, if FFlagEnableAppChatSnoozeMenuFocus then UseTokensResult.Padding.XLarge else 20),
					PaddingRight = UDim.new(0, if FFlagEnableAppChatSnoozeMenuFocus then UseTokensResult.Padding.XXLarge else 24),
					PaddingTop = UDim.new(0, if FFlagEnableAppChatSnoozeMenuFocus then UseTokensResult.Padding.XLarge else 20),
					PaddingLeft = if FFlagEnableAppChatSnoozeMenuFocus then UDim.new(0, UseTokensResult.Padding.XXLarge) else nil
				}),
				Title = React.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					TextWrapped = true,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodyLarge.Font) else nil,
					Text = UseStateResult1.title or "",
					TextSize = UseStyleResult.Font.Body.RelativeSize * UseStyleResult.Font.BaseSize,
					TextColor3 = Colors.White,
					TextXAlignment = if SnoozeMenuTextXAlignment then Enum.TextXAlignment.Left else nil
				}),
				Description = if UseStateResult1 and UseStateResult1.description and UseStateResult1.description ~= "" then React.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.CaptionBody.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodySmall.Font) else nil,
					Text = UseStateResult1.description or "",
					TextSize = UseStyleResult.Font.CaptionBody.RelativeSize * UseStyleResult.Font.BaseSize,
					TextColor3 = UseStyleResult.Theme.TextDefault.Color
				}) else nil
			}),
			SnoozeOptions = React.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = React.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				SnoozeOptions = Roact.createFragment(UseMemoResult1)
			})
		})
	}) else nil
end