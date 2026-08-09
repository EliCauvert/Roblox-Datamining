local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local loginStatus = require(parent.RobloxAppEnums).LoginStatus
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

return function(value) --[[ line: 35 | named "AppChatAccountSettingsEventReceiver" ]]
	-- upvalues: useDispatch (ref), useIsAppLoadedModule (ref), useSelector (ref), loginStatus (ref), getFFlagDebugAppChatModule (ref), useKeybindModule (ref), name (ref), reactModule (ref), fetchChatMetadataModule (ref), useIsAppChatVisibleModule (ref), useIsChatEnabledModule (ref), getDeepValue2Module (ref), usePrevious (ref), reloadAllMessagesModule (ref), realtimeDeliveryModule (ref), appChatNetworkingModule (ref), fFlagEnableAEGIS2AppChatConversationBanner (ref), dismissedAllConversationModalsForSequenceModule (ref), fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (ref)
	local var14 = useDispatch()
	local var15 = useIsAppLoadedModule()
	local var16 = useSelector(function(p0) --[[ line: 38 ]]
		-- upvalues: loginStatus (copy)
		return p0.AuthenticationStatus and p0.AuthenticationStatus.status == loginStatus.LOGGED_IN
	end)
	
	if getFFlagDebugAppChatModule() then
		useKeybindModule({
			keyCode = Enum.KeyCode.G,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function() --[[ line: 43 ]]
			-- upvalues: name (copy), var14 (ref)
			name:debug("Ctrl + G pressed, toggling group chat enabled")
			var14({ type = "Debug_GroupChatEnabledToggled" })
		end, { var14 })
	end
	local var17 = reactModule.useCallback(function() --[[ line: 51 ]]
		-- upvalues: var14 (ref), fetchChatMetadataModule (copy), name (copy)
		var14(fetchChatMetadataModule()):andThen(function(p1) --[[ line: 52 ]]
			-- upvalues: name (copy)
			name:info("Finished fetching chat metadata. Determined isChatEnabled as {}", p1)
		end)
	end, { var14 })
	local var18 = useIsAppChatVisibleModule()
	reactModule.useEffect(function() --[[ line: 59 ]]
		-- upvalues: value (ref), var16 (ref), var15 (ref), name (copy), var17 (ref)
		local var23
		if not value.isInExperience then
			var23 = var16 and not var15
		end
		if var23 then
			name:info("App is not loaded, fetching chat metadata")
			var17()
		end
	end, { var17, var15, value.isInExperience, var16 })
	local var19 = useIsChatEnabledModule()
	local var20 = useSelector(function(p2) --[[ line: 67 ]]
		-- upvalues: getDeepValue2Module (copy)
		return getDeepValue2Module(p2, "ChatAppReducer.ChatSettings.chatUserMessagesEnabled")
	end)
	local var21 = usePrevious(var20)
	reactModule.useEffect(function() --[[ line: 72 ]]
		-- upvalues: var19 (ref), var21 (ref), var20 (ref), name (copy), var14 (ref), reloadAllMessagesModule (copy)
		if var19 and var21 ~= nil and var21 ~= var20 then
			name:info("Chat messages eligibility changed, reloading all messages")
			var14(reloadAllMessagesModule()):catch(function(p3) --[[ line: 79 ]]
				-- upvalues: name (copy)
				name:warn("Failed to reload all messages after chat user messages eligibility change", p3)
			end)
		end
	end, { var14, var19, var21, var20 })
	realtimeDeliveryModule.useRealtimeNamespace("UserSettingsChanged", function(p4) --[[ line: 85 ]]
		-- upvalues: name (copy), var14 (ref), reloadAllMessagesModule (copy), var17 (ref)
		if p4.SettingsChanged then
			local var24 = false
			local index = table.find(p4.SettingsChanged, "WhoCanUsePartyChatWithMe")
			
			if index then
				name:info("Received privacy setting notification, reloading all messages")
				var14(reloadAllMessagesModule()):catch(function(p5) --[[ line: 91 ]]
					-- upvalues: name (copy)
					name:warn("Failed to reload all messages after party setting change", p5)
				end)
			end
			if var24 or (table.find(p4.SettingsChanged, "WhoCanPartyWithMe") or (table.find(p4.SettingsChanged, "WhoCanUsePartyVoiceWithMe") or index)) then
				name:info("Received privacy setting notification, fetching chat metadata")
				var17()
			end
		end
	end, { var17, var14 })
	realtimeDeliveryModule.useRealtimeConnectionStateChanged("UserSettingsChanged", function(p6, p7) --[[ line: 107 ]]
		-- upvalues: name (copy), var17 (ref)
		if p6 == Enum.ConnectionState.Connected and p7 then
			name:info("Reconnected to UserSettingsChanged, fetching chat metadata")
			var17()
		end
	end, { var17 })
	
	local var22 = function(p8) --[[ line: 114 ]]
		-- upvalues: var14 (ref), appChatNetworkingModule (copy), name (copy), fFlagEnableAEGIS2AppChatConversationBanner (copy), dismissedAllConversationModalsForSequenceModule (copy)
		var14(appChatNetworkingModule.rodux.GetChatLandingModal.API(p8)):catch(function(p9) --[[ line: 115 ]]
			-- upvalues: name (copy)
			name:warning("Error in GetChatLandingModal request. Error: {}", tostring(p9))
		end)
		
		if fFlagEnableAEGIS2AppChatConversationBanner then
			var14(dismissedAllConversationModalsForSequenceModule(appChatNetworkingModule.Constants.ModalSequence.ConversationBottomModal))
		end
	end
	
	realtimeDeliveryModule.useRealtimeNamespace(fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(_) --[[ line: 129 ]]
		-- upvalues: name (copy), fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (copy), var15 (ref), var22 (ref), value (ref), var17 (ref)
		name:info("Received Realtime: {}", fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace)
		
		if var15 then
			var22(value.isInExperience)
			var17()
			
			return
		end
	end, { var17, var15, value.isInExperience, var18 })
	realtimeDeliveryModule.useRealtimeConnectionStateChanged(fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(p10, p11) --[[ line: 141 ]]
		-- upvalues: name (copy), fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (copy), var15 (ref), var22 (ref), value (ref), var17 (ref)
		name:info("Reconnected to Realtime: {}, hasMissedEvents: {}", fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, tostring(p11))
		
		if p10 == Enum.ConnectionState.Connected and p11 and var15 then
			var22(value.isInExperience)
			var17()
			
			return
		end
	end, { var17, var15, value.isInExperience, var18 })
	
	return nil
end