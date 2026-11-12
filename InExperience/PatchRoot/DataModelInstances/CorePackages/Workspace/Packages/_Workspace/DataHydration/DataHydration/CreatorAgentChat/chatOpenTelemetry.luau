local Signal, Signal2 = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createSignal(nil)

local function updateOpenChat(ChatOpenId, UniverseId, SessionId)
	-- upvalues: Signal (copy), Signal2 (copy)
	local SignalResult = Signal(false)
	
	if SignalResult ~= nil and SignalResult.chatOpenId == ChatOpenId and (SignalResult.universeId ~= UniverseId or SignalResult.sessionId ~= SessionId) then
		Signal2(table.freeze({
			chatOpenId = ChatOpenId,
			universeId = UniverseId,
			sessionId = SessionId
		}))
	end
end

return {
	open = function(ChatOpenId, UniverseId)
		-- upvalues: Signal (copy), Signal2 (copy)
		local SignalResult = Signal(false)
		
		if SignalResult == nil or SignalResult.chatOpenId ~= ChatOpenId then
			Signal2(table.freeze({ chatOpenId = ChatOpenId, universeId = UniverseId }))
		end
	end,
	close = function(ChatOpenId)
		-- upvalues: Signal (copy), Signal2 (copy)
		local SignalResult = Signal(false)
		
		if SignalResult ~= nil and SignalResult.chatOpenId == ChatOpenId then
			Signal2(nil)
		end
	end,
	setUniverseId = function(ChatOpenId, UniverseId)
		-- upvalues: Signal (copy), updateOpenChat (copy)
		local SignalResult = Signal(false)
		updateOpenChat(ChatOpenId, UniverseId, if SignalResult == nil then nil else SignalResult.sessionId)
	end,
	setSessionId = function(ChatOpenId, SessionId)
		-- upvalues: Signal (copy), updateOpenChat (copy)
		local SignalResult = Signal(false)
		updateOpenChat(ChatOpenId, if SignalResult == nil then nil else SignalResult.universeId, SessionId)
	end,
	getChatOpenId = function()
		-- upvalues: Signal (copy)
		local SignalResult = Signal(false)
		
		return if SignalResult == nil then nil else SignalResult.chatOpenId
	end,
	getSessionId = function()
		-- upvalues: Signal (copy)
		local SignalResult = Signal(false)
		
		return if SignalResult == nil then nil else SignalResult.sessionId
	end,
	getChatOpenIdForUniverse = function(UniverseId)
		-- upvalues: Signal (copy)
		local SignalResult = Signal(false)
		
		return if SignalResult == nil or SignalResult.universeId ~= UniverseId then nil else SignalResult.chatOpenId
	end,
	resolveEventIds = function(ChatOpenId, SessionId, UniverseId)
		-- upvalues: Signal (copy)
		local SignalResult = Signal(false)
		
		if SignalResult == nil then
			return ChatOpenId, nil
		elseif if ChatOpenId == nil then if SessionId == nil then if UniverseId == nil then SignalResult.universeId == nil else UniverseId == SignalResult.universeId else SessionId == SignalResult.sessionId else ChatOpenId == SignalResult.chatOpenId then
			return SignalResult.chatOpenId, SignalResult.sessionId
		else
			return ChatOpenId, nil
		end
	end
}