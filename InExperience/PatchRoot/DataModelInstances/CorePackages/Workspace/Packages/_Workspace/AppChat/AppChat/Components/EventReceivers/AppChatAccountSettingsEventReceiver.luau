local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local loginStatus = require(parent.RobloxAppEnums).LoginStatus
local fFlagUseSignalsForAuthenticationStatus = require(parent.SharedFlags).FFlagUseSignalsForAuthenticationStatus
local var1 = if fFlagUseSignalsForAuthenticationStatus then require(parent.AuthenticationStatus).GetAuthenticationStatusStore else nil
local fetchChatMetadataModule = require(appChat.Conversations.Thunks.fetchChatMetadata)
local useIsAppLoadedModule = require(appChat.Hooks.useIsAppLoaded)
local useKeybindModule = require(appChat.App.Hooks.useKeybind)
local usePrevious = require(parent.RoactUtils).Hooks.usePrevious
local useIsChatEnabledModule = require(appChat.Hooks.useIsChatEnabled)
local reloadAllMessagesModule = require(appChat.Conversations.Thunks.reloadAllMessages)
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local dismissedAllConversationModalsForSequenceModule = require(appChat.Conversations.Actions.DismissedAllConversationModalsForSequence)
local useIsAppChatVisibleModule = require(appChat.App.Hooks.useIsAppChatVisible)
local getFFlagDebugAppChatModule = require(appChat.Flags.getFFlagDebugAppChat)
local fFlagEnableAEGIS2AppChatConversationBanner = require(parent.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner
local fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace = require(parent.SharedFlags).FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace
local name = require(appChat.Logger):new(script.Name)

return function(value)
	-- upvalues: useDispatch (ref), useIsAppLoadedModule (ref), fFlagUseSignalsForAuthenticationStatus (ref), useSignalState (ref), var1 (ref), loginStatus (ref), useSelector (ref), getFFlagDebugAppChatModule (ref), useKeybindModule (ref), name (ref), reactModule (ref), fetchChatMetadataModule (ref), useIsAppChatVisibleModule (ref), useIsChatEnabledModule (ref), getDeepValue2Module (ref), usePrevious (ref), reloadAllMessagesModule (ref), realtimeDeliveryModule (ref), appChatNetworkingModule (ref), fFlagEnableAEGIS2AppChatConversationBanner (ref), dismissedAllConversationModalsForSequenceModule (ref), fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (ref)
	local var2
	local var3 = useDispatch()
	local var4 = useIsAppLoadedModule()
	
	if fFlagUseSignalsForAuthenticationStatus then
		var2 = useSignalState(var1(false).getStatus) == loginStatus.LOGGED_IN
		var2 = nil
	else
		var2 = useSelector(function(p1)
			-- upvalues: loginStatus (copy)
			return p1.AuthenticationStatus and p1.AuthenticationStatus.status == loginStatus.LOGGED_IN
		end)
	end
	if getFFlagDebugAppChatModule() then
		useKeybindModule({
			keyCode = Enum.KeyCode.G,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function()
			-- upvalues: name (copy), var3 (ref)
			name:debug("Ctrl + G pressed, toggling group chat enabled")
			var3({ type = "Debug_GroupChatEnabledToggled" })
		end, { var3 })
	end
	local var5 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), fetchChatMetadataModule (copy), name (copy)
		var3(fetchChatMetadataModule()):andThen(function(p1)
			-- upvalues: name (copy)
			name:info("Finished fetching chat metadata. Determined isChatEnabled as {}", p1)
		end)
	end, { var3 })
	local var6 = useIsAppChatVisibleModule()
	reactModule.useEffect(function()
		-- upvalues: value (ref), var2 (ref), var4 (ref), name (copy), var5 (ref)
		local var7
		if not value.isInExperience then
			var7 = var2 and not var4
		end
		if var7 then
			name:info("App is not loaded, fetching chat metadata")
			var5()
		end
	end, { var5, var4, value.isInExperience, var2 })
	local var7 = useIsChatEnabledModule()
	local var8 = useSelector(function(p1)
		-- upvalues: getDeepValue2Module (copy)
		return getDeepValue2Module(p1, "ChatAppReducer.ChatSettings.chatUserMessagesEnabled")
	end)
	local var9 = usePrevious(var8)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var9 (ref), var8 (ref), name (copy), var3 (ref), reloadAllMessagesModule (copy)
		if var7 and var9 ~= nil and var9 ~= var8 then
			name:info("Chat messages eligibility changed, reloading all messages")
			var3(reloadAllMessagesModule()):catch(function(p1)
				-- upvalues: name (copy)
				name:warn("Failed to reload all messages after chat user messages eligibility change", p1)
			end)
		end
	end, { var3, var7, var9, var8 })
	realtimeDeliveryModule.useRealtimeNamespace("UserSettingsChanged", function(p1)
		-- upvalues: name (copy), var3 (ref), reloadAllMessagesModule (copy), var5 (ref)
		if p1.SettingsChanged then
			local var10 = false
			local index = table.find(p1.SettingsChanged, "WhoCanUsePartyChatWithMe")
			
			if index then
				name:info("Received privacy setting notification, reloading all messages")
				var3(reloadAllMessagesModule()):catch(function(p2)
					-- upvalues: name (copy)
					name:warn("Failed to reload all messages after party setting change", p2)
				end)
			end
			if var10 or (table.find(p1.SettingsChanged, "WhoCanPartyWithMe") or (table.find(p1.SettingsChanged, "WhoCanUsePartyVoiceWithMe") or index)) then
				name:info("Received privacy setting notification, fetching chat metadata")
				var5()
			end
		end
	end, { var5, var3 })
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("UserSettingsChanged", function(p1, p2)
		-- upvalues: name (copy), var5 (ref)
		if p1 == Enum.ConnectionState.Connected and p2 then
			name:info("Reconnected to UserSettingsChanged, fetching chat metadata")
			var5()
		end
	end, { var5 })
	
	local var10 = function(p1)
		-- upvalues: var3 (ref), appChatNetworkingModule (copy), name (copy), fFlagEnableAEGIS2AppChatConversationBanner (copy), dismissedAllConversationModalsForSequenceModule (copy)
		var3(appChatNetworkingModule.rodux.GetChatLandingModal.API(p1)):catch(function(p2)
			-- upvalues: name (copy)
			name:warning("Error in GetChatLandingModal request. Error: {}", tostring(p2))
		end)
		
		if fFlagEnableAEGIS2AppChatConversationBanner then
			var3(dismissedAllConversationModalsForSequenceModule(appChatNetworkingModule.Constants.ModalSequence.ConversationBottomModal))
		end
	end
	
	realtimeDeliveryModule.useRealtimeNamespace(fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(_)
		-- upvalues: name (copy), fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (copy), var4 (ref), var10 (ref), value (ref), var5 (ref)
		name:info("Received Realtime: {}", fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace)
		
		if var4 then
			var10(value.isInExperience)
			var5()
			
			return
		end
	end, { var5, var4, value.isInExperience, var6 })
	realtimeDeliveryModule.useRealtimeConnectionStateChanged(fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(p1, p2)
		-- upvalues: name (copy), fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (copy), var4 (ref), var10 (ref), value (ref), var5 (ref)
		name:info("Reconnected to Realtime: {}, hasMissedEvents: {}", fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, tostring(p2))
		
		if p1 == Enum.ConnectionState.Connected and p2 and var4 then
			var10(value.isInExperience)
			var5()
			
			return
		end
	end, { var5, var4, value.isInExperience, var6 })
	
	return nil
end