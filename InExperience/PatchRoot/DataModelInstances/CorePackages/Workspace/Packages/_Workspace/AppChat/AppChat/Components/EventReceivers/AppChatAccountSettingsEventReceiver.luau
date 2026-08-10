local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local loginStatus = require(parent.RobloxAppEnums).LoginStatus
local fFlagUseSignalsForAuthenticationStatus = require(parent.SharedFlags).FFlagUseSignalsForAuthenticationStatus
local var3 = if fFlagUseSignalsForAuthenticationStatus then require(parent.AuthenticationStatus).GetAuthenticationStatusStore else nil
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

return function(value) --[[ line: 43 | named "AppChatAccountSettingsEventReceiver" ]]
	-- upvalues: useDispatch (ref), useIsAppLoadedModule (ref), fFlagUseSignalsForAuthenticationStatus (ref), useSignalState (ref), var3 (ref), loginStatus (ref), useSelector (ref), getFFlagDebugAppChatModule (ref), useKeybindModule (ref), name (ref), reactModule (ref), fetchChatMetadataModule (ref), useIsAppChatVisibleModule (ref), useIsChatEnabledModule (ref), getDeepValue2Module (ref), usePrevious (ref), reloadAllMessagesModule (ref), realtimeDeliveryModule (ref), appChatNetworkingModule (ref), fFlagEnableAEGIS2AppChatConversationBanner (ref), dismissedAllConversationModalsForSequenceModule (ref), fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (ref)
	local var17
	local var15 = useDispatch()
	local var16 = useIsAppLoadedModule()
	
	if fFlagUseSignalsForAuthenticationStatus then
		var17 = useSignalState(var3(false).getStatus) == loginStatus.LOGGED_IN
		var17 = nil
	else
		var17 = useSelector(function(p0) --[[ line: 48 ]]
			-- upvalues: loginStatus (copy)
			return p0.AuthenticationStatus and p0.AuthenticationStatus.status == loginStatus.LOGGED_IN
		end)
	end
	if getFFlagDebugAppChatModule() then
		useKeybindModule({
			keyCode = Enum.KeyCode.G,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function() --[[ line: 53 ]]
			-- upvalues: name (copy), var15 (ref)
			name:debug("Ctrl + G pressed, toggling group chat enabled")
			var15({ type = "Debug_GroupChatEnabledToggled" })
		end, { var15 })
	end
	local var18 = reactModule.useCallback(function() --[[ line: 61 ]]
		-- upvalues: var15 (ref), fetchChatMetadataModule (copy), name (copy)
		var15(fetchChatMetadataModule()):andThen(function(p1) --[[ line: 62 ]]
			-- upvalues: name (copy)
			name:info("Finished fetching chat metadata. Determined isChatEnabled as {}", p1)
		end)
	end, { var15 })
	local var19 = useIsAppChatVisibleModule()
	reactModule.useEffect(function() --[[ line: 69 ]]
		-- upvalues: value (ref), var17 (ref), var16 (ref), name (copy), var18 (ref)
		local var24
		if not value.isInExperience then
			var24 = var17 and not var16
		end
		if var24 then
			name:info("App is not loaded, fetching chat metadata")
			var18()
		end
	end, { var18, var16, value.isInExperience, var17 })
	local var20 = useIsChatEnabledModule()
	local var21 = useSelector(function(p2) --[[ line: 77 ]]
		-- upvalues: getDeepValue2Module (copy)
		return getDeepValue2Module(p2, "ChatAppReducer.ChatSettings.chatUserMessagesEnabled")
	end)
	local var22 = usePrevious(var21)
	reactModule.useEffect(function() --[[ line: 82 ]]
		-- upvalues: var20 (ref), var22 (ref), var21 (ref), name (copy), var15 (ref), reloadAllMessagesModule (copy)
		if var20 and var22 ~= nil and var22 ~= var21 then
			name:info("Chat messages eligibility changed, reloading all messages")
			var15(reloadAllMessagesModule()):catch(function(p3) --[[ line: 89 ]]
				-- upvalues: name (copy)
				name:warn("Failed to reload all messages after chat user messages eligibility change", p3)
			end)
		end
	end, { var15, var20, var22, var21 })
	realtimeDeliveryModule.useRealtimeNamespace("UserSettingsChanged", function(p4) --[[ line: 95 ]]
		-- upvalues: name (copy), var15 (ref), reloadAllMessagesModule (copy), var18 (ref)
		if p4.SettingsChanged then
			local var25 = false
			local index = table.find(p4.SettingsChanged, "WhoCanUsePartyChatWithMe")
			
			if index then
				name:info("Received privacy setting notification, reloading all messages")
				var15(reloadAllMessagesModule()):catch(function(p5) --[[ line: 101 ]]
					-- upvalues: name (copy)
					name:warn("Failed to reload all messages after party setting change", p5)
				end)
			end
			if var25 or (table.find(p4.SettingsChanged, "WhoCanPartyWithMe") or (table.find(p4.SettingsChanged, "WhoCanUsePartyVoiceWithMe") or index)) then
				name:info("Received privacy setting notification, fetching chat metadata")
				var18()
			end
		end
	end, { var18, var15 })
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("UserSettingsChanged", function(p6, p7) --[[ line: 117 ]]
		-- upvalues: name (copy), var18 (ref)
		if p6 == Enum.ConnectionState.Connected and p7 then
			name:info("Reconnected to UserSettingsChanged, fetching chat metadata")
			var18()
		end
	end, { var18 })
	
	local var23 = function(p8) --[[ line: 124 ]]
		-- upvalues: var15 (ref), appChatNetworkingModule (copy), name (copy), fFlagEnableAEGIS2AppChatConversationBanner (copy), dismissedAllConversationModalsForSequenceModule (copy)
		var15(appChatNetworkingModule.rodux.GetChatLandingModal.API(p8)):catch(function(p9) --[[ line: 125 ]]
			-- upvalues: name (copy)
			name:warning("Error in GetChatLandingModal request. Error: {}", tostring(p9))
		end)
		
		if fFlagEnableAEGIS2AppChatConversationBanner then
			var15(dismissedAllConversationModalsForSequenceModule(appChatNetworkingModule.Constants.ModalSequence.ConversationBottomModal))
		end
	end
	
	realtimeDeliveryModule.useRealtimeNamespace(fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(_) --[[ line: 139 ]]
		-- upvalues: name (copy), fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (copy), var16 (ref), var23 (ref), value (ref), var18 (ref)
		name:info("Received Realtime: {}", fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace)
		
		if var16 then
			var23(value.isInExperience)
			var18()
			
			return
		end
	end, { var18, var16, value.isInExperience, var19 })
	realtimeDeliveryModule.useRealtimeConnectionStateChanged(fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(p10, p11) --[[ line: 151 ]]
		-- upvalues: name (copy), fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (copy), var16 (ref), var23 (ref), value (ref), var18 (ref)
		name:info("Reconnected to Realtime: {}, hasMissedEvents: {}", fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, tostring(p11))
		
		if p10 == Enum.ConnectionState.Connected and p11 and var16 then
			var23(value.isInExperience)
			var18()
			
			return
		end
	end, { var18, var16, value.isInExperience, var19 })
	
	return nil
end