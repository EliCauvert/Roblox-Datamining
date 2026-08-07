local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local createProxy = require(parent.SignalsExperimental).createProxy
local _ = require(appChat.MessageData.Types)

return function() --[[ line: 31 | named "createConversationMessageStore" ]]
	-- upvalues: createProxy (ref), cryoModule (ref)
	local var2 = createProxy({})
	
	return {
		messages = var2,
		getMessage = function(p0, p1) --[[ line: 35 ]]
			-- upvalues: var2 (ref)
			return var2(p1)[p0]
		end,
		upsertMessages = function(p2) --[[ line: 39 ]]
			-- upvalues: var2 (ref)
			for i, v in p2 do
				var2[i] = v
			end
		end,
		updateMessage = function(p3, p4) --[[ line: 45 ]]
			-- upvalues: var2 (ref), cryoModule (copy)
			local var3 = var2[p3]
			
			if var3 ~= nil then
				var2[p3] = cryoModule.Dictionary.join(var3, p4)
			end
		end,
		removeMessage = function(p5) --[[ line: 52 ]]
			-- upvalues: var2 (ref)
			var2[p5] = nil
		end,
		clear = function() --[[ line: 56 ]]
			-- upvalues: var2 (ref)
			for i in var2 do
				var2[i] = nil
			end
		end
	}
end