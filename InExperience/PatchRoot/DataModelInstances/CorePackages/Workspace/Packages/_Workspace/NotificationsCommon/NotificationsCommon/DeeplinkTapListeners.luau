local LoggerModule = require(script:FindFirstAncestor("NotificationsCommon").Logger)
local List = {}

local function logListenerError(Err)
	-- upvalues: LoggerModule (copy)
	LoggerModule:error("DeeplinkTapListeners: a listener failed: {}", (tostring(Err)))
end

return {
	connect = function(Listener)
		-- upvalues: List (copy)
		local config = { connected = true, listener = Listener }
		table.insert(List, config)
		
		return function()
			-- upvalues: config (copy), List (upval)
			if not config.connected then return end
			config.connected = false
			local FoundIndex: number? = table.find(List, config)
			
			if FoundIndex then
				table.remove(List, FoundIndex)
			end
		end
	end,
	notify = function(p1)
		-- upvalues: List (copy), logListenerError (copy)
		for _, value in table.clone(List) do
			if value.connected then
				xpcall(value.listener, logListenerError, p1)
			end
		end
	end
}