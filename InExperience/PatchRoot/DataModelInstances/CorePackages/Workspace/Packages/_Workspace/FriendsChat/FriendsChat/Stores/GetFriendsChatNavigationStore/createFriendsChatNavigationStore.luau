local Parent = script:FindFirstAncestor("FriendsChat").Parent
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)

return function()
	-- upvalues: CreateSignalFunction (copy), SignalsModule (copy), GetConversationStoreModule (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	local Signal3, Signal2_2 = CreateSignalFunction(nil)
	local Signal4, Signal2_3 = CreateSignalFunction(false)
	local Computed = SignalsModule.createComputed(function(p1)
		-- upvalues: Signal (copy), GetConversationStoreModule (upval)
		local SignalResult = Signal(p1)
		
		return if SignalResult == nil then nil elseif GetConversationStoreModule(p1).getConversation(SignalResult, p1) == nil then nil else SignalResult
	end)
	local v1 = nil
	
	return {
		getSelectedConversationId = Signal,
		getEffectiveConversationId = Computed,
		setSelectedConversationId = Signal2,
		getFocusInputBarRequestTime = Signal1,
		requestFocusInputBar = function(p1)
			-- upvalues: Signal2_1 (copy)
			Signal2_1(p1 or os.clock())
		end,
		clearFocusInputBarRequest = function()
			-- upvalues: Signal2_1 (copy)
			Signal2_1(nil)
		end,
		getConversationListFocusRequestTime = Signal3,
		requestFocusConversationList = function(p1)
			-- upvalues: Signal2_2 (copy)
			Signal2_2(p1 or os.clock())
		end,
		clearConversationListFocusRequest = function()
			-- upvalues: Signal2_2 (copy)
			Signal2_2(nil)
		end,
		getIsInputBarFocused = Signal4,
		setInputBarFocused = Signal2_3,
		cleanup = SignalsModule.createEffect(function(p1)
			-- upvalues: Signal (copy), Computed (copy), v1 (ref), Signal2 (copy)
			local SignalResult = Signal(p1)
			local ComputedResult = Computed(p1)
			
			if ComputedResult ~= nil then
				v1 = ComputedResult
				
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
	}
end