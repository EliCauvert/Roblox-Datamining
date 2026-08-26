local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local dateTime = require(parent.Time).DateTime
local getConversationTimestampModule = require(appChat.Utils.getConversationTimestamp)

local function computeTimestamp(p1)
	-- upvalues: getConversationTimestampModule (ref), dateTime (ref)
	return if p1 == nil then "" else getConversationTimestampModule(dateTime.fromUnixTimestamp(p1))
end

return function(p1)
	-- upvalues: reactModule (ref), computeTimestamp (ref)
	local var1, var2 = reactModule.useBinding(computeTimestamp(p1))
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), computeTimestamp (copy), p1 (ref)
		var2(computeTimestamp(p1))
		
		if p1 == nil then
			return function() end
		end
		local var3 = false
		
		local function scheduleUpdate()
			-- upvalues: var3 (write), var2 (copy), computeTimestamp (copy), p1 (copy), scheduleUpdate (ref)
			task.delay(30, function()
				-- upvalues: var3 (copy), var2 (copy), computeTimestamp (copy), p1 (copy), scheduleUpdate (copy)
				if var3 then
					return
				end
				var2(computeTimestamp(p1))
				scheduleUpdate()
			end)
		end
		
		task.delay(30, function()
			-- upvalues: var3 (write), var2 (copy), computeTimestamp (copy), p1 (copy), scheduleUpdate (ref)
			if var3 then
				return
			end
			var2(computeTimestamp(p1))
			scheduleUpdate()
		end)
		
		return function()
			-- upvalues: var3 (write)
			var3 = true
		end
	end, { p1 })
	
	return var1
end