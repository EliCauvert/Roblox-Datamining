local runService = game:GetService("RunService")
local gameCollections = script:FindFirstAncestor("GameCollections")
local reactModule = require(gameCollections.Parent.React)
local calculateCountdownTimeModule = require(gameCollections.calculateCountdownTime)

local function _(p0) --[[ line: 19 | named "validateTimeValues" ]]
	return if p0.days < 0 then false elseif p0.hours < 0 or p0.hours > 23 then false else p0.minutes < 0 or p0.minutes > 59
end

local _ = function(p1) --[[ line: 35 | named "getUpdateFrequency" ]]
	return if p1 < 15 then 1 else 15
end

return function(p2, p3, p4) --[[ line: 46 | named "useCountdownSubtitleTextBinding" ]]
	-- upvalues: reactModule (ref), calculateCountdownTimeModule (ref), runService (ref)
	local var4, var5 = reactModule.useState("")
	local var6 = reactModule.useCallback(function() --[[ line: 52 ]]
		-- upvalues: p4 (ref), p2 (ref), p3 (ref), calculateCountdownTimeModule (copy), var5 (ref)
		if p4 == nil or p4 == "" or (p2 == nil or p3 == nil) or p3 == "" then
			return 0
		end
		local var10
		local var7 = p4
		local var8 = p2 - DateTime.now().UnixTimestamp
		local var9 = calculateCountdownTimeModule(var8)
		
		if var9.days < 0 then
			var10 = false
		elseif var9.hours < 0 or var9.hours > 23 then
			var10 = false
		elseif var9.minutes >= 0 then
			var10 = var9.minutes <= 59
		end
		if var10 then
			var7 = if var9.days > 0 then p4 else p3:gsub("{hours}", tostring(var9.hours)):gsub("{minutes}", tostring(var9.minutes))
		end
		var5(var7)
		
		return var8
	end, { p4, p2, p3 })
	reactModule.useEffect(function() --[[ line: 79 ]]
		-- upvalues: var6 (ref)
		var6()
	end, { var6 })
	reactModule.useEffect(function() --[[ line: 84 ]]
		-- upvalues: p4 (ref), p2 (ref), p3 (ref), runService (copy), var6 (ref)
		local heartbeatConnection = nil
		
		if p4 ~= nil and p4 ~= "" and (p2 ~= nil and p3 ~= nil) and p3 ~= "" then
			local var12 = p2 - DateTime.now().UnixTimestamp
			
			if var12 > 0 then
				local var13 = 0
				local var14 = if var12 < 15 then 1 else 15
				heartbeatConnection = runService.Heartbeat:Connect(function() --[[ line: 99 ]]
					-- upvalues: var13 (write), var14 (write), var12 (write), var6 (copy), heartbeatConnection (write)
					local processTime = os.clock()
					
					if processTime - var13 < var14 then return end
					var13 = processTime
					var12 = var6()
					var14 = if var12 < 15 then 1 else 15
					
					if var12 <= 0 and heartbeatConnection then
						heartbeatConnection:Disconnect()
						heartbeatConnection = nil
					end
				end)
			end
		end
		return function() --[[ line: 114 ]]
			-- upvalues: heartbeatConnection (write)
			if heartbeatConnection ~= nil then
				heartbeatConnection:Disconnect()
				heartbeatConnection = nil
			end
		end
	end, { p2, var6 })
	
	return var4
end