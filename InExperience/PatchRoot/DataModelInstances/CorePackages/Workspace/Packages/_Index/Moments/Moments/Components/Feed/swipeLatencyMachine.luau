local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)

return function(p0) --[[ line: 68 | named "swipeLatencyMachine" ]]
	local now = p0.now
	local var0 = nil
	local var1 = 0
	
	local function _() --[[ line: 76 | named "tryComplete" ]]
		-- upvalues: var0 (write), p0 (ref)
		if var0 == nil then return end
		local settledAt = var0.settledAt
		local frameAt = var0.frameAt
		
		if settledAt == nil or frameAt == nil then
			return
		end
		var0 = nil
		p0.onMeasurement(math.round(math.max(0, frameAt - settledAt)), math.round(math.max(frameAt, settledAt) - var0.committedAt), var0.dimensions)
	end
	
	local schedule = p0.schedule or task.delay
	
	local _ = function(p1) --[[ line: 97 | named "armCap" ]]
		-- upvalues: p0 (ref), schedule (ref), var1 (write), var0 (write)
		if p0.capMs <= 0 then
			return
		end
		schedule(p0.capMs / 1000, function() --[[ line: 101 ]]
			-- upvalues: p1 (ref), var1 (copy), var0 (copy)
			if p1 == var1 then
				var0 = nil
				
				return
			end
		end)
	end
	
	return {
		start = function(p2, p3, p4) --[[ line: 110 ]]
			-- upvalues: var1 (write), now (ref), var0 (write), p0 (ref), schedule (ref)
			var1 += 1
			local var3 = now()
			var0 = {
				committedAt = var3,
				settledAt = if p2 then var3 else nil,
				frameAt = if p3 then var3 else nil,
				dimensions = p4
			}
			local var4 = var1
			
			if p0.capMs > 0 then
				schedule(p0.capMs / 1000, function() --[[ line: 101 ]]
					-- upvalues: var4 (ref), var1 (copy), var0 (copy)
					if var4 == var1 then
						var0 = nil
						
						return
					end
				end)
			end
			local var5 = var0
			
			if var5 == nil then return end
			local settledAt = var5.settledAt
			local frameAt = var5.frameAt
			
			if settledAt ~= nil then
				if frameAt == nil then return end
				var0 = nil
				p0.onMeasurement(math.round(math.max(0, frameAt - settledAt)), math.round(math.max(frameAt, settledAt) - var5.committedAt), var5.dimensions)
			end
		end,
		update = function(p5, p6) --[[ line: 126 ]]
			-- upvalues: var0 (write), now (ref), p0 (ref)
			if var0 == nil then return end
			if var0.settledAt == nil and p5 then
				var0.settledAt = now()
			end
			if var0.frameAt == nil and p6 then
				var0.frameAt = now()
			end
			if var0 == nil then return end
			local settledAt = var0.settledAt
			local frameAt = var0.frameAt
			
			if settledAt ~= nil then
				if frameAt == nil then return end
				var0 = nil
				p0.onMeasurement(math.round(math.max(0, frameAt - settledAt)), math.round(math.max(frameAt, settledAt) - var0.committedAt), var0.dimensions)
			end
		end
	}
end