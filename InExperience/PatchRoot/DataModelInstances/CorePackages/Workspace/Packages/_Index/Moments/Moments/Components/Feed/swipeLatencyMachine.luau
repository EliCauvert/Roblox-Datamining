local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)

return function(p1) --[[ Line: 68 | Named "swipeLatencyMachine" ]]
	local NowFunction = p1.now
	local Config = nil
	local Count = 0
	
	local function _() --[[ Line: 76 | Named "tryComplete" ]]
		-- upvalues: Config (ref), p1 (copy)
		local Config1 = Config
		
		if Config1 == nil then return end
		local SettledAt: number = Config1.settledAt
		local FrameAt: number = Config1.frameAt
		
		if SettledAt ~= nil and FrameAt ~= nil then
			Config = nil
			p1.onMeasurement(math.round((math.max(0, FrameAt - SettledAt))), math.round(math.max(FrameAt, SettledAt) - Config1.committedAt), Config1.dimensions)
			
			return
		end
	end
	
	local Schedule = p1.schedule or task.delay
	
	local _ = function(Count1) --[[ Line: 97 | Named "armCap" ]]
		-- upvalues: p1 (copy), Schedule (copy), Count (ref), Config (ref)
		if p1.capMs > 0 then
			Schedule(p1.capMs / 1000, function() --[[ Line: 101 ]]
				-- upvalues: Count1 (copy), Count (upval), Config (upval)
				if Count1 == Count then
					Config = nil
					
					return
				end
			end)
			
			return
		end
	end
	
	return {
		start = function(p2, p3, Dimensions) --[[ Line: 110 ]]
			-- upvalues: Count (ref), NowFunction (copy), Config (ref), p1 (copy), Schedule (copy)
			Count += 1
			local NowResult = NowFunction()
			Config = {
				committedAt = NowResult,
				settledAt = if p2 then NowResult else nil,
				frameAt = if p3 then NowResult else nil,
				dimensions = Dimensions
			}
			local Count1: number = Count
			
			if p1.capMs > 0 then
				Schedule(p1.capMs / 1000, function() --[[ Line: 101 ]]
					-- upvalues: Count1 (copy), Count (upval), Config (upval)
					if Count1 == Count then
						Config = nil
						
						return
					end
				end)
			end
			local Config1 = Config
			
			if Config1 == nil then return end
			local SettledAt: number = Config1.settledAt
			local FrameAt: number = Config1.frameAt
			
			if SettledAt ~= nil then
				if FrameAt == nil then return end
				Config = nil
				p1.onMeasurement(math.round((math.max(0, FrameAt - SettledAt))), math.round(math.max(FrameAt, SettledAt) - Config1.committedAt), Config1.dimensions)
			end
		end,
		update = function(p2, p3) --[[ Line: 126 ]]
			-- upvalues: Config (ref), NowFunction (copy), p1 (copy)
			local Config1 = Config
			
			if Config1 == nil then return end
			if Config1.settledAt == nil and p2 then
				Config1.settledAt = NowFunction()
			end
			if Config1.frameAt == nil and p3 then
				Config1.frameAt = NowFunction()
			end
			local Config2 = Config
			
			if Config2 == nil then return end
			local SettledAt: number = Config2.settledAt
			local FrameAt: number = Config2.frameAt
			
			if SettledAt ~= nil then
				if FrameAt == nil then return end
				Config = nil
				p1.onMeasurement(math.round((math.max(0, FrameAt - SettledAt))), math.round(math.max(FrameAt, SettledAt) - Config2.committedAt), Config2.dimensions)
			end
		end
	}
end