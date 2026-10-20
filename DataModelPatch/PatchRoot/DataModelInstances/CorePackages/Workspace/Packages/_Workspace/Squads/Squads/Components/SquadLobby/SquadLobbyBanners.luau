local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local CrossExperienceModule = require(Parent.CrossExperience)
local CrossExperienceVoiceModule = require(Parent.CrossExperienceVoice)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local VoiceChatModule = require(Parent.VoiceChat)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local DependenciesModule = require(Squads.dependencies)
local React = DependenciesModule.React
local Foundation = DependenciesModule.Foundation
local SharedFlags = DependenciesModule.SharedFlags
local Default = CrossExperienceVoiceModule.CrossExperienceVoiceManager.default
local VoiceStatus = CrossExperienceModule.Utils.VoiceStatus
local VoiceStatusChangedFunction = CrossExperienceModule.Actions.VoiceStatusChanged
local UseVoiceStatusFunction = CrossExperienceVoiceModule.Hooks.useVoiceStatus
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseTokensFunction = Foundation.Hooks.useTokens
local UseNavigationFunction = DependenciesModule.useNavigation
local GetFFlagEnableCrossExpVoiceFunction = SharedFlags.GetFFlagEnableCrossExpVoice
local UseCurrentSquadIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadId
local UseCurrentSquadParentChannelIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local UseStoreFunction = DependenciesModule.Hooks.useStore
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local GetFFlagEnableCrossExpVoiceMemoryCheckFunction = SharedFlags.getFFlagEnableCrossExpVoiceMemoryCheck
local FFlagEnableVoiceEuConsentPrompt = SharedFlags.FFlagEnableVoiceEuConsentPrompt
local UseIsAnyOtherUserPartyVoiceEligibleModule = require(Squads.Hooks.useIsAnyOtherUserPartyVoiceEligible)
local UseIsLocalPlayerPartyVoiceEligibleFunction = require(Parent.SquadsCore.Hooks).useIsLocalPlayerPartyVoiceEligible
local UseIsCurrentSquadPartyVoiceEligibleFunction = require(Parent.SquadsCore.Hooks).useIsCurrentSquadPartyVoiceEligible
local SQUADVOICEEUMODALCONSENTGIVENKEY = require(Parent.SquadsCore.Constants).SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY
local SQUADVOICEEUMODALSEENKEY = require(Parent.SquadsCore.Constants).SQUAD_VOICE_EU_MODAL_SEEN_KEY
local GetTableAppStorageKeyFunction = require(Parent.SquadsCore.appStorageAccess).getTableAppStorageKey
local DisplayEuConsentPromptModule = require(Parent.SquadsCore.displayEuConsentPrompt)
local PartyVoiceBannerErrorUserNotEligibleURL = game:DefineFastString("PartyVoiceBannerErrorUserNotEligibleURL", "")
local DisallowSquadLobbyBannersInlineButtons = game:DefineFastFlag("DisallowSquadLobbyBannersInlineButtons", false)
local DisablePartyVoiceEligibilityBanner = game:DefineFastFlag("DisablePartyVoiceEligibilityBanner", false)

function openWebview(p1, Url)
	-- upvalues: HttpService (copy), GuiService (copy)
	GuiService:BroadcastNotification(HttpService:JSONEncode({
		presentationStyle = 0,
		visible = true,
		title = if game:GetEngineFeature("SetWebViewTitle") then p1 else nil,
		url = Url
	}), 20)
end

local function v23(Frame)
	-- upvalues: UseTokensFunction (copy), DisallowSquadLobbyBannersInlineButtons (copy), React (copy), Foundation (copy)
	local UseTokensResult = UseTokensFunction()
	local NoDisallowSquadLobbyBannersInlineButtons: boolean = Frame.isButtonInline and not DisallowSquadLobbyBannersInlineButtons
	
	return React.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_200.Color3,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_200.Transparency,
		LayoutOrder = Frame.LayoutOrder
	}, {
		UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, UseTokensResult.Radius.Small) }),
		UIPadding = React.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, UseTokensResult.Gap.XLarge),
			PaddingRight = UDim.new(0, UseTokensResult.Gap.XLarge),
			PaddingTop = UDim.new(0, UseTokensResult.Gap.Medium),
			PaddingBottom = UDim.new(0, UseTokensResult.Gap.Medium)
		}),
		UIListLayout = React.createElement("UIListLayout", {
			FillDirection = if NoDisallowSquadLobbyBannersInlineButtons then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical,
			Padding = if NoDisallowSquadLobbyBannersInlineButtons then UDim.new(0, UseTokensResult.Gap.XSmall) else UDim.new(0, UseTokensResult.Gap.Medium),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Wraps = not NoDisallowSquadLobbyBannersInlineButtons,
			HorizontalFlex = if NoDisallowSquadLobbyBannersInlineButtons then Enum.UIFlexAlignment.SpaceBetween else Enum.UIFlexAlignment.Fill,
			VerticalFlex = if NoDisallowSquadLobbyBannersInlineButtons then Enum.UIFlexAlignment.Fill else Enum.UIFlexAlignment.None
		}),
		TextFrame = React.createElement(Foundation.View, { tag = "col auto-xy gap-small wrap", LayoutOrder = 1 }, (React.useMemo(function()
			-- upvalues: React (upval), Foundation (upval), UseTokensResult (copy), Frame (copy)
			local Elements = {
				React.createElement(Foundation.Text, {
					LayoutOrder = 1,
					TextWrapped = true,
					AutomaticSize = Enum.AutomaticSize.XY,
					backgroundStyle = UseTokensResult.Color.None,
					colorstyle = UseTokensResult.Color.Content.Emphasis,
					fontStyle = UseTokensResult.Typography.BodySmall,
					Text = Frame.label,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextTruncate = Enum.TextTruncate.None
				})
			}
			
			if Frame.sublabels then
				for i, sublabel in ipairs(Frame.sublabels) do
					if sublabel and sublabel ~= "" then
						table.insert(Elements, React.createElement(Foundation.Text, {
							TextWrapped = true,
							RichText = true,
							AutomaticSize = Enum.AutomaticSize.XY,
							backgroundStyle = UseTokensResult.Color.None,
							colorstyle = UseTokensResult.Color.Content.Emphasis,
							fontStyle = UseTokensResult.Typography.BodySmall,
							LayoutOrder = i + 1,
							Text = sublabel,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Center,
							TextTruncate = Enum.TextTruncate.None
						}))
					end
				end
			end
			return Elements
		end, { Frame.label, Frame.sublabels }))),
		InlineButton = if Frame.onActivated and NoDisallowSquadLobbyBannersInlineButtons then React.createElement(Foundation.Button, {
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			text = Frame.buttonLabel,
			variant = Foundation.Enums.ButtonVariant.Link,
			onActivated = Frame.onActivated
		}) else nil,
		BottomButton = if Frame.onActivated and not NoDisallowSquadLobbyBannersInlineButtons then React.createElement(Foundation.Button, {
			LayoutOrder = 2,
			text = Frame.buttonLabel,
			variant = Foundation.Enums.ButtonVariant.Standard,
			size = Foundation.Enums.ButtonSize.Small,
			onActivated = Frame.onActivated,
			fillBehavior = Foundation.Enums.FillBehavior.Fill
		}) else nil
	})
end

local function v24(Frame)
	-- upvalues: UseLocalUserIdFunction (copy), UseDispatchFunction (copy), React (copy), SquadExternalContractContext (copy), GetTableAppStorageKeyFunction (copy), SQUADVOICEEUMODALSEENKEY (copy), SQUADVOICEEUMODALCONSENTGIVENKEY (copy), HttpService (copy), Default (copy), v23 (copy), DisplayEuConsentPromptModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseStateResult, UseStateResult2 = React.useState(false)
	local TableAppStorageKey = GetTableAppStorageKeyFunction(SQUADVOICEEUMODALSEENKEY)
	local TableAppStorageKey1 = GetTableAppStorageKeyFunction(SQUADVOICEEUMODALCONSENTGIVENKEY)
	React.useEffect(function()
		-- upvalues: TableAppStorageKey (copy), UseLocalUserIdResult (copy), TableAppStorageKey1 (copy), UseStateResult2 (copy)
		if TableAppStorageKey[tostring(UseLocalUserIdResult)] and not TableAppStorageKey1[tostring(UseLocalUserIdResult)] then
			UseStateResult2(true)
		end
	end, {
		HttpService:JSONEncode(TableAppStorageKey),
		HttpService:JSONEncode(TableAppStorageKey1)
	})
	React.useEffect(function()
		-- upvalues: Default (upval), UseStateResult2 (copy)
		local EventConnection = Default.VoiceEuModalConsented.Event:Connect(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
		local EventConnection1 = Default.VoiceEuModalRefused.Event:Connect(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end)
		
		return function()
			-- upvalues: EventConnection (copy), EventConnection1 (copy)
			EventConnection:Disconnect()
			EventConnection1:Disconnect()
		end
	end, {})
	
	return if UseStateResult then React.createElement(v23, {
		label = "Give consent to the voice recording policy in order to access voice chat.",
		buttonLabel = "Connect",
		isButtonInline = true,
		LayoutOrder = Frame.LayoutOrder,
		onActivated = function()
			-- upvalues: UseDispatchResult (copy), DisplayEuConsentPromptModule (upval), UseContextResult (copy), UseLocalUserIdResult (copy), TableAppStorageKey (copy), TableAppStorageKey1 (copy)
			UseDispatchResult(DisplayEuConsentPromptModule(UseContextResult.setSquadPrompt, tostring(UseLocalUserIdResult), TableAppStorageKey, TableAppStorageKey1))
		end
	}) else nil
end

local function v25(Frame)
	-- upvalues: UseDispatchFunction (copy), UseStoreFunction (copy), React (copy), SquadExternalContractContext (copy), UseCurrentSquadIdFunction (copy), UseVoiceStatusFunction (copy), CrossExperienceModule (copy), VoiceStatus (copy), UseLocalizationFunction (copy), VoiceStatusChangedFunction (copy), Default (copy), GetFFlagEnableCrossExpVoiceMemoryCheckFunction (copy), SquadPromptType (copy), v23 (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseStoreResult = UseStoreFunction()
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction() or ""
	local UseVoiceStatusResult = UseVoiceStatusFunction()
	local IsUseVoiceStatusResultMatch = UseVoiceStatusResult == CrossExperienceModule.Constants.VOICE_STATUS.ERROR_JOIN_FEASIBILITY_CHECK_FAILED
	local IsVoiceRetriableErrorByGameJoin = VoiceStatus.isVoiceRetriableErrorByGameJoin(UseVoiceStatusResult) or VoiceStatus.isVoiceRetriableErrorByVoiceJoin(UseVoiceStatusResult)
	local UseLocalizationResult = UseLocalizationFunction({
		errorText = "Feature.Squads.Label.VoiceErrorGeneral",
		errorButton = "Feature.Squads.Action.VoiceErrorGeneral"
	})
	local UseResult = React.useCallback(function()
		-- upvalues: UseDispatchResult (copy), VoiceStatusChangedFunction (upval), CrossExperienceModule (upval), Default (upval), UseCurrentSquadIdResult (copy), GetFFlagEnableCrossExpVoiceMemoryCheckFunction (upval), IsUseVoiceStatusResultMatch (copy), UseContextResult (copy), UseStoreResult (copy), SquadPromptType (upval), VoiceStatus (upval), UseVoiceStatusResult (copy)
		local function v51(ShouldIgnoreMemoryWarning)
			-- upvalues: UseDispatchResult (upval), VoiceStatusChangedFunction (upval), CrossExperienceModule (upval), Default (upval), UseCurrentSquadIdResult (upval)
			UseDispatchResult(VoiceStatusChangedFunction({
				status = CrossExperienceModule.Constants.VOICE_STATUS.RCC_CONNECTING
			}))
			Default:join({
				force = true,
				partyId = UseCurrentSquadIdResult,
				shouldIgnoreMemoryWarning = ShouldIgnoreMemoryWarning
			})
		end
		
		if GetFFlagEnableCrossExpVoiceMemoryCheckFunction() and IsUseVoiceStatusResultMatch then
			if Default:performJoinFeasibilityCheck() then
				v51()
				
				return
			else
				UseContextResult.setSquadPrompt(UseStoreResult, {
					hideCancelButton = false,
					promptType = SquadPromptType.ConnectVoiceWithLowMemory,
					onConfirm = function() end,
					onCancel = function()
						-- upvalues: v51 (copy)
						v51(true)
					end
				})
				
				return
			end
		elseif VoiceStatus.isVoiceRetriableErrorByGameJoin(UseVoiceStatusResult) then
			if GetFFlagEnableCrossExpVoiceMemoryCheckFunction() then
				v51()
				
				return
			else
				UseDispatchResult(VoiceStatusChangedFunction({
					status = CrossExperienceModule.Constants.VOICE_STATUS.RCC_CONNECTING
				}))
				Default:join({ force = true, partyId = UseCurrentSquadIdResult })
				
				return
			end
		elseif VoiceStatus.isVoiceRetriableErrorByVoiceJoin(UseVoiceStatusResult) then
			Default:rejoinVoice()
		end
	end, {
		UseVoiceStatusResult,
		UseCurrentSquadIdResult,
		IsUseVoiceStatusResultMatch
	})
	local IsUseVoiceStatusResultMatch1 = GetFFlagEnableCrossExpVoiceMemoryCheckFunction() and IsUseVoiceStatusResultMatch or IsVoiceRetriableErrorByGameJoin
	
	return if IsUseVoiceStatusResultMatch1 then React.createElement(v23, {
		isButtonInline = true,
		LayoutOrder = Frame.LayoutOrder,
		label = UseLocalizationResult.errorText,
		buttonLabel = UseLocalizationResult.errorButton,
		onActivated = if UseCurrentSquadIdResult == "" then nil else UseResult
	}) else nil
end

local function v26(Frame)
	-- upvalues: UseIsCurrentSquadPartyVoiceEligibleFunction (copy), UseIsLocalPlayerPartyVoiceEligibleFunction (copy), UseIsAnyOtherUserPartyVoiceEligibleModule (copy), UseLocalizationFunction (copy), UseAppPolicyFunction (copy), React (copy), PartyVoiceBannerErrorUserNotEligibleURL (copy), v23 (copy)
	local UseIsCurrentSquadPartyVoiceEligibleResult = UseIsCurrentSquadPartyVoiceEligibleFunction()
	local UseIsLocalPlayerPartyVoiceEligibleResult = UseIsLocalPlayerPartyVoiceEligibleFunction()
	local UseIsAnyOtherUserPartyVoiceEligibleModuleResult = UseIsAnyOtherUserPartyVoiceEligibleModule()
	local UseLocalizationResult = UseLocalizationFunction({
		errorText = "Feature.Squads.Label.VoiceErrorUserIneligible",
		errorButton = "Feature.Squads.Action.VoiceErrorUserIneligible"
	})
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getWebViewSupport()
	end)
	local UseResult = React.useCallback(function()
		-- upvalues: PartyVoiceBannerErrorUserNotEligibleURL (upval), UseLocalizationResult (copy)
		if PartyVoiceBannerErrorUserNotEligibleURL ~= "" then
			openWebview(UseLocalizationResult.errorButton, PartyVoiceBannerErrorUserNotEligibleURL)
		end
	end, { UseLocalizationResult.errorButton })
	
	return if UseIsCurrentSquadPartyVoiceEligibleResult and (not UseIsLocalPlayerPartyVoiceEligibleResult and UseIsAnyOtherUserPartyVoiceEligibleModuleResult) then React.createElement(v23, {
		isButtonInline = false,
		LayoutOrder = Frame.LayoutOrder,
		label = UseLocalizationResult.errorText,
		buttonLabel = UseLocalizationResult.errorButton,
		onActivated = if UseAppPolicyResult and PartyVoiceBannerErrorUserNotEligibleURL ~= "" then UseResult else nil
	}) else nil
end

local function v27(Frame)
	-- upvalues: UseVoiceStatusFunction (copy), UseCurrentSquadIdFunction (copy), React (copy), VoiceChatModule (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), VoiceStatus (copy), v23 (copy)
	local UseVoiceStatusResult = UseVoiceStatusFunction()
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction() or ""
	local UseMemoResult = React.useMemo(function()
		-- upvalues: VoiceChatModule (upval)
		return VoiceChatModule.Utils.GetSettingsAppAvailable()
	end, {})
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		errorText = "Feature.SettingsHub.Prompt.Subtitle.AllowMicrophoneAccess",
		errorButton = "Feature.SettingsHub.Action.OpenSettings",
		errorSubtext1 = React.useMemo(function()
			-- upvalues: UseMemoResult (copy), UseAppPolicyResult (copy)
			return (if UseMemoResult then UseAppPolicyResult.getMicSettingsDeeplinkDirectionsLocaleKey() else UseAppPolicyResult.getMicSettingsDirectionsLocaleKey()) or nil
		end, { UseAppPolicyResult, UseMemoResult }),
		errorSubtext2 = React.useMemo(function()
			-- upvalues: UseAppPolicyResult (copy)
			return if UseAppPolicyResult.getRequiresAppRestartOnMicAccessChange() then "Feature.SettingsHub.Prompt.RestartOnMicAccessChange" else nil
		end, { UseAppPolicyResult, UseMemoResult })
	})
	local UseResult = React.useCallback(function()
		-- upvalues: VoiceChatModule (upval)
		pcall(function()
			-- upvalues: VoiceChatModule (upval)
			VoiceChatModule.Utils.SwitchToMicrophoneSettings()
		end)
	end, {})
	
	return if VoiceStatus.isMicPermissionsError(UseVoiceStatusResult) then React.createElement(v23, {
		isButtonInline = true,
		LayoutOrder = Frame.LayoutOrder,
		label = UseLocalizationResult.errorText,
		sublabels = {
			UseLocalizationResult.errorSubtext1,
			UseLocalizationResult.errorSubtext2
		},
		buttonLabel = UseLocalizationResult.errorButton,
		onActivated = if UseCurrentSquadIdResult == "" or not UseMemoResult then nil else UseResult
	}) else nil
end

local function v28(Frame)
	-- upvalues: UseNavigationFunction (copy), UseCurrentSquadParentChannelIdFunction (copy), UseIsCurrentSquadPartyVoiceEligibleFunction (copy), UseIsLocalPlayerPartyVoiceEligibleFunction (copy), UseLocalizationFunction (copy), React (copy), v23 (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseCurrentSquadParentChannelIdResult = UseCurrentSquadParentChannelIdFunction() or ""
	local UseIsCurrentSquadPartyVoiceEligibleResult = UseIsCurrentSquadPartyVoiceEligibleFunction()
	local UseIsLocalPlayerPartyVoiceEligibleResult = UseIsLocalPlayerPartyVoiceEligibleFunction()
	local UseIsLocalPlayerPartyVoiceEligibleResult1 = UseIsCurrentSquadPartyVoiceEligibleResult == false and UseIsLocalPlayerPartyVoiceEligibleResult
	local UseLocalizationResult = UseLocalizationFunction({
		errorText = "Feature.Squads.Label.VoiceErrorPartyNotVoiceEligible",
		errorButton = "Feature.Squads.Action.VoiceErrorPartyNotVoiceEligible"
	})
	local UseResult = React.useCallback(function()
		-- upvalues: UseCurrentSquadParentChannelIdResult (copy), UseNavigationResult (copy)
		if UseCurrentSquadParentChannelIdResult ~= "" then
			pcall(function()
				-- upvalues: UseNavigationResult (upval), UseCurrentSquadParentChannelIdResult (upval)
				UseNavigationResult.navigate("CreateUnfilteredChatPartialModal", { conversationId = UseCurrentSquadParentChannelIdResult })
			end)
		end
	end, {
		UseCurrentSquadParentChannelIdResult,
		UseNavigationResult
	})
	
	return if UseIsLocalPlayerPartyVoiceEligibleResult1 then React.createElement(v23, {
		isButtonInline = false,
		LayoutOrder = Frame.LayoutOrder,
		label = UseLocalizationResult.errorText,
		buttonLabel = UseLocalizationResult.errorButton,
		onActivated = UseResult
	}) else nil
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), React (copy), GetFFlagEnableCrossExpVoiceFunction (copy), v25 (copy), DisablePartyVoiceEligibilityBanner (copy), v28 (copy), v26 (copy), v27 (copy), FFlagEnableVoiceEuConsentPrompt (copy), v24 (copy)
	local UseTokensResult = UseTokensFunction()
	
	return React.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		[React.Change.AbsoluteSize] = React.useCallback(function(Frame)
			-- upvalues: p1 (copy)
			if Frame then
				p1.onAbsoluteSizeChanged(Frame.AbsoluteSize)
			end
		end, { p1.onAbsoluteSizeChanged })
	}, {
		UIPadding = React.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, UseTokensResult.Padding.XLarge),
			PaddingRight = UDim.new(0, UseTokensResult.Padding.XLarge)
		}),
		UIListLayout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseTokensResult.Gap.Medium)
		}),
		VoiceErrorBanner = if GetFFlagEnableCrossExpVoiceFunction() then React.createElement(v25, { LayoutOrder = 1 }) else nil,
		PartyVoiceEligibilityBanner = if GetFFlagEnableCrossExpVoiceFunction() and not DisablePartyVoiceEligibilityBanner then React.createElement(v28, { LayoutOrder = 2 }) else nil,
		PartyVoiceUserEligibilityBanner = if GetFFlagEnableCrossExpVoiceFunction() then React.createElement(v26, { LayoutOrder = 3 }) else nil,
		VoiceMicPermissionsBanner = if GetFFlagEnableCrossExpVoiceFunction() then React.createElement(v27, { LayoutOrder = 4 }) else nil,
		VoiceEuModalConnectBanner = if GetFFlagEnableCrossExpVoiceFunction() and FFlagEnableVoiceEuConsentPrompt then React.createElement(v24, { LayoutOrder = 5 }) else nil
	})
end