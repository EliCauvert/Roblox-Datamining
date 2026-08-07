local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

local function _(p0) --[[ line: 41 | named "tokenize" ]]
	local t = {}
	
	for i in string.gmatch(p0, "%S+") do
		table.insert(t, i)
	end
	return t
end

local _ = function(p1) --[[ line: 49 | named "trim" ]]
	return string.match(p1, "^%s*(.-)%s*$") or ""
end

local _ = function(p2, p3) --[[ line: 53 | named "startsWith" ]]
	return if #p2 < #p3 then false else string.sub(p2, 1, #p3) == p3
end

local _ = function(p4, p5) --[[ line: 60 | named "anyWordEquals" ]]
	for i, v in p4 do
		if v == p5 then
			return true
		end
	end
	return false
end

local _ = function(p6, p7) --[[ line: 69 | named "anyWordStartsWith" ]]
	for i, v in p6 do
		if if #v < #p7 then false else string.sub(v, 1, #p7) == p7 then
			return true
		end
	end
	return false
end

local function anyWordIncludes(p8, p9) --[[ line: 78 ]]
	for i, v in p8 do
		if string.find(v, p9, 1, true) ~= nil then
			return true
		end
	end
	return false
end

local _ = function(a) --[[ line: 87 | named "maxEditsFor" ]]
	return if a >= 8 then 2 else 1
end

local function editDistanceWithin(p10, p11, p12) --[[ line: 95 ]]
	if p10 == p11 then
		return true
	end
	local p10Count = #p10
	local p11Count = #p11
	
	if p12 < math.abs(p10Count - p11Count) then
		return false
	elseif p10Count < p11Count then
		p11 = p10
		p10 = p11
		local var7 = p11Count
		p11Count = p10Count
		p10Count = var7
	end
	if p11Count == 0 then
		return p10Count <= p12
	end
	local list = table.create(p11Count + 1)
	local list_1 = table.create(p11Count + 1)
	local list_2 = table.create(p11Count + 1)
	
	for i = 0, p11Count do
		list_1[i + 1] = i
	end
	for i_2 = 1, p10Count do
		list_2[1] = i_2
		local var11 = i_2
		local byteValue = string.byte(p10, i_2)
		local var13 = if i_2 >= 2 then string.byte(p10, i_2 - 1) else 0
		
		for i_1 = 1, p11Count do
			local byteValue_1 = string.byte(p11, i_1)
			local var15 = if byteValue == byteValue_1 then 0 else 1
			local var16 = list_1[i_1 + 1] + 1
			local var17 = list_2[i_1] + 1
			local var18 = list_1[i_1] + var15
			local var19 = var16
			
			if var17 < var19 then
				var19 = var17
			end
			if var18 < var19 then
				var19 = var18
			end
			if i_2 >= 2 and i_1 >= 2 and (byteValue == string.byte(p11, i_1 - 1) and var13 == byteValue_1) then
				local var20 = list[i_1 - 1] + 1
				
				if var20 < var19 then
					var19 = var20
				end
			end
			list_2[i_1 + 1] = var19
			
			if var19 < var11 then
				var11 = var19
			end
		end
		if p12 >= var11 then
			local var21 = list_1
			list_1 = list_2
			list_2 = list
			list = var21
			continue
		end
		return false
	end
	return list_1[p11Count + 1] <= p12
end

local _ = function(p13, p14, p15) --[[ line: 164 | named "anyWordWithinEditDistance" ]]
	-- upvalues: editDistanceWithin (ref)
	for i, v in p13 do
		if editDistanceWithin(p14, v, p15) then
			return true
		end
	end
	return false
end

local function anyWordHasFuzzyPrefix(p16, p17, p18) --[[ line: 176 ]]
	-- upvalues: editDistanceWithin (ref)
	local p17Count = #p17
	
	for i, v in p16 do
		if p17Count <= #v and editDistanceWithin(p17, string.sub(v, 1, p17Count), p18) then
			return true
		end
	end
	return false
end

local function scoreToken(p19, p20, p21, p22) --[[ line: 215 ]]
	-- upvalues: anyWordHasFuzzyPrefix (ref), anyWordIncludes (ref), editDistanceWithin (ref)
	if p19 == p21 then
		return 100
	end
	local var23
	for i, v in p20 do
		if v == p21 then
			var23 = true
			if var23 then
				return 50
			end
			local var24
			for i, v in p20 do
				if if #v < #p21 then false else string.sub(v, 1, #p21) == p21 then
					var24 = true
					if var24 then
						return 20
					elseif #p21 >= 5 and anyWordHasFuzzyPrefix(p20, p21, if #p21 >= 8 then 2 else 1) then
						return 8
					elseif #p21 > 1 and string.find(p19, p21, 1, true) ~= nil then
						return 5
					elseif #p21 == 1 and p22 > 1 and anyWordIncludes(p20, p21) then
						return 5
					elseif #p21 >= 4 then
						local var26
						local var25 = if #p21 >= 8 then 2 else 1
						
						for v, v_2 in p20 do
							if editDistanceWithin(p21, v_2, var25) then
								var26 = true
								return if var26 then 12 else 0
							end
						end
						var26 = false
					end
				end
			end
			var24 = false
		end
	end
	var23 = false
end

return {
	substringMatch = function(p23, p24, p25) --[[ line: 191 ]]
		if p25 <= 0 then
			return {}
		elseif p24 == "" then
			return {}
		end
		local lowerText = string.lower(p24)
		local t = {}
		
		for i, v in p23 do
			if string.find(string.lower(v.name), lowerText, 1, true) ~= nil then
				table.insert(t, v)
				
				if p25 <= #t then break end
			end
		end
		return t
	end,
	fuzzyMatch = function(p26, p27, p28) --[[ line: 256 ]]
		-- upvalues: scoreToken (ref)
		if p28 <= 0 then
			return {}
		end
		local lowerText = string.lower(string.match(p27, "^%s*(.-)%s*$") or "")
		
		if lowerText == "" then
			return p26
		end
		local t = {}
		
		for i in string.gmatch(lowerText, "%S+") do
			table.insert(t, i)
		end
		local lowerText_1, var36, var37, var38
		t = #t
		local t_1 = {}
		
		for i_1, v in p26 do
			lowerText_1 = string.lower(v.name)
			local t_2 = {}
			
			for i_3 in string.gmatch(lowerText_1, "%S+") do
				table.insert(t_2, i_3)
			end
			var36 = t_2
			var37 = 0
			var38 = false
			
			for i_4, v_1 in t do
				local var39 = scoreToken(lowerText_1, var36, v_1, t)
				
				if var39 ~= 0 then
					var38 = true
					break
				end
				var37 += var39
			end
			if not var38 then
				table.insert(t_1, { item = v, score = var37, index = i_1 })
			end
		end
		table.sort(t_1, function(p29, p30) --[[ line: 294 ]]
			return if p29.score == p30.score then p29.index < p30.index else p30.score < p29.score
		end)
		local minValue = math.min(p28, #t_1)
		local list = table.create(minValue)
		
		for i_2 = 1, minValue do
			list[i_2] = t_1[i_2].item
		end
		return list
	end
}