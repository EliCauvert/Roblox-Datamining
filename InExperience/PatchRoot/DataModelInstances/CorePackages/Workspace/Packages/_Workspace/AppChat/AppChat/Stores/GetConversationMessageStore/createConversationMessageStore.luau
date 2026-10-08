local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local createProxy = require(parent.SignalsExperimental).createProxy
local _ = require(appChat.MessageData.Types)
local signalsMigrationConfigModule = require(appChat.Flags.SignalsMigrationConfig)

local function keepSendingMessageStableKey(p1, p2)
	-- upvalues: cryoModule (ref)
	return if p1 == nil or p1.stableKey == nil or p1.stableKey == p1.id or p2.stableKey ~= nil and p2.stableKey ~= p2.id then p2 else cryoModule.Dictionary.join(p2, { stableKey = p1.stableKey })
end

return function()
	-- upvalues: createProxy (ref), signalsMigrationConfigModule (ref), keepSendingMessageStableKey (ref), cryoModule (ref)
	local var1 = createProxy({})
	
	return {
		messages = var1,
		getMessage = function(p1, p2)
			-- upvalues: var1 (ref)
			return var1(p2)[p1]
		end,
		upsertMessages = function(p1)
			-- upvalues: signalsMigrationConfigModule (copy), keepSendingMessageStableKey (copy), var1 (ref)
			for i, v in p1 do
				local v
				if signalsMigrationConfigModule.shouldUseViewRecyclerMessageList then
					v = keepSendingMessageStableKey(var1[i], v)
				end
				var1[i] = v
			end
		end,
		updateMessage = function(p2, p3)
			-- upvalues: var1 (ref), cryoModule (copy)
			local var2 = var1[p2]
			
			if var2 ~= nil then
				var1[p2] = cryoModule.Dictionary.join(var2, p3)
			end
		end,
		removeMessage = function(p2)
			-- upvalues: var1 (ref)
			var1[p2] = nil
		end,
		clear = function()
			-- upvalues: var1 (ref)
			for i in var1 do
				var1[i] = nil
			end
		end
	}
end