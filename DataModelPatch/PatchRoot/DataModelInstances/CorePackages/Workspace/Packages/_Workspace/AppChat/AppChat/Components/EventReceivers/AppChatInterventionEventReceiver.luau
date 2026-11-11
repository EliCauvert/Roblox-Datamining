local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local PartyChatTimeoutReceivedSignal = require(Parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal
local GetContainsChatSettingModule = require(AppChat.Utils.getContainsChatSetting)
local NewResult = require(AppChat.Logger):new(script.Name)

return function(_)
	-- upvalues: UseDispatchFunction (copy), RealtimeDeliveryModule (copy), GetContainsChatSettingModule (copy), AppChatNetworkingModule (copy), NewResult (copy), ReactModule (copy), PartyChatTimeoutReceivedSignal (copy)
	local UseDispatchResult = UseDispatchFunction()
	RealtimeDeliveryModule.useRealtimeNamespace("UserSettingsChanged", function(p1)
		-- upvalues: GetContainsChatSettingModule (upval), UseDispatchResult (copy), AppChatNetworkingModule (upval), NewResult (upval)
		if p1.SettingsChanged and GetContainsChatSettingModule(p1.SettingsChanged) then
			UseDispatchResult(AppChatNetworkingModule.rodux.GetChatModerationStatuses.API()):catch(function(Err)
				-- upvalues: NewResult (upval)
				NewResult:warning("NetworkingChat failure in UserSettingsChanged->GetChatModerationStatuses, Status: " .. tostring(Err))
			end)
		end
	end, { UseDispatchResult })
	ReactModule.useEffect(function()
		-- upvalues: PartyChatTimeoutReceivedSignal (upval), UseDispatchResult (copy), AppChatNetworkingModule (upval), NewResult (upval)
		local Connection = PartyChatTimeoutReceivedSignal:connect(function(p1)
			-- upvalues: UseDispatchResult (upval), AppChatNetworkingModule (upval), NewResult (upval)
			UseDispatchResult(AppChatNetworkingModule.rodux.GetChatModerationStatuses.API(if p1 then { p1 } else {})):catch(function(Err)
				-- upvalues: NewResult (upval)
				NewResult:warning("NetworkingChat failure in partyChatTimeoutReceivedSignal->GetChatModerationStatuses, Status: " .. tostring(Err))
			end)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			if Connection then
				Connection:disconnect()
			end
		end
	end, { UseDispatchResult })
	
	return nil
end