local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local RobloxEventReceiver = require(AppChat.Parent.RealtimeDelivery).RobloxEventReceiver
local CreateRealtimePortModule = require(AppChat.AppChatData.Ports.createRealtimePort)

local function createEngineSignal()
	local List = {}
	
	return {
		Connect = function(_, Value)
			-- upvalues: List (copy)
			table.insert(List, Value)
			
			return {
				Disconnect = function()
					-- upvalues: List (upval), Value (copy)
					local FoundIndex: number? = table.find(List, Value)
					
					if FoundIndex ~= nil then
						table.remove(List, FoundIndex)
					end
				end
			}
		end,
		Fire = function(_, ...)
			-- upvalues: List (copy)
			for _, value in table.clone(List) do
				value(...)
			end
		end
	}
end

return function()
	-- upvalues: createEngineSignal (copy), CreateRealtimePortModule (copy), RobloxEventReceiver (copy), HttpService (copy)
	local config = {
		RobloxEventReceived = createEngineSignal(),
		RobloxConnectionChanged = createEngineSignal()
	}
	
	return {
		port = CreateRealtimePortModule(function()
			-- upvalues: RobloxEventReceiver (upval), config (copy)
			return RobloxEventReceiver.new(config)
		end),
		push = function(Namespace, Input)
			-- upvalues: config (copy), HttpService (upval)
			config.RobloxEventReceived:Fire({
				namespace = Namespace,
				detail = HttpService:JSONEncode(Input)
			})
		end
	}
end