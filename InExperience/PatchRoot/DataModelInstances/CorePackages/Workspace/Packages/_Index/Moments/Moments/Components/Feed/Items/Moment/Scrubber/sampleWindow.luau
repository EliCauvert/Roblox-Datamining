local function _(p0) --[[ line: 65 | named "isNaN" ]]
	return p0 ~= p0
end

return {
	estimateVelocity = function(p1) --[[ line: 74 ]]
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
	planTargets = function(p2, p3, p4, p5) --[[ line: 97 ]]
		local granularity = p5.granularity
		
		if p2 ~= p2 or granularity <= 0 or (#p5.bands == 0 or p5.maxSamples <= 0) then
			return {}
		end
		local var5 = p5.maxLeadFraction * (p4.max - p4.min)
		local rounded = math.round((p2 + math.clamp((if p3 ~= p3 then 0 else p3) * p5.predictionLead, -var5, var5)) / granularity)
		
		local function _(p6) --[[ line: 111 | named "strideForDistance" ]]
			-- upvalues: p5 (ref)
			for i, v in p5.bands do
				if p6 <= v.radius + 0.000000001 then
					return v.stride
				end
			end
			return nil
		end
		
		local floored = math.floor(p5.bands[#p5.bands].radius / granularity + 0.000000001)
		local t = {}
		local t_1 = {}
		
		local function consider(p7) --[[ line: 126 ]]
			-- upvalues: t (ref), p5 (ref), granularity (ref), rounded (ref), p4 (ref), t_1 (ref)
			if p5.maxSamples <= #t then return end
			local stride
			local var12 = math.abs(p7) * granularity
			
			for i, v in p5.bands do
				if var12 <= v.radius + 0.000000001 then
					stride = v.stride
					if stride == nil or p7 % stride ~= 0 then return end
					var12 = (rounded + p7) * granularity
					
					if var12 < p4.min or p4.max < var12 or t_1[var12] then
						return
					end
					t_1[var12] = true
					table.insert(t, var12)
					
					return
				end
			end
			stride = nil
		end
		
		if p5.maxSamples > #t then
			local stride
			local var11 = granularity * 0
			
			for i, v in p5.bands do
				if var11 <= v.radius + 0.000000001 then
					stride = v.stride
					if stride ~= nil and 0 % stride == 0 then
						var11 = (rounded + 0) * granularity
						
						if var11 >= p4.min and p4.max >= var11 and not t_1[var11] then
							t_1[var11] = true
							table.insert(t, var11)
						end
					end
				end
			end
			stride = nil
		end
		for i = 1, floored do
			if p5.maxSamples <= #t then break end
			consider(i)
			consider(-i)
		end
		table.sort(t)
		
		return t
	end,
	diff = function(p8, p9) --[[ line: 160 ]]
		local t = {}
		local t_1 = {}
		
		for i, v in p8 do
			t[v] = true
			
			if not p9[v] then
				table.insert(t_1, v)
			end
		end
		local t_2 = {}
		
		for i_1 in p9 do
			if not t[i_1] then
				table.insert(t_2, i_1)
			end
		end
		table.sort(t_2)
		
		return { fetch = t_1, evict = t_2 }
	end,
	selectFrameTime = function(p10, p11) --[[ line: 185 ]]
		local var16 = nil
		local var17 = 1e999
		
		for i, v in p11 do
			local absValue = math.abs(v - p10)
			
			if absValue < var17 then
				var17 = absValue
				var16 = v
			end
		end
		return var16
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