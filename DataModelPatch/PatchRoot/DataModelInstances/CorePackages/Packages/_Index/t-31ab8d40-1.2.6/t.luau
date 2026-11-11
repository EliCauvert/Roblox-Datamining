local Typeof1 = typeof or type

local function _(p1)
	-- upvalues: Typeof1 (copy)
	return function(p2)
		-- upvalues: Typeof1 (upval), p1 (copy)
		local TypeofResult = Typeof1(p2)
		
		if TypeofResult == p1 then
			return true
		else
			return false, string.format("%s expected, got %s", p1, TypeofResult)
		end
	end
end

local function any(p1)
	if p1 == nil then
		return false, "any expected, got nil"
	else
		return true
	end
end

local v1 = "boolean"

local function Boolean(p1)
	-- upvalues: Typeof1 (copy), v1 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v1 then
		return true
	else
		return false, string.format("%s expected, got %s", v1, TypeofResult)
	end
end

local v2 = "thread"

local function Thread(p1)
	-- upvalues: Typeof1 (copy), v2 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v2 then
		return true
	else
		return false, string.format("%s expected, got %s", v2, TypeofResult)
	end
end

local v3 = "function"

local function Callback(p1)
	-- upvalues: Typeof1 (copy), v3 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v3 then
		return true
	else
		return false, string.format("%s expected, got %s", v3, TypeofResult)
	end
end

local v4 = "nil"

local function None(p1)
	-- upvalues: Typeof1 (copy), v4 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v4 then
		return true
	else
		return false, string.format("%s expected, got %s", v4, TypeofResult)
	end
end

local v5 = "string"

local function v12(p1)
	-- upvalues: Typeof1 (copy), v5 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v5 then
		return true
	else
		return false, string.format("%s expected, got %s", v5, TypeofResult)
	end
end

local v6 = "table"

local function v14(p1)
	-- upvalues: Typeof1 (copy), v6 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v6 then
		return true
	else
		return false, string.format("%s expected, got %s", v6, TypeofResult)
	end
end

local v7 = "userdata"

local function Userdata(p1)
	-- upvalues: Typeof1 (copy), v7 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v7 then
		return true
	else
		return false, string.format("%s expected, got %s", v7, TypeofResult)
	end
end

local v8 = "Axes"

local function Axes(p1)
	-- upvalues: Typeof1 (copy), v8 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v8 then
		return true
	else
		return false, string.format("%s expected, got %s", v8, TypeofResult)
	end
end

local v9 = "BrickColor"

local function v20(p1)
	-- upvalues: Typeof1 (copy), v9 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v9 then
		return true
	else
		return false, string.format("%s expected, got %s", v9, TypeofResult)
	end
end

local v10 = "CFrame"

local function v22(p1)
	-- upvalues: Typeof1 (copy), v10 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v10 then
		return true
	else
		return false, string.format("%s expected, got %s", v10, TypeofResult)
	end
end

local v11 = "Color3"

local function v24(p1)
	-- upvalues: Typeof1 (copy), v11 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v11 then
		return true
	else
		return false, string.format("%s expected, got %s", v11, TypeofResult)
	end
end

local v12 = "ColorSequence"

local function ColorSequence(p1)
	-- upvalues: Typeof1 (copy), v12 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v12 then
		return true
	else
		return false, string.format("%s expected, got %s", v12, TypeofResult)
	end
end

local v13 = "ColorSequenceKeypoint"

local function ColorSequenceKeypoint(p1)
	-- upvalues: Typeof1 (copy), v13 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v13 then
		return true
	else
		return false, string.format("%s expected, got %s", v13, TypeofResult)
	end
end

local v14 = "DockWidgetPluginGuiInfo"

local function DockWidgetPluginGuiInfo(p1)
	-- upvalues: Typeof1 (copy), v14 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v14 then
		return true
	else
		return false, string.format("%s expected, got %s", v14, TypeofResult)
	end
end

local v15 = "Faces"

local function Faces(p1)
	-- upvalues: Typeof1 (copy), v15 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v15 then
		return true
	else
		return false, string.format("%s expected, got %s", v15, TypeofResult)
	end
end

local v16 = "Instance"

local function v34(p1)
	-- upvalues: Typeof1 (copy), v16 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v16 then
		return true
	else
		return false, string.format("%s expected, got %s", v16, TypeofResult)
	end
end

local v17 = "NumberRange"

local function v36(p1)
	-- upvalues: Typeof1 (copy), v17 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v17 then
		return true
	else
		return false, string.format("%s expected, got %s", v17, TypeofResult)
	end
end

local v18 = "NumberSequence"

local function NumberSequence(p1)
	-- upvalues: Typeof1 (copy), v18 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v18 then
		return true
	else
		return false, string.format("%s expected, got %s", v18, TypeofResult)
	end
end

local v19 = "NumberSequenceKeypoint"

local function NumberSequenceKeypoint(p1)
	-- upvalues: Typeof1 (copy), v19 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v19 then
		return true
	else
		return false, string.format("%s expected, got %s", v19, TypeofResult)
	end
end

local v20 = "PathWaypoint"

local function PathWaypoint(p1)
	-- upvalues: Typeof1 (copy), v20 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v20 then
		return true
	else
		return false, string.format("%s expected, got %s", v20, TypeofResult)
	end
end

local v21 = "PhysicalProperties"

local function PhysicalProperties(p1)
	-- upvalues: Typeof1 (copy), v21 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v21 then
		return true
	else
		return false, string.format("%s expected, got %s", v21, TypeofResult)
	end
end

local v22 = "Random"

local function v46(p1)
	-- upvalues: Typeof1 (copy), v22 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v22 then
		return true
	else
		return false, string.format("%s expected, got %s", v22, TypeofResult)
	end
end

local v23 = "Ray"

local function v48(p1)
	-- upvalues: Typeof1 (copy), v23 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v23 then
		return true
	else
		return false, string.format("%s expected, got %s", v23, TypeofResult)
	end
end

local v24 = "Rect"

local function v50(p1)
	-- upvalues: Typeof1 (copy), v24 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v24 then
		return true
	else
		return false, string.format("%s expected, got %s", v24, TypeofResult)
	end
end

local v25 = "Region3"

local function v52(p1)
	-- upvalues: Typeof1 (copy), v25 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v25 then
		return true
	else
		return false, string.format("%s expected, got %s", v25, TypeofResult)
	end
end

local v26 = "Region3int16"

local function Region3int16(p1)
	-- upvalues: Typeof1 (copy), v26 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v26 then
		return true
	else
		return false, string.format("%s expected, got %s", v26, TypeofResult)
	end
end

local v27 = "TweenInfo"

local function v56(p1)
	-- upvalues: Typeof1 (copy), v27 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v27 then
		return true
	else
		return false, string.format("%s expected, got %s", v27, TypeofResult)
	end
end

local v28 = "UDim"

local function v58(p1)
	-- upvalues: Typeof1 (copy), v28 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v28 then
		return true
	else
		return false, string.format("%s expected, got %s", v28, TypeofResult)
	end
end

local v29 = "UDim2"

local function v60(p1)
	-- upvalues: Typeof1 (copy), v29 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v29 then
		return true
	else
		return false, string.format("%s expected, got %s", v29, TypeofResult)
	end
end

local v30 = "Vector2"

local function v62(p1)
	-- upvalues: Typeof1 (copy), v30 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v30 then
		return true
	else
		return false, string.format("%s expected, got %s", v30, TypeofResult)
	end
end

local v31 = "Vector3"

local function v64(p1)
	-- upvalues: Typeof1 (copy), v31 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v31 then
		return true
	else
		return false, string.format("%s expected, got %s", v31, TypeofResult)
	end
end

local v32 = "Vector3int16"

local function Vector3int16(p1)
	-- upvalues: Typeof1 (copy), v32 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v32 then
		return true
	else
		return false, string.format("%s expected, got %s", v32, TypeofResult)
	end
end

local v33 = "Enum"

local function v68(p1)
	-- upvalues: Typeof1 (copy), v33 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v33 then
		return true
	else
		return false, string.format("%s expected, got %s", v33, TypeofResult)
	end
end

local v34 = "EnumItem"

local function EnumItem(p1)
	-- upvalues: Typeof1 (copy), v34 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v34 then
		return true
	else
		return false, string.format("%s expected, got %s", v34, TypeofResult)
	end
end

local v35 = "RBXScriptSignal"

local function RBXScriptSignal(p1)
	-- upvalues: Typeof1 (copy), v35 (copy)
	local TypeofResult = Typeof1(p1)
	
	if TypeofResult == v35 then
		return true
	else
		return false, string.format("%s expected, got %s", v35, TypeofResult)
	end
end

local v36 = "RBXScriptConnection"
local TModule = {
	any = any,
	boolean = Boolean,
	thread = Thread,
	callback = Callback,
	none = None,
	string = v12,
	table = v14,
	userdata = Userdata,
	number = function(p1)
		-- upvalues: Typeof1 (copy)
		local TypeofResult = Typeof1(p1)
		
		if TypeofResult ~= "number" then
			return false, string.format("number expected, got %s", TypeofResult)
		elseif p1 == p1 then
			return true
		else
			return false, "unexpected NaN value"
		end
	end,
	nan = function(p1)
		if p1 == p1 then
			return false, "unexpected non-NaN value"
		else
			return true
		end
	end,
	Axes = Axes,
	BrickColor = v20,
	CFrame = v22,
	Color3 = v24,
	ColorSequence = ColorSequence,
	ColorSequenceKeypoint = ColorSequenceKeypoint,
	DockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo,
	Faces = Faces,
	Instance = v34,
	NumberRange = v36,
	NumberSequence = NumberSequence,
	NumberSequenceKeypoint = NumberSequenceKeypoint,
	PathWaypoint = PathWaypoint,
	PhysicalProperties = PhysicalProperties,
	Random = v46,
	Ray = v48,
	Rect = v50,
	Region3 = v52,
	Region3int16 = Region3int16,
	TweenInfo = v56,
	UDim = v58,
	UDim2 = v60,
	Vector2 = v62,
	Vector3 = v64,
	Vector3int16 = Vector3int16,
	Enum = v68,
	EnumItem = EnumItem,
	RBXScriptSignal = RBXScriptSignal,
	RBXScriptConnection = function(p1)
		-- upvalues: Typeof1 (copy), v36 (copy)
		local TypeofResult = Typeof1(p1)
		
		if TypeofResult == v36 then
			return true
		else
			return false, string.format("%s expected, got %s", v36, TypeofResult)
		end
	end
}

function TModule.literal(...)
	-- upvalues: TModule (copy)
	local Selected = select("#", ...)
	
	if Selected == 1 then
		local v37 = (...)
		
		return function(p1)
			-- upvalues: v37 (copy)
			if p1 == v37 then
				return true
			else
				return false, string.format("expected %s, got %s", tostring(v37), (tostring(p1)))
			end
		end
	end
	local LiteralResults = {}
	
	for i = 1, Selected do
		LiteralResults[i] = TModule.literal((select(i, ...)))
	end
	return TModule.union(unpack(LiteralResults))
end

TModule.exactly = TModule.literal

function TModule.keyOf(List)
	-- upvalues: TModule (copy)
	local t = {}
	
	for i in pairs(List) do
		t[#t + 1] = i
	end
	return TModule.literal(unpack(t))
end

function TModule.valueOf(List)
	-- upvalues: TModule (copy)
	local t = {}
	
	for _, value in pairs(List) do
		t[#t + 1] = value
	end
	return TModule.literal(unpack(t))
end

function TModule.integer(p1: number)
	-- upvalues: TModule (copy)
	local NumberResult, NumberResult2 = TModule.number(p1)
	
	if not NumberResult then
		return false, NumberResult2 or ""
	elseif p1 % 1 == 0 then
		return true
	else
		return false, string.format("integer expected, got %s", p1)
	end
end

function TModule.numberMin(p1)
	-- upvalues: TModule (copy)
	return function(p2)
		-- upvalues: TModule (upval), p1 (copy)
		local NumberResult, NumberResult2 = TModule.number(p2)
		
		if not NumberResult then
			return false, NumberResult2 or ""
		elseif p1 <= p2 then
			return true
		else
			return false, string.format("number >= %s expected, got %s", p1, p2)
		end
	end
end

function TModule.numberMax(p1)
	-- upvalues: TModule (copy)
	return function(p2)
		-- upvalues: TModule (upval), p1 (copy)
		local NumberResult, NumberResult2 = TModule.number(p2)
		
		if not NumberResult then
			return false, NumberResult2
		elseif p2 <= p1 then
			return true
		else
			return false, string.format("number <= %s expected, got %s", p1, p2)
		end
	end
end

function TModule.numberMinExclusive(p1)
	-- upvalues: TModule (copy)
	return function(p2)
		-- upvalues: TModule (upval), p1 (copy)
		local NumberResult, NumberResult2 = TModule.number(p2)
		
		if not NumberResult then
			return false, NumberResult2 or ""
		elseif p1 < p2 then
			return true
		else
			return false, string.format("number > %s expected, got %s", p1, p2)
		end
	end
end

function TModule.numberMaxExclusive(p1)
	-- upvalues: TModule (copy)
	return function(p2)
		-- upvalues: TModule (upval), p1 (copy)
		local NumberResult, NumberResult2 = TModule.number(p2)
		
		if not NumberResult then
			return false, NumberResult2 or ""
		elseif p2 < p1 then
			return true
		else
			return false, string.format("number < %s expected, got %s", p1, p2)
		end
	end
end

TModule.numberPositive = TModule.numberMinExclusive(0)
TModule.numberNegative = TModule.numberMaxExclusive(0)

function TModule.numberConstrained(p1, p2)
	-- upvalues: TModule (copy)
	assert(TModule.number(p1) and TModule.number(p2))
	local NumberMinResult = TModule.numberMin(p1)
	local NumberMaxResult = TModule.numberMax(p2)
	
	return function(p3)
		-- upvalues: NumberMinResult (copy), NumberMaxResult (copy)
		local NumberMinResultResult, NumberMinResultResult2 = NumberMinResult(p3)
		
		if not NumberMinResultResult then
			return false, NumberMinResultResult2 or ""
		end
		local NumberMaxResultResult, NumberMaxResultResult2 = NumberMaxResult(p3)
		
		if NumberMaxResultResult then
			return true
		else
			return false, NumberMaxResultResult2 or ""
		end
	end
end

function TModule.numberConstrainedExclusive(p1, p2)
	-- upvalues: TModule (copy)
	assert(TModule.number(p1) and TModule.number(p2))
	local NumberMinExclusiveResult = TModule.numberMinExclusive(p1)
	local NumberMaxExclusiveResult = TModule.numberMaxExclusive(p2)
	
	return function(p3)
		-- upvalues: NumberMinExclusiveResult (copy), NumberMaxExclusiveResult (copy)
		local NumberMinExclusiveResultResult, NumberMinExclusiveResultResult2 = NumberMinExclusiveResult(p3)
		
		if not NumberMinExclusiveResultResult then
			return false, NumberMinExclusiveResultResult2 or ""
		end
		local NumberMaxExclusiveResultResult, NumberMaxExclusiveResultResult2 = NumberMaxExclusiveResult(p3)
		
		if NumberMaxExclusiveResultResult then
			return true
		else
			return false, NumberMaxExclusiveResultResult2 or ""
		end
	end
end

function TModule.match(Pattern)
	-- upvalues: TModule (copy)
	assert(TModule.string(Pattern))
	
	return function(Text: string)
		-- upvalues: TModule (upval), Pattern (copy)
		local v38, v39 = TModule.string(Text)
		
		if not v38 then
			return false, v39
		elseif string.match(Text, Pattern) == nil then
			return false, string.format("\"%s\" failed to match pattern \"%s\"", Text, Pattern)
		else
			return true
		end
	end
end

function TModule.optional(Callback)
	-- upvalues: TModule (copy)
	assert(TModule.callback(Callback))
	
	return function(p1)
		-- upvalues: Callback (copy)
		if p1 == nil then
			return true
		end
		local CallbackResult, CallbackResult2 = Callback(p1)
		
		if CallbackResult then
			return true
		else
			return false, string.format("(optional) %s", CallbackResult2 or "")
		end
	end
end

function TModule.tuple(...)
	local list = { ... }
	
	return function(...)
		-- upvalues: list (copy)
		local list1 = { ... }
		local v38 = nil
		
		for i = 1, #list do
			local v39
			v39, v115 = list[i](list1[i])
			
			if v39 == false then
				return false, string.format("Bad tuple index #%s:\n\t%s", i, v38 or "")
			end
		end
		return true
	end
end

function TModule.keys(Callback)
	-- upvalues: TModule (copy)
	assert(TModule.callback(Callback))
	
	return function(List)
		-- upvalues: TModule (upval), Callback (copy)
		local v38, v39 = TModule.table(List)
		
		if v38 == false then
			return false, v39 or ""
		end
		local CallbackResult2 = nil
		for i in pairs(List) do
			local CallbackResult
			CallbackResult, CallbackResult2 = Callback(i)
			
			if CallbackResult == false then
				return false, string.format("bad key %s:\n\t%s", tostring(i), CallbackResult2 or "")
			end
		end
		return true
	end
end

function TModule.values(Callback)
	-- upvalues: TModule (copy)
	assert(TModule.callback(Callback))
	
	return function(List)
		-- upvalues: TModule (upval), Callback (copy)
		local v38, v39 = TModule.table(List)
		
		if v38 == false then
			return false, v39 or ""
		end
		local CallbackResult2 = nil
		for i, value in pairs(List) do
			local CallbackResult
			CallbackResult, CallbackResult2 = Callback(value)
			
			if CallbackResult == false then
				return false, string.format("bad value for key %s:\n\t%s", tostring(i), CallbackResult2 or "")
			end
		end
		return true
	end
end

function TModule.map(Any, Callback)
	-- upvalues: TModule (copy)
	assert(TModule.callback(Any), TModule.callback(Callback))
	local KeysResult = TModule.keys(Any)
	local ValuesResult = TModule.values(Callback)
	
	return function(p1)
		-- upvalues: KeysResult (copy), ValuesResult (copy)
		local KeysResultResult, KeysResultResult2 = KeysResult(p1)
		
		if not KeysResultResult then
			return false, KeysResultResult2 or ""
		end
		local ValuesResultResult, ValuesResultResult2 = ValuesResult(p1)
		
		if ValuesResultResult then
			return true
		else
			return false, ValuesResultResult2 or ""
		end
	end
end

local KeysResult = TModule.keys(TModule.integer)

function TModule.array(Callback)
	-- upvalues: TModule (copy), KeysResult (copy)
	assert(TModule.callback(Callback))
	local ValuesResult = TModule.values(Callback)
	
	return function(List)
		-- upvalues: KeysResult (upval), ValuesResult (copy)
		local KeysResultResult, KeysResultResult2 = KeysResult(List)
		
		if KeysResultResult == false then
			return false, string.format("[array] %s", KeysResultResult2 or "")
		end
		local Count = 0
		
		for i, _ in ipairs(List) do
			Count += 1
		end
		for i in pairs(List) do
			if i < 1 or Count < i then
				return false, string.format("[array] key %s must be sequential", (tostring(i)))
			end
		end
		local ValuesResultResult, ValuesResultResult2 = ValuesResult(List)
		
		if ValuesResultResult then
			return true
		else
			return false, string.format("[array] %s", ValuesResultResult2 or "")
		end
	end
end

local ArrayResult = TModule.array(TModule.callback)

function TModule.union(...)
	-- upvalues: ArrayResult (copy)
	local list = { ... }
	assert(ArrayResult(list))
	
	return function(p1)
		-- upvalues: list (copy)
		for _, value in pairs(list) do
			if value(p1) then
				return true
			end
		end
		return false, "bad type for union"
	end
end

TModule.some = TModule.union

function TModule.intersection(...)
	-- upvalues: ArrayResult (copy)
	local list = { ... }
	assert(ArrayResult(list))
	
	return function(p1)
		-- upvalues: list (copy)
		local v38 = nil
		for _, value in pairs(list) do
			local v39
			v39, v139 = value(p1)
			
			if not v39 then
				return false, v38 or ""
			end
		end
		return true
	end
end

TModule.every = TModule.intersection
local MapResult = TModule.map(TModule.any, TModule.callback)

function TModule.interface(p1)
	-- upvalues: MapResult (copy), TModule (copy)
	assert(MapResult(p1))
	
	return function(p2)
		-- upvalues: TModule (upval), p1 (copy)
		local v38, v39 = TModule.table(p2)
		
		if v38 == false then
			return false, v39 or ""
		end
		local v40 = nil
		for i, value in pairs(p1) do
			local v41
			v41, v143 = value(p2[i])
			
			if v41 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i), v40 or "")
			end
		end
		return true
	end
end

function TModule.strictInterface(p2)
	-- upvalues: MapResult (copy), TModule (copy)
	assert(MapResult(p2))
	
	return function(List)
		-- upvalues: TModule (upval), p2 (copy)
		local v38, v39 = TModule.table(List)
		
		if v38 == false then
			return false, v39 or ""
		end
		local v40 = nil
		for i, value in pairs(p2) do
			local v41
			v41, v147 = value(List[i])
			
			if v41 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i), v40 or "")
			end
		end
		for i1 in pairs(List) do
			if not p2[i1] then
				return false, string.format("[interface] unexpected field '%s'", (tostring(i1)))
			end
		end
		return true
	end
end

function TModule.instanceOf(ClassName, p3)
	-- upvalues: TModule (copy)
	assert(TModule.string(ClassName))
	local ChildrenResult = if p3 == nil then nil else TModule.children(p3)
	
	return function(p4)
		-- upvalues: TModule (upval), ClassName (copy), ChildrenResult (ref)
		local v42, v43 = TModule.Instance(p4)
		
		if not v42 then
			return false, v43 or ""
		end
		if p4.ClassName ~= ClassName then
			return false, string.format("%s expected, got %s", ClassName, p4.ClassName)
		end
		if ChildrenResult then
			local ChildrenResultResult, ChildrenResultResult2 = ChildrenResult(p4)
			
			if not ChildrenResultResult then
				return false, ChildrenResultResult2
			end
		end
		return true
	end
end

TModule.instance = TModule.instanceOf

function TModule.instanceIsA(ClassName, p3)
	-- upvalues: TModule (copy)
	assert(TModule.string(ClassName))
	local ChildrenResult = if p3 == nil then nil else TModule.children(p3)
	
	return function(Object)
		-- upvalues: TModule (upval), ClassName (copy), ChildrenResult (ref)
		local v42, v43 = TModule.Instance(Object)
		
		if not v42 then
			return false, v43 or ""
		end
		if not Object:IsA(ClassName) then
			return false, string.format("%s expected, got %s", ClassName, Object.ClassName)
		end
		if ChildrenResult then
			local ChildrenResultResult, ChildrenResultResult2 = ChildrenResult(Object)
			
			if not ChildrenResultResult then
				return false, ChildrenResultResult2
			end
		end
		return true
	end
end

function TModule.enum(EnumType)
	-- upvalues: TModule (copy)
	assert(TModule.Enum(EnumType))
	
	return function(p3)
		-- upvalues: TModule (upval), EnumType (copy)
		local EnumItemResult, EnumItemResult2 = TModule.EnumItem(p3)
		
		if not EnumItemResult then
			return false, EnumItemResult2
		elseif p3.EnumType == EnumType then
			return true
		else
			return false, string.format("enum of %s expected, got enum of %s", tostring(EnumType), (tostring(p3.EnumType)))
		end
	end
end

local TupleResult = TModule.tuple(TModule.callback, TModule.callback)

function TModule.wrap(Callback1, Callback)
	-- upvalues: TupleResult (copy)
	assert(TupleResult(Callback1, Callback))
	
	return function(...)
		-- upvalues: Callback (copy), Callback1 (copy)
		assert(Callback(...))
		
		return Callback1(...)
	end
end

function TModule.strict(Callback)
	return function(...)
		-- upvalues: Callback (copy)
		assert(Callback(...))
	end
end

local MapResult1 = TModule.map(TModule.string, TModule.callback)

function TModule.children(p3)
	-- upvalues: MapResult1 (copy), TModule (copy)
	assert(MapResult1(p3))
	
	return function(Object)
		-- upvalues: TModule (upval), p3 (copy)
		local v42, v43 = TModule.Instance(Object)
		
		if not v42 then
			return false, v43 or ""
		end
		local t = {}
		local Name = nil
		
		for i, child in pairs(Object:GetChildren()) do
			Name = child.Name
			
			if p3[Name] then
				if t[Name] then
					return false, string.format("Cannot process multiple children with the same name \"%s\"", Name)
				end
				t[Name] = child
			end
		end
		local v44 = nil
		for i, value in pairs(p3) do
			local v45
			v45, v165 = value(t[i])
			
			if not v45 then
				return false, string.format("[%s.%s] %s", Object:GetFullName(), i, v44 or "")
			end
		end
		return true
	end
end

return TModule