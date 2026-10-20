local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local ChatModerationStatusRefreshCoordinatorModule = require(AppChat.Stores.ChatModerationStatusRefreshCoordinator)
local GetContainsChatSettingModule = require(AppChat.Utils.getContainsChatSetting)
local PartyChatTimeoutReceivedSignal = require(Parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal
local NewResult = require(AppChat.Logger):new(script.Name)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions

return function(_)
	-- upvalues: UseDispatchFunction (copy), FFlagAppChatReactiveFeatureRestrictions (copy), ReactModule (copy), ChatModerationStatusRefreshCoordinatorModule (copy), RealtimeDeliveryModule (copy), GetContainsChatSettingModule (copy), AppChatNetworkingModule (copy), NewResult (copy), PartyChatTimeoutReceivedSignal (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseMemoResult = if FFlagAppChatReactiveFeatureRestrictions then ReactModule.useMemo(function()
		-- upvalues: ChatModerationStatusRefreshCoordinatorModule (upval)
		return ChatModerationStatusRefreshCoordinatorModule.createOwner()
	end, { UseDispatchResult }) else nil
	RealtimeDeliveryModule.useRealtimeNamespace("UserSettingsChanged", function(p1)
		-- upvalues: GetContainsChatSettingModule (upval), FFlagAppChatReactiveFeatureRestrictions (upval), ChatModerationStatusRefreshCoordinatorModule (upval), UseMemoResult (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), NewResult (upval)
		if p1.SettingsChanged and GetContainsChatSettingModule(p1.SettingsChanged) then
			if FFlagAppChatReactiveFeatureRestrictions then
				ChatModerationStatusRefreshCoordinatorModule.enqueue(UseMemoResult, function()
					-- upvalues: UseDispatchResult (upval), AppChatNetworkingModule (upval)
					return UseDispatchResult(AppChatNetworkingModule.rodux.GetChatModerationStatuses.API())
				end).promise:catch(function(Err)
					-- upvalues: NewResult (upval)
					NewResult:warning("NetworkingChat failure in UserSettingsChanged->GetChatModerationStatuses, Status: " .. tostring(Err))
				end)
				
				return
			end
			UseDispatchResult(AppChatNetworkingModule.rodux.GetChatModerationStatuses.API()):catch(function(Err)
				-- upvalues: NewResult (upval)
				NewResult:warning("NetworkingChat failure in UserSettingsChanged->GetChatModerationStatuses, Status: " .. tostring(Err))
			end)
		end
	end, {
		if FFlagAppChatReactiveFeatureRestrictions then UseMemoResult else UseDispatchResult,
		UseDispatchResult
	})
	ReactModule.useEffect(function()
		-- upvalues: PartyChatTimeoutReceivedSignal (upval), FFlagAppChatReactiveFeatureRestrictions (upval), ChatModerationStatusRefreshCoordinatorModule (upval), UseMemoResult (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), NewResult (upval)
		local Connection = PartyChatTimeoutReceivedSignal:connect(function(p1)
			-- upvalues: FFlagAppChatReactiveFeatureRestrictions (upval), ChatModerationStatusRefreshCoordinatorModule (upval), UseMemoResult (upval), UseDispatchResult (upval), AppChatNetworkingModule (upval), NewResult (upval)
			if FFlagAppChatReactiveFeatureRestrictions then
				ChatModerationStatusRefreshCoordinatorModule.enqueue(UseMemoResult, function()
					-- upvalues: UseDispatchResult (upval), AppChatNetworkingModule (upval), p1 (copy)
					return UseDispatchResult(AppChatNetworkingModule.rodux.GetChatModerationStatuses.API(if p1 then { p1 } else {}))
				end).promise:catch(function(Err)
					-- upvalues: NewResult (upval)
					NewResult:warning("NetworkingChat failure in partyChatTimeoutReceivedSignal->GetChatModerationStatuses, Status: " .. tostring(Err))
				end)
				
				return
			else
				UseDispatchResult(AppChatNetworkingModule.rodux.GetChatModerationStatuses.API(if p1 then { p1 } else {})):catch(function(Err)
					-- upvalues: NewResult (upval)
					NewResult:warning("NetworkingChat failure in partyChatTimeoutReceivedSignal->GetChatModerationStatuses, Status: " .. tostring(Err))
				end)
			end
		end)
		
		return function()
			-- upvalues: Connection (copy), FFlagAppChatReactiveFeatureRestrictions (upval), ChatModerationStatusRefreshCoordinatorModule (upval), UseMemoResult (upval)
			if Connection then
				Connection:disconnect()
			end
			if FFlagAppChatReactiveFeatureRestrictions then
				ChatModerationStatusRefreshCoordinatorModule.cancelOwner(UseMemoResult)
			end
		end
	end, {
		if FFlagAppChatReactiveFeatureRestrictions then UseMemoResult else UseDispatchResult,
		UseDispatchResult
	})
	
	return nil
end