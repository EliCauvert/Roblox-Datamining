local guiService = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local crossExperienceModule = require(parent.CrossExperience)
local crossExperienceVoiceModule = require(parent.CrossExperienceVoice)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local voiceChatModule = require(parent.VoiceChat)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local foundation = dependenciesModule.Foundation
local sharedFlags = dependenciesModule.SharedFlags
local default = crossExperienceVoiceModule.CrossExperienceVoiceManager.default
local voiceStatus = crossExperienceModule.Utils.VoiceStatus
local voiceStatusChanged = crossExperienceModule.Actions.VoiceStatusChanged
local useVoiceStatus = crossExperienceVoiceModule.Hooks.useVoiceStatus
local useLocalization = dependenciesModule.Hooks.useLocalization
local useDispatch = dependenciesModule.Hooks.useDispatch
local useTokens = foundation.Hooks.useTokens
local useNavigation = dependenciesModule.useNavigation
local getFFlagEnableCrossExpVoice = sharedFlags.GetFFlagEnableCrossExpVoice
local useCurrentSquadId = require(parent.SquadsCore.Hooks).useCurrentSquadId
local useCurrentSquadParentChannelId = require(parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local useStore = dependenciesModule.Hooks.useStore
local squadPromptType = require(parent.SquadsCore.Enums).SquadPromptType
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local getFFlagEnableCrossExpVoiceMemoryCheck = sharedFlags.getFFlagEnableCrossExpVoiceMemoryCheck
local fFlagEnableVoiceEuConsentPrompt = sharedFlags.FFlagEnableVoiceEuConsentPrompt
local useIsAnyOtherUserPartyVoiceEligibleModule = require(squads.Hooks.useIsAnyOtherUserPartyVoiceEligible)
local useIsLocalPlayerPartyVoiceEligible = require(parent.SquadsCore.Hooks).useIsLocalPlayerPartyVoiceEligible
local useIsCurrentSquadPartyVoiceEligible = require(parent.SquadsCore.Hooks).useIsCurrentSquadPartyVoiceEligible
local SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY = require(parent.SquadsCore.Constants).SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY
local SQUAD_VOICE_EU_MODAL_SEEN_KEY = require(parent.SquadsCore.Constants).SQUAD_VOICE_EU_MODAL_SEEN_KEY
local getTableAppStorageKey = require(parent.SquadsCore.appStorageAccess).getTableAppStorageKey
local displayEuConsentPromptModule = require(parent.SquadsCore.displayEuConsentPrompt)
local partyVoiceBannerErrorUserNotEligibleURL = game:DefineFastString("PartyVoiceBannerErrorUserNotEligibleURL", "")
local disallowSquadLobbyBannersInlineButtons = game:DefineFastFlag("DisallowSquadLobbyBannersInlineButtons", false)
local disablePartyVoiceEligibilityBanner = game:DefineFastFlag("DisablePartyVoiceEligibilityBanner", false)

function openWebview(p1, p2)
	-- upvalues: httpService (ref), guiService (ref)
	guiService:BroadcastNotification(httpService:JSONEncode({
		presentationStyle = 0,
		visible = true,
		title = if game:GetEngineFeature("SetWebViewTitle") then p1 else nil,
		url = p2
	}), 20)
end

local var1 = function(p1)
	-- upvalues: useTokens (ref), disallowSquadLobbyBannersInlineButtons (ref), react (ref), foundation (ref)
	local var2 = useTokens()
	local var3 = p1.isButtonInline and not disallowSquadLobbyBannersInlineButtons
	
	return react.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundColor3 = var2.Color.Surface.Surface_200.Color3,
		BackgroundTransparency = var2.Color.Surface.Surface_200.Transparency,
		LayoutOrder = p1.LayoutOrder
	}, {
		UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, var2.Radius.Small) }),
		UIPadding = react.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var2.Gap.XLarge),
			PaddingRight = UDim.new(0, var2.Gap.XLarge),
			PaddingTop = UDim.new(0, var2.Gap.Medium),
			PaddingBottom = UDim.new(0, var2.Gap.Medium)
		}),
		UIListLayout = react.createElement("UIListLayout", {
			FillDirection = if var3 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical,
			Padding = if var3 then UDim.new(0, var2.Gap.XSmall) else UDim.new(0, var2.Gap.Medium),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Wraps = not var3,
			HorizontalFlex = if var3 then Enum.UIFlexAlignment.SpaceBetween else Enum.UIFlexAlignment.Fill,
			VerticalFlex = if var3 then Enum.UIFlexAlignment.Fill else Enum.UIFlexAlignment.None
		}),
		TextFrame = react.createElement(foundation.View, { tag = "col auto-xy gap-small wrap", LayoutOrder = 1 }, react.useMemo(function()
			-- upvalues: react (copy), foundation (copy), var2 (ref), p1 (ref)
			local list = {
				react.createElement(foundation.Text, {
					LayoutOrder = 1,
					TextWrapped = true,
					AutomaticSize = Enum.AutomaticSize.XY,
					backgroundStyle = var2.Color.None,
					colorstyle = var2.Color.Content.Emphasis,
					fontStyle = var2.Typography.BodySmall,
					Text = p1.label,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextTruncate = Enum.TextTruncate.None
				})
			}
			
			if p1.sublabels then
				for i, v in ipairs(p1.sublabels) do
					if v and v ~= "" then
						table.insert(list, react.createElement(foundation.Text, {
							TextWrapped = true,
							RichText = true,
							AutomaticSize = Enum.AutomaticSize.XY,
							backgroundStyle = var2.Color.None,
							colorstyle = var2.Color.Content.Emphasis,
							fontStyle = var2.Typography.BodySmall,
							LayoutOrder = i + 1,
							Text = v,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Center,
							TextTruncate = Enum.TextTruncate.None
						}))
					end
				end
			end
			return list
		end, { p1.label, p1.sublabels })),
		InlineButton = if p1.onActivated and var3 then react.createElement(foundation.Button, {
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			text = p1.buttonLabel,
			variant = foundation.Enums.ButtonVariant.Link,
			onActivated = p1.onActivated
		}) else nil,
		BottomButton = if p1.onActivated and not var3 then react.createElement(foundation.Button, {
			LayoutOrder = 2,
			text = p1.buttonLabel,
			variant = foundation.Enums.ButtonVariant.Standard,
			size = foundation.Enums.ButtonSize.Small,
			onActivated = p1.onActivated,
			fillBehavior = foundation.Enums.FillBehavior.Fill
		}) else nil
	})
end

local var4 = function(p2)
	-- upvalues: useLocalUserId (ref), useDispatch (ref), react (ref), squadExternalContractContext (ref), getTableAppStorageKey (ref), SQUAD_VOICE_EU_MODAL_SEEN_KEY (ref), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (ref), httpService (ref), default (ref), var1 (ref), displayEuConsentPromptModule (ref)
	local var5 = useLocalUserId()
	local var6 = useDispatch()
	local var7 = react.useContext(squadExternalContractContext)
	local var8, var9 = react.useState(false)
	local var10 = getTableAppStorageKey(SQUAD_VOICE_EU_MODAL_SEEN_KEY)
	local var11 = getTableAppStorageKey(SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY)
	react.useEffect(function()
		-- upvalues: var10 (ref), var5 (ref), var11 (ref), var9 (ref)
		if var10[tostring(var5)] and not var11[tostring(var5)] then
			var9(true)
		end
	end, {
		httpService:JSONEncode(var10),
		httpService:JSONEncode(var11)
	})
	react.useEffect(function()
		-- upvalues: default (copy), var9 (ref)
		local eventConnection = default.VoiceEuModalConsented.Event:Connect(function()
			-- upvalues: var9 (copy)
			var9(false)
		end)
		local eventConnection_1 = default.VoiceEuModalRefused.Event:Connect(function()
			-- upvalues: var9 (copy)
			var9(true)
		end)
		
		return function()
			-- upvalues: eventConnection (ref), eventConnection_1 (ref)
			eventConnection:Disconnect()
			eventConnection_1:Disconnect()
		end
	end, {})
	
	return if var8 then react.createElement(var1, {
		label = "Give consent to the voice recording policy in order to access voice chat.",
		buttonLabel = "Connect",
		isButtonInline = true,
		LayoutOrder = p2.LayoutOrder,
		onActivated = function()
			-- upvalues: var6 (ref), displayEuConsentPromptModule (copy), var7 (ref), var5 (ref), var10 (ref), var11 (ref)
			var6(displayEuConsentPromptModule(var7.setSquadPrompt, tostring(var5), var10, var11))
		end
	}) else nil
end

local var5 = function(p2)
	-- upvalues: useDispatch (ref), useStore (ref), react (ref), squadExternalContractContext (ref), useCurrentSquadId (ref), useVoiceStatus (ref), crossExperienceModule (ref), voiceStatus (ref), useLocalization (ref), voiceStatusChanged (ref), default (ref), getFFlagEnableCrossExpVoiceMemoryCheck (ref), squadPromptType (ref), var1 (ref)
	local var6 = useDispatch()
	local var7 = useStore()
	local var8 = react.useContext(squadExternalContractContext)
	local var9 = useCurrentSquadId() or ""
	local var10 = useVoiceStatus()
	local var11 = var10 == crossExperienceModule.Constants.VOICE_STATUS.ERROR_JOIN_FEASIBILITY_CHECK_FAILED
	local var12 = useLocalization({
		errorText = "Feature.Squads.Label.VoiceErrorGeneral",
		errorButton = "Feature.Squads.Action.VoiceErrorGeneral"
	})
	
	return if if getFFlagEnableCrossExpVoiceMemoryCheck() then var11 else voiceStatus.isVoiceRetriableErrorByGameJoin(var10) or voiceStatus.isVoiceRetriableErrorByVoiceJoin(var10) then react.createElement(var1, {
		isButtonInline = true,
		LayoutOrder = p2.LayoutOrder,
		label = var12.errorText,
		buttonLabel = var12.errorButton,
		onActivated = if var9 ~= "" then nil else react.useCallback(function()
			-- upvalues: var6 (ref), voiceStatusChanged (copy), crossExperienceModule (copy), default (copy), var9 (ref), getFFlagEnableCrossExpVoiceMemoryCheck (copy), var11 (ref), var8 (ref), var7 (ref), squadPromptType (copy), voiceStatus (copy), var10 (ref)
			local var13 = function(p3)
				-- upvalues: var6 (copy), voiceStatusChanged (copy), crossExperienceModule (copy), default (copy), var9 (copy)
				var6(voiceStatusChanged({
					status = crossExperienceModule.Constants.VOICE_STATUS.RCC_CONNECTING
				}))
				default:join({
					force = true,
					partyId = var9,
					shouldIgnoreMemoryWarning = p3
				})
			end
			
			if getFFlagEnableCrossExpVoiceMemoryCheck() and var11 then
				if default:performJoinFeasibilityCheck() then
					var13()
					
					return
				end
				var8.setSquadPrompt(var7, {
					hideCancelButton = false,
					promptType = squadPromptType.ConnectVoiceWithLowMemory,
					onConfirm = function() end,
					onCancel = function()
						-- upvalues: var13 (ref)
						var13(true)
					end
				})
				
				return
			elseif voiceStatus.isVoiceRetriableErrorByGameJoin(var10) then
				if getFFlagEnableCrossExpVoiceMemoryCheck() then
					var13()
					
					return
				end
				var6(voiceStatusChanged({
					status = crossExperienceModule.Constants.VOICE_STATUS.RCC_CONNECTING
				}))
				default:join({ force = true, partyId = var9 })
				
				return
			elseif voiceStatus.isVoiceRetriableErrorByVoiceJoin(var10) then
				default:rejoinVoice()
			end
		end, { var10, var9, var11 })
	}) else nil
end

local var6 = function(p2)
	-- upvalues: useIsCurrentSquadPartyVoiceEligible (ref), useIsLocalPlayerPartyVoiceEligible (ref), useIsAnyOtherUserPartyVoiceEligibleModule (ref), useLocalization (ref), useAppPolicy (ref), react (ref), partyVoiceBannerErrorUserNotEligibleURL (ref), var1 (ref)
	local var7 = useLocalization({
		errorText = "Feature.Squads.Label.VoiceErrorUserIneligible",
		errorButton = "Feature.Squads.Action.VoiceErrorUserIneligible"
	})
	
	return if not (not useIsCurrentSquadPartyVoiceEligible() or (useIsLocalPlayerPartyVoiceEligible() or not useIsAnyOtherUserPartyVoiceEligibleModule())) then react.createElement(var1, {
		isButtonInline = false,
		LayoutOrder = p2.LayoutOrder,
		label = var7.errorText,
		buttonLabel = var7.errorButton,
		onActivated = if useAppPolicy(function(p3)
			return p3.getWebViewSupport()
		end) and partyVoiceBannerErrorUserNotEligibleURL ~= "" then react.useCallback(function()
			-- upvalues: partyVoiceBannerErrorUserNotEligibleURL (copy), var7 (ref)
			if partyVoiceBannerErrorUserNotEligibleURL ~= "" then
				openWebview(var7.errorButton, partyVoiceBannerErrorUserNotEligibleURL)
			end
		end, { var7.errorButton }) else nil
	}) else nil
end

local var7 = function(p2)
	-- upvalues: useVoiceStatus (ref), useCurrentSquadId (ref), react (ref), voiceChatModule (ref), useAppPolicy (ref), useLocalization (ref), voiceStatus (ref), var1 (ref)
	local var8 = useVoiceStatus()
	local var9 = useCurrentSquadId() or ""
	local var10 = react.useMemo(function()
		-- upvalues: voiceChatModule (copy)
		return voiceChatModule.Utils.GetSettingsAppAvailable()
	end, {})
	local var11 = useAppPolicy(function(p3)
		return p3
	end)
	local var12 = useLocalization({
		errorText = "Feature.SettingsHub.Prompt.Subtitle.AllowMicrophoneAccess",
		errorButton = "Feature.SettingsHub.Action.OpenSettings",
		errorSubtext1 = react.useMemo(function()
			-- upvalues: var10 (ref), var11 (ref)
			return (if var10 then var11.getMicSettingsDeeplinkDirectionsLocaleKey() else var11.getMicSettingsDirectionsLocaleKey()) or nil
		end, { var11, var10 }),
		errorSubtext2 = react.useMemo(function()
			-- upvalues: var11 (ref)
			return if var11.getRequiresAppRestartOnMicAccessChange() then "Feature.SettingsHub.Prompt.RestartOnMicAccessChange" else nil
		end, { var11, var10 })
	})
	
	return if voiceStatus.isMicPermissionsError(var8) then react.createElement(var1, {
		isButtonInline = true,
		LayoutOrder = p2.LayoutOrder,
		label = var12.errorText,
		sublabels = { var12.errorSubtext1, var12.errorSubtext2 },
		buttonLabel = var12.errorButton,
		onActivated = if var9 == "" or not var10 then nil else react.useCallback(function()
			-- upvalues: voiceChatModule (copy)
			pcall(function()
				-- upvalues: voiceChatModule (copy)
				voiceChatModule.Utils.SwitchToMicrophoneSettings()
			end)
		end, {})
	}) else nil
end

local var8 = function(p2)
	-- upvalues: useNavigation (ref), useCurrentSquadParentChannelId (ref), useIsCurrentSquadPartyVoiceEligible (ref), useIsLocalPlayerPartyVoiceEligible (ref), useLocalization (ref), react (ref), var1 (ref)
	local var9 = useNavigation()
	local var10 = useCurrentSquadParentChannelId() or ""
	local var11 = useLocalization({
		errorText = "Feature.Squads.Label.VoiceErrorPartyNotVoiceEligible",
		errorButton = "Feature.Squads.Action.VoiceErrorPartyNotVoiceEligible"
	})
	
	return if useIsCurrentSquadPartyVoiceEligible() == false and useIsLocalPlayerPartyVoiceEligible() then react.createElement(var1, {
		isButtonInline = false,
		LayoutOrder = p2.LayoutOrder,
		label = var11.errorText,
		buttonLabel = var11.errorButton,
		onActivated = react.useCallback(function()
			-- upvalues: var10 (ref), var9 (ref)
			if var10 ~= "" then
				pcall(function()
					-- upvalues: var9 (copy), var10 (copy)
					var9.navigate("CreateUnfilteredChatPartialModal", { conversationId = var10 })
				end)
			end
		end, { var10, var9 })
	}) else nil
end

return function(p2)
	-- upvalues: useTokens (ref), react (ref), getFFlagEnableCrossExpVoice (ref), var5 (ref), disablePartyVoiceEligibilityBanner (ref), var8 (ref), var6 (ref), var7 (ref), fFlagEnableVoiceEuConsentPrompt (ref), var4 (ref)
	local var9 = useTokens()
	
	return react.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		[react.Change.AbsoluteSize] = react.useCallback(function(p3)
			-- upvalues: p2 (ref)
			if p3 then
				p2.onAbsoluteSizeChanged(p3.AbsoluteSize)
			end
		end, { p2.onAbsoluteSizeChanged })
	}, {
		UIPadding = react.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var9.Padding.XLarge),
			PaddingRight = UDim.new(0, var9.Padding.XLarge)
		}),
		UIListLayout = react.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var9.Gap.Medium)
		}),
		VoiceErrorBanner = if getFFlagEnableCrossExpVoice() then react.createElement(var5, { LayoutOrder = 1 }) else nil,
		PartyVoiceEligibilityBanner = if getFFlagEnableCrossExpVoice() and not disablePartyVoiceEligibilityBanner then react.createElement(var8, { LayoutOrder = 2 }) else nil,
		PartyVoiceUserEligibilityBanner = if getFFlagEnableCrossExpVoice() then react.createElement(var6, { LayoutOrder = 3 }) else nil,
		VoiceMicPermissionsBanner = if getFFlagEnableCrossExpVoice() then react.createElement(var7, { LayoutOrder = 4 }) else nil,
		VoiceEuModalConnectBanner = if getFFlagEnableCrossExpVoice() and fFlagEnableVoiceEuConsentPrompt then react.createElement(var4, { LayoutOrder = 5 }) else nil
	})
end