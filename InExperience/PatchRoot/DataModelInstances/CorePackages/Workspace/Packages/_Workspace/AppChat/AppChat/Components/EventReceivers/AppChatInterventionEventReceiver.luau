local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local appChatNetworkingModule = require(parent.AppChatNetworking)
local chatModerationStatusRefreshCoordinatorModule = require(appChat.Stores.ChatModerationStatusRefreshCoordinator)
local getContainsChatSettingModule = require(appChat.Utils.getContainsChatSetting)
local partyChatTimeoutReceivedSignal = require(parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal
local name = require(appChat.Logger):new(script.Name)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions

return function(_)
	-- upvalues: useDispatch (ref), fFlagAppChatReactiveFeatureRestrictions (ref), reactModule (ref), chatModerationStatusRefreshCoordinatorModule (ref), realtimeDeliveryModule (ref), getContainsChatSettingModule (ref), appChatNetworkingModule (ref), name (ref), partyChatTimeoutReceivedSignal (ref)
	local var1 = useDispatch()
	local var2 = if fFlagAppChatReactiveFeatureRestrictions then reactModule.useMemo(function()
		-- upvalues: chatModerationStatusRefreshCoordinatorModule (copy)
		return chatModerationStatusRefreshCoordinatorModule.createOwner()
	end, { var1 }) else nil
	realtimeDeliveryModule.useRealtimeNamespace("UserSettingsChanged", function(p1)
		-- upvalues: getContainsChatSettingModule (copy), fFlagAppChatReactiveFeatureRestrictions (copy), chatModerationStatusRefreshCoordinatorModule (copy), var2 (ref), var1 (ref), appChatNetworkingModule (copy), name (copy)
		if p1.SettingsChanged and getContainsChatSettingModule(p1.SettingsChanged) then
			if fFlagAppChatReactiveFeatureRestrictions then
				chatModerationStatusRefreshCoordinatorModule.enqueue(var2, function()
					-- upvalues: var1 (copy), appChatNetworkingModule (copy)
					return var1(appChatNetworkingModule.rodux.GetChatModerationStatuses.API())
				end).promise:catch(function(p2)
					-- upvalues: name (copy)
					name:warning("NetworkingChat failure in UserSettingsChanged->GetChatModerationStatuses, Status: " .. tostring(p2))
				end)
				
				return
			end
			var1(appChatNetworkingModule.rodux.GetChatModerationStatuses.API()):catch(function(p2)
				-- upvalues: name (copy)
				name:warning("NetworkingChat failure in UserSettingsChanged->GetChatModerationStatuses, Status: " .. tostring(p2))
			end)
		end
	end, {
		if fFlagAppChatReactiveFeatureRestrictions then var2 else var1,
		var1
	})
	reactModule.useEffect(function()
		-- upvalues: partyChatTimeoutReceivedSignal (copy), fFlagAppChatReactiveFeatureRestrictions (copy), chatModerationStatusRefreshCoordinatorModule (copy), var2 (ref), var1 (ref), appChatNetworkingModule (copy), name (copy)
		local var3 = partyChatTimeoutReceivedSignal:connect(function(p1)
			-- upvalues: fFlagAppChatReactiveFeatureRestrictions (copy), chatModerationStatusRefreshCoordinatorModule (copy), var2 (copy), var1 (copy), appChatNetworkingModule (copy), name (copy)
			if fFlagAppChatReactiveFeatureRestrictions then
				chatModerationStatusRefreshCoordinatorModule.enqueue(var2, function()
					-- upvalues: var1 (copy), appChatNetworkingModule (copy), p1 (ref)
					return var1(appChatNetworkingModule.rodux.GetChatModerationStatuses.API(if p1 then { p1 } else {}))
				end).promise:catch(function(p2)
					-- upvalues: name (copy)
					name:warning("NetworkingChat failure in partyChatTimeoutReceivedSignal->GetChatModerationStatuses, Status: " .. tostring(p2))
				end)
				
				return
			end
			var1(appChatNetworkingModule.rodux.GetChatModerationStatuses.API(if p1 then { p1 } else {})):catch(function(p2)
				-- upvalues: name (copy)
				name:warning("NetworkingChat failure in partyChatTimeoutReceivedSignal->GetChatModerationStatuses, Status: " .. tostring(p2))
			end)
		end)
		
		return function()
			-- upvalues: var3 (ref), fFlagAppChatReactiveFeatureRestrictions (copy), chatModerationStatusRefreshCoordinatorModule (copy), var2 (copy)
			if var3 then
				var3:disconnect()
			end
			if fFlagAppChatReactiveFeatureRestrictions then
				chatModerationStatusRefreshCoordinatorModule.cancelOwner(var2)
			end
		end
	end, {
		if fFlagAppChatReactiveFeatureRestrictions then var2 else var1,
		var1
	})
	
	return nil
end