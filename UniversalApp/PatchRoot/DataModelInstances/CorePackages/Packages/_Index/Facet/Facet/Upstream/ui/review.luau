local AmbientModule = require("./ambient")
local PaintBoundsModule = require("./paint_bounds")
local ReviewRulesModule = require("./review_rules")
local config = {
	TouchGui = true,
	Freecam = true,
	BubbleChat = true,
	Chat = true
}

local function _(p1, p2)
	if p1 == nil then
		return nil
	else
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), p2 (copy)
			return p1[p2]
		end)
		
		return if Success then Result else nil
	end
end

local function call(Node, p1, ...)
	local Callback = nil
	if Node == nil then
		Callback = nil
	else
		local Success, Result = pcall(function()
			-- upvalues: Node (copy), p1 (copy)
			return Node[p1]
		end)
		Callback = if Success then Result else nil
	end
	if type(Callback) ~= "function" then
		return false, nil
	end
	local Success1, Result1 = pcall(Callback, Node, ...)
	
	if Success1 then
		return true, Result1
	else
		return false, nil
	end
end

local _ = function(p1, p2): boolean
	-- upvalues: call (copy)
	local IsA, IsA2 = call(p1, "IsA", p2)
	
	return IsA and IsA2 == true
end

local _ = function(p1, p2)
	-- upvalues: call (copy)
	local GetStyled, GetStyled2 = call(p1, "GetStyled", p2)
	
	if GetStyled and GetStyled2 ~= nil then
		return GetStyled2
	elseif p1 == nil then
		return nil
	else
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), p2 (copy)
			return p1[p2]
		end)
		
		return if Success then Result else nil
	end
end

local _ = function(Value: number, p1)
	return if type(Value) == "number" and Value == Value and math.abs(Value) ~= 1e999 then Value else p1
end

local function color(p1)
	local t = {}
	local Value1 = nil
	
	if p1 == nil then
		Value1 = nil
	else
		local v1 = "R"
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), v1 (copy)
			return p1[v1]
		end)
		Value1 = if Success then Result else nil
	end
	t.r = if type(Value1) == "number" and Value1 == Value1 and math.abs(Value1) ~= 1e999 then Value1 else 0
	local Value2 = nil
	
	if p1 == nil then
		Value2 = nil
	else
		local v2 = "G"
		local Success1, Result1 = pcall(function()
			-- upvalues: p1 (copy), v2 (copy)
			return p1[v2]
		end)
		Value2 = if Success1 then Result1 else nil
	end
	t.g = if type(Value2) == "number" and Value2 == Value2 and math.abs(Value2) ~= 1e999 then Value2 else 0
	local Value = nil
	
	if p1 == nil then
		Value = nil
	else
		local v3 = "B"
		local Success2, Result2 = pcall(function()
			-- upvalues: p1 (copy), v3 (copy)
			return p1[v3]
		end)
		Value = if Success2 then Result2 else nil
	end
	t.b = if type(Value) == "number" and Value == Value and math.abs(Value) ~= 1e999 then Value else 0
	
	return t
end

local _ = function(p1)
	local Value = nil
	if p1 == nil then
		Value = nil
	else
		local v1 = "X"
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), v1 (copy)
			return p1[v1]
		end)
		Value = if Success then Result else nil
	end
	local Value2 = if type(Value) == "number" and Value == Value and math.abs(Value) ~= 1e999 then Value else 0
	local Value1 = nil
	
	if p1 == nil then
		Value1 = nil
	else
		local v2 = "Y"
		local Success1, Result1 = pcall(function()
			-- upvalues: p1 (copy), v2 (copy)
			return p1[v2]
		end)
		Value1 = if Success1 then Result1 else nil
	end
	if type(Value1) == "number" and Value1 == Value1 and math.abs(Value1) ~= 1e999 then
		return Value2, Value1
	else
		return Value2, 0
	end
end

local _ = function(p1)
	-- upvalues: call (copy)
	local GetChildren, GetChildren2 = call(p1, "GetChildren")
	
	return if GetChildren and type(GetChildren2) == "table" then GetChildren2 else {}
end

local _ = function(p1)
	return if type(p1) == "string" then p1 else nil
end

local function role(Node): string?
	-- upvalues: call (copy)
	local GetTags, GetTags2 = call(Node, "GetTags")
	
	if not GetTags or type(GetTags2) ~= "table" then
		return nil
	end
	for _, Text in GetTags2 do
		if type(Text) == "string" and string.sub(Text, 1, 11) == "facet-type-" then
			return (string.sub(Text, 12))
		end
	end
	return nil
end

local function built(Node): boolean
	-- upvalues: call (copy)
	local GetTags, GetTags2 = call(Node, "GetTags")
	
	if not GetTags or type(GetTags2) ~= "table" then
		return false
	end
	for _, value in GetTags2 do
		if type(value) == "string" and string.sub(value, 1, 6) == "facet-" then
			return true
		end
	end
	return false
end

local _ = function()
	-- upvalues: AmbientModule (copy)
	return AmbientModule()
end

local MeasureResults = {}

local function declaredPaint(Node)
	-- upvalues: call (copy)
	local GetAttribute, GetAttribute2 = call(Node, "GetAttribute", "FacetPaintRect")
	local GetAttribute1, GetAttribute2_1 = call(Node, "GetAttribute", "FacetSourceSize")
	
	if not GetAttribute or GetAttribute2 == nil or not GetAttribute1 or GetAttribute2_1 == nil then
		return nil
	end
	local v1 = nil
	if GetAttribute2 == nil then
		v1 = nil
	else
		local v2 = "Min"
		local Success, Result = pcall(function()
			-- upvalues: GetAttribute2 (copy), v2 (copy)
			return GetAttribute2[v2]
		end)
		v1 = if Success then Result else nil
	end
	local Value = nil
	if v1 == nil then
		Value = nil
	else
		local v3 = "X"
		local Success1, Result1 = pcall(function()
			-- upvalues: v1 (copy), v3 (copy)
			return v1[v3]
		end)
		Value = if Success1 then Result1 else nil
	end
	local Value6 = if type(Value) == "number" and Value == Value and math.abs(Value) ~= 1e999 then Value else 0
	local Value1 = nil
	
	if v1 == nil then
		Value1 = nil
	else
		local v4 = "Y"
		local Success2, Result2 = pcall(function()
			-- upvalues: v1 (copy), v4 (copy)
			return v1[v4]
		end)
		Value1 = if Success2 then Result2 else nil
	end
	local Value7 = if type(Value1) == "number" and Value1 == Value1 and math.abs(Value1) ~= 1e999 then Value1 else 0
	local v5 = nil
	
	if GetAttribute2 == nil then
		v5 = nil
	else
		local v6 = "Max"
		local Success3, Result3 = pcall(function()
			-- upvalues: GetAttribute2 (copy), v6 (copy)
			return GetAttribute2[v6]
		end)
		v5 = if Success3 then Result3 else nil
	end
	local Value2 = nil
	if v5 == nil then
		Value2 = nil
	else
		local v7 = "X"
		local Success4, Result4 = pcall(function()
			-- upvalues: v5 (copy), v7 (copy)
			return v5[v7]
		end)
		Value2 = if Success4 then Result4 else nil
	end
	local Value8 = if type(Value2) == "number" and Value2 == Value2 and math.abs(Value2) ~= 1e999 then Value2 else 0
	local Value3 = nil
	
	if v5 == nil then
		Value3 = nil
	else
		local v8 = "Y"
		local Success5, Result5 = pcall(function()
			-- upvalues: v5 (copy), v8 (copy)
			return v5[v8]
		end)
		Value3 = if Success5 then Result5 else nil
	end
	local Value9 = if type(Value3) == "number" and Value3 == Value3 and math.abs(Value3) ~= 1e999 then Value3 else 0
	local Value4 = nil
	
	if GetAttribute2_1 == nil then
		Value4 = nil
	else
		local v9 = "X"
		local Success6, Result6 = pcall(function()
			-- upvalues: GetAttribute2_1 (copy), v9 (copy)
			return GetAttribute2_1[v9]
		end)
		Value4 = if Success6 then Result6 else nil
	end
	local Value10 = if type(Value4) == "number" and Value4 == Value4 and math.abs(Value4) ~= 1e999 then Value4 else 0
	local Value5 = nil
	
	if GetAttribute2_1 == nil then
		Value5 = nil
	else
		local v10 = "Y"
		local Success7, Result7 = pcall(function()
			-- upvalues: GetAttribute2_1 (copy), v10 (copy)
			return GetAttribute2_1[v10]
		end)
		Value5 = if Success7 then Result7 else nil
	end
	local Value11 = if type(Value5) == "number" and Value5 == Value5 and math.abs(Value5) ~= 1e999 then Value5 else 0
	
	return if Value10 <= 0 or Value11 <= 0 then nil else {
		x0 = Value6,
		y0 = Value7,
		x1 = Value8,
		y1 = Value9,
		width = Value10,
		height = Value11
	}
end

local function paintCrop(Node)
	local v1 = nil
	if Node == nil then
		v1 = nil
	else
		local v2 = "Image"
		local Success, Result = pcall(function()
			-- upvalues: Node (copy), v2 (copy)
			return Node[v2]
		end)
		v1 = if Success then Result else nil
	end
	local v3 = if type(v1) == "string" then v1 else nil
	
	if v3 == nil or v3 == "" then
		return nil
	end
	local Offset = nil
	if Node == nil then
		Offset = nil
	else
		local v4 = "ImageRectOffset"
		local Success1, Result1 = pcall(function()
			-- upvalues: Node (copy), v4 (copy)
			return Node[v4]
		end)
		Offset = if Success1 then Result1 else nil
	end
	local Extent = nil
	if Node == nil then
		Extent = nil
	else
		local v5 = "ImageRectSize"
		local Success2, Result2 = pcall(function()
			-- upvalues: Node (copy), v5 (copy)
			return Node[v5]
		end)
		Extent = if Success2 then Result2 else nil
	end
	local Value = nil
	if Offset == nil then
		Value = nil
	else
		local v6 = "X"
		local Success3, Result3 = pcall(function()
			-- upvalues: Offset (copy), v6 (copy)
			return Offset[v6]
		end)
		Value = if Success3 then Result3 else nil
	end
	local Value4 = if type(Value) == "number" and Value == Value and math.abs(Value) ~= 1e999 then Value else 0
	local Value1 = nil
	
	if Offset == nil then
		Value1 = nil
	else
		local v7 = "Y"
		local Success4, Result4 = pcall(function()
			-- upvalues: Offset (copy), v7 (copy)
			return Offset[v7]
		end)
		Value1 = if Success4 then Result4 else nil
	end
	local Value5 = if type(Value1) == "number" and Value1 == Value1 and math.abs(Value1) ~= 1e999 then Value1 else 0
	local Value2 = nil
	
	if Extent == nil then
		Value2 = nil
	else
		local v8 = "X"
		local Success5, Result5 = pcall(function()
			-- upvalues: Extent (copy), v8 (copy)
			return Extent[v8]
		end)
		Value2 = if Success5 then Result5 else nil
	end
	local Value6 = if type(Value2) == "number" and Value2 == Value2 and math.abs(Value2) ~= 1e999 then Value2 else 0
	local Value3 = nil
	
	if Extent == nil then
		Value3 = nil
	else
		local v9 = "Y"
		local Success6, Result6 = pcall(function()
			-- upvalues: Extent (copy), v9 (copy)
			return Extent[v9]
		end)
		Value3 = if Success6 then Result6 else nil
	end
	local Value7 = if type(Value3) == "number" and Value3 == Value3 and math.abs(Value3) ~= 1e999 then Value3 else 0
	
	if (Value6 <= 0 or Value7 <= 0) and (Value4 ~= 0 or Value5 ~= 0) then
		return nil
	else
		return {
			key = ("%s|%g,%g,%g,%g"):format(v3, Value4, Value5, Value6, Value7),
			offset = Offset,
			extent = Extent,
			width = Value6,
			height = Value7
		}
	end
end

local function readPaint(p1, p2)
	-- upvalues: call (copy), MeasureResults (copy), PaintBoundsModule (copy)
	local CreateEditableImageAsync, CreateEditableImageAsync2 = call(p1, "CreateEditableImageAsync", p2.content)
	
	if CreateEditableImageAsync and CreateEditableImageAsync2 ~= nil then
		local v1 = nil
		if CreateEditableImageAsync2 == nil then
			v1 = nil
		else
			local v2 = "Size"
			local Success, Result = pcall(function()
				-- upvalues: CreateEditableImageAsync2 (copy), v2 (copy)
				return CreateEditableImageAsync2[v2]
			end)
			v1 = if Success then Result else nil
		end
		local Value = nil
		if v1 == nil then
			Value = nil
		else
			local v3 = "X"
			local Success1, Result1 = pcall(function()
				-- upvalues: v1 (copy), v3 (copy)
				return v1[v3]
			end)
			Value = if Success1 then Result1 else nil
		end
		local Value2 = if type(Value) == "number" and Value == Value and math.abs(Value) ~= 1e999 then Value else 0
		local Value1 = nil
		
		if v1 == nil then
			Value1 = nil
		else
			local v4 = "Y"
			local Success2, Result2 = pcall(function()
				-- upvalues: v1 (copy), v4 (copy)
				return v1[v4]
			end)
			Value1 = if Success2 then Result2 else nil
		end
		local Value3 = if type(Value1) == "number" and Value1 == Value1 and math.abs(Value1) ~= 1e999 then Value1 else 0
		for _, crop in p2.crops do
			local IsWidthBelow: boolean = crop.width <= 0 or crop.height <= 0
			local Value4 = if IsWidthBelow then Value2 else crop.width
			local Value5 = if IsWidthBelow then Value3 else crop.height
			local ReadPixelsBuffer, ReadPixelsBuffer2 = call(CreateEditableImageAsync2, "ReadPixelsBuffer", crop.offset, if IsWidthBelow then v1 else crop.extent)
			
			if ReadPixelsBuffer and type(ReadPixelsBuffer2) == "buffer" and Value4 > 0 and Value4 * Value5 * 4 <= buffer.len(ReadPixelsBuffer2) then
				MeasureResults[crop.key] = PaintBoundsModule.measure(ReadPixelsBuffer2, Value4, Value5)
			end
		end
		call(CreateEditableImageAsync2, "Destroy")
	end
	for _, crop1 in p2.crops do
		if MeasureResults[crop1.key] == nil then
			MeasureResults[crop1.key] = false
		end
	end
end

local function measurePaint(p3, List)
	-- upvalues: paintCrop (copy), MeasureResults (copy), call (copy), readPaint (copy)
	local Keys = {}
	local t = {}
	local List1 = {}
	
	for _, value in List do
		local PaintCropResult = paintCrop(value.node)
		
		if PaintCropResult ~= nil then
			Keys[value] = PaintCropResult.key
			
			if MeasureResults[PaintCropResult.key] == nil then
				local Node = value.node
				local v5 = nil
				
				if Node == nil then
					v5 = nil
				else
					local v6 = "Image"
					local Success, Result = pcall(function()
						-- upvalues: Node (copy), v6 (copy)
						return Node[v6]
					end)
					v5 = if Success then Result else nil
				end
				local v7 = (if type(v5) == "string" then v5 else nil) or ""
				local Entry = t[v7]
				
				if Entry == nil then
					local t1 = {}
					local Node1 = value.node
					local Content1 = nil
					
					if Node1 == nil then
						Content1 = nil
					else
						local v8 = "ImageContent"
						local Success1, Result1 = pcall(function()
							-- upvalues: Node1 (copy), v8 (copy)
							return Node1[v8]
						end)
						Content1 = if Success1 then Result1 else nil
					end
					t1.content = Content1
					t1.crops = {}
					Entry = t1
					t[v7] = Entry
					table.insert(List1, Entry)
				end
				local v9 = false
				
				for _, crop in Entry.crops do
					v9 = v9 or crop.key == PaintCropResult.key
				end
				if not v9 then
					table.insert(Entry.crops, PaintCropResult)
				end
			end
		end
	end
	if #List1 == 0 then
		return Keys
	end
	local GetService, GetService2 = call(p3, "GetService", "RunService")
	local IsStudio, IsStudio2 = call(if GetService then GetService2 else nil, "IsStudio")
	local GetService1, GetService2_1 = call(p3, "GetService", "AssetService")
	
	if not IsStudio or IsStudio2 ~= true or not GetService1 or GetService2_1 == nil or not coroutine.isyieldable() then
		return Keys
	end
	local Task1 = if task then task else nil
	
	if Task1 == nil then
		for _, value1 in List1 do
			readPaint(GetService2_1, value1)
		end
		return Keys
	else
		local Count = 1
		local Count1 = 0
		
		local function work()
			-- upvalues: Count (ref), List1 (copy), readPaint (upval), GetService2_1 (copy), Count1 (ref)
			while Count <= #List1 do
				local Entry = List1[Count]
				Count += 1
				pcall(readPaint, GetService2_1, Entry)
			end
			Count1 -= 1
		end
		
		for _ = 1, math.min(8, #List1) do
			Count1 += 1
			Task1.spawn(work)
		end
		while Count1 > 0 do
			Task1.wait()
		end
		return Keys
	end
end

local function paint(p4, List)
	-- upvalues: declaredPaint (copy), measurePaint (copy), MeasureResults (copy), PaintBoundsModule (copy)
	local List1 = {}
	local t = {}
	
	for _, value in List do
		local DeclaredPaintResult = declaredPaint(value.node)
		
		if DeclaredPaintResult == nil then
			table.insert(List1, value)
		else
			t[value] = DeclaredPaintResult
		end
	end
	for i, value1 in measurePaint(p4, List1) do
		local MeasureResult = MeasureResults[value1]
		
		if MeasureResult then
			t[i] = MeasureResult
		end
	end
	for i1, value2 in t do
		i1.element.paint = PaintBoundsModule.place(i1.rect, value2, i1.mode, i1.slice, i1.quarter)
	end
end

local function roots(Root)
	-- upvalues: AmbientModule (copy), call (copy)
	if Root ~= nil then
		return { Root }
	end
	local GetService, GetService2 = call(AmbientModule(), "GetService", "Players")
	local v10 = nil
	
	if GetService then
		if GetService2 == nil then
			v10 = nil
		else
			local v11 = "LocalPlayer"
			local Success, Result = pcall(function()
				-- upvalues: GetService2 (copy), v11 (copy)
				return GetService2[v11]
			end)
			v10 = if Success then Result else nil
		end
	else
		v10 = nil
	end
	local FindFirstChildOfClass, FindFirstChildOfClass2 = call(v10, "FindFirstChildOfClass", "PlayerGui")
	
	if FindFirstChildOfClass then
		FindFirstChildOfClass = FindFirstChildOfClass2 ~= nil
	end
	assert(FindFirstChildOfClass, "Facet review: there is no PlayerGui here. Run it on the client, or pass a root.")
	
	return { FindFirstChildOfClass2 }
end

local function collect(p5)
	-- upvalues: call (copy), AmbientModule (copy), config (copy), color (copy), built (copy), role (copy), roots (copy), paint (copy)
	local P25 = p5 or {}
	local FindFirstAncestorWhichIsA1 = nil
	
	if P25.root == nil then
		FindFirstAncestorWhichIsA1 = AmbientModule()
	else
		local FindFirstAncestorWhichIsA, FindFirstAncestorWhichIsA2 = call(P25.root, "FindFirstAncestorWhichIsA", "DataModel")
		FindFirstAncestorWhichIsA1 = if FindFirstAncestorWhichIsA then FindFirstAncestorWhichIsA2 else nil
	end
	local GetService, GetService2 = call(FindFirstAncestorWhichIsA1, "GetService", "Workspace")
	local v10 = nil
	
	if GetService then
		if GetService2 == nil then
			v10 = nil
		else
			local v11 = "CurrentCamera"
			local Success, Result = pcall(function()
				-- upvalues: GetService2 (copy), v11 (copy)
				return GetService2[v11]
			end)
			v10 = if Success then Result else nil
		end
	else
		v10 = nil
	end
	local v12 = nil
	if v10 == nil then
		v12 = nil
	else
		local v13 = "ViewportSize"
		local Success1, Result1 = pcall(function()
			-- upvalues: v10 (copy), v13 (copy)
			return v10[v13]
		end)
		v12 = if Success1 then Result1 else nil
	end
	local Value = nil
	if v12 == nil then
		Value = nil
	else
		local v14 = "X"
		local Success2, Result2 = pcall(function()
			-- upvalues: v12 (copy), v14 (copy)
			return v12[v14]
		end)
		Value = if Success2 then Result2 else nil
	end
	local Value2 = if type(Value) == "number" and Value == Value and math.abs(Value) ~= 1e999 then Value else 0
	local Value1 = nil
	
	if v12 == nil then
		Value1 = nil
	else
		local v15 = "Y"
		local Success3, Result3 = pcall(function()
			-- upvalues: v12 (copy), v15 (copy)
			return v12[v15]
		end)
		Value1 = if Success3 then Result3 else nil
	end
	local Value3 = if type(Value1) == "number" and Value1 == Value1 and math.abs(Value1) ~= 1e999 then Value1 else 0
	local Elements = {}
	local Indexes = {}
	local List = {}
	local Callback = nil
	
	local function visitChild(Node, Parent, Visible, p6)
		-- upvalues: call (upval), config (upval), Elements (copy), color (upval), Indexes (copy), List (copy), built (upval), role (upval), Callback (ref)
		local Index = Parent
		local Visible1: boolean = Visible
		local v16 = p6
		local IsA, IsA2 = call(Node, "IsA", "LayerCollector")
		
		if IsA then
			IsA = IsA2 == true
		end
		repeat
			if IsA then
				local v17 = nil
				if Node == nil then
					v17 = nil
				else
					local v18 = "Name"
					local Success, Result = pcall(function()
						-- upvalues: Node (copy), v18 (copy)
						return Node[v18]
					end)
					v17 = if Success then Result else nil
				end
				local v19 = if type(v17) == "string" then v17 else nil
				local IsA3, IsA2_2 = call(Node, "IsA", "ScreenGui")
				
				if IsA3 then
					IsA3 = IsA2_2 == true
				end
				if not IsA3 or v19 ~= nil and config[v19] then return end
				local Visible2: boolean = Visible
				
				if Visible2 then
					local Enabled = nil
					if Node == nil then
						Enabled = nil
					else
						local v20 = "Enabled"
						local Success3, Result3 = pcall(function()
							-- upvalues: Node (copy), v20 (copy)
							return Node[v20]
						end)
						Enabled = if Success3 then Result3 else nil
					end
					Visible2 = Enabled ~= false
				end
				Visible1 = Visible2
				break
			end
			local IsA1, IsA2_1 = call(Node, "IsA", "GuiObject")
			
			if IsA1 then
				IsA1 = IsA2_1 == true
			end
			if not IsA1 then break end
			local FindFirstChildOfClass, FindFirstChildOfClass2 = call(Node, "FindFirstChildOfClass", "UIScale")
			
			if FindFirstChildOfClass and FindFirstChildOfClass2 ~= nil then
				local Value10 = nil
				if FindFirstChildOfClass2 == nil then
					Value10 = nil
				else
					local v21 = "Scale"
					local Success6, Result6 = pcall(function()
						-- upvalues: FindFirstChildOfClass2 (copy), v21 (copy)
						return FindFirstChildOfClass2[v21]
					end)
					Value10 = if Success6 then Result6 else nil
				end
				v16 = p6 * (if type(Value10) == "number" and Value10 == Value10 and math.abs(Value10) ~= 1e999 then Value10 else 1)
			end
			local v22 = nil
			if Node == nil then
				v22 = nil
			else
				local v23 = "AbsolutePosition"
				local Success7, Result7 = pcall(function()
					-- upvalues: Node (copy), v23 (copy)
					return Node[v23]
				end)
				v22 = if Success7 then Result7 else nil
			end
			local Value11 = nil
			if v22 == nil then
				Value11 = nil
			else
				local v24 = "X"
				local Success8, Result8 = pcall(function()
					-- upvalues: v22 (copy), v24 (copy)
					return v22[v24]
				end)
				Value11 = if Success8 then Result8 else nil
			end
			local Value29 = if type(Value11) == "number" and Value11 == Value11 and math.abs(Value11) ~= 1e999 then Value11 else 0
			local Value12 = nil
			
			if v22 == nil then
				Value12 = nil
			else
				local v25 = "Y"
				local Success12, Result14 = pcall(function()
					-- upvalues: v22 (copy), v25 (copy)
					return v22[v25]
				end)
				Value12 = if Success12 then Result14 else nil
			end
			local Value30 = if type(Value12) == "number" and Value12 == Value12 and math.abs(Value12) ~= 1e999 then Value12 else 0
			local v26 = nil
			
			if Node == nil then
				v26 = nil
			else
				local v27 = "AbsoluteSize"
				local Success14, Result16 = pcall(function()
					-- upvalues: Node (copy), v27 (copy)
					return Node[v27]
				end)
				v26 = if Success14 then Result16 else nil
			end
			local Value15 = nil
			if v26 == nil then
				Value15 = nil
			else
				local v28 = "X"
				local Success16, Result18 = pcall(function()
					-- upvalues: v26 (copy), v28 (copy)
					return v26[v28]
				end)
				Value15 = if Success16 then Result18 else nil
			end
			local Value32 = if type(Value15) == "number" and Value15 == Value15 and math.abs(Value15) ~= 1e999 then Value15 else 0
			local Value16 = nil
			
			if v26 == nil then
				Value16 = nil
			else
				local v29 = "Y"
				local Success19, Result21 = pcall(function()
					-- upvalues: v26 (copy), v29 (copy)
					return v26[v29]
				end)
				Value16 = if Success19 then Result21 else nil
			end
			local Value33 = if type(Value16) == "number" and Value16 == Value16 and math.abs(Value16) ~= 1e999 then Value16 else 0
			local Visible3: boolean = Visible
			
			if Visible3 then
				local Enabled2 = nil
				if Node == nil then
					Enabled2 = nil
				else
					local v30 = "Visible"
					local Success23, Result25 = pcall(function()
						-- upvalues: Node (copy), v30 (copy)
						return Node[v30]
					end)
					Enabled2 = if Success23 then Result25 else nil
				end
				Visible3 = Enabled2 ~= false
			end
			local Value18 = nil
			if Node == nil then
				Value18 = nil
			else
				local v31 = "AbsoluteRotation"
				local Success24, Result26 = pcall(function()
					-- upvalues: Node (copy), v31 (copy)
					return Node[v31]
				end)
				Value18 = if Success24 then Result26 else nil
			end
			local Value34 = if type(Value18) == "number" and Value18 == Value18 and math.abs(Value18) ~= 1e999 then Value18 else 0
			local ValueRemainder = Value34 % 180
			local Smallest = math.min(ValueRemainder, 180 - ValueRemainder)
			local config1 = {
				x = Value29,
				y = Value30,
				width = Value32,
				height = Value33
			}
			local IsA5, IsA2_6 = call(Node, "IsA", "TextLabel")
			
			if IsA5 then
				IsA5 = IsA2_6 == true
			end
			if not IsA5 then
				local IsA2_7
				IsA5, IsA2_7 = call(Node, "IsA", "TextButton")
				
				if IsA5 then
					IsA5 = IsA2_7 == true
				end
				if not IsA5 then
					local IsA2_8
					IsA5, IsA2_8 = call(Node, "IsA", "TextBox")
					
					if IsA5 then
						IsA5 = IsA2_8 == true
					end
				end
			end
			local Flag1 = false
			
			if Smallest > 89 then
				Flag1 = not IsA5
				
				if Flag1 then
					local Value14 = nil
					if Node == nil then
						Value14 = nil
					else
						local v32 = "Rotation"
						local Success30, Result34 = pcall(function()
							-- upvalues: Node (copy), v32 (copy)
							return Node[v32]
						end)
						Value14 = if Success30 then Result34 else nil
					end
					Flag1 = math.abs((if type(Value14) == "number" and Value14 == Value14 and math.abs(Value14) ~= 1e999 then Value14 else 0) % 180 - ValueRemainder) < 1
				end
			end
			if Flag1 then
				Value29 += (Value32 - Value33) / 2
				Value30 += (Value33 - Value32) / 2
				local Height: number = Value33
				Value33 = Value32
				Smallest = 0
				Value32 = Height
			end
			local HasTag1, HasTag2_1 = call(Node, "HasTag", "facet-icon-glyph")
			
			if HasTag1 then
				HasTag1 = HasTag2_1 == true
			end
			local Element = { index = #Elements + 1, parent = Parent }
			local Result33 = nil
			
			if Node == nil then
				Result33 = nil
			else
				local v33 = "ClassName"
				local Success29, Result32 = pcall(function()
					-- upvalues: Node (copy), v33 (copy)
					return Node[v33]
				end)
				Result33 = if Success29 then Result32 else nil
			end
			Element.class = (if type(Result33) == "string" then Result33 else nil) or "GuiObject"
			local GetFullName, GetFullName2 = call(Node, "GetFullName")
			Element.path = if GetFullName and type(GetFullName2) == "string" then GetFullName2 else "?"
			Element.rect = {
				x = Value29,
				y = Value30,
				width = Value32,
				height = Value33
			}
			Element.visible = Visible3
			local IsA6, IsA2_9 = call(Node, "IsA", "GuiButton")
			
			if IsA6 then
				IsA6 = IsA2_9 == true
			end
			if not IsA6 then
				local IsA2_10
				IsA6, IsA2_10 = call(Node, "IsA", "TextBox")
				
				if IsA6 then
					IsA6 = IsA2_10 == true
				end
			end
			Element.interactive = IsA6
			local Value17 = nil
			
			if Node == nil then
				Value17 = nil
			else
				local v34 = "ZIndex"
				local Success21, Result23 = pcall(function()
					-- upvalues: Node (copy), v34 (copy)
					return Node[v34]
				end)
				Value17 = if Success21 then Result23 else nil
			end
			Element.z = if type(Value17) == "number" and Value17 == Value17 and math.abs(Value17) ~= 1e999 then Value17 else 1
			Element.turn = if Smallest > 0.5 then Smallest else nil
			local FindFirstChildWhichIsA, FindFirstChildWhichIsA2 = call(Node, "FindFirstChildWhichIsA", "UIListLayout")
			local Fan = nil
			
			if FindFirstChildWhichIsA and FindFirstChildWhichIsA2 ~= nil then
				local Result29 = nil
				if FindFirstChildWhichIsA2 == nil then
					Result29 = nil
				else
					local v35 = "Padding"
					local Success26, Result28 = pcall(function()
						-- upvalues: FindFirstChildWhichIsA2 (copy), v35 (copy)
						return FindFirstChildWhichIsA2[v35]
					end)
					Result29 = if Success26 then Result28 else nil
				end
				Fan = true
				local Value1 = nil
				
				if Result29 == nil then
					Value1 = nil
				else
					local v36 = "Offset"
					local Success35, Result39 = pcall(function()
						-- upvalues: Result29 (copy), v36 (copy)
						return Result29[v36]
					end)
					Value1 = if Success35 then Result39 else nil
				end
				if (if type(Value1) == "number" and Value1 == Value1 and math.abs(Value1) ~= 1e999 then Value1 else 0) >= 0 then
					local Value6 = nil
					if Result29 == nil then
						Value6 = nil
					else
						local v37 = "Scale"
						local Success25, Result27 = pcall(function()
							-- upvalues: Result29 (copy), v37 (copy)
							return Result29[v37]
						end)
						Value6 = if Success25 then Result27 else nil
					end
					Fan = (if type(Value6) == "number" and Value6 == Value6 and math.abs(Value6) ~= 1e999 then Value6 else 0) < 0
				end
			else
				Fan = false
			end
			Element.fan = Fan
			local Clips = true
			local Enabled3 = nil
			
			if Node == nil then
				Enabled3 = nil
			else
				local v38 = "ClipsDescendants"
				local Success37, Result41 = pcall(function()
					-- upvalues: Node (copy), v38 (copy)
					return Node[v38]
				end)
				Enabled3 = if Success37 then Result41 else nil
			end
			if Enabled3 ~= true then
				local IsA2_11
				Clips, IsA2_11 = call(Node, "IsA", "ScrollingFrame")
				
				if Clips then
					Clips = IsA2_11 == true
				end
				if not Clips then
					local IsA2_4
					Clips, IsA2_4 = call(Node, "IsA", "CanvasGroup")
					
					if Clips then
						Clips = IsA2_4 == true
					end
				end
			end
			Element.clips = Clips
			local GetStyled1, GetStyled2_1 = call(Node, "GetStyled", "BackgroundColor3")
			local GetStyled3 = nil
			
			if GetStyled1 and GetStyled2_1 ~= nil then
				GetStyled3 = GetStyled2_1
			elseif Node == nil then
				GetStyled3 = nil
			else
				local v39 = "BackgroundColor3"
				local Success38, Result42 = pcall(function()
					-- upvalues: Node (copy), v39 (copy)
					return Node[v39]
				end)
				GetStyled3 = if Success38 then Result42 else nil
			end
			Element.fill = color(GetStyled3)
			local GetStyled4, GetStyled2_2 = call(Node, "GetStyled", "BackgroundTransparency")
			local Value8 = nil
			
			if GetStyled4 and GetStyled2_2 ~= nil then
				Value8 = GetStyled2_2
			elseif Node == nil then
				Value8 = nil
			else
				local v40 = "BackgroundTransparency"
				local Success40, Result44 = pcall(function()
					-- upvalues: Node (copy), v40 (copy)
					return Node[v40]
				end)
				Value8 = if Success40 then Result44 else nil
			end
			Element.fillTransparency = math.clamp(if type(Value8) == "number" and (Value8 == Value8 and math.abs(Value8) ~= 1e999) then Value8 else 1, 0, 1)
			local Flag, IsA2_5 = call(Node, "IsA", "ViewportFrame")
			
			if Flag then
				Flag = IsA2_5 == true
			end
			repeat
				if Flag then break end
				if HasTag1 then
					local v41 = nil
					if Node == nil then
						v41 = nil
					else
						local v42 = "Text"
						local Success41, Result45 = pcall(function()
							-- upvalues: Node (copy), v42 (copy)
							return Node[v42]
						end)
						v41 = if Success41 then Result45 else nil
					end
					if ((if type(v41) == "string" then v41 else nil) or "") ~= "" then
						Flag = true
						local GetStyled5, GetStyled2_3 = call(Node, "GetStyled", "TextTransparency")
						local Value7 = nil
						
						if GetStyled5 and GetStyled2_3 ~= nil then
							Value7 = GetStyled2_3
						elseif Node == nil then
							Value7 = nil
						else
							local v43 = "TextTransparency"
							local Success1, Result1 = pcall(function()
								-- upvalues: Node (copy), v43 (copy)
								return Node[v43]
							end)
							Value7 = if Success1 then Result1 else nil
						end
						if (if type(Value7) == "number" and (Value7 == Value7 and math.abs(Value7) ~= 1e999) then Value7 else 0) < 0.9 then break end
					end
				end
				local IsA7, IsA2_12 = call(Node, "IsA", "ImageLabel")
				
				if IsA7 then
					IsA7 = IsA2_12 == true
				end
				if not IsA7 then
					local IsA2_13
					Flag, IsA2_13 = call(Node, "IsA", "ImageButton")
					
					if Flag then
						Flag = IsA2_13 == true
					end
					if not Flag then break end
				end
				Flag = false
				local v44 = nil
				
				if Node == nil then
					v44 = nil
				else
					local v45 = "Image"
					local Success43, Result47 = pcall(function()
						-- upvalues: Node (copy), v45 (copy)
						return Node[v45]
					end)
					v44 = if Success43 then Result47 else nil
				end
				if ((if type(v44) == "string" then v44 else nil) or "") == "" then break end
				local GetStyled7, GetStyled2_5 = call(Node, "GetStyled", "ImageTransparency")
				local Value3 = nil
				
				if GetStyled7 and GetStyled2_5 ~= nil then
					Value3 = GetStyled2_5
				elseif Node == nil then
					Value3 = nil
				else
					local v46 = "ImageTransparency"
					local Success44, Result48 = pcall(function()
						-- upvalues: Node (copy), v46 (copy)
						return Node[v46]
					end)
					Value3 = if Success44 then Result48 else nil
				end
				Flag = (if type(Value3) == "number" and Value3 == Value3 and math.abs(Value3) ~= 1e999 then Value3 else 0) < 0.9
			until true
			Element.image = Flag
			local IsA4, IsA2_3 = call(Node, "IsA", "ImageLabel")
			local IsA8 = nil
			
			if IsA4 then
				IsA4 = IsA2_3 == true
			end
			repeat
				if not IsA4 then
					local IsA2_14
					IsA8, IsA2_14 = call(Node, "IsA", "ImageButton")
					
					if IsA8 then
						IsA8 = IsA2_14 == true
					end
					if not IsA8 then break end
				end
				IsA8 = Element.image
			until true
			if IsA8 then
				local v47 = nil
				if Node == nil then
					v47 = nil
				else
					local v48 = "Parent"
					local Success39, Result43 = pcall(function()
						-- upvalues: Node (copy), v48 (copy)
						return Node[v48]
					end)
					v47 = if Success39 then Result43 else nil
				end
				local HasTag4, HasTag2_3 = call(v47, "HasTag", "facet-art-ground")
				
				if HasTag4 and HasTag2_3 == true then
					Element.ground = true
				end
				local HasTag, HasTag2 = call(Node, "HasTag", "facet-skin-art")
				local v49 = nil
				
				if HasTag and HasTag2 == true then
					if Node == nil then
						v49 = nil
					else
						local v50 = "Parent"
						local Success45, Result49 = pcall(function()
							-- upvalues: Node (copy), v50 (copy)
							return Node[v50]
						end)
						v49 = if Success45 then Result49 else nil
					end
				else
					v49 = nil
				end
				for _ = 1, 6 do
					if v49 == nil then break end
					local HasTag5, HasTag2_4 = call(v49, "HasTag", "facet-skinned")
					
					if HasTag5 and HasTag2_4 == true then
						Element.parent = Indexes[v49] or Element.parent
						break
					end
					local v51 = v49
					
					if v51 == nil then
						v49 = nil
					else
						local v52 = "Parent"
						local Success46, Result50 = pcall(function()
							-- upvalues: v51 (copy), v52 (copy)
							return v51[v52]
						end)
						v49 = if Success46 then Result50 else nil
					end
				end
			end
			local Floored = math.floor(Value34 / 90 + 0.5)
			local Value4 = nil
			
			if Node == nil then
				Value4 = nil
			else
				local v53 = "Rotation"
				local Success18, Result20 = pcall(function()
					-- upvalues: Node (copy), v53 (copy)
					return Node[v53]
				end)
				Value4 = if Success18 then Result20 else nil
			end
			local ValueRemainder1 = (Value34 - (if type(Value4) == "number" and (Value4 == Value4 and math.abs(Value4) ~= 1e999) then Value4 else 0)) % 360
			local IsMagnitudeBelow: boolean = Floored % 2 == 0 and math.abs(Value34 - Floored * 90) <= 10
			
			if IsA8 and (Visible3 and Value32 > 0 and Value33 > 0) and (IsMagnitudeBelow or Flag1) and (ValueRemainder1 < 1 or ValueRemainder1 > 359) then
				local Result13 = nil
				if Node == nil then
					Result13 = nil
				else
					local v54 = "SliceCenter"
					local Success11, Result12 = pcall(function()
						-- upvalues: Node (copy), v54 (copy)
						return Node[v54]
					end)
					Result13 = if Success11 then Result12 else nil
				end
				local v55 = nil
				if Result13 == nil then
					v55 = nil
				else
					local v56 = "Min"
					local Success34, Result38 = pcall(function()
						-- upvalues: Result13 (copy), v56 (copy)
						return Result13[v56]
					end)
					v55 = if Success34 then Result38 else nil
				end
				local Value9 = nil
				if v55 == nil then
					Value9 = nil
				else
					local v57 = "X"
					local Success5, Result5 = pcall(function()
						-- upvalues: v55 (copy), v57 (copy)
						return v55[v57]
					end)
					Value9 = if Success5 then Result5 else nil
				end
				local Value28 = if type(Value9) == "number" and Value9 == Value9 and math.abs(Value9) ~= 1e999 then Value9 else 0
				local Value2 = nil
				
				if v55 == nil then
					Value2 = nil
				else
					local v58 = "Y"
					local Success15, Result17 = pcall(function()
						-- upvalues: v55 (copy), v58 (copy)
						return v55[v58]
					end)
					Value2 = if Success15 then Result17 else nil
				end
				local Value31 = if type(Value2) == "number" and Value2 == Value2 and math.abs(Value2) ~= 1e999 then Value2 else 0
				local Result10 = nil
				
				if Result13 == nil then
					Result10 = nil
				else
					local v59 = "Max"
					local Success9, Result9 = pcall(function()
						-- upvalues: Result13 (copy), v59 (copy)
						return Result13[v59]
					end)
					Result10 = if Success9 then Result9 else nil
				end
				local Value = nil
				if Result10 == nil then
					Value = nil
				else
					local v60 = "X"
					local Success50, Result56 = pcall(function()
						-- upvalues: Result10 (copy), v60 (copy)
						return Result10[v60]
					end)
					Value = if Success50 then Result56 else nil
				end
				local Value26 = if type(Value) == "number" and Value == Value and math.abs(Value) ~= 1e999 then Value else 0
				local Value21 = nil
				
				if Result10 == nil then
					Value21 = nil
				else
					local v61 = "Y"
					local Success51, Result57 = pcall(function()
						-- upvalues: Result10 (copy), v61 (copy)
						return Result10[v61]
					end)
					Value21 = if Success51 then Result57 else nil
				end
				local Value36 = if type(Value21) == "number" and (Value21 == Value21 and math.abs(Value21) ~= 1e999) then Value21 else 0
				local config2 = {
					element = Element,
					node = Node,
					rect = config1,
					quarter = Floored
				}
				local v62 = nil
				
				if Node == nil then
					v62 = nil
				else
					local v63 = "ScaleType"
					local Success52, Result58 = pcall(function()
						-- upvalues: Node (copy), v63 (copy)
						return Node[v63]
					end)
					v62 = if Success52 then Result58 else nil
				end
				local v64 = nil
				if v62 == nil then
					v64 = nil
				else
					local v65 = "Name"
					local Success10, Result11 = pcall(function()
						-- upvalues: v62 (copy), v65 (copy)
						return v62[v65]
					end)
					v64 = if Success10 then Result11 else nil
				end
				config2.mode = (if type(v64) == "string" then v64 else nil) or "Stretch"
				local Slice = { x0 = Value28, y0 = Value31, x1 = Value26, y1 = Value36 }
				local Value25 = nil
				
				if Node == nil then
					Value25 = nil
				else
					local v66 = "SliceScale"
					local Success4, Result4 = pcall(function()
						-- upvalues: Node (copy), v66 (copy)
						return Node[v66]
					end)
					Value25 = if Success4 then Result4 else nil
				end
				Slice.scale = if type(Value25) == "number" and (Value25 == Value25 and math.abs(Value25) ~= 1e999) then Value25 else 1
				config2.slice = Slice
				table.insert(List, config2)
			end
			local GetAttribute1, GetAttribute2_1 = call(Node, "GetAttribute", "FacetUnfit")
			
			if GetAttribute1 and GetAttribute2_1 == true then
				local FindFirstChild, FindFirstChild2 = call(Node, "FindFirstChild", "FacetUnfitDetails")
				local v67 = nil
				
				if FindFirstChild then
					local v68 = nil
					if FindFirstChild2 == nil then
						v68 = nil
					else
						local v69 = "Value"
						local Success28, Result31 = pcall(function()
							-- upvalues: FindFirstChild2 (copy), v69 (copy)
							return FindFirstChild2[v69]
						end)
						v68 = if Success28 then Result31 else nil
					end
					v67 = if type(v68) == "string" then v68 else nil
				else
					v67 = nil
				end
				Element.unfit = v67 or "composition does not fit"
			end
			local GetAttribute3, GetAttribute2_2 = call(Node, "GetAttribute", "FacetForm")
			
			if GetAttribute3 and type(GetAttribute2_2) == "number" then
				Element.region = true
			end
			local GetAttribute, GetAttribute2 = call(Node, "GetAttribute", "FacetReveal")
			
			if GetAttribute and type(GetAttribute2) == "string" and GetAttribute2 ~= "" then
				Element.reveal = GetAttribute2
			end
			if not HasTag1 and IsA5 then
				local GetStyled6, GetStyled2_4 = call(Node, "GetStyled", "FontFace")
				local v70 = nil
				
				if GetStyled6 and GetStyled2_4 ~= nil then
					v70 = GetStyled2_4
				elseif Node == nil then
					v70 = nil
				else
					local v71 = "FontFace"
					local Success20, Result22 = pcall(function()
						-- upvalues: Node (copy), v71 (copy)
						return Node[v71]
					end)
					v70 = if Success20 then Result22 else nil
				end
				local v72 = nil
				if v70 == nil then
					v72 = nil
				else
					local v73 = "Weight"
					local Success27, Result30 = pcall(function()
						-- upvalues: v70 (copy), v73 (copy)
						return v70[v73]
					end)
					v72 = if Success27 then Result30 else nil
				end
				local Value24 = nil
				if v72 == nil then
					Value24 = nil
				else
					local v74 = "Value"
					local Success22, Result24 = pcall(function()
						-- upvalues: v72 (copy), v74 (copy)
						return v72[v74]
					end)
					Value24 = if Success22 then Result24 else nil
				end
				local Value39 = if type(Value24) == "number" and (Value24 == Value24 and math.abs(Value24) ~= 1e999) then Value24 else 400
				local GetStyled9, GetStyled2_7 = call(Node, "GetStyled", "TextSize")
				local Value5 = nil
				
				if GetStyled9 and GetStyled2_7 ~= nil then
					Value5 = GetStyled2_7
				elseif Node == nil then
					Value5 = nil
				else
					local v75 = "TextSize"
					local Success2, Result2 = pcall(function()
						-- upvalues: Node (copy), v75 (copy)
						return Node[v75]
					end)
					Value5 = if Success2 then Result2 else nil
				end
				local Value27 = if type(Value5) == "number" and Value5 == Value5 and math.abs(Value5) ~= 1e999 then Value5 else 14
				local GetStyled, GetStyled2 = call(Node, "GetStyled", "TextScaled")
				local Enabled1 = nil
				
				if GetStyled and GetStyled2 ~= nil then
					Enabled1 = GetStyled2
				elseif Node == nil then
					Enabled1 = nil
				else
					local v76 = "TextScaled"
					local Success47, Result51 = pcall(function()
						-- upvalues: Node (copy), v76 (copy)
						return Node[v76]
					end)
					Enabled1 = if Success47 then Result51 else nil
				end
				if Enabled1 == true then
					local v77 = nil
					if Node == nil then
						v77 = nil
					else
						local v78 = "TextBounds"
						local Success53, Result59 = pcall(function()
							-- upvalues: Node (copy), v78 (copy)
							return Node[v78]
						end)
						v77 = if Success53 then Result59 else nil
					end
					local Value19 = nil
					if v77 == nil then
						Value19 = nil
					else
						local v79 = "X"
						local Success54, Result60 = pcall(function()
							-- upvalues: v77 (copy), v79 (copy)
							return v77[v79]
						end)
						Value19 = if Success54 then Result60 else nil
					end
					if type(Value19) == "number" and Value19 == Value19 and math.abs(Value19) == 1e999 then
					end
					local Value20 = nil
					if v77 == nil then
						Value20 = nil
					else
						local v80 = "Y"
						local Success17, Result19 = pcall(function()
							-- upvalues: v77 (copy), v80 (copy)
							return v77[v80]
						end)
						Value20 = if Success17 then Result19 else nil
					end
					local Value35 = if type(Value20) == "number" and Value20 == Value20 and math.abs(Value20) ~= 1e999 then Value20 else 0
					
					if Value35 > 0 then
						Value27 = Value35 / v16
					end
				end
				local v81 = nil
				if Node == nil then
					v81 = nil
				else
					local v82 = "TextBounds"
					local Success13, Result15 = pcall(function()
						-- upvalues: Node (copy), v82 (copy)
						return Node[v82]
					end)
					v81 = if Success13 then Result15 else nil
				end
				local Value23 = nil
				if v81 == nil then
					Value23 = nil
				else
					local v83 = "X"
					local Success55, Result61 = pcall(function()
						-- upvalues: v81 (copy), v83 (copy)
						return v81[v83]
					end)
					Value23 = if Success55 then Result61 else nil
				end
				local Value38 = if type(Value23) == "number" and (Value23 == Value23 and math.abs(Value23) ~= 1e999) then Value23 else 0
				local Value22 = nil
				
				if v81 == nil then
					Value22 = nil
				else
					local v84 = "Y"
					local Success32, Result36 = pcall(function()
						-- upvalues: v81 (copy), v84 (copy)
						return v81[v84]
					end)
					Value22 = if Success32 then Result36 else nil
				end
				local Value37 = if type(Value22) == "number" and Value22 == Value22 and math.abs(Value22) ~= 1e999 then Value22 else 0
				local v85 = nil
				
				if Node == nil then
					v85 = nil
				else
					local v86 = "TextXAlignment"
					local Success33, Result37 = pcall(function()
						-- upvalues: Node (copy), v86 (copy)
						return Node[v86]
					end)
					v85 = if Success33 then Result37 else nil
				end
				local v87 = nil
				if v85 == nil then
					v87 = nil
				else
					local v88 = "Name"
					local Success36, Result40 = pcall(function()
						-- upvalues: v85 (copy), v88 (copy)
						return v85[v88]
					end)
					v87 = if Success36 then Result40 else nil
				end
				local v89 = if type(v87) == "string" then v87 else nil
				local v90 = nil
				
				if Node == nil then
					v90 = nil
				else
					local v91 = "TextYAlignment"
					local Success56, Result62 = pcall(function()
						-- upvalues: Node (copy), v91 (copy)
						return Node[v91]
					end)
					v90 = if Success56 then Result62 else nil
				end
				local v92 = nil
				if v90 == nil then
					v92 = nil
				else
					local v93 = "Name"
					local Success57, Result63 = pcall(function()
						-- upvalues: v90 (copy), v93 (copy)
						return v90[v93]
					end)
					v92 = if Success57 then Result63 else nil
				end
				local v94 = if type(v92) == "string" then v92 else nil
				local Text = {
					ink = if Value38 > 0 and Value37 > 0 then {
						x = if v89 == "Left" then Value29 elseif v89 == "Right" then Value29 + Value32 - Value38 else Value29 + (Value32 - Value38) / 2,
						y = if v94 == "Top" then Value30 elseif v94 == "Bottom" then Value30 + Value33 - Value37 else Value30 + (Value33 - Value37) / 2,
						width = Value38,
						height = Value37
					} else nil
				}
				local IsA9, IsA2_15 = call(Node, "IsA", "TextBox")
				
				if IsA9 then
					IsA9 = IsA2_15 == true
				end
				Text.native = not IsA9 and not built(Node)
				local v95 = nil
				
				if Node == nil then
					v95 = nil
				else
					local v96 = "Text"
					local Success58, Result64 = pcall(function()
						-- upvalues: Node (copy), v96 (copy)
						return Node[v96]
					end)
					v95 = if Success58 then Result64 else nil
				end
				Text.content = (if type(v95) == "string" then v95 else nil) or ""
				Text.size = math.floor(Value27 * v16 + 0.5)
				Text.bold = Value39 >= 600
				local Result55 = nil
				
				if v70 == nil then
					Result55 = nil
				else
					local v97 = "Family"
					local Success49, Result54 = pcall(function()
						-- upvalues: v70 (copy), v97 (copy)
						return v70[v97]
					end)
					Result55 = if Success49 then Result54 else nil
				end
				Text.font = if type(Result55) == "string" then Result55 else nil
				Text.role = role(Node)
				local GetStyled10, GetStyled2_8 = call(Node, "GetStyled", "TextColor3")
				local Result53 = nil
				
				if GetStyled10 and GetStyled2_8 ~= nil then
					Result53 = GetStyled2_8
				elseif Node == nil then
					Result53 = nil
				else
					local v98 = "TextColor3"
					local Success48, Result52 = pcall(function()
						-- upvalues: Node (copy), v98 (copy)
						return Node[v98]
					end)
					Result53 = if Success48 then Result52 else nil
				end
				Text.color = color(Result53)
				local GetStyled8, GetStyled2_6 = call(Node, "GetStyled", "TextTransparency")
				local Value13 = nil
				
				if GetStyled8 and GetStyled2_6 ~= nil then
					Value13 = GetStyled2_6
				elseif Node == nil then
					Value13 = nil
				else
					local v99 = "TextTransparency"
					local Success31, Result35 = pcall(function()
						-- upvalues: Node (copy), v99 (copy)
						return Node[v99]
					end)
					Value13 = if Success31 then Result35 else nil
				end
				Text.transparency = math.clamp(if type(Value13) == "number" and Value13 == Value13 and math.abs(Value13) ~= 1e999 then Value13 else 0, 0, 1)
				Element.text = Text
			end
			table.insert(Elements, Element)
			Indexes[Node] = Element.index
			Index = Element.index
			Visible1 = Visible3
			local HasTag3, HasTag2_2 = call(Node, "HasTag", "facet-art-ground")
			
			if not HasTag3 or HasTag2_2 ~= true then break end
			local FindFirstAncestorWhichIsA, FindFirstAncestorWhichIsA2 = call(Node, "FindFirstAncestorWhichIsA", "Folder")
			local v100 = nil
			
			if FindFirstAncestorWhichIsA then
				local v101 = nil
				if FindFirstAncestorWhichIsA2 == nil then
					v101 = nil
				else
					local v102 = "Parent"
					local Success42, Result46 = pcall(function()
						-- upvalues: FindFirstAncestorWhichIsA2 (copy), v102 (copy)
						return FindFirstAncestorWhichIsA2[v102]
					end)
					v101 = if Success42 then Result46 else nil
				end
				v100 = Indexes[v101]
			else
				v100 = nil
			end
			Index = v100 or Index
		until true
		Callback(Node, Index, Visible1, v16)
	end
	
	Callback = function(Node, Index, p6, p7)
		-- upvalues: call (upval), visitChild (copy)
		local GetChildren, GetChildren2 = call(Node, "GetChildren")
		local GetChildren1 = if GetChildren and type(GetChildren2) == "table" then GetChildren2 else {}
		for _, value in GetChildren1 do
			visitChild(value, Index, p6, p7)
		end
	end
	
	for _, value in roots(P25.root) do
		local IsA, IsA2 = call(value, "IsA", "GuiObject")
		
		if IsA then
			IsA = IsA2 == true
		end
		if not IsA then
			local IsA1, IsA2_1 = call(value, "IsA", "LayerCollector")
			
			if IsA1 then
				IsA1 = IsA2_1 == true
			end
			if not IsA1 then
				Callback(value, nil, true, 1)
				continue
			end
		end
		visitChild(value, nil, true, 1)
	end
	paint(FindFirstAncestorWhichIsA1, List)
	
	if Value2 <= 0 or Value3 <= 0 then
		for _, element in Elements do
			Value2 = math.max(Value2, element.rect.x + element.rect.width)
			Value3 = math.max(Value3, element.rect.y + element.rect.height)
		end
	end
	local IsEnabled, GetService2_1 = call(FindFirstAncestorWhichIsA1, "GetService", "UserInputService")
	
	if IsEnabled then
		local Enabled = nil
		if GetService2_1 == nil then
			Enabled = nil
		else
			local v16 = "TouchEnabled"
			local Success4, Result4 = pcall(function()
				-- upvalues: GetService2_1 (copy), v16 (copy)
				return GetService2_1[v16]
			end)
			Enabled = if Success4 then Result4 else nil
		end
		IsEnabled = Enabled == true
	end
	return {
		width = Value2,
		height = Value3,
		elements = Elements,
		touch = IsEnabled
	}
end

local config1 = { x = 0, y = 0, width = 0, height = 0 }

local function recentErrors()
	-- upvalues: call (copy), AmbientModule (copy)
	local GetService, GetService2 = call(AmbientModule(), "GetService", "LogService")
	local GetLogHistory, GetLogHistory2 = call(if GetService then GetService2 else nil, "GetLogHistory")
	local List = {}
	
	if not GetLogHistory or type(GetLogHistory2) ~= "table" then
		return List
	end
	local t = {}
	
	for i = #GetLogHistory2, math.max(1, #GetLogHistory2 - 300), -1 do
		local GetLogHistoryEntry = GetLogHistory2[i]
		local v17 = nil
		
		if GetLogHistoryEntry == nil then
			v17 = nil
		else
			local v18 = "message"
			local Success, Result = pcall(function()
				-- upvalues: GetLogHistoryEntry (copy), v18 (copy)
				return GetLogHistoryEntry[v18]
			end)
			v17 = if Success then Result else nil
		end
		local Text = if type(v17) == "string" then v17 else nil
		
		if Text ~= nil then
			local FindFunction = string.find
			local v19 = nil
			
			if GetLogHistoryEntry == nil then
				v19 = nil
			else
				local v20 = "messageType"
				local Success1, Result1 = pcall(function()
					-- upvalues: GetLogHistoryEntry (copy), v20 (copy)
					return GetLogHistoryEntry[v20]
				end)
				v19 = if Success1 then Result1 else nil
			end
			local NoError = FindFunction(tostring(v19), "Error", 1, true) == nil
			local Segment = nil
			
			if not NoError then
				Segment = string.sub(string.gsub(Text, "%s+", " "), 1, 300)
				NoError = t[Segment]
			end
			if not NoError then
				t[Segment] = true
				table.insert(List, Segment)
				
				if #List == 3 then break end
			else
				continue
			end
		else
			continue
		end
	end
	return List
end

local function runtimeFindings(p8)
	-- upvalues: config1 (copy), AmbientModule (copy), call (copy), recentErrors (copy)
	local List = {}
	local Flag = false
	
	for _, element in p8.elements do
		if element.visible and element.text ~= nil and element.text.content ~= "" then
			Flag = true
			break
		end
	end
	if not Flag then
		table.insert(List, {
			rule = "empty-screen",
			severity = "high",
			path = "PlayerGui",
			detail = "No text is visible. If a mounted screen should show content, a build error stopped it; read the runtime errors below and the console before adjusting layout.",
			rect = config1
		})
	end
	local GetService, GetService2 = call(AmbientModule(), "GetService", "Players")
	local v21 = nil
	
	if GetService then
		if GetService2 == nil then
			v21 = nil
		else
			local v22 = "LocalPlayer"
			local Success, Result = pcall(function()
				-- upvalues: GetService2 (copy), v22 (copy)
				return GetService2[v22]
			end)
			v21 = if Success then Result else nil
		end
	else
		v21 = nil
	end
	local FindFirstChildOfClass, FindFirstChildOfClass2 = call(v21, "FindFirstChildOfClass", "PlayerGui")
	local GetDescendants, GetDescendants2 = call(if FindFirstChildOfClass then FindFirstChildOfClass2 else nil, "GetDescendants")
	
	if GetDescendants and type(GetDescendants2) == "table" then
		for _, value in GetDescendants2 do
			local GetAttribute, GetAttribute2 = call(value, "GetAttribute", "FacetError")
			
			if GetAttribute and type(GetAttribute2) == "string" and GetAttribute2 ~= "" then
				local GetFullName, GetFullName2 = call(value, "GetFullName")
				table.insert(List, {
					rule = "build-failed",
					severity = "high",
					path = if GetFullName and type(GetFullName2) == "string" then GetFullName2 else "?",
					detail = "This control failed to build: " .. string.sub(string.gsub(GetAttribute2, "%s+", " "), 1, 300),
					rect = config1
				})
			end
			local IsA, IsA2 = call(value, "IsA", "ViewportFrame")
			
			if IsA then
				IsA = IsA2 == true
			end
			if IsA then
				local Enabled = nil
				if value == nil then
					Enabled = nil
				else
					local v23 = "Visible"
					local Success1, Result1 = pcall(function()
						-- upvalues: value (copy), v23 (copy)
						return value[v23]
					end)
					Enabled = if Success1 then Result1 else nil
				end
				if Enabled ~= false then
					local Largest1 = 0
					
					for _, value1 in { "Ambient", "LightColor" } do
						local v24 = nil
						if value == nil then
							v24 = nil
						else
							local Success2, Result2 = pcall(function()
								-- upvalues: value (copy), value1 (copy)
								return value[value1]
							end)
							v24 = if Success2 then Result2 else nil
						end
						local Value2 = nil
						if v24 == nil then
							Value2 = nil
						else
							local v25 = "R"
							local Success3, Result3 = pcall(function()
								-- upvalues: v24 (copy), v25 (copy)
								return v24[v25]
							end)
							Value2 = if Success3 then Result3 else nil
						end
						local Value4 = if type(Value2) == "number" and Value2 == Value2 and math.abs(Value2) ~= 1e999 then Value2 else 1
						local Value = nil
						
						if v24 == nil then
							Value = nil
						else
							local v26 = "G"
							local Success4, Result4 = pcall(function()
								-- upvalues: v24 (copy), v26 (copy)
								return v24[v26]
							end)
							Value = if Success4 then Result4 else nil
						end
						local Value5 = if type(Value) == "number" and (Value == Value and math.abs(Value) ~= 1e999) then Value else 1
						local Value1 = nil
						
						if v24 == nil then
							Value1 = nil
						else
							local v27 = "B"
							local Success5, Result5 = pcall(function()
								-- upvalues: v24 (copy), v27 (copy)
								return v24[v27]
							end)
							Value1 = if Success5 then Result5 else nil
						end
						local Value3 = if type(Value1) == "number" and Value1 == Value1 and math.abs(Value1) ~= 1e999 then Value1 else 1
						local Largest = math.max(Value4, Value5, Value3)
						local Smallest = math.min(Value4, Value5, Value3)
						Largest1 = math.max(Largest1, if Largest > 0 then (Largest - Smallest) / Largest else 0)
					end
					if Largest1 > 0.2 then
						local GetFullName1, GetFullName2_1 = call(value, "GetFullName")
						table.insert(List, {
							rule = "tinted-preview-light",
							severity = "medium",
							detail = "A preview's Ambient or LightColor is tinted, so it shows its subject in shifted colors. Keep both near white where the player judges or chooses colors.",
							path = if GetFullName1 and type(GetFullName2_1) == "string" then GetFullName2_1 else "ViewportFrame",
							rect = config1
						})
					end
				end
			end
		end
	end
	for _, value2 in recentErrors() do
		table.insert(List, {
			rule = "runtime-error",
			severity = "high",
			path = "LogService",
			detail = "Recent client error: " .. value2,
			rect = config1
		})
	end
	return List
end

local function screen(p9)
	-- upvalues: collect (copy), ReviewRulesModule (copy), runtimeFindings (copy)
	local CollectResult = collect(p9)
	local AnalyzeResult = ReviewRulesModule.analyze(CollectResult)
	local RuntimeFindingsResult = runtimeFindings(CollectResult)
	
	if #RuntimeFindingsResult == 0 then
		return AnalyzeResult
	end
	local List = {}
	
	for i, value in RuntimeFindingsResult do
		table.insert(AnalyzeResult.findings, i, value)
		table.insert(List, ("[%s] %s: %s"):format(value.severity, value.rule, value.detail))
	end
	AnalyzeResult.text = table.concat(List, "\n") .. "\n" .. AnalyzeResult.text
	
	return AnalyzeResult
end

local function mountedSheets()
	-- upvalues: call (copy), AmbientModule (copy)
	local t = {}
	local GetService, GetService2 = call(AmbientModule(), "GetService", "Players")
	local v28 = nil
	
	if GetService then
		if GetService2 == nil then
			v28 = nil
		else
			local v29 = "LocalPlayer"
			local Success, Result = pcall(function()
				-- upvalues: GetService2 (copy), v29 (copy)
				return GetService2[v29]
			end)
			v28 = if Success then Result else nil
		end
	else
		v28 = nil
	end
	local FindFirstChildOfClass, FindFirstChildOfClass2 = call(v28, "FindFirstChildOfClass", "PlayerGui")
	local GetDescendants, GetDescendants2 = call(if FindFirstChildOfClass then FindFirstChildOfClass2 else nil, "GetDescendants")
	
	if GetDescendants and type(GetDescendants2) == "table" then
		for _, Object in GetDescendants2 do
			local GetAttribute, GetAttribute2 = call(Object, "GetAttribute", "FacetSheet")
			
			if GetAttribute and GetAttribute2 == true then
				local v30 = nil
				if Object == nil then
					v30 = nil
				else
					local v31 = "Name"
					local Success1, Result1 = pcall(function()
						-- upvalues: Object (copy), v31 (copy)
						return Object[v31]
					end)
					v30 = if Success1 then Result1 else nil
				end
				local Text = (if type(v30) == "string" then v30 else nil) or "Sheet"
				while t[Text] ~= nil do
					Text ..= "+"
				end
				t[Text] = {
					open = function()
						-- upvalues: Object (copy)
						Object:SetAttribute("FacetPresent", nil)
						Object:SetAttribute("FacetPresent", true)
					end,
					close = function()
						-- upvalues: Object (copy)
						Object:SetAttribute("FacetPresent", false)
					end
				}
			end
		end
	end
	return t
end

return table.freeze({
	analyze = ReviewRulesModule.analyze,
	collect = collect,
	paintRect = function(p10)
		-- upvalues: AmbientModule (copy), call (copy), PaintBoundsModule (copy)
		local AmbientModuleResult = AmbientModule()
		local GetService, GetService2 = call(AmbientModuleResult, "GetService", "RunService")
		local IsStudio, IsStudio2 = call(if GetService then GetService2 else nil, "IsStudio")
		local GetService1, GetService2_1 = call(AmbientModuleResult, "GetService", "AssetService")
		local Success, Result, Result3 = pcall(function()
			-- upvalues: p10 (copy)
			return Content.fromUri(p10), Vector2.zero
		end)
		
		if not IsStudio or IsStudio2 ~= true or not GetService1 or not Success then
			return nil
		end
		local CreateEditableImageAsync, CreateEditableImageAsync2 = call(GetService2_1, "CreateEditableImageAsync", Result)
		
		if not CreateEditableImageAsync or CreateEditableImageAsync2 == nil then
			return nil
		end
		local v32 = nil
		if CreateEditableImageAsync2 == nil then
			v32 = nil
		else
			local v33 = "Size"
			local Success1, Result1 = pcall(function()
				-- upvalues: CreateEditableImageAsync2 (copy), v33 (copy)
				return CreateEditableImageAsync2[v33]
			end)
			v32 = if Success1 then Result1 else nil
		end
		local Value = nil
		if v32 == nil then
			Value = nil
		else
			local v34 = "X"
			local Success2, Result2 = pcall(function()
				-- upvalues: v32 (copy), v34 (copy)
				return v32[v34]
			end)
			Value = if Success2 then Result2 else nil
		end
		local Value2 = if type(Value) == "number" and Value == Value and math.abs(Value) ~= 1e999 then Value else 0
		local Value1 = nil
		
		if v32 == nil then
			Value1 = nil
		else
			local v35 = "Y"
			local Success3, Result4 = pcall(function()
				-- upvalues: v32 (copy), v35 (copy)
				return v32[v35]
			end)
			Value1 = if Success3 then Result4 else nil
		end
		local Value3 = if type(Value1) == "number" and Value1 == Value1 and math.abs(Value1) ~= 1e999 then Value1 else 0
		local ReadPixelsBuffer, ReadPixelsBuffer2 = call(CreateEditableImageAsync2, "ReadPixelsBuffer", Result3, v32)
		call(CreateEditableImageAsync2, "Destroy")
		
		return if ReadPixelsBuffer and type(ReadPixelsBuffer2) == "buffer" and Value2 > 0 and buffer.len(ReadPixelsBuffer2) >= Value2 * Value3 * 4 then PaintBoundsModule.measure(ReadPixelsBuffer2, Value2, Value3) else nil
	end,
	screen = screen,
	screens = function(p10, p11): string
		-- upvalues: mountedSheets (copy), screen (copy)
		local FacetReviewScreensRunsInPlayWhereTaskWaitIsAvailable: (any) -> () = assert(task and task.wait, "Facet review.screens runs in Play, where task.wait is available")
		local P36 = p10 or mountedSheets()
		
		if next(P36) == nil then
			return "No screens: pass { Name = presentedCell }, or mount Sheets so review.screens can find them."
		end
		local Settle = if p11 and p11.settle then p11.settle else 0.5
		local Config = if p11 then { root = p11.root } else nil
		local List = {}
		
		for i in P36 do
			table.insert(List, i)
		end
		table.sort(List)
		local List1 = {}
		local t = {}
		
		for _, value in List do
			local Entry = P36[value]
			
			local function toggle(p12)
				-- upvalues: Entry (copy)
				if Entry.set then
					Entry.set(Entry, p12)
					
					return
				end
				if p12 then
					assert(Entry.open, "a screen target needs a writable cell or an open function")()
					
					return
				end
				if Entry.close then
					Entry.close()
				end
			end
			
			local Success, Result = pcall(toggle, true)
			FacetReviewScreensRunsInPlayWhereTaskWaitIsAvailable(Settle)
			local List2 = { ("== %s"):format(value) }
			
			if not Success then
				table.insert(List2, "[high] open-failed: " .. tostring(Result))
			end
			local Success1, Result1 = pcall(screen, Config)
			
			if Success1 then
				local Count = 0
				
				for _, finding in Result1.findings do
					local IsBuildFailed: boolean = finding.rule == "build-failed" or finding.rule == "runtime-error"
					local Text = finding.rule .. finding.detail
					local Entry1 = IsBuildFailed and t[Text]
					
					if not Entry1 then
						t[Text] = IsBuildFailed or nil
						Entry1 = finding.severity == "low" or Count >= 5
					end
					if not Entry1 then
						Count += 1
						table.insert(List2, ("[%s] %s: %s"):format(finding.severity, finding.rule, (string.sub(string.gsub(finding.detail, "%s+", " "), 1, 200))))
					end
				end
				if Count == 0 then
					table.insert(List2, "no high or medium findings")
				end
			else
				table.insert(List2, "[high] review-failed: " .. tostring(Result1))
			end
			pcall(toggle, false)
			FacetReviewScreensRunsInPlayWhereTaskWaitIsAvailable(Settle / 2)
			table.insert(List1, table.concat(List2, "\n"))
		end
		return table.concat(List1, "\n")
	end,
	fixes = ReviewRulesModule.fixes
})