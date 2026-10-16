return {
	Filter = function(p1, Callback) --[[ Line: 11 ]]
		local List = {}
		
		for i = 1, #p1 do
			local v1 = p1[i]
			
			if Callback(v1, i) then
				table.insert(List, v1)
			end
		end
		return List
	end,
	Map = function(p2, Callback) --[[ Line: 27 ]]
		local t = {}
		
		for i = 1, #p2 do
			t[i] = Callback(p2[i], i)
		end
		return t
	end,
	MapReverse = function(p3, Callback) --[[ Line: 40 ]]
		local t = {}
		
		for i = #p3, 1, -1 do
			t[i] = Callback(p3[i], i)
		end
		return t
	end,
	FilterMap = function(p4, Callback) --[[ Line: 56 ]]
		local List = {}
		
		for i = 1, #p4 do
			local CallbackResult = Callback(p4[i], i)
			
			if CallbackResult ~= nil then
				table.insert(List, CallbackResult)
			end
		end
		return List
	end,
	Fold = function(p5, p6, Callback) --[[ Line: 74 ]]
		local v2 = p6
		
		for i = 1, #p5 do
			v2 = Callback(v2, p5[i], i)
		end
		return v2
	end,
	FoldDictionary = function(List, p7, Callback) --[[ Line: 87 ]]
		local v3 = p7
		
		for i, value in pairs(List) do
			v3 = Callback(v3, i, value)
		end
		return v3
	end,
	Take = function(p8, p9, p10) --[[ Line: 100 ]]
		local P10 = p10 or 1
		local NewP = p9 + (P10 - 1)
		
		if #p8 < NewP then
			NewP = #p8
		end
		local t = {}
		
		for i = P10, NewP do
			t[i - (P10 - 1)] = p8[i]
		end
		return t
	end,
	Find = function(List, p11) --[[ Line: 122 ]]
		for i, value in ipairs(List) do
			if value == p11 then
				return i
			end
		end
		return nil
	end
}