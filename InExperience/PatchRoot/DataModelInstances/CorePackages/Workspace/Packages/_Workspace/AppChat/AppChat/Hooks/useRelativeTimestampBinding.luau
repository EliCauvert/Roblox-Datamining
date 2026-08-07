local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local dateTime = require(parent.Time).DateTime
local getConversationTimestampModule = require(appChat.Utils.getConversationTimestamp)

local function computeTimestamp(p0) --[[ line: 10 ]]
	-- upvalues: getConversationTimestampModule (ref), dateTime (ref)
	return if p0 == nil then "" else getConversationTimestampModule(dateTime.fromUnixTimestamp(p0))
end

return function(p1) --[[ line: 17 | named "useRelativeTimestampBinding" ]]
	-- upvalues: reactModule (ref), computeTimestamp (ref)
	local var4, var5 = reactModule.useBinding(computeTimestamp(p1))
	reactModule.useEffect(function() --[[ line: 20 ]]
		-- upvalues: var5 (ref), computeTimestamp (copy), p1 (ref)
		var5(computeTimestamp(p1))
		
		if p1 == nil then
			return function() --[[ line: 24 ]] end
		end
		local var6 = false
		
		local function scheduleUpdate() --[[ line: 29 ]]
			-- upvalues: var6 (write), var5 (copy), computeTimestamp (copy), p1 (copy), scheduleUpdate (ref)
			task.delay(30, function() --[[ line: 30 ]]
				-- upvalues: var6 (copy), var5 (copy), computeTimestamp (copy), p1 (copy), scheduleUpdate (copy)
				if var6 then
					return
				end
				var5(computeTimestamp(p1))
				scheduleUpdate()
			end)
		end
		
		task.delay(30, function() --[[ line: 30 ]]
			-- upvalues: var6 (write), var5 (copy), computeTimestamp (copy), p1 (copy), scheduleUpdate (ref)
			if var6 then
				return
			end
			var5(computeTimestamp(p1))
			scheduleUpdate()
		end)
		
		return function() --[[ line: 41 ]]
			-- upvalues: var6 (write)
			var6 = true
		end
	end, { p1 })
	
	return var4
end