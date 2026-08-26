local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)

return function(p1)
	local now = p1.now
	local var1 = nil
	local var2 = 0
	
	local function _()
		-- upvalues: var1 (write), p1 (ref)
		if var1 == nil then return end
		local settledAt = var1.settledAt
		local frameAt = var1.frameAt
		
		if settledAt == nil or frameAt == nil then
			return
		end
		var1 = nil
		p1.onMeasurement(math.round(math.max(0, frameAt - settledAt)), math.round(math.max(frameAt, settledAt) - var1.committedAt), var1.dimensions)
	end
	
	local schedule = p1.schedule or task.delay
	
	local _ = function(p2)
		-- upvalues: p1 (ref), schedule (ref), var2 (write), var1 (write)
		if p1.capMs <= 0 then
			return
		end
		schedule(p1.capMs / 1000, function()
			-- upvalues: p2 (ref), var2 (copy), var1 (copy)
			if p2 == var2 then
				var1 = nil
				
				return
			end
		end)
	end
	
	return {
		start = function(p2, p3, p4)
			-- upvalues: var2 (write), now (ref), var1 (write), p1 (ref), schedule (ref)
			var2 += 1
			local var3 = now()
			var1 = {
				committedAt = var3,
				settledAt = if p2 then var3 else nil,
				frameAt = if p3 then var3 else nil,
				dimensions = p4
			}
			local var4 = var2
			
			if p1.capMs > 0 then
				schedule(p1.capMs / 1000, function()
					-- upvalues: var4 (ref), var2 (copy), var1 (copy)
					if var4 == var2 then
						var1 = nil
						
						return
					end
				end)
			end
			local var5 = var1
			
			if var5 == nil then return end
			local settledAt = var5.settledAt
			local frameAt = var5.frameAt
			
			if settledAt ~= nil then
				if frameAt == nil then return end
				var1 = nil
				p1.onMeasurement(math.round(math.max(0, frameAt - settledAt)), math.round(math.max(frameAt, settledAt) - var5.committedAt), var5.dimensions)
			end
		end,
		update = function(p2, p3)
			-- upvalues: var1 (write), now (ref), p1 (ref)
			if var1 == nil then return end
			if var1.settledAt == nil and p2 then
				var1.settledAt = now()
			end
			if var1.frameAt == nil and p3 then
				var1.frameAt = now()
			end
			if var1 == nil then return end
			local settledAt = var1.settledAt
			local frameAt = var1.frameAt
			
			if settledAt ~= nil then
				if frameAt == nil then return end
				var1 = nil
				p1.onMeasurement(math.round(math.max(0, frameAt - settledAt)), math.round(math.max(frameAt, settledAt) - var1.committedAt), var1.dimensions)
			end
		end
	}
end