local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local appChatNetworkingModule = require(parent.AppChatNetworking)
local partyChatTimeoutReceivedSignal = require(parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal
local getContainsChatSettingModule = require(appChat.Utils.getContainsChatSetting)
local name = require(appChat.Logger):new(script.Name)

return function(_)
	-- upvalues: useDispatch (ref), realtimeDeliveryModule (ref), getContainsChatSettingModule (ref), appChatNetworkingModule (ref), name (ref), reactModule (ref), partyChatTimeoutReceivedSignal (ref)
	local var1 = useDispatch()
	realtimeDeliveryModule.useRealtimeNamespace("UserSettingsChanged", function(p1)
		-- upvalues: getContainsChatSettingModule (copy), var1 (ref), appChatNetworkingModule (copy), name (copy)
		if p1.SettingsChanged and getContainsChatSettingModule(p1.SettingsChanged) then
			var1(appChatNetworkingModule.rodux.GetChatModerationStatuses.API()):catch(function(p2)
				-- upvalues: name (copy)
				name:warning("NetworkingChat failure in UserSettingsChanged->GetChatModerationStatuses, Status: " .. tostring(p2))
			end)
		end
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: partyChatTimeoutReceivedSignal (copy), var1 (ref), appChatNetworkingModule (copy), name (copy)
		local var2 = partyChatTimeoutReceivedSignal:connect(function(p1)
			-- upvalues: var1 (copy), appChatNetworkingModule (copy), name (copy)
			var1(appChatNetworkingModule.rodux.GetChatModerationStatuses.API(if p1 then { p1 } else {})):catch(function(p2)
				-- upvalues: name (copy)
				name:warning("NetworkingChat failure in partyChatTimeoutReceivedSignal->GetChatModerationStatuses, Status: " .. tostring(p2))
			end)
		end)
		
		return function()
			-- upvalues: var2 (ref)
			if var2 then
				var2:disconnect()
			end
		end
	end, { var1 })
	
	return nil
end