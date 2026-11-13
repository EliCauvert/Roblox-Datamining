local config = { [1] = "top", [3] = "bottom" }
local config1 = {
	topLeft = { 1, 1 },
	top = { 2, 1 },
	topRight = { 3, 1 },
	left = { 1, 2 },
	center = { 2, 2 },
	right = { 3, 2 },
	bottomLeft = { 1, 3 },
	bottom = { 2, 3 },
	bottomRight = { 3, 3 },
	topbar = { 2, 1 }
}
local config2 = { [9] = 1, [11] = 3 }
local list = { 7, 11, 15 }

local function _(p1, p2, p3)
	-- upvalues: config1 (copy)
	if p1 == "topbar" and p2 then
		return 0, 0
	else
		local TopRight = if p1 == "topbar" and p3 then config1.topRight else config1[p1]
		
		return TopRight[1], TopRight[2]
	end
end

local function resolve(p1: number, p2: number, p3: number, List1, Vector, p4, p5)
	-- upvalues: config1 (copy), config2 (copy), list (copy), resolve (copy), config (copy)
	local Buffer = table.create(#List1, 1)
	local Buffer1 = table.create(#List1, false)
	local config3 = {
		top = 0,
		bottom = 0,
		hang = 0,
		leanTop = 0,
		leanBottom = 0
	}
	
	if p1 <= 0 or p2 <= 0 then
		return Buffer, Buffer1, config3, {}, { top = 0, bottom = 0 }
	end
	local P8 = p4 or { top = false, bottom = false }
	local v1 = (p1 - p3 * 2) / 3
	local P9 = p5 or { top = 0, bottom = 0 }
	local config5 = nil
	local Largests = nil
	local Largest = nil
	local t1 = nil
	local config4 = nil
	while true do
		Largests = {}
		local Largests1 = {}
		local t = {}
		local t2 = {}
		local Vectors = {}
		Largest = 0
		local function between(KeyRemainder: number, Top)
			-- upvalues: Largests (copy), p1 (copy), P9 (copy), p3 (copy), v1 (copy)
			local Largest = Largests[KeyRemainder + 4] or 0
			local Largest1 = Largests[KeyRemainder + 12] or 0
			local Largest2 = math.max(Largest, Largest1)
			
			if Largest2 <= 0 then
				return p1, 0, 0, 0
			end
			local v2: number = if Largest > 0 and Largest1 <= 0 then 1 elseif Largest1 > 0 and Largest <= 0 then -1 else 0
			
			if Top and v2 ~= 0 and P9[Top] == v2 then
				return p1 - Largest2 - p3, v2, Largest2, v2
			else
				return math.max(v1, p1 - (Largest2 + p3) * 2), 0, Largest2, v2
			end
		end
		for i1, value1 in List1 do
			local Zone = value1.zone
			local Inverted: boolean = Vector ~= nil and not Buffer1[i1]
			local Trailing = value1.trailing
			local TopRightEntry = nil
			local TopRightEntry1 = nil
			
			if Zone == "topbar" and Inverted then
				TopRightEntry = 0
				TopRightEntry1 = 0
			else
				local TopRight = if Zone == "topbar" and Trailing then config1.topRight else config1[Zone]
				TopRightEntry = TopRight[1]
				TopRightEntry1 = TopRight[2]
			end
			local NewTopRightEntry = TopRightEntry * 4 + TopRightEntry1
			t[NewTopRightEntry] = t[NewTopRightEntry] or {}
			table.insert(t[NewTopRightEntry], i1)
			local BufferEntry: number = Buffer[i1]
			local Size = if BufferEntry > 0 then value1.sizes[BufferEntry] else nil
			
			if Size and Size.x > 0 and Size.y > 0 then
				if TopRightEntry1 == 3 and value1.hangs then
					Largest = math.max(Largest, value1.hangs[BufferEntry] or 0)
				end
				if NewTopRightEntry == 0 then
					Largests[NewTopRightEntry] = (Largests[NewTopRightEntry] or -p3) + p3 + Size.x
					Largests1[NewTopRightEntry] = math.max(Largests1[NewTopRightEntry] or 0, Size.y)
				elseif config2[NewTopRightEntry] then
					local List = t2[NewTopRightEntry] or {}
					t2[NewTopRightEntry] = List
					
					if value1.zone == "topbar" then
						local Vector1 = Vectors[NewTopRightEntry]
						
						if Vector1 == nil then
							Vector1 = { x = 0, y = -p3 }
							Vectors[NewTopRightEntry] = Vector1
							table.insert(List, 1, Vector1)
						end
						Vector1.x = math.max(Vector1.x, Size.x)
						Vector1.y += p3 + Size.y
					else
						table.insert(List, { x = Size.x, y = Size.y })
					end
				else
					Largests[NewTopRightEntry] = math.max(Largests[NewTopRightEntry] or 0, Size.x)
					Largests1[NewTopRightEntry] = (Largests1[NewTopRightEntry] or -p3) + p3 + Size.y
				end
			end
		end
		for i2, value2 in config2 do
			local Entry1 = t2[i2]
			
			if Entry1 then
				local Top: string = if value2 == 1 then "top" else "bottom"
				local Top1 = if Top == "top" then P8.top else P8.bottom
				local BetweenResult = if Top1 then p1 else between(value2, Top)
				local Largest1 = 0
				local Negated = -p3
				local NewX = -1
				local Largest2 = 0
				
				for _, Vector2 in Entry1 do
					if NewX >= 0 and NewX + p3 + Vector2.x <= BetweenResult then
						NewX += p3 + Vector2.x
						Largest2 = math.max(Largest2, Vector2.y)
					else
						if NewX >= 0 then
							Largest1 = math.max(Largest1, NewX)
							Negated += p3 + Largest2
						end
						NewX = Vector2.x
						Largest2 = Vector2.y
					end
				end
				local NewNegated = Negated + (p3 + Largest2)
				Largests[i2] = math.max(Largest1, NewX)
				Largests1[i2] = NewNegated
			end
		end
		for _, value3 in list do
			if (Largests1[value3] or 0) > 0 then
				Largests1[value3] += Largest
			end
		end
		t1 = {}
		
		local function fail(Key, Largest)
			-- upvalues: t (copy), Buffer (copy), List1 (copy), t1 (copy)
			local Entry = t[Key] or {}
			for _, value in Entry do
				local BufferEntry: number = Buffer[value]
				local Size = if BufferEntry > 0 then List1[value].sizes[BufferEntry] else nil
				
				if Largest == nil or Size and Largest < Size.x then
					t1[value] = true
				end
			end
		end
		
		local function _(p6, p7, p8)
			-- upvalues: Largests1 (copy), fail (copy), Largests (copy)
			if p8 < (Largests1[p6] or 0) then
				fail(p6)
				
				return
			end
			if p7 < (Largests[p6] or 0) then
				fail(p6, p7)
			end
		end
		
		if Vector then
			local t3 = {}
			local Count = 0
			local Entry2 = t[0] or {}
			for _, value4 in Entry2 do
				local BufferEntry: number = Buffer[value4]
				local Size = if BufferEntry > 0 then List1[value4].sizes[BufferEntry] else nil
				
				if Size and Size.x > 0 and Size.y > 0 then
					local Leading: string = if List1[value4].leading then "leading" elseif List1[value4].trailing then "trailing" else "middle"
					
					if not t3[Leading] then
						t3[Leading] = true
						Count += 1
					end
				end
			end
			if Vector.x < (Largests[0] or 0) + (if Count > 0 then math.max(0, (Vector.lanes or 1) - Count) else 0) * p3 then
				fail(0)
			elseif Vector.y < (Largests1[0] or 0) then
				local Entry3 = t[0] or {}
				for _, value7 in Entry3 do
					local BufferEntry: number = Buffer[value7]
					local Size = if BufferEntry > 0 then List1[value7].sizes[BufferEntry] else nil
					
					if Size and Vector.y < Size.y then
						t1[value7] = true
					end
				end
			end
		end
		config4 = {
			top = math.max(Largests1[5] or 0, Largests1[13] or 0),
			bottom = math.max(Largests1[7] or 0, Largests1[15] or 0)
		}
		config5 = { top = false, bottom = false }
		
		for i4 = 1, 3 do
			local NewI = i4 * 4 + 1
			local NewI1 = i4 * 4 + 2
			local NewI2 = i4 * 4 + 3
			
			for i5, value5 in { NewI, NewI1, NewI2 } do
				local BetweenResult = v1
				
				if i4 ~= 2 and (i5 ~= 2 and (Largests[8 + i5] or 0) == 0) then
					local Largest4 = Largests[(if i4 == 1 then 12 else 4) + i5] or 0
					BetweenResult = math.max(v1, if Largest4 > 0 then p1 - Largest4 - p3 else p1)
				end
				if i4 == 2 then
					local Top = if i5 == 1 then "top" elseif i5 == 3 then "bottom" else nil
					BetweenResult = between(i5, Top)
					local Largest3 = Largests[value5] or 0
					
					if Top and (if Top == "top" then P8.top else P8.bottom) then
						BetweenResult = p1
					elseif BetweenResult < Largest3 then
						if Top then
							config5[Top] = true
						end
						if Largest3 <= p1 and (Largests1[value5] or 0) <= p2 then
							local LargestDelta = (p1 - Largest3) / 2 - p3
							fail(4 + i5, LargestDelta)
							fail(12 + i5, LargestDelta)
						end
					end
				end
				if p2 < (Largests1[value5] or 0) then
					fail(value5)
				elseif BetweenResult < (Largests[value5] or 0) then
					fail(value5, BetweenResult)
				end
			end
			local NewTop = Largests1[NewI] or 0
			local Largest5 = Largests1[NewI1] or 0
			local NewBottom = Largests1[NewI2] or 0
			
			if i4 == 2 then
				if P8.top and NewTop > 0 then
					NewTop = config4.top + p3 + NewTop
				end
				if P8.bottom and NewBottom > 0 then
					NewBottom = config4.bottom + p3 + NewBottom
				end
			end
			if Largest5 > 0 then
				if NewTop > 0 and (p2 - Largest5) / 2 < NewTop + p3 then
					fail(NewI)
					fail(NewI1)
				end
				if NewBottom > 0 and p2 - NewBottom < (p2 + Largest5) / 2 + p3 then
					fail(NewI2)
					fail(NewI1)
				end
			elseif NewTop > 0 and NewBottom > 0 and p2 < NewTop + p3 + NewBottom then
				fail(NewI)
				fail(NewI2)
			end
		end
		local function clearSides(Bottom, p6, NewBottom)
			-- upvalues: Largests (copy), Largests1 (copy), p3 (copy), p1 (copy), p2 (copy), fail (copy)
			local Largest = Largests[p6] or 0
			
			if not Bottom or Largest <= 0 then return end
			for _, value in { 6, 14 } do
				local Largest1 = Largests[value] or 0
				local Largest2 = Largests1[value] or 0
				
				if Largest2 > 0 and (p1 - Largest) / 2 < Largest1 + p3 and (p2 - Largest2) / 2 < NewBottom + p3 then
					fail(value)
					fail(p6)
				end
			end
		end
		
		clearSides(P8.top, 9, config4.top + p3 + (Largests1[9] or 0))
		clearSides(P8.bottom, 11, config4.bottom + p3 + (Largests1[11] or 0))
		local List2 = {}
		
		for i7 = 1, 3 do
			for i8 = 1, 3 do
				local NewI = i7 * 4 + i8
				local Largest6 = Largests[NewI] or 0
				local Largest7 = Largests1[NewI] or 0
				
				if Largest6 > 0 and Largest7 > 0 then
					local LargestRatio: number = if i7 == 1 then 0 elseif i7 == 3 then p1 - Largest6 else (p1 - Largest6) / 2
					local LargestRatio1: number = if i8 == 1 then 0 elseif i8 == 3 then p2 - Largest7 else (p2 - Largest7) / 2
					
					if i7 == 2 and i8 ~= 2 then
						local Top: string = if i8 == 1 then "top" else "bottom"
						
						if if Top == "top" then P8.top else P8.bottom then
							LargestRatio1 += (if i8 == 1 then 1 else -1) * (config4[Top] + p3)
						else
							local _, BetweenResult2_1, BetweenResult3_1 = between(i8, Top)
							LargestRatio += BetweenResult2_1 * (BetweenResult3_1 + p3) / 2
						end
					end
					for _, Vector3 in List2 do
						if Vector3.key % 4 ~= i8 and math.floor(Vector3.key / 4) ~= i7 and LargestRatio < Vector3.x + Vector3.w + p3 and Vector3.x < LargestRatio + Largest6 + p3 and LargestRatio1 < Vector3.y + Vector3.h + p3 and Vector3.y < LargestRatio1 + Largest7 + p3 then
							fail(NewI)
							fail(Vector3.key)
						end
					end
					table.insert(List2, {
						key = NewI,
						x = LargestRatio,
						y = LargestRatio1,
						w = Largest6,
						h = Largest7
					})
				end
			end
		end
		local v2 = nil
		
		for i, value in List1 do
			local BufferEntry: number = Buffer[i]
			local Inverted: boolean = Vector ~= nil and (value.zone == "topbar" and not Buffer1[i])
			
			if t1[i] and (BufferEntry > 0 and (BufferEntry < #value.sizes or (value.mayDrop or Inverted))) and (v2 == nil or List1[v2].rank <= value.rank) then
				v2 = i
			end
		end
		if v2 == nil then
			break
		end
		local Entry = List1[v2]
		
		if Buffer[v2] < #Entry.sizes then
			Buffer[v2] += 1
		elseif Vector == nil or (Entry.zone ~= "topbar" or Buffer1[v2]) then
			Buffer[v2] = 0
		else
			Buffer1[v2] = true
			Buffer[v2] = 1
		end
	end
	local BetweenResult4 = nil
	for i9 in config5 do
		local _, _, _
		_, _, _, BetweenResult4 = between(if i9 == "top" then 1 else 3, i9)
		
		if config5[i9] and (not (if i9 == "top" then P8.top else P8.bottom) and P9[i9] == 0 and BetweenResult4 ~= 0) then
			return resolve(p1, p2, p3, List1, Vector, P8, { top = P9.top, bottom = P9.bottom, [i9] = BetweenResult4 })
		end
	end
	for i10 in config5 do
		if config5[i10] and (not (if i10 == "top" then P8.top else P8.bottom) and config4[i10] > 0) then
			local config6 = { top = P8.top, bottom = P8.bottom }
			
			if i10 == "top" then
				config6.top = true
			else
				config6.bottom = true
			end
			return resolve(p1, p2, p3, List1, Vector, config6, P9)
		end
	end
	config3.top = if P8.top and (Largests[9] or 0) > 0 then config4.top + p3 else 0
	config3.bottom = if P8.bottom and (Largests[11] or 0) > 0 then config4.bottom + p3 else 0
	config3.hang = Largest
	
	for i6, value6 in config do
		local _, BetweenResult2, BetweenResult3 = between(i6, value6)
		local BetweenResultRatio = if (if value6 == "top" then P8.top else P8.bottom) or BetweenResult2 == 0 then 0 else BetweenResult2 * (BetweenResult3 + p3) / 2
		
		if value6 == "top" then
			config3.leanTop = BetweenResultRatio
		else
			config3.leanBottom = BetweenResultRatio
		end
	end
	local List3 = {}
	
	for i3 in t1 do
		table.insert(List3, i3)
	end
	table.sort(List3)
	
	return Buffer, Buffer1, config3, List3, { top = Largests[9] or 0, bottom = Largests[11] or 0 }
end

return {
	CELLS = config1,
	occupied = function(List, p7, p8, p9)
		local t = {}
		
		for i, value in List do
			local v3 = p7[i] or 0
			local Size = if v3 > 0 then value.sizes[v3] else nil
			local Inverted: boolean = value.zone == "topbar" and (p9 and not p8[i])
			
			if Size and Size.x > 0 and Size.y > 0 and not Inverted then
				t[if value.zone == "topbar" then if value.trailing then "topRight" else "top" else value.zone] = true
			end
		end
		return t
	end,
	resolve = resolve
}