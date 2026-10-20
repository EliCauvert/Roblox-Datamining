local IXPService = game:GetService("IXPService")
local UserInputService = game:GetService("UserInputService")
local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local ReactOtterModule = require(Parent.ReactOtter)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(Squads.Enums.SquadButtonSourceEnum)
local SquadButtonClickIntentionEnumModule = require(Squads.Enums.SquadButtonClickIntentionEnum)
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseIsTvRemoteDeviceFunction = require(Parent.RoactUtils).Hooks.useIsTvRemoteDevice
local DependenciesModule = require(Squads.dependencies)
local Foundation = DependenciesModule.Foundation
local React = DependenciesModule.React
local _ = require(Parent.SquadsCore.Enums)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadState = require(Parent.SquadsCore.Enums).SquadState
local LeaveSquadFunction = require(Parent.SquadsCore.Thunks).leaveSquad
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local UseSquadStateFunction = require(Parent.SquadsCore.Hooks).useSquadState
local UseTokensFunction = Foundation.Hooks.useTokens
local FFlagPartyDevAPIToRespectThirdPartySettingsEnabled = SharedFlagsModule.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local FFlagDebugAppChatEnableDomLocators = SharedFlagsModule.FFlagDebugAppChatEnableDomLocators
local AppChatNewSquadJoinButtonLookIconless = game:DefineFastFlag("AppChatNewSquadJoinButtonLookIconless", false)
local AppChatSquadButtonColorUpdate = game:DefineFastFlag("AppChatSquadButtonColorUpdate", false)
local AppChatSquadButtonColorVariantB = game:DefineFastFlag("AppChatSquadButtonColorVariantB", false)
local AppChatSquadButtonColorUpdateIxpEnabled = game:DefineFastFlag("AppChatSquadButtonColorUpdateIxpEnabled", false)
local AppChatSquadButtonColorUpdateIxpLayer = game:DefineFastString("AppChatSquadButtonColorUpdateIxpLayer", "Social.AppChat")
local AppChatSquadButtonHideGamepadIconOnTvRemote = game:DefineFastFlag("AppChatSquadButtonHideGamepadIconOnTvRemote", false)
local config = { dampingRatio = 1, frequency = 1 }

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseDispatchFunction (copy), UsePreferredInputFunction (copy), AppChatSquadButtonHideGamepadIconOnTvRemote (copy), UseIsTvRemoteDeviceFunction (copy), UseTokensFunction (copy), React (copy), SquadExternalContractContext (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), UseSquadStateFunction (copy), ReactOtterModule (copy), config (copy), UseSelectorFunction (copy), SquadButtonClickIntentionEnumModule (copy), EventNamesModule (copy), LeaveSquadFunction (copy), SquadPromptType (copy), AppChatSquadButtonColorVariantB (copy), AppChatSquadButtonColorUpdateIxpEnabled (copy), IXPService (copy), AppChatSquadButtonColorUpdateIxpLayer (copy), Foundation (copy), AppChatSquadButtonColorUpdate (copy), SquadState (copy), FFlagDebugAppChatEnableDomLocators (copy), AppChatNewSquadJoinButtonLookIconless (copy), ResponsiveModule (copy), UserInputService (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		joinButtonText = "Feature.Squads.Action.Join",
		startButtonText = "Feature.Squads.Action.Start",
		viewButtonText = "Feature.Squads.Action.View"
	})
	local UseDispatchResult = UseDispatchFunction()
	local UsePreferredInputResult = UsePreferredInputFunction()
	local UseIsTvRemoteDeviceResult = if AppChatSquadButtonHideGamepadIconOnTvRemote then UseIsTvRemoteDeviceFunction() else false
	local UseTokensResult = UseTokensFunction()
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseParentChannelHasGroupUpResult = UseContextResult.useParentChannelHasGroupUp(p1.conversationId)
	local NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled = not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or UseContextResult.useIsChatEnabled()
	local UseSquadStateResult = UseSquadStateFunction()
	local Callback = nil
	local UseAnimatedBindingResult, Callback = ReactOtterModule.useAnimatedBinding(1, function(p2)
		-- upvalues: p1 (copy), Callback (ref), ReactOtterModule (upval), config (upval)
		if p1.shouldAnimate then
			task.delay(0.5, function()
				-- upvalues: Callback (upval), ReactOtterModule (upval), p2 (copy), config (upval)
				Callback(ReactOtterModule.spring(if p2 == 1 then 0 else 1, config))
			end)
		end
	end)
	React.useEffect(function()
		-- upvalues: p1 (copy), Callback (ref), ReactOtterModule (upval), config (upval)
		if p1.shouldAnimate then
			Callback(ReactOtterModule.spring(1, config))
			
			return
		else
			Callback(ReactOtterModule.instant(1))
		end
	end, { p1.shouldAnimate, Callback })
	local UseSelectorResult = UseSelectorFunction((React.useCallback(function(p2)
		return if p2.Squad and p2.Squad.Squad then p2.Squad.Squad.currentSquad else nil
	end, {})))
	local UseMemoResult = React.useMemo(function(): boolean
		-- upvalues: UseSelectorResult (copy), p1 (copy)
		return UseSelectorResult and UseSelectorResult.parentChannelId == p1.conversationId
	end, { UseSelectorResult, p1.conversationId })
	local UseMemoResult1 = React.useMemo(function()
		-- upvalues: UseMemoResult (copy), SquadButtonClickIntentionEnumModule (upval), UseParentChannelHasGroupUpResult (copy)
		return if UseMemoResult then SquadButtonClickIntentionEnumModule.View elseif UseParentChannelHasGroupUpResult then SquadButtonClickIntentionEnumModule.Join else SquadButtonClickIntentionEnumModule.Create
	end, { UseMemoResult, UseParentChannelHasGroupUpResult })
	local UseMemoResult2 = React.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseLocalizationResult (copy), UseParentChannelHasGroupUpResult (copy)
		return if UseMemoResult then UseLocalizationResult.viewButtonText elseif UseParentChannelHasGroupUpResult then UseLocalizationResult.joinButtonText else UseLocalizationResult.startButtonText
	end, {
		UseParentChannelHasGroupUpResult,
		UseMemoResult,
		UseLocalizationResult.joinButtonText,
		UseLocalizationResult.startButtonText,
		UseLocalizationResult.viewButtonText
	})
	local UseResult = React.useCallback(function()
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), p1 (copy), UseSelectorResult (copy), UseMemoResult1 (copy)
		UseContextResult.fireSquadAnalytics(EventNamesModule.EnterSquadButtonPressed, {
			conversationId = p1.conversationId,
			squadButtonSource = p1.squadButtonSource,
			squadId = UseSelectorResult and UseSelectorResult.squadId,
			squadLocation = p1.squadLocation,
			userIntention = UseMemoResult1
		})
	end, {
		UseMemoResult1, UseSelectorResult, p1.conversationId, p1.squadButtonSource,
		p1.squadLocation, UseContextResult.fireSquadAnalytics
	})
	local UseResult1 = React.useCallback(function()
		-- upvalues: UseResult (copy), UseMemoResult (copy), UseSelectorResult (copy), UseDispatchResult (copy), LeaveSquadFunction (upval), SquadPromptType (upval), UseContextResult (copy), p1 (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (upval), NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy)
		UseResult()
		
		if UseMemoResult or not UseSelectorResult then
			p1.onActivated(p1.conversationId)
			
			return
		else
			UseDispatchResult(LeaveSquadFunction(SquadPromptType.JoinAnotherSquad, UseContextResult.setSquadPrompt, function()
				-- upvalues: p1 (upval)
				p1.onActivated(p1.conversationId)
			end, UseContextResult.squadLocation, not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled))
		end
	end, {
		UseSelectorResult, UseMemoResult, p1.onActivated, UseResult,
		UseContextResult.setSquadPrompt, UseContextResult.squadLocation,
		if FFlagPartyDevAPIToRespectThirdPartySettingsEnabled then NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled else nil
	})
	local UseMemoResult3 = React.useMemo(function()
		-- upvalues: UseTokensResult (copy), p1 (copy)
		return if UseTokensResult.Config.ColorMode.IsLight == "true" then if p1.isInCard then UseTokensResult.Color.Extended.Gray.Gray_300 else UseTokensResult.Color.Extended.Gray.Gray_200 elseif p1.isInCard then UseTokensResult.Color.Extended.Gray.Gray_800 else UseTokensResult.Color.Extended.Gray.Gray_900
	end, { p1.isInCard, UseTokensResult.Config.ColorMode.IsLight })
	local IsUseMemoResultMatch = UseMemoResult1 == SquadButtonClickIntentionEnumModule.View
	local NoAppChatSquadButtonColorVariantB = not AppChatSquadButtonColorVariantB
	React.useEffect(function()
		-- upvalues: AppChatSquadButtonColorUpdateIxpEnabled (upval), IXPService (upval), AppChatSquadButtonColorUpdateIxpLayer (upval)
		if AppChatSquadButtonColorUpdateIxpEnabled then
			IXPService:LogFlagLinkedUserLayerExposure(AppChatSquadButtonColorUpdateIxpLayer)
		end
	end, {})
	
	return React.createElement(Foundation.View, {
		tag = if AppChatSquadButtonColorUpdate then {
			["row align-x-center align-y-center gap-xsmall radius-medium"] = true,
			["bg-action-standard stroke-action-standard"] = not IsUseMemoResultMatch,
			["bg-action-soft-emphasis stroke-action-soft-emphasis"] = IsUseMemoResultMatch and NoAppChatSquadButtonColorVariantB,
			["bg-action-emphasis stroke-action-emphasis"] = IsUseMemoResultMatch and AppChatSquadButtonColorVariantB
		} else "row align-x-center align-y-center gap-xsmall stroke-action-standard radius-medium bg-action-standard",
		AutomaticSize = if p1.isFullWidth then Enum.AutomaticSize.None else Enum.AutomaticSize.XY,
		Size = UDim2.new(if p1.isFullWidth then 1 else 0, 0, 0, UseTokensResult.Size.Size_800),
		isDisabled = UseSquadStateResult == SquadState.Initializing,
		onActivated = UseResult1,
		LayoutOrder = p1.layoutOrder,
		padding = {
			left = UDim.new(0, UseTokensResult.Padding.Small),
			right = UDim.new(0, UseTokensResult.Padding.Small)
		},
		selection = { Selectable = p1.Selectable },
		testId = if FFlagDebugAppChatEnableDomLocators then `{p1.testId}{UseMemoResult1}` else nil
	}, {
		GroupIconContainer = if AppChatNewSquadJoinButtonLookIconless then nil else React.createElement(Foundation.View, { tag = "size-400-400", LayoutOrder = 1 }, {
			GroupIcon = React.createElement(Foundation.Icon, {
				name = Foundation.Enums.IconName.ThreePeople,
				size = Foundation.Enums.IconSize.Small,
				style = UseTokensResult.Color.ActionStandard.Foreground,
				variant = Foundation.Enums.IconVariant.Regular
			}),
			GreenDot = if UseParentChannelHasGroupUpResult or UseMemoResult then React.createElement(Foundation.View, {
				tag = "radius-circle anchor-top-right",
				ZIndex = 2,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_200, UseTokensResult.Size.Size_200),
				backgroundStyle = UseAnimatedBindingResult:map(function(p2)
					-- upvalues: UseTokensResult (copy)
					return {
						Color3 = UseTokensResult.Color.Extended.Green.Green_500.Color3,
						Transparency = 1 + (UseTokensResult.Color.Extended.Green.Green_500.Transparency - 1) * p2
					}
				end),
				Position = UDim2.new(1, UseTokensResult.Size.Size_50, 0, -UseTokensResult.Size.Size_50),
				stroke = {
					Color = UseMemoResult3.Color3,
					Transparency = UseAnimatedBindingResult:map(function(p2): number
						-- upvalues: UseMemoResult3 (copy)
						return 1 + (UseMemoResult3.Transparency - 1) * p2
					end),
					Thickness = UseTokensResult.Stroke.Thicker
				}
			}) else nil
		}),
		TextLabel = React.createElement(Foundation.Text, {
			LayoutOrder = 2,
			tag = if AppChatSquadButtonColorUpdate then {
				["auto-xy text-label-small text-no-wrap text-truncate-end"] = true,
				["content-action-standard"] = not IsUseMemoResultMatch,
				["content-action-soft-emphasis"] = IsUseMemoResultMatch and NoAppChatSquadButtonColorVariantB,
				["content-action-emphasis"] = IsUseMemoResultMatch and AppChatSquadButtonColorVariantB
			} else "auto-xy text-label-small content-action-standard text-truncate-end text-no-wrap",
			Text = UseMemoResult2,
			testId = if FFlagDebugAppChatEnableDomLocators then `{p1.testId}{UseMemoResult1}--text` else nil,
			padding = { right = UDim.new(0, UseTokensResult.Padding.XXSmall) },
			sizeConstraint = if p1.isFullWidth then nil else {
				MaxSize = Vector2.new(UseTokensResult.Size.Size_2800, UseTokensResult.Size.Size_800)
			}
		}),
		SignifierImage = if p1.shouldShowSignifier and (UsePreferredInputResult == ResponsiveModule.Input.Directional and not UseIsTvRemoteDeviceResult) then React.createElement(Foundation.Icon, {
			LayoutOrder = 3,
			name = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonX),
			size = Foundation.Enums.IconSize.Small,
			style = if AppChatSquadButtonColorUpdate and IsUseMemoResultMatch then if AppChatSquadButtonColorVariantB then UseTokensResult.Color.ActionEmphasis.Foreground else UseTokensResult.Color.ActionSoftEmphasis.Foreground else UseTokensResult.Color.ActionStandard.Foreground
		}) else nil
	})
end