local RunService = game:GetService("RunService")
local GameCollections = script:FindFirstAncestor("GameCollections")
local ReactModule = require(GameCollections.Parent.React)
local CalculateCountdownTimeModule = require(GameCollections.calculateCountdownTime)

local function _(p1): boolean
	return p1.days >= 0 and (p1.hours >= 0 and p1.hours <= 23 and (p1.minutes >= 0 and p1.minutes <= 59))
end

local _ = function(p1: number): number
	return if p1 < 15 then 1 else 15
end

return function(p1, Text, Minutes)
	-- upvalues: ReactModule (copy), CalculateCountdownTimeModule (copy), RunService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Minutes (copy), p1 (copy), Text (copy), CalculateCountdownTimeModule (upval), UseStateResult2 (copy)
		if Minutes == nil or Minutes == "" or p1 == nil or Text == nil or Text == "" then
			return 0
		end
		local Minutes1 = Minutes
		local v1 = p1 - DateTime.now().UnixTimestamp
		local CountdownTimeModule = CalculateCountdownTimeModule(v1)
		
		if CountdownTimeModule.days >= 0 and (CountdownTimeModule.hours >= 0 and CountdownTimeModule.hours <= 23 and (CountdownTimeModule.minutes >= 0 and CountdownTimeModule.minutes <= 59)) then
			Minutes1 = if CountdownTimeModule.days > 0 then Minutes else Text:gsub("{hours}", (tostring(CountdownTimeModule.hours))):gsub("{minutes}", (tostring(CountdownTimeModule.minutes)))
		end
		UseStateResult2(Minutes1)
		
		return v1
	end, { Minutes, p1, Text })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: Minutes (copy), p1 (copy), Text (copy), RunService (upval), UseResult (copy)
		local Connection = nil
		
		if Minutes ~= nil and Minutes ~= "" and p1 ~= nil and Text ~= nil and Text ~= "" then
			local v1 = p1 - DateTime.now().UnixTimestamp
			
			if v1 > 0 then
				local v2 = 0
				local v3: number = if v1 < 15 then 1 else 15
				Connection = RunService.Heartbeat:Connect(function()
					-- upvalues: v2 (ref), v3 (ref), v1 (ref), UseResult (upval), Connection (ref)
					local ClockTime = os.clock()
					
					if ClockTime - v2 < v3 then return end
					v2 = ClockTime
					v1 = UseResult()
					v3 = if v1 < 15 then 1 else 15
					
					if v1 <= 0 and Connection then
						Connection:Disconnect()
						Connection = nil
					end
				end)
			end
		end
		return function()
			-- upvalues: Connection (ref)
			if Connection ~= nil then
				Connection:Disconnect()
				Connection = nil
			end
		end
	end, { p1, UseResult })
	
	return UseStateResult
end