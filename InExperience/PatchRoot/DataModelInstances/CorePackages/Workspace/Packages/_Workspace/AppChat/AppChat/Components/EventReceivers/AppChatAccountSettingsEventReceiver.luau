local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local LoginStatus = require(Parent.RobloxAppEnums).LoginStatus
local FFlagUseSignalsForAuthenticationStatus = require(Parent.SharedFlags).FFlagUseSignalsForAuthenticationStatus
local GetAuthenticationStatusStore = if FFlagUseSignalsForAuthenticationStatus then require(Parent.AuthenticationStatus).GetAuthenticationStatusStore else nil
local FetchChatMetadataModule = require(AppChat.Conversations.Thunks.fetchChatMetadata)
local UseIsAppLoadedModule = require(AppChat.Hooks.useIsAppLoaded)
local UseKeybindModule = require(AppChat.App.Hooks.useKeybind)
local UsePreviousFunction = require(Parent.RoactUtils).Hooks.usePrevious
local UseIsChatEnabledModule = require(AppChat.Hooks.useIsChatEnabled)
local ReloadAllMessagesModule = require(AppChat.Conversations.Thunks.reloadAllMessages)
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local DismissedAllConversationModalsForSequenceModule = require(AppChat.Conversations.Actions.DismissedAllConversationModalsForSequence)
local UseIsAppChatVisibleModule = require(AppChat.App.Hooks.useIsAppChatVisible)
local GetFFlagDebugAppChatModule = require(AppChat.Flags.getFFlagDebugAppChat)
local FFlagEnableAEGIS2AppChatConversationBanner = require(Parent.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner
local FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace = require(Parent.SharedFlags).FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace
local NewResult = require(AppChat.Logger):new(script.Name)

return function(p1) --[[ Line: 43 | Named "AppChatAccountSettingsEventReceiver" ]]
	-- upvalues: UseDispatchFunction (copy), UseIsAppLoadedModule (copy), FFlagUseSignalsForAuthenticationStatus (copy), UseSignalStateFunction (copy), GetAuthenticationStatusStore (copy), LoginStatus (copy), UseSelectorFunction (copy), GetFFlagDebugAppChatModule (copy), UseKeybindModule (copy), NewResult (copy), ReactModule (copy), FetchChatMetadataModule (copy), UseIsAppChatVisibleModule (copy), UseIsChatEnabledModule (copy), GetDeepValue2Module (copy), UsePreviousFunction (copy), ReloadAllMessagesModule (copy), RealtimeDeliveryModule (copy), AppChatNetworkingModule (copy), FFlagEnableAEGIS2AppChatConversationBanner (copy), DismissedAllConversationModalsForSequenceModule (copy), FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseIsAppLoadedModuleResult = UseIsAppLoadedModule()
	local IsUseSignalStateResultMatch = if FFlagUseSignalsForAuthenticationStatus then UseSignalStateFunction(GetAuthenticationStatusStore(false).getStatus) == LoginStatus.LOGGED_IN else UseSelectorFunction(function(p2): boolean --[[ Line: 48 ]]
		-- upvalues: LoginStatus (upval)
		return p2.AuthenticationStatus and p2.AuthenticationStatus.status == LoginStatus.LOGGED_IN
	end)
	
	if GetFFlagDebugAppChatModule() then
		UseKeybindModule({
			keyCode = Enum.KeyCode.G,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function() --[[ Line: 53 ]]
			-- upvalues: NewResult (upval), UseDispatchResult (copy)
			NewResult:debug("Ctrl + G pressed, toggling group chat enabled")
			UseDispatchResult({ type = "Debug_GroupChatEnabledToggled" })
		end, { UseDispatchResult })
	end
	local UseResult = ReactModule.useCallback(function() --[[ Line: 61 ]]
		-- upvalues: UseDispatchResult (copy), FetchChatMetadataModule (upval), NewResult (upval)
		UseDispatchResult(FetchChatMetadataModule()):andThen(function(Result) --[[ Line: 62 ]]
			-- upvalues: NewResult (upval)
			NewResult:info("Finished fetching chat metadata. Determined isChatEnabled as {}", Result)
		end)
	end, { UseDispatchResult })
	local UseIsAppChatVisibleModuleResult = UseIsAppChatVisibleModule()
	ReactModule.useEffect(function() --[[ Line: 69 ]]
		-- upvalues: p1 (copy), IsUseSignalStateResultMatch (copy), UseIsAppLoadedModuleResult (copy), NewResult (upval), UseResult (copy)
		if if p1.isInExperience then not UseIsAppLoadedModuleResult else IsUseSignalStateResultMatch and not UseIsAppLoadedModuleResult then
			NewResult:info("App is not loaded, fetching chat metadata")
			UseResult()
		end
	end, {
		UseResult,
		UseIsAppLoadedModuleResult,
		p1.isInExperience,
		IsUseSignalStateResultMatch
	})
	local UseIsChatEnabledModuleResult = UseIsChatEnabledModule()
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 77 ]]
		-- upvalues: GetDeepValue2Module (upval)
		return GetDeepValue2Module(p2, "ChatAppReducer.ChatSettings.chatUserMessagesEnabled")
	end)
	local UsePreviousResult = UsePreviousFunction(UseSelectorResult)
	ReactModule.useEffect(function() --[[ Line: 82 ]]
		-- upvalues: UseIsChatEnabledModuleResult (copy), UsePreviousResult (copy), UseSelectorResult (copy), NewResult (upval), UseDispatchResult (copy), ReloadAllMessagesModule (upval)
		if UseIsChatEnabledModuleResult and UsePreviousResult ~= nil and UsePreviousResult ~= UseSelectorResult then
			NewResult:info("Chat messages eligibility changed, reloading all messages")
			UseDispatchResult(ReloadAllMessagesModule()):catch(function(Err) --[[ Line: 89 ]]
				-- upvalues: NewResult (upval)
				NewResult:warn("Failed to reload all messages after chat user messages eligibility change", Err)
			end)
		end
	end, {
		UseDispatchResult,
		UseIsChatEnabledModuleResult,
		UsePreviousResult,
		UseSelectorResult
	})
	RealtimeDeliveryModule.useRealtimeNamespace("UserSettingsChanged", function(p2) --[[ Line: 95 ]]
		-- upvalues: NewResult (upval), UseDispatchResult (copy), ReloadAllMessagesModule (upval), UseResult (copy)
		if p2.SettingsChanged then
			local v1 = false
			local FoundIndex: number? = table.find(p2.SettingsChanged, "WhoCanUsePartyChatWithMe")
			
			if FoundIndex then
				NewResult:info("Received privacy setting notification, reloading all messages")
				UseDispatchResult(ReloadAllMessagesModule()):catch(function(Err) --[[ Line: 101 ]]
					-- upvalues: NewResult (upval)
					NewResult:warn("Failed to reload all messages after party setting change", Err)
				end)
			end
			if v1 or (table.find(p2.SettingsChanged, "WhoCanPartyWithMe") or (table.find(p2.SettingsChanged, "WhoCanUsePartyVoiceWithMe") or FoundIndex)) then
				NewResult:info("Received privacy setting notification, fetching chat metadata")
				UseResult()
			end
		end
	end, { UseResult, UseDispatchResult })
	RealtimeDeliveryModule.useRealtimeConnectionStateChanged("UserSettingsChanged", function(ConnectionState, p2) --[[ Line: 117 ]]
		-- upvalues: NewResult (upval), UseResult (copy)
		if ConnectionState == Enum.ConnectionState.Connected and p2 then
			NewResult:info("Reconnected to UserSettingsChanged, fetching chat metadata")
			UseResult()
		end
	end, { UseResult })
	
	local function v28(IsInExperience) --[[ Line: 124 ]]
		-- upvalues: UseDispatchResult (copy), AppChatNetworkingModule (upval), NewResult (upval), FFlagEnableAEGIS2AppChatConversationBanner (upval), DismissedAllConversationModalsForSequenceModule (upval)
		UseDispatchResult(AppChatNetworkingModule.rodux.GetChatLandingModal.API(IsInExperience)):catch(function(Err) --[[ Line: 125 ]]
			-- upvalues: NewResult (upval)
			NewResult:warning("Error in GetChatLandingModal request. Error: {}", (tostring(Err)))
		end)
		
		if FFlagEnableAEGIS2AppChatConversationBanner then
			UseDispatchResult(DismissedAllConversationModalsForSequenceModule(AppChatNetworkingModule.Constants.ModalSequence.ConversationBottomModal))
		end
	end
	
	RealtimeDeliveryModule.useRealtimeNamespace(FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(_) --[[ Line: 139 ]]
		-- upvalues: NewResult (upval), FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (upval), UseIsAppLoadedModuleResult (copy), v28 (copy), p1 (copy), UseResult (copy)
		NewResult:info("Received Realtime: {}", FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace)
		
		if UseIsAppLoadedModuleResult then
			v28(p1.isInExperience)
			UseResult()
			
			return
		end
	end, {
		UseResult,
		UseIsAppLoadedModuleResult,
		p1.isInExperience,
		UseIsAppChatVisibleModuleResult
	})
	RealtimeDeliveryModule.useRealtimeConnectionStateChanged(FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(ConnectionState, p2) --[[ Line: 151 ]]
		-- upvalues: NewResult (upval), FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (upval), UseIsAppLoadedModuleResult (copy), v28 (copy), p1 (copy), UseResult (copy)
		NewResult:info("Reconnected to Realtime: {}, hasMissedEvents: {}", FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, (tostring(p2)))
		
		if ConnectionState == Enum.ConnectionState.Connected and p2 and UseIsAppLoadedModuleResult then
			v28(p1.isInExperience)
			UseResult()
			
			return
		end
	end, {
		UseResult,
		UseIsAppLoadedModuleResult,
		p1.isInExperience,
		UseIsAppChatVisibleModuleResult
	})
	
	return nil
end