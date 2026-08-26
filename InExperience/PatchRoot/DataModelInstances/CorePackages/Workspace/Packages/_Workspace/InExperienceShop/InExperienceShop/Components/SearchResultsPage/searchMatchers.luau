local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

local function _(p1)
	local t = {}
	
	for i in string.gmatch(p1, "%S+") do
		table.insert(t, i)
	end
	return t
end

local _ = function(p2)
	return string.match(p2, "^%s*(.-)%s*$") or ""
end

local _ = function(p2, p3)
	return if #p2 < #p3 then false else string.sub(p2, 1, #p3) == p3
end

local _ = function(p2, p3)
	for i, v in p2 do
		if v == p3 then
			return true
		end
	end
	return false
end

local _ = function(p4, p5)
	for i, v in p4 do
		if if #v < #p5 then false else string.sub(v, 1, #p5) == p5 then
			return true
		end
	end
	return false
end

local function anyWordIncludes(p6, p7)
	for i, v in p6 do
		if string.find(v, p7, 1, true) ~= nil then
			return true
		end
	end
	return false
end

local _ = function(a)
	return if a >= 8 then 2 else 1
end

local function editDistanceWithin(p8, p9, p10)
	if p8 == p9 then
		return true
	end
	local p10Count = #p8
	local p11Count = #p9
	
	if p10 < math.abs(p10Count - p11Count) then
		return false
	elseif p10Count < p11Count then
		p9 = p8
		p8 = p9
		local var1 = p11Count
		p11Count = p10Count
		p10Count = var1
	end
	if p11Count == 0 then
		return p10Count <= p10
	end
	local list = table.create(p11Count + 1)
	local list_1 = table.create(p11Count + 1)
	local list_2 = table.create(p11Count + 1)
	
	for i = 0, p11Count do
		list_1[i + 1] = i
	end
	for i_2 = 1, p10Count do
		list_2[1] = i_2
		local var2 = i_2
		local byteValue = string.byte(p8, i_2)
		local var3 = if i_2 >= 2 then string.byte(p8, i_2 - 1) else 0
		
		for i_1 = 1, p11Count do
			local byteValue_1 = string.byte(p9, i_1)
			local var4 = if byteValue == byteValue_1 then 0 else 1
			local var5 = list_1[i_1 + 1] + 1
			local var6 = list_2[i_1] + 1
			local var7 = list_1[i_1] + var4
			local var8 = var5
			
			if var6 < var8 then
				var8 = var6
			end
			if var7 < var8 then
				var8 = var7
			end
			if i_2 >= 2 and i_1 >= 2 and (byteValue == string.byte(p9, i_1 - 1) and var3 == byteValue_1) then
				local var9 = list[i_1 - 1] + 1
				
				if var9 < var8 then
					var8 = var9
				end
			end
			list_2[i_1 + 1] = var8
			
			if var8 < var2 then
				var2 = var8
			end
		end
		if p10 >= var2 then
			local var10 = list_1
			list_1 = list_2
			list_2 = list
			list = var10
			continue
		end
		return false
	end
	return list_1[p11Count + 1] <= p10
end

local _ = function(p11, p12, p13)
	-- upvalues: editDistanceWithin (ref)
	for i, v in p11 do
		if editDistanceWithin(p12, v, p13) then
			return true
		end
	end
	return false
end

local function anyWordHasFuzzyPrefix(p14, p15, p16)
	-- upvalues: editDistanceWithin (ref)
	local p17Count = #p15
	
	for i, v in p14 do
		if p17Count <= #v and editDistanceWithin(p15, string.sub(v, 1, p17Count), p16) then
			return true
		end
	end
	return false
end

local function scoreToken(p17, p18, p19, p20)
	-- upvalues: anyWordHasFuzzyPrefix (ref), anyWordIncludes (ref), editDistanceWithin (ref)
	if p17 == p19 then
		return 100
	end
	local var11
	for i, v in p18 do
		if v == p19 then
			var11 = true
			if var11 then
				return 50
			end
			local var12
			for i, v in p18 do
				if if #v < #p19 then false else string.sub(v, 1, #p19) == p19 then
					var12 = true
					if var12 then
						return 20
					elseif #p19 >= 5 and anyWordHasFuzzyPrefix(p18, p19, if #p19 >= 8 then 2 else 1) then
						return 8
					elseif #p19 > 1 and string.find(p17, p19, 1, true) ~= nil then
						return 5
					elseif #p19 == 1 and p20 > 1 and anyWordIncludes(p18, p19) then
						return 5
					elseif #p19 >= 4 then
						local var13
						local var14 = if #p19 >= 8 then 2 else 1
						
						for v, v_2 in p18 do
							if editDistanceWithin(p19, v_2, var14) then
								var13 = true
								return if var13 then 12 else 0
							end
						end
						var13 = false
					end
				end
			end
			var12 = false
		end
	end
	var11 = false
end

return {
	substringMatch = function(p21, p22, p23)
		if p23 <= 0 then
			return {}
		elseif p22 == "" then
			return {}
		end
		local lowerText = string.lower(p22)
		local t = {}
		
		for i, v in p21 do
			if string.find(string.lower(v.name), lowerText, 1, true) ~= nil then
				table.insert(t, v)
				
				if p23 <= #t then break end
			end
		end
		return t
	end,
	fuzzyMatch = function(p24, p25, p26)
		-- upvalues: scoreToken (ref)
		if p26 <= 0 then
			return {}
		end
		local lowerText = string.lower(string.match(p25, "^%s*(.-)%s*$") or "")
		
		if lowerText == "" then
			return p24
		end
		local t = {}
		
		for i in string.gmatch(lowerText, "%S+") do
			table.insert(t, i)
		end
		local lowerText_1, var15, var16, var17
		t = #t
		local t_1 = {}
		
		for i_1, v in p24 do
			lowerText_1 = string.lower(v.name)
			local t_2 = {}
			
			for i_3 in string.gmatch(lowerText_1, "%S+") do
				table.insert(t_2, i_3)
			end
			var15 = t_2
			var16 = 0
			var17 = false
			
			for i_4, v_1 in t do
				local var18 = scoreToken(lowerText_1, var15, v_1, t)
				
				if var18 ~= 0 then
					var17 = true
					break
				end
				var16 += var18
			end
			if not var17 then
				table.insert(t_1, { item = v, score = var16, index = i_1 })
			end
		end
		table.sort(t_1, function(p27, p28)
			return if p27.score == p28.score then p27.index < p28.index else p28.score < p27.score
		end)
		local minValue = math.min(p26, #t_1)
		local list = table.create(minValue)
		
		for i_2 = 1, minValue do
			list[i_2] = t_1[i_2].item
		end
		return list
	end
}