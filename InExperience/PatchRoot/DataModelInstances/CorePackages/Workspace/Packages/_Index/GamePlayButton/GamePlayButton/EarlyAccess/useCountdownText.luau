local runService = game:GetService("RunService")
local reactModule = require(script:FindFirstAncestor("GamePlayButton").Parent.React)

local function formatRemaining(p1)
	local maxValue = math.max(math.floor(p1), 0)
	local floored = math.floor(maxValue / 86400)
	local floored_1 = math.floor(maxValue % 86400 / 3600)
	local floored_2 = math.floor(maxValue % 3600 / 60)
	local var1 = maxValue % 60
	local t = {}
	
	if floored > 0 then
		table.insert(t, string.format("%dd", floored))
	end
	if floored_1 > 0 then
		table.insert(t, string.format("%dh", floored_1))
	end
	if floored_2 > 0 then
		table.insert(t, string.format("%dm", floored_2))
	end
	table.insert(t, string.format("%ds", var1))
	
	return table.concat(t, " ")
end

local function computeText(p1)
	-- upvalues: formatRemaining (ref)
	if p1 == nil then
		return ""
	end
	local var1 = p1 - DateTime.now().UnixTimestamp
	
	return if var1 <= 0 then "" else formatRemaining(var1)
end

return function(p1)
	-- upvalues: reactModule (ref), computeText (ref), runService (ref)
	local var1, var2 = reactModule.useState(function()
		-- upvalues: computeText (copy), p1 (ref)
		return computeText(p1)
	end)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), computeText (copy), p1 (ref), runService (copy)
		var2(computeText(p1))
		
		if p1 == nil or p1 - DateTime.now().UnixTimestamp <= 0 then
			return
		end
		local heartbeatConnection = nil
		local var3 = 0
		heartbeatConnection = runService.Heartbeat:Connect(function()
			-- upvalues: var3 (write), var2 (copy), computeText (copy), p1 (copy), heartbeatConnection (write)
			local processTime = os.clock()
			
			if processTime - var3 < 1 then return end
			var3 = processTime
			var2(computeText(p1))
			
			if p1 - DateTime.now().UnixTimestamp <= 0 and heartbeatConnection then
				heartbeatConnection:Disconnect()
				heartbeatConnection = nil
			end
		end)
		
		return function()
			-- upvalues: heartbeatConnection (write)
			if heartbeatConnection then
				heartbeatConnection:Disconnect()
				heartbeatConnection = nil
			end
		end
	end, { p1 })
	
	return var1
end