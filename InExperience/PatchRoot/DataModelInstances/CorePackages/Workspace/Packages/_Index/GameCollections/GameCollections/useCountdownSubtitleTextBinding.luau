local runService = game:GetService("RunService")
local gameCollections = script:FindFirstAncestor("GameCollections")
local reactModule = require(gameCollections.Parent.React)
local calculateCountdownTimeModule = require(gameCollections.calculateCountdownTime)

local function _(p1)
	return if p1.days < 0 then false elseif p1.hours < 0 or p1.hours > 23 then false else p1.minutes < 0 or p1.minutes > 59
end

local _ = function(p1)
	return if p1 < 15 then 1 else 15
end

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), calculateCountdownTimeModule (ref), runService (ref)
	local var1, var2 = reactModule.useState("")
	local var3 = reactModule.useCallback(function()
		-- upvalues: p3 (ref), p1 (ref), p2 (ref), calculateCountdownTimeModule (copy), var2 (ref)
		if p3 == nil or p3 == "" or (p1 == nil or p2 == nil) or p2 == "" then
			return 0
		end
		local var4
		local var5 = p3
		local var6 = p1 - DateTime.now().UnixTimestamp
		local var7 = calculateCountdownTimeModule(var6)
		
		if var7.days < 0 then
			var4 = false
		elseif var7.hours < 0 or var7.hours > 23 then
			var4 = false
		elseif var7.minutes >= 0 then
			var4 = var7.minutes <= 59
		end
		if var4 then
			var5 = if var7.days > 0 then p3 else p2:gsub("{hours}", tostring(var7.hours)):gsub("{minutes}", tostring(var7.minutes))
		end
		var2(var5)
		
		return var6
	end, { p3, p1, p2 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		var3()
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), p1 (ref), p2 (ref), runService (copy), var3 (ref)
		local heartbeatConnection = nil
		
		if p3 ~= nil and p3 ~= "" and (p1 ~= nil and p2 ~= nil) and p2 ~= "" then
			local var4 = p1 - DateTime.now().UnixTimestamp
			
			if var4 > 0 then
				local var5 = 0
				local var6 = if var4 < 15 then 1 else 15
				heartbeatConnection = runService.Heartbeat:Connect(function()
					-- upvalues: var5 (write), var6 (write), var4 (write), var3 (copy), heartbeatConnection (write)
					local processTime = os.clock()
					
					if processTime - var5 < var6 then return end
					var5 = processTime
					var4 = var3()
					var6 = if var4 < 15 then 1 else 15
					
					if var4 <= 0 and heartbeatConnection then
						heartbeatConnection:Disconnect()
						heartbeatConnection = nil
					end
				end)
			end
		end
		return function()
			-- upvalues: heartbeatConnection (write)
			if heartbeatConnection ~= nil then
				heartbeatConnection:Disconnect()
				heartbeatConnection = nil
			end
		end
	end, { p1, var3 })
	
	return var1
end