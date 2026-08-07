local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local appChatNetworkingModule = require(parent.AppChatNetworking)
local partyChatTimeoutReceivedSignal = require(parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal
local getContainsChatSettingModule = require(appChat.Utils.getContainsChatSetting)
local name = require(appChat.Logger):new(script.Name)

return function(_) --[[ line: 15 | named "AppChatInterventionEventReceiver" ]]
	-- upvalues: useDispatch (ref), realtimeDeliveryModule (ref), getContainsChatSettingModule (ref), appChatNetworkingModule (ref), name (ref), reactModule (ref), partyChatTimeoutReceivedSignal (ref)
	local var6 = useDispatch()
	realtimeDeliveryModule.useRealtimeNamespace("UserSettingsChanged", function(p0) --[[ line: 17 ]]
		-- upvalues: getContainsChatSettingModule (copy), var6 (ref), appChatNetworkingModule (copy), name (copy)
		if p0.SettingsChanged and getContainsChatSettingModule(p0.SettingsChanged) then
			var6(appChatNetworkingModule.rodux.GetChatModerationStatuses.API()):catch(function(p1) --[[ line: 20 ]]
				-- upvalues: name (copy)
				name:warning("NetworkingChat failure in UserSettingsChanged->GetChatModerationStatuses, Status: " .. tostring(p1))
			end)
		end
	end, { var6 })
	reactModule.useEffect(function() --[[ line: 29 ]]
		-- upvalues: partyChatTimeoutReceivedSignal (copy), var6 (ref), appChatNetworkingModule (copy), name (copy)
		local var7 = partyChatTimeoutReceivedSignal:connect(function(p2) --[[ line: 30 ]]
			-- upvalues: var6 (copy), appChatNetworkingModule (copy), name (copy)
			var6(appChatNetworkingModule.rodux.GetChatModerationStatuses.API(if p2 then { p2 } else {})):catch(function(p3) --[[ line: 33 ]]
				-- upvalues: name (copy)
				name:warning("NetworkingChat failure in partyChatTimeoutReceivedSignal->GetChatModerationStatuses, Status: " .. tostring(p3))
			end)
		end)
		
		return function() --[[ line: 40 ]]
			-- upvalues: var7 (ref)
			if var7 then
				var7:disconnect()
			end
		end
	end, { var6 })
	
	return nil
end