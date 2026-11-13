local config = { x = 0, y = 0, z = 0 }

local function _(Value: number, p1)
	if Value == nil then
		return p1
	else
		assert(type(Value) == "number" and Value == Value and math.abs(Value) < 1000000, "A pattern needs finite numbers")
		
		return Value
	end
end

local function record(Variants)
	assert(type(Variants) == "table", "A pattern value is a record")
	local t = {}
	
	for i, variant in Variants do
		assert(type(i) == "string" or type(i) == "number", "A pattern key is text or a number")
		t[i] = variant
	end
	return t
end

local function triple(Position, p1)
	-- upvalues: record (copy)
	if Position == nil then
		return p1
	end
	local RecordResult = record(Position)
	assert(#RecordResult == 3, "A pattern vector has three numbers")
	
	for i in RecordResult do
		assert(i == 1 or (i == 2 or i == 3), "A pattern vector has three numbers")
	end
	local t = {}
	local Value: number = RecordResult[1]
	local v1 = nil
	
	if Value == nil then
		v1 = 0
	else
		assert(type(Value) == "number" and Value == Value and math.abs(Value) < 1000000, "A pattern needs finite numbers")
		v1 = Value
	end
	t.x = v1
	local Value1: number = RecordResult[2]
	local v2 = nil
	
	if Value1 == nil then
		v2 = 0
	else
		assert(type(Value1) == "number" and Value1 == Value1 and math.abs(Value1) < 1000000, "A pattern needs finite numbers")
		v2 = Value1
	end
	t.y = v2
	local Value2: number = RecordResult[3]
	local v3 = nil
	
	if Value2 == nil then
		v3 = 0
	else
		assert(type(Value2) == "number" and Value2 == Value2 and math.abs(Value2) < 1000000, "A pattern needs finite numbers")
		v3 = Value2
	end
	t.z = v3
	
	return t
end

local function color(Text: string, FFFFFF)
	-- upvalues: triple (copy), config (copy)
	if Text == nil then
		return FFFFFF
	elseif type(Text) == "string" then
		assert(string.match(Text, "^#%x%x%x%x%x%x$"), "A pattern color is hex or an RGB vector")
		
		return Text
	else
		local TripleResult = triple(Text, config)
		
		return { TripleResult.x, TripleResult.y, TripleResult.z }
	end
end

return {
	rows = function(p2)
		-- upvalues: triple (copy), config (copy), record (copy), color (copy)
		local Mode = p2.mode or "linear"
		assert(Mode == "linear" or (Mode == "grid" or Mode == "radial"), "A pattern is linear, grid or radial")
		local Columns: number = p2.columns
		local v4 = nil
		
		if Columns == nil then
			v4 = 3
		else
			assert(type(Columns) == "number" and Columns == Columns and math.abs(Columns) < 1000000, "A pattern needs finite numbers")
			v4 = Columns
		end
		local Rows: number = p2.rows
		local v5 = nil
		
		if Rows == nil then
			v5 = 3
		else
			assert(type(Rows) == "number" and Rows == Rows and math.abs(Rows) < 1000000, "A pattern needs finite numbers")
			v5 = Rows
		end
		local v6 = nil
		if Mode == "grid" then
			v6 = v4 * v5
		else
			local Count: number = p2.count
			
			if Count == nil then
				v6 = 3
			else
				assert(type(Count) == "number" and Count == Count and math.abs(Count) < 1000000, "A pattern needs finite numbers")
				v6 = Count
			end
		end
		local IsColumn = p2.order == "column"
		assert(p2.order == nil or (IsColumn or p2.order == "row"), "A grid order is row or column")
		assert(p2.fit == nil or type(p2.fit) == "boolean", "Grid fitting is a boolean")
		assert(v6 >= 0 and v6 <= 500 and v6 % 1 == 0, "A pattern has 0 to 500 instances")
		assert(v4 >= 1 and (v4 % 1 == 0 and v5 >= 1) and v5 % 1 == 0, "A grid has positive integer columns and rows")
		local TripleResult = triple(p2.position, config)
		local TripleResult1 = triple(p2.spacing, { x = 3, y = 0, z = 0 })
		local TripleResult2 = triple(p2.extent, { x = 9, y = 0, z = 9 })
		local TripleResult3 = triple(p2.gap, config)
		local TripleResult4 = triple(p2.rotation, config)
		local TripleResult5 = triple(p2.size, { x = 4, y = 1, z = 4 })
		local Radius: number = p2.radius
		local v7 = nil
		
		if Radius == nil then
			v7 = 3
		else
			assert(type(Radius) == "number" and Radius == Radius and math.abs(Radius) < 1000000, "A pattern needs finite numbers")
			v7 = Radius
		end
		local v8 = nil
		if p2.phase == nil then
			v8 = nil
		else
			local Phase: number = p2.phase
			
			if Phase == nil then
				v8 = 0
			else
				assert(type(Phase) == "number" and Phase == Phase and math.abs(Phase) < 1000000, "A pattern needs finite numbers")
				v8 = Phase
			end
		end
		local IndexOrigin: number = p2.indexOrigin
		local v9 = nil
		
		if IndexOrigin == nil then
			v9 = 1
		else
			assert(type(IndexOrigin) == "number" and IndexOrigin == IndexOrigin and math.abs(IndexOrigin) < 1000000, "A pattern needs finite numbers")
			v9 = IndexOrigin
		end
		assert(v9 % 1 == 0, "A pattern index origin is an integer")
		local NamePattern = p2.namePattern or "Item%d"
		assert(type(NamePattern) == "string" and #NamePattern <= 160, "A pattern has a short name pattern")
		local _, Replaced2 = string.gsub(NamePattern, "%%0?[1-9]?d", "")
		assert(Replaced2 == 1 or Mode == "grid" and Replaced2 == 2, "A name pattern has one index or two grid indices")
		assert(not string.find(string.gsub(NamePattern, "%%0?[1-9]?d", ""), "%%"), "A name pattern contains only integer placeholders")
		local List = {}
		
		if p2.variants ~= nil then
			local RecordResult = record(p2.variants)
			assert(#RecordResult <= 32, "A pattern has at most 32 variants")
			
			for i1 in RecordResult do
				assert(type(i1) == "number" and (i1 >= 1 and i1 <= #RecordResult) and i1 % 1 == 0, "Pattern variants form a dense list")
			end
			for i2 = 1, #RecordResult do
				table.insert(List, (record(RecordResult[i2])))
			end
		end
		local IsSum = p2.variantBy == "sum"
		assert(p2.variantBy == nil or (IsSum or p2.variantBy == "index"), "A pattern varies by index or grid sum")
		local FFFFFF = color(p2.color, "#FFFFFF")
		local Radians = math.rad(TripleResult4.x)
		local Radians1 = math.rad(TripleResult4.y)
		local Radians2 = math.rad(TripleResult4.z)
		local Cosine = math.cos(Radians)
		local Sine = math.sin(Radians)
		local Cosine1 = math.cos(Radians1)
		local Sine1 = math.sin(Radians1)
		local Cosine2 = math.cos(Radians2)
		local Sine2 = math.sin(Radians2)
		local List1 = {}
		
		for i = 0, v6 - 1 do
			local Floored: number = if IsColumn then math.floor(i / v5) else i % v4
			local IRemainder: number = if IsColumn then i % v5 else math.floor(i / v4)
			local NewFloored: number = if IsSum then Floored + IRemainder else i
			local Entry = if #List > 0 then List[NewFloored % #List + 1] else {}
			for i3 in Entry do
				assert(i3 == "position" or (i3 == "rotation" or (i3 == "size" or (i3 == "color" or (i3 == "name" or i3 == "visible")))), "A pattern variant has position, rotation, size, color, name or visibility")
			end
			local TripleResult6 = triple(Entry.position, config)
			local TripleResult7 = triple(Entry.rotation, config)
			local X = TripleResult6.x
			local NewY = TripleResult6.y
			local Z = TripleResult6.z
			local Degrees = 0
			local NewSine = nil
			local NewCosine = nil
			
			if Mode == "radial" then
				local Angle = if v8 == nil then i / v6 * 3.141592653589793 * 2 else v8 + i * (6.283185307179586 / v6)
				NewSine = math.sin(Angle) * v7 + X
				NewCosine = math.cos(Angle) * v7 + Z
				Degrees = math.deg(Angle)
			elseif Mode == "grid" then
				NewSine = (Floored + 0.5) * TripleResult2.x / v4 - TripleResult2.x / 2 + X
				NewCosine = (IRemainder + 0.5) * TripleResult2.z / v5 - TripleResult2.z / 2 + Z
			else
				NewSine = i * TripleResult1.x + X
				NewY = i * TripleResult1.y + NewY
				NewCosine = i * TripleResult1.z + Z
			end
			local ColorResult = color(Entry.color, FFFFFF)
			local TripleResult8 = triple(Entry.size, TripleResult5)
			
			if Mode == "grid" and p2.fit == true then
				TripleResult8 = {
					x = TripleResult2.x / v4 - TripleResult3.x,
					y = TripleResult8.y,
					z = TripleResult2.z / v5 - TripleResult3.z
				}
			end
			assert(TripleResult8.x > 0 and TripleResult8.y > 0 and TripleResult8.z > 0, "Pattern sizes are positive")
			local Formatted: string = if Replaced2 == 2 then string.format(NamePattern, Floored + v9, IRemainder + v9) else string.format(NamePattern, i + v9)
			local Name = Entry.name or Formatted
			assert(type(Name) == "string" and #Name <= 160, "A pattern variant has a short name")
			assert(Entry.visible == nil or type(Entry.visible) == "boolean", "Pattern visibility is a boolean")
			table.insert(List1, {
				id = Formatted,
				name = Name,
				visible = Entry.visible ~= false,
				position = {
					TripleResult.x + (Cosine1 * Cosine2 + Sine1 * Sine * Sine2) * NewSine + (-Cosine1 * Sine2 + Sine1 * Sine * Cosine2) * NewY + Sine1 * Cosine * NewCosine,
					TripleResult.y + Cosine * Sine2 * NewSine + Cosine * Cosine2 * NewY - Sine * NewCosine,
					TripleResult.z + (-Sine1 * Cosine2 + Cosine1 * Sine * Sine2) * NewSine + (Sine1 * Sine2 + Cosine1 * Sine * Cosine2) * NewY + Cosine1 * Cosine * NewCosine
				},
				rotation = {
					TripleResult4.x + TripleResult7.x,
					TripleResult4.y + TripleResult7.y + Degrees,
					TripleResult4.z + TripleResult7.z
				},
				size = { TripleResult8.x, TripleResult8.y, TripleResult8.z },
				color = ColorResult
			})
		end
		return List1
	end,
	fields = {
		{ id = "id", type = "string" },
		{ id = "name", type = "string" },
		{ id = "position", type = "vector3" },
		{ id = "rotation", type = "vector3" },
		{ id = "size", type = "vector3" },
		{ id = "color", type = "color", luauType = "unknown" },
		{ id = "visible", type = "boolean" }
	}
}