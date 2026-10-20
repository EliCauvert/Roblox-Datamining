local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local CreateProxyFunction = require(Parent.SignalsExperimental).createProxy
local _ = require(AppChat.MessageData.Types)
local SignalsMigrationConfigModule = require(AppChat.Flags.SignalsMigrationConfig)

local function keepSendingMessageStableKey(p1, p2)
	-- upvalues: CryoModule (copy)
	return if p1 == nil or p1.stableKey == nil or p1.stableKey == p1.id or p2.stableKey ~= nil and p2.stableKey ~= p2.id then p2 else CryoModule.Dictionary.join(p2, { stableKey = p1.stableKey })
end

return function()
	-- upvalues: CreateProxyFunction (copy), SignalsMigrationConfigModule (copy), keepSendingMessageStableKey (copy), CryoModule (copy)
	local Proxy = CreateProxyFunction({})
	
	return {
		messages = Proxy,
		getMessage = function(p1, p2)
			-- upvalues: Proxy (copy)
			return Proxy(p2)[p1]
		end,
		upsertMessages = function(List)
			-- upvalues: SignalsMigrationConfigModule (upval), keepSendingMessageStableKey (upval), Proxy (copy)
			for i, value in List do
				if SignalsMigrationConfigModule.shouldUseViewRecyclerMessageList then
					value = keepSendingMessageStableKey(Proxy[i], value)
				end
				Proxy[i] = value
			end
		end,
		updateMessage = function(Key, p1)
			-- upvalues: Proxy (copy), CryoModule (upval)
			local ProxyEntry = Proxy[Key]
			
			if ProxyEntry ~= nil then
				Proxy[Key] = CryoModule.Dictionary.join(ProxyEntry, p1)
			end
		end,
		removeMessage = function(Key)
			-- upvalues: Proxy (copy)
			Proxy[Key] = nil
		end,
		clear = function()
			-- upvalues: Proxy (copy)
			for i in Proxy do
				Proxy[i] = nil
			end
		end
	}
end