local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local dateTime = require(parent.Time).DateTime
local getConversationTimestampModule = require(appChat.Utils.getConversationTimestamp)

local function computeTimestamp(p0)
	-- upvalues: getConversationTimestampModule (ref), dateTime (ref)
	return if p0 == nil then "" else getConversationTimestampModule(dateTime.fromUnixTimestamp(p0))
end

return function(p1)
	-- upvalues: reactModule (ref), computeTimestamp (ref)
	local var4, var5 = reactModule.useBinding(computeTimestamp(p1))
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), computeTimestamp (copy), p1 (ref)
		var5(computeTimestamp(p1))
		
		if p1 == nil then
			return function() end
		end
		local var6 = false
		
		local function scheduleUpdate()
			-- upvalues: var6 (write), var5 (copy), computeTimestamp (copy), p1 (copy), scheduleUpdate (ref)
			task.delay(30, function()
				-- upvalues: var6 (copy), var5 (copy), computeTimestamp (copy), p1 (copy), scheduleUpdate (copy)
				if var6 then
					return
				end
				var5(computeTimestamp(p1))
				scheduleUpdate()
			end)
		end
		
		task.delay(30, function()
			-- upvalues: var6 (write), var5 (copy), computeTimestamp (copy), p1 (copy), scheduleUpdate (ref)
			if var6 then
				return
			end
			var5(computeTimestamp(p1))
			scheduleUpdate()
		end)
		
		return function()
			-- upvalues: var6 (write)
			var6 = true
		end
	end, { p1 })
	
	return var4
end