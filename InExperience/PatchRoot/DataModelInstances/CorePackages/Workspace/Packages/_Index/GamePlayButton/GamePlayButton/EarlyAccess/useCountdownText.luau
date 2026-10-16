local RunService = game:GetService("RunService")
local ReactModule = require(script:FindFirstAncestor("GamePlayButton").Parent.React)

local function formatRemaining(Value: number): string --[[ Line: 13 ]]
	local Largest = math.max(math.floor(Value), 0)
	local Floored = math.floor(Largest / 86400)
	local Floored1 = math.floor(Largest % 86400 / 3600)
	local Floored2 = math.floor(Largest % 3600 / 60)
	local LargestRemainder = Largest % 60
	local List = {}
	
	if Floored > 0 then
		table.insert(List, string.format("%dd", Floored))
	end
	if Floored1 > 0 then
		table.insert(List, string.format("%dh", Floored1))
	end
	if Floored2 > 0 then
		table.insert(List, string.format("%dm", Floored2))
	end
	table.insert(List, string.format("%ds", LargestRemainder))
	
	return table.concat(List, " ")
end

local function computeText(p1) --[[ Line: 34 ]]
	-- upvalues: formatRemaining (copy)
	if p1 == nil then
		return ""
	else
		local v1 = p1 - DateTime.now().UnixTimestamp
		
		return if v1 <= 0 then "" else formatRemaining(v1)
	end
end

return function(p1) --[[ Line: 46 | Named "useCountdownText" ]]
	-- upvalues: ReactModule (copy), computeText (copy), RunService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 47 ]]
		-- upvalues: computeText (upval), p1 (copy)
		return computeText(p1)
	end)
	ReactModule.useEffect(function() --[[ Line: 51 ]]
		-- upvalues: UseStateResult2 (copy), computeText (upval), p1 (copy), RunService (upval)
		UseStateResult2(computeText(p1))
		
		if p1 == nil or p1 - DateTime.now().UnixTimestamp <= 0 then return end
		local Connection = nil
		local v1 = 0
		Connection = RunService.Heartbeat:Connect(function() --[[ Line: 60 ]]
			-- upvalues: v1 (ref), UseStateResult2 (upval), computeText (upval), p1 (upval), Connection (ref)
			local ClockTime = os.clock()
			
			if ClockTime - v1 < 1 then return end
			v1 = ClockTime
			UseStateResult2(computeText(p1))
			
			if p1 - DateTime.now().UnixTimestamp <= 0 and Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end)
		
		return function() --[[ Line: 73 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
	end, { p1 })
	
	return UseStateResult
end