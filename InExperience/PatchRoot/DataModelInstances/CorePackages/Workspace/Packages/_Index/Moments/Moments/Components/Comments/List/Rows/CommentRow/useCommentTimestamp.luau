local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local commentTimestampModule = require(script.Parent.commentTimestamp)

return function(p1)
	-- upvalues: reactModule (ref), commentTimestampModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: commentTimestampModule (copy), p1 (ref)
		return commentTimestampModule.parseTimestamp(p1)
	end, { p1 })
	local var2, var3 = reactModule.useState(function()
		return DateTime.now().UnixTimestampMillis
	end)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var1 (ref), commentTimestampModule (copy)
		var3(DateTime.now().UnixTimestampMillis)
		
		if var1 == nil then
			return
		end
		local var4 = false
		local var5 = nil
		
		local function scheduleUpdate()
			-- upvalues: commentTimestampModule (copy), var1 (copy), var5 (write), var4 (write), var3 (copy), scheduleUpdate (ref)
			local unixTimestampMillis = DateTime.now().UnixTimestampMillis
			local nextChangeTimestamp = commentTimestampModule.getNextChangeTimestamp(var1, unixTimestampMillis)
			
			if nextChangeTimestamp == nil then
				var5 = nil
				
				return
			end
			var5 = task.delay(math.max(0, nextChangeTimestamp - unixTimestampMillis) / 1000, function()
				-- upvalues: var5 (copy), var4 (copy), var3 (copy), scheduleUpdate (copy)
				var5 = nil
				
				if var4 then
					return
				end
				var3(DateTime.now().UnixTimestampMillis)
				scheduleUpdate()
			end)
		end
		
		scheduleUpdate()
		
		return function()
			-- upvalues: var4 (write), var5 (write)
			var4 = true
			
			if var5 ~= nil then
				task.cancel(var5)
				var5 = nil
			end
		end
	end, { var1 })
	
	return commentTimestampModule.formatTimestamp(var1, var2)
end