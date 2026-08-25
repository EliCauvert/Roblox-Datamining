local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local createProxy = require(parent.SignalsExperimental).createProxy
local _ = require(appChat.MessageData.Types)

return function()
	-- upvalues: createProxy (ref), cryoModule (ref)
	local var2 = createProxy({})
	
	return {
		messages = var2,
		getMessage = function(p0, p1)
			-- upvalues: var2 (ref)
			return var2(p1)[p0]
		end,
		upsertMessages = function(p2)
			-- upvalues: var2 (ref)
			for i, v in p2 do
				var2[i] = v
			end
		end,
		updateMessage = function(p3, p4)
			-- upvalues: var2 (ref), cryoModule (copy)
			local var3 = var2[p3]
			
			if var3 ~= nil then
				var2[p3] = cryoModule.Dictionary.join(var3, p4)
			end
		end,
		removeMessage = function(p5)
			-- upvalues: var2 (ref)
			var2[p5] = nil
		end,
		clear = function()
			-- upvalues: var2 (ref)
			for i in var2 do
				var2[i] = nil
			end
		end
	}
end