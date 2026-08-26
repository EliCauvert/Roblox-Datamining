local function _(p1)
	return p1 ~= p1
end

return {
	estimateVelocity = function(p1)
		local p1Count = #p1
		
		if p1Count < 2 then
			return 0
		end
		local var1 = p1[1]
		local var2 = p1[p1Count]
		local var3 = var2.time - var1.time
		
		if var3 <= 0 or var3 ~= var3 then
			return 0
		end
		local var4 = (var2.position - var1.position) / var3
		
		return if var4 ~= var4 then 0 else var4
	end,
	planTargets = function(p1, p2, p3, p4)
		local granularity = p4.granularity
		
		if p1 ~= p1 or granularity <= 0 or (#p4.bands == 0 or p4.maxSamples <= 0) then
			return {}
		end
		local var1 = p4.maxLeadFraction * (p3.max - p3.min)
		local rounded = math.round((p1 + math.clamp((if p2 ~= p2 then 0 else p2) * p4.predictionLead, -var1, var1)) / granularity)
		
		local function _(p5)
			-- upvalues: p4 (ref)
			for i, v in p4.bands do
				if p5 <= v.radius + 0.000000001 then
					return v.stride
				end
			end
			return nil
		end
		
		local floored = math.floor(p4.bands[#p4.bands].radius / granularity + 0.000000001)
		local t = {}
		local t_1 = {}
		
		local function consider(p6)
			-- upvalues: t (ref), p4 (ref), granularity (ref), rounded (ref), p3 (ref), t_1 (ref)
			if p4.maxSamples <= #t then return end
			local stride
			local var2 = math.abs(p6) * granularity
			
			for i, v in p4.bands do
				if var2 <= v.radius + 0.000000001 then
					stride = v.stride
					if stride == nil or p6 % stride ~= 0 then return end
					var2 = (rounded + p6) * granularity
					
					if var2 < p3.min or p3.max < var2 or t_1[var2] then
						return
					end
					t_1[var2] = true
					table.insert(t, var2)
					
					return
				end
			end
			stride = nil
		end
		
		if p4.maxSamples > #t then
			local stride
			local var3 = granularity * 0
			
			for i, v in p4.bands do
				if var3 <= v.radius + 0.000000001 then
					stride = v.stride
					if stride ~= nil and 0 % stride == 0 then
						var3 = (rounded + 0) * granularity
						
						if var3 >= p3.min and p3.max >= var3 and not t_1[var3] then
							t_1[var3] = true
							table.insert(t, var3)
						end
					end
				end
			end
			stride = nil
		end
		for i = 1, floored do
			if p4.maxSamples <= #t then break end
			consider(i)
			consider(-i)
		end
		table.sort(t)
		
		return t
	end,
	diff = function(p7, p8)
		local t = {}
		local t_1 = {}
		
		for i, v in p7 do
			t[v] = true
			
			if not p8[v] then
				table.insert(t_1, v)
			end
		end
		local t_2 = {}
		
		for i_1 in p8 do
			if not t[i_1] then
				table.insert(t_2, i_1)
			end
		end
		table.sort(t_2)
		
		return { fetch = t_1, evict = t_2 }
	end,
	selectFrameTime = function(p9, p10)
		local var4 = nil
		local var5 = 1e999
		
		for i, v in p10 do
			local absValue = math.abs(v - p9)
			
			if absValue < var5 then
				var5 = absValue
				var4 = v
			end
		end
		return var4
	end,
	defaultConfig = {
		granularity = 0.2,
		predictionLead = 0.4,
		maxLeadFraction = 0.2,
		maxSamples = 40,
		bands = {
			{ radius = 1, stride = 1 },
			{ radius = 3, stride = 3 },
			{ radius = 8, stride = 8 }
		}
	}
}