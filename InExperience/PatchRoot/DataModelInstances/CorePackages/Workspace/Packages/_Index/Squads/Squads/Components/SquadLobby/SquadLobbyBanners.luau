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

function openWebview(p0, p1)
	-- upvalues: httpService (ref), guiService (ref)
	guiService:BroadcastNotification(httpService:JSONEncode({
		presentationStyle = 0,
		visible = true,
		title = if game:GetEngineFeature("SetWebViewTitle") then p0 else nil,
		url = p1
	}), 20)
end

local var12 = function(p2)
	-- upvalues: useTokens (ref), disallowSquadLobbyBannersInlineButtons (ref), react (ref), foundation (ref)
	local var18 = useTokens()
	local var19 = p2.isButtonInline and not disallowSquadLobbyBannersInlineButtons
	
	return react.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundColor3 = var18.Color.Surface.Surface_200.Color3,
		BackgroundTransparency = var18.Color.Surface.Surface_200.Transparency,
		LayoutOrder = p2.LayoutOrder
	}, {
		UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, var18.Radius.Small) }),
		UIPadding = react.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var18.Gap.XLarge),
			PaddingRight = UDim.new(0, var18.Gap.XLarge),
			PaddingTop = UDim.new(0, var18.Gap.Medium),
			PaddingBottom = UDim.new(0, var18.Gap.Medium)
		}),
		UIListLayout = react.createElement("UIListLayout", {
			FillDirection = if var19 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical,
			Padding = if var19 then UDim.new(0, var18.Gap.XSmall) else UDim.new(0, var18.Gap.Medium),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Wraps = not var19,
			HorizontalFlex = if var19 then Enum.UIFlexAlignment.SpaceBetween else Enum.UIFlexAlignment.Fill,
			VerticalFlex = if var19 then Enum.UIFlexAlignment.Fill else Enum.UIFlexAlignment.None
		}),
		TextFrame = react.createElement(foundation.View, { tag = "col auto-xy gap-small wrap", LayoutOrder = 1 }, react.useMemo(function()
			-- upvalues: react (copy), foundation (copy), var18 (ref), p2 (ref)
			local list = {
				react.createElement(foundation.Text, {
					LayoutOrder = 1,
					TextWrapped = true,
					AutomaticSize = Enum.AutomaticSize.XY,
					backgroundStyle = var18.Color.None,
					colorstyle = var18.Color.Content.Emphasis,
					fontStyle = var18.Typography.BodySmall,
					Text = p2.label,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextTruncate = Enum.TextTruncate.None
				})
			}
			
			if p2.sublabels then
				for i, v in ipairs(p2.sublabels) do
					if v and v ~= "" then
						table.insert(list, react.createElement(foundation.Text, {
							TextWrapped = true,
							RichText = true,
							AutomaticSize = Enum.AutomaticSize.XY,
							backgroundStyle = var18.Color.None,
							colorstyle = var18.Color.Content.Emphasis,
							fontStyle = var18.Typography.BodySmall,
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
		end, { p2.label, p2.sublabels })),
		InlineButton = if p2.onActivated and var19 then react.createElement(foundation.Button, {
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			text = p2.buttonLabel,
			variant = foundation.Enums.ButtonVariant.Link,
			onActivated = p2.onActivated
		}) else nil,
		BottomButton = if p2.onActivated and not var19 then react.createElement(foundation.Button, {
			LayoutOrder = 2,
			text = p2.buttonLabel,
			variant = foundation.Enums.ButtonVariant.Standard,
			size = foundation.Enums.ButtonSize.Small,
			onActivated = p2.onActivated,
			fillBehavior = foundation.Enums.FillBehavior.Fill
		}) else nil
	})
end

local var13 = function(p3)
	-- upvalues: useLocalUserId (ref), useDispatch (ref), react (ref), squadExternalContractContext (ref), getTableAppStorageKey (ref), SQUAD_VOICE_EU_MODAL_SEEN_KEY (ref), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (ref), httpService (ref), default (ref), var12 (ref), displayEuConsentPromptModule (ref)
	local var21 = useLocalUserId()
	local var22 = useDispatch()
	local var23 = react.useContext(squadExternalContractContext)
	local var24, var25 = react.useState(false)
	local var26 = getTableAppStorageKey(SQUAD_VOICE_EU_MODAL_SEEN_KEY)
	local var27 = getTableAppStorageKey(SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY)
	react.useEffect(function()
		-- upvalues: var26 (ref), var21 (ref), var27 (ref), var25 (ref)
		if var26[tostring(var21)] and not var27[tostring(var21)] then
			var25(true)
		end
	end, {
		httpService:JSONEncode(var26),
		httpService:JSONEncode(var27)
	})
	react.useEffect(function()
		-- upvalues: default (copy), var25 (ref)
		local eventConnection = default.VoiceEuModalConsented.Event:Connect(function()
			-- upvalues: var25 (copy)
			var25(false)
		end)
		local eventConnection_1 = default.VoiceEuModalRefused.Event:Connect(function()
			-- upvalues: var25 (copy)
			var25(true)
		end)
		
		return function()
			-- upvalues: eventConnection (ref), eventConnection_1 (ref)
			eventConnection:Disconnect()
			eventConnection_1:Disconnect()
		end
	end, {})
	
	return if var24 then react.createElement(var12, {
		label = "Give consent to the voice recording policy in order to access voice chat.",
		buttonLabel = "Connect",
		isButtonInline = true,
		LayoutOrder = p3.LayoutOrder,
		onActivated = function()
			-- upvalues: var22 (ref), displayEuConsentPromptModule (copy), var23 (ref), var21 (ref), var26 (ref), var27 (ref)
			var22(displayEuConsentPromptModule(var23.setSquadPrompt, tostring(var21), var26, var27))
		end
	}) else nil
end

local var14 = function(p4)
	-- upvalues: useDispatch (ref), useStore (ref), react (ref), squadExternalContractContext (ref), useCurrentSquadId (ref), useVoiceStatus (ref), crossExperienceModule (ref), voiceStatus (ref), useLocalization (ref), voiceStatusChanged (ref), default (ref), getFFlagEnableCrossExpVoiceMemoryCheck (ref), squadPromptType (ref), var12 (ref)
	local var30 = useDispatch()
	local var31 = useStore()
	local var32 = react.useContext(squadExternalContractContext)
	local var33 = useCurrentSquadId() or ""
	local var34 = useVoiceStatus()
	local var35 = var34 == crossExperienceModule.Constants.VOICE_STATUS.ERROR_JOIN_FEASIBILITY_CHECK_FAILED
	local var36 = useLocalization({
		errorText = "Feature.Squads.Label.VoiceErrorGeneral",
		errorButton = "Feature.Squads.Action.VoiceErrorGeneral"
	})
	
	return if if getFFlagEnableCrossExpVoiceMemoryCheck() then var35 else voiceStatus.isVoiceRetriableErrorByGameJoin(var34) or voiceStatus.isVoiceRetriableErrorByVoiceJoin(var34) then react.createElement(var12, {
		isButtonInline = true,
		LayoutOrder = p4.LayoutOrder,
		label = var36.errorText,
		buttonLabel = var36.errorButton,
		onActivated = if var33 ~= "" then nil else react.useCallback(function()
			-- upvalues: var30 (ref), voiceStatusChanged (copy), crossExperienceModule (copy), default (copy), var33 (ref), getFFlagEnableCrossExpVoiceMemoryCheck (copy), var35 (ref), var32 (ref), var31 (ref), squadPromptType (copy), voiceStatus (copy), var34 (ref)
			local var37 = function(p5)
				-- upvalues: var30 (copy), voiceStatusChanged (copy), crossExperienceModule (copy), default (copy), var33 (copy)
				var30(voiceStatusChanged({
					status = crossExperienceModule.Constants.VOICE_STATUS.RCC_CONNECTING
				}))
				default:join({
					force = true,
					partyId = var33,
					shouldIgnoreMemoryWarning = p5
				})
			end
			
			if getFFlagEnableCrossExpVoiceMemoryCheck() and var35 then
				if default:performJoinFeasibilityCheck() then
					var37()
					
					return
				end
				var32.setSquadPrompt(var31, {
					hideCancelButton = false,
					promptType = squadPromptType.ConnectVoiceWithLowMemory,
					onConfirm = function() end,
					onCancel = function()
						-- upvalues: var37 (ref)
						var37(true)
					end
				})
				
				return
			elseif voiceStatus.isVoiceRetriableErrorByGameJoin(var34) then
				if getFFlagEnableCrossExpVoiceMemoryCheck() then
					var37()
					
					return
				end
				var30(voiceStatusChanged({
					status = crossExperienceModule.Constants.VOICE_STATUS.RCC_CONNECTING
				}))
				default:join({ force = true, partyId = var33 })
				
				return
			elseif voiceStatus.isVoiceRetriableErrorByVoiceJoin(var34) then
				default:rejoinVoice()
			end
		end, { var34, var33, var35 })
	}) else nil
end

local var15 = function(p6)
	-- upvalues: useIsCurrentSquadPartyVoiceEligible (ref), useIsLocalPlayerPartyVoiceEligible (ref), useIsAnyOtherUserPartyVoiceEligibleModule (ref), useLocalization (ref), useAppPolicy (ref), react (ref), partyVoiceBannerErrorUserNotEligibleURL (ref), var12 (ref)
	local var38 = useLocalization({
		errorText = "Feature.Squads.Label.VoiceErrorUserIneligible",
		errorButton = "Feature.Squads.Action.VoiceErrorUserIneligible"
	})
	
	return if not (not useIsCurrentSquadPartyVoiceEligible() or (useIsLocalPlayerPartyVoiceEligible() or not useIsAnyOtherUserPartyVoiceEligibleModule())) then react.createElement(var12, {
		isButtonInline = false,
		LayoutOrder = p6.LayoutOrder,
		label = var38.errorText,
		buttonLabel = var38.errorButton,
		onActivated = if useAppPolicy(function(p7)
			return p7.getWebViewSupport()
		end) and partyVoiceBannerErrorUserNotEligibleURL ~= "" then react.useCallback(function()
			-- upvalues: partyVoiceBannerErrorUserNotEligibleURL (copy), var38 (ref)
			if partyVoiceBannerErrorUserNotEligibleURL ~= "" then
				openWebview(var38.errorButton, partyVoiceBannerErrorUserNotEligibleURL)
			end
		end, { var38.errorButton }) else nil
	}) else nil
end

local var16 = function(p8)
	-- upvalues: useVoiceStatus (ref), useCurrentSquadId (ref), react (ref), voiceChatModule (ref), useAppPolicy (ref), useLocalization (ref), voiceStatus (ref), var12 (ref)
	local var39 = useVoiceStatus()
	local var40 = useCurrentSquadId() or ""
	local var41 = react.useMemo(function()
		-- upvalues: voiceChatModule (copy)
		return voiceChatModule.Utils.GetSettingsAppAvailable()
	end, {})
	local var42 = useAppPolicy(function(p9)
		return p9
	end)
	local var43 = useLocalization({
		errorText = "Feature.SettingsHub.Prompt.Subtitle.AllowMicrophoneAccess",
		errorButton = "Feature.SettingsHub.Action.OpenSettings",
		errorSubtext1 = react.useMemo(function()
			-- upvalues: var41 (ref), var42 (ref)
			return (if var41 then var42.getMicSettingsDeeplinkDirectionsLocaleKey() else var42.getMicSettingsDirectionsLocaleKey()) or nil
		end, { var42, var41 }),
		errorSubtext2 = react.useMemo(function()
			-- upvalues: var42 (ref)
			return if var42.getRequiresAppRestartOnMicAccessChange() then "Feature.SettingsHub.Prompt.RestartOnMicAccessChange" else nil
		end, { var42, var41 })
	})
	
	return if voiceStatus.isMicPermissionsError(var39) then react.createElement(var12, {
		isButtonInline = true,
		LayoutOrder = p8.LayoutOrder,
		label = var43.errorText,
		sublabels = { var43.errorSubtext1, var43.errorSubtext2 },
		buttonLabel = var43.errorButton,
		onActivated = if var40 == "" or not var41 then nil else react.useCallback(function()
			-- upvalues: voiceChatModule (copy)
			pcall(function()
				-- upvalues: voiceChatModule (copy)
				voiceChatModule.Utils.SwitchToMicrophoneSettings()
			end)
		end, {})
	}) else nil
end

local var17 = function(p10)
	-- upvalues: useNavigation (ref), useCurrentSquadParentChannelId (ref), useIsCurrentSquadPartyVoiceEligible (ref), useIsLocalPlayerPartyVoiceEligible (ref), useLocalization (ref), react (ref), var12 (ref)
	local var44 = useNavigation()
	local var45 = useCurrentSquadParentChannelId() or ""
	local var46 = useLocalization({
		errorText = "Feature.Squads.Label.VoiceErrorPartyNotVoiceEligible",
		errorButton = "Feature.Squads.Action.VoiceErrorPartyNotVoiceEligible"
	})
	
	return if useIsCurrentSquadPartyVoiceEligible() == false and useIsLocalPlayerPartyVoiceEligible() then react.createElement(var12, {
		isButtonInline = false,
		LayoutOrder = p10.LayoutOrder,
		label = var46.errorText,
		buttonLabel = var46.errorButton,
		onActivated = react.useCallback(function()
			-- upvalues: var45 (ref), var44 (ref)
			if var45 ~= "" then
				pcall(function()
					-- upvalues: var44 (copy), var45 (copy)
					var44.navigate("CreateUnfilteredChatPartialModal", { conversationId = var45 })
				end)
			end
		end, { var45, var44 })
	}) else nil
end

return function(p11)
	-- upvalues: useTokens (ref), react (ref), getFFlagEnableCrossExpVoice (ref), var14 (ref), disablePartyVoiceEligibilityBanner (ref), var17 (ref), var15 (ref), var16 (ref), fFlagEnableVoiceEuConsentPrompt (ref), var13 (ref)
	local var47 = useTokens()
	
	return react.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		[react.Change.AbsoluteSize] = react.useCallback(function(p12)
			-- upvalues: p11 (ref)
			if p12 then
				p11.onAbsoluteSizeChanged(p12.AbsoluteSize)
			end
		end, { p11.onAbsoluteSizeChanged })
	}, {
		UIPadding = react.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var47.Padding.XLarge),
			PaddingRight = UDim.new(0, var47.Padding.XLarge)
		}),
		UIListLayout = react.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var47.Gap.Medium)
		}),
		VoiceErrorBanner = if getFFlagEnableCrossExpVoice() then react.createElement(var14, { LayoutOrder = 1 }) else nil,
		PartyVoiceEligibilityBanner = if getFFlagEnableCrossExpVoice() and not disablePartyVoiceEligibilityBanner then react.createElement(var17, { LayoutOrder = 2 }) else nil,
		PartyVoiceUserEligibilityBanner = if getFFlagEnableCrossExpVoice() then react.createElement(var15, { LayoutOrder = 3 }) else nil,
		VoiceMicPermissionsBanner = if getFFlagEnableCrossExpVoice() then react.createElement(var16, { LayoutOrder = 4 }) else nil,
		VoiceEuModalConnectBanner = if getFFlagEnableCrossExpVoice() and fFlagEnableVoiceEuConsentPrompt then react.createElement(var13, { LayoutOrder = 5 }) else nil
	})
end