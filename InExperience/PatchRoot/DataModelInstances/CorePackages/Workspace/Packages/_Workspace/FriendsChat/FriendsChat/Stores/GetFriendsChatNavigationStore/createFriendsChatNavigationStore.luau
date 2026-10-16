local Parent = script:FindFirstAncestor("FriendsChat").Parent
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)
local GetFFlagAppChatEnableRootedNavigationModule = require(Parent.AppChat.getFFlagAppChatEnableRootedNavigation)

return function() --[[ Line: 39 ]]
	-- upvalues: CreateSignalFunction (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), SignalsModule (copy), GetConversationStoreModule (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	local Signal3, Signal2_2 = CreateSignalFunction(nil)
	local Signal4, Signal2_3 = CreateSignalFunction(false)
	local Callback = Signal
	
	local function Effect() --[[ Line: 48 ]] end
	
	if GetFFlagAppChatEnableRootedNavigationModule() then
		Callback = SignalsModule.createComputed(function(p1) --[[ Line: 50 ]]
			-- upvalues: Signal (copy), GetConversationStoreModule (upval)
			local SignalResult = Signal(p1)
			
			return if SignalResult == nil then nil elseif GetConversationStoreModule(p1).getConversation(SignalResult, p1) == nil then nil else SignalResult
		end)
		local v1 = nil
		Effect = SignalsModule.createEffect(function(p1) --[[ Line: 59 ]]
			-- upvalues: Signal (copy), Callback (ref), v1 (ref), Signal2 (copy)
			local SignalResult = Signal(p1)
			local CallbackResult = Callback(p1)
			
			if CallbackResult ~= nil then
				v1 = CallbackResult
				
				return
			end
			if SignalResult == nil or SignalResult ~= v1 then
				v1 = nil
				
				return
			else
				v1 = nil
				Signal2(nil)
			end
		end)
	end
	return {
		getSelectedConversationId = Signal,
		getEffectiveConversationId = Callback,
		setSelectedConversationId = Signal2,
		getFocusInputBarRequestTime = Signal1,
		requestFocusInputBar = function(p1) --[[ Line: 78 ]]
			-- upvalues: Signal2_1 (copy)
			Signal2_1(p1 or os.clock())
		end,
		clearFocusInputBarRequest = function() --[[ Line: 81 ]]
			-- upvalues: Signal2_1 (copy)
			Signal2_1(nil)
		end,
		getConversationListFocusRequestTime = Signal3,
		requestFocusConversationList = function(p1) --[[ Line: 85 ]]
			-- upvalues: Signal2_2 (copy)
			Signal2_2(p1 or os.clock())
		end,
		clearConversationListFocusRequest = function() --[[ Line: 88 ]]
			-- upvalues: Signal2_2 (copy)
			Signal2_2(nil)
		end,
		getIsInputBarFocused = Signal4,
		setInputBarFocused = Signal2_3,
		cleanup = Effect
	}
end