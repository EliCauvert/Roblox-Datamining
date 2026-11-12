local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.Signals)
local _ = require(Parent.Foundation)
local _ = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local GetSduiTokensStoreModule = require(SduiCoreSystem.ClientBinding.getSduiTokensStore)
local ProtoVariableMapperModule = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local SplitDottedPathModule = require(SduiCoreSystem.ClientBinding.splitDottedPath)
local FFlagSduiPropParsersShouldHandleTokens = require(Parent.SharedFlags).FFlagSduiPropParsersShouldHandleTokens
local FFlagSduiUnwrapStructPropEnvelope = require(Parent.SharedFlags).FFlagSduiUnwrapStructPropEnvelope
local FFlagSduiParseProtoGradientFields = require(Parent.SharedFlags).FFlagSduiParseProtoGradientFields

local function resolveTokenValueToNumber(Tokens, Text: string)
	-- upvalues: SplitDottedPathModule (copy)
	local IsSegmentMatch = string.sub(Text, 1, 1) == "-"
	local Segment: string = if IsSegmentMatch then string.sub(Text, 2) else Text
	local Tokens1 = Tokens
	local SplitDottedPathModuleResult = SplitDottedPathModule(Segment)
	local CountSplitDottedPathModuleResult = #SplitDottedPathModuleResult
	
	for i, value in SplitDottedPathModuleResult do
		local Token = Tokens1[value]
		
		if i ~= CountSplitDottedPathModuleResult and typeof(Token) ~= "table" then
			error(`Token path {Segment} invalid`)
		end
		Tokens1 = Tokens1[value]
	end
	if typeof(Tokens1) ~= "number" then
		error(`Token path {Segment} did not resolve to a number: {Text}`)
	end
	return if IsSegmentMatch then Tokens1 * -1 else Tokens1
end

local function getTokenOrNumber(p1, p2, p3, p4)
	-- upvalues: GetSduiTokensStoreModule (copy), resolveTokenValueToNumber (copy)
	local Number: number? = tonumber(p1)
	
	if Number then
		if p3 then
			local Tokens = GetSduiTokensStoreModule().getTokens(p2, p4)
			
			return Number * (Tokens and Tokens.Config.UI.Scale or 1)
		else
			return Number
		end
	elseif typeof(p1) ~= "string" then
		error("Expected number or token string, got " .. typeof(p1))
		
		return
	else
		local Success, Result = pcall(function()
			-- upvalues: resolveTokenValueToNumber (upval), GetSduiTokensStoreModule (upval), p2 (copy), p4 (copy), p1 (copy)
			return (resolveTokenValueToNumber(GetSduiTokensStoreModule().getTokens(p2, p4), p1))
		end)
		
		if Success and Result then
			return Result
		else
			error(if typeof(Result) == "string" then Result else nil)
		end
	end
end

local Callback = if FFlagSduiPropParsersShouldHandleTokens then function(Text, p1, p2)
	-- upvalues: getTokenOrNumber (copy)
	local Success, Result = pcall(function(): UDim2?
		-- upvalues: Text (copy), getTokenOrNumber (upval), p1 (copy), p2 (copy)
		local Parts = string.split(Text, ",")
		
		if #Parts == 4 then
			return UDim2.new(tonumber(Parts[1]) or 0, getTokenOrNumber(Parts[2], p1, p2, "parseUDim2"), tonumber(Parts[3]) or 0, (getTokenOrNumber(Parts[4], p1, p2, "parseUDim2")))
		else
			error("Not enough components in string to parse UDim2")
		end
	end)
	
	if Success and Result then
		return Result
	else
		error(if typeof(Result) == "string" then Result else nil)
	end
end else function(Text, p1, p2)
	-- upvalues: GetSduiTokensStoreModule (copy)
	local Success, Result = pcall(function(): UDim2?
		-- upvalues: Text (copy), p2 (copy), GetSduiTokensStoreModule (upval), p1 (copy)
		local Parts = string.split(Text, ",")
		
		if #Parts ~= 4 then
			error("Not enough components in string to parse UDim2")
			
			return
		end
		local Number: number = tonumber(Parts[2]) or 0
		local Number1: number = tonumber(Parts[4]) or 0
		
		if p2 then
			local ParseUDim2Tokens = GetSduiTokensStoreModule().getTokens(p1, "parseUDim2")
			Number *= ParseUDim2Tokens and ParseUDim2Tokens.Config.UI.Scale or 1
			Number1 *= ParseUDim2Tokens and ParseUDim2Tokens.Config.UI.Scale or 1
		end
		return UDim2.new(tonumber(Parts[1]) or 0, Number, tonumber(Parts[3]) or 0, Number1)
	end)
	
	if Success and Result then
		return Result
	else
		error(if typeof(Result) == "string" then Result else nil)
	end
end
local Callback1 = if FFlagSduiPropParsersShouldHandleTokens then function(Text, p1, p2)
	-- upvalues: getTokenOrNumber (copy)
	local Success, Result = pcall(function(): UDim?
		-- upvalues: Text (copy), getTokenOrNumber (upval), p1 (copy), p2 (copy)
		local Parts = string.split(Text, ",")
		
		if #Parts == 2 then
			return UDim.new(tonumber(Parts[1]) or 0, (getTokenOrNumber(Parts[2], p1, p2, "parseUDim")))
		else
			error("Not enough components in string to parse UDim")
		end
	end)
	
	if Success and Result then
		return Result
	else
		error(if typeof(Result) == "string" then Result else nil)
	end
end else function(Text, p1, p2)
	-- upvalues: GetSduiTokensStoreModule (copy)
	local Success, Result = pcall(function(): UDim?
		-- upvalues: Text (copy), p2 (copy), GetSduiTokensStoreModule (upval), p1 (copy)
		local Parts = string.split(Text, ",")
		
		if #Parts ~= 2 then
			error("Not enough components in string to parse UDim")
			
			return
		end
		local Number: number = tonumber(Parts[2]) or 0
		
		if p2 then
			local ParseUDim2Tokens = GetSduiTokensStoreModule().getTokens(p1, "parseUDim2")
			Number *= ParseUDim2Tokens and ParseUDim2Tokens.Config.UI.Scale or 1
		end
		return UDim.new(tonumber(Parts[1]) or 0, Number)
	end)
	
	if Success and Result then
		return Result
	else
		error(if typeof(Result) == "string" then Result else nil)
	end
end

local function parseNumber(p1, p2, p3)
	-- upvalues: GetSduiTokensStoreModule (copy)
	local Success, Result = pcall(function(): number
		-- upvalues: p1 (copy)
		return (tonumber(p1))
	end)
	
	if not Success or not Result then
		error(if typeof(Result) == "string" then Result else nil)
		
		return
	end
	if p3 then
		local ParseUDim2Tokens = GetSduiTokensStoreModule().getTokens(p2, "parseUDim2")
		
		return Result * (ParseUDim2Tokens and ParseUDim2Tokens.Config.UI.Scale or 1)
	else
		return Result
	end
end

local Callback2 = nil

local function isStructEnvelope(List): boolean
	local Fields = List.fields
	
	if typeof(Fields) ~= "table" then
		return false
	end
	for i in List do
		if i ~= "fields" then
			return false
		end
	end
	local Flag = false
	
	for _, field in Fields do
		if typeof(field) ~= "table" then
			return false
		elseif typeof(field.kind) == "table" and typeof(field.kind.type) == "string" then
			Flag = true
		end
	end
	return Flag or next(Fields) == nil
end

local function parseStruct(List)
	-- upvalues: FFlagSduiUnwrapStructPropEnvelope (copy), isStructEnvelope (copy), Callback2 (ref), ProtoVariableMapperModule (copy), parseStruct (copy)
	if typeof(List) ~= "table" then
		return List
	end
	if FFlagSduiUnwrapStructPropEnvelope and isStructEnvelope(List) then
		return Callback2(List)
	end
	local MapPropNameFunction = ProtoVariableMapperModule.mapPropName
	local t = {}
	
	for i, value in List do
		t[if typeof(i) == "string" then MapPropNameFunction(i) else i] = if typeof(value) == "table" then parseStruct(value) else value
	end
	return t
end

local Callback3 = nil

local function unwrapStructList(p1)
	-- upvalues: Callback3 (ref)
	local t = {}
	local Values = if typeof(p1) == "table" then p1.values else nil
	
	if typeof(Values) ~= "table" then
		return t
	end
	for i, value in Values do
		t[i] = Callback3(value)
	end
	return t
end

Callback3 = function(p2)
	-- upvalues: parseStruct (copy), unwrapStructList (copy)
	if typeof(p2) == "table" then
		local Kind = p2.kind
		
		return if typeof(Kind) == "table" and typeof(Kind.type) == "string" then if Kind.type == "null_value" then nil elseif Kind.type == "struct_value" then parseStruct(Kind.value) elseif Kind.type == "list_value" then unwrapStructList(Kind.value) else Kind.value else parseStruct(p2)
	else
		return p2
	end
end

Callback2 = function(p2)
	-- upvalues: ProtoVariableMapperModule (copy), Callback3 (ref)
	local MapPropNameFunction = ProtoVariableMapperModule.mapPropName
	local t = {}
	
	for i, field in p2.fields do
		t[if typeof(i) == "string" then MapPropNameFunction(i) else i] = Callback3(field)
	end
	return t
end

local function parseColor3(EndColor)
	if typeof(EndColor) == "Color3" then
		return EndColor
	elseif typeof(EndColor) == "string" then
		local Success, Result = pcall(function(): Color3
			-- upvalues: EndColor (copy)
			return Color3.fromHex(EndColor)
		end)
		
		return if Success then Result else nil
	elseif typeof(EndColor) == "table" and typeof(EndColor.Color3) == "Color3" then
		return EndColor.Color3
	else
		error(`Could not resolve Color3 from input: {EndColor}`)
	end
end

local config = {
	startOpacity = 0,
	endOpacity = 1,
	degree = 270,
	startColor = Color3.new(0, 0, 0),
	endColor = Color3.new(0, 0, 0)
}

local function parseGradient(p3)
	-- upvalues: parseStruct (copy), config (copy), parseColor3 (copy)
	local ParseStructResult = parseStruct(p3)
	
	if typeof(ParseStructResult) ~= "table" then
		error(`Could not resolve gradient from input: {p3}`)
	end
	local StartColor = if ParseStructResult.startColor == nil then config.startColor else parseColor3(ParseStructResult.startColor)
	local EndColor = if ParseStructResult.endColor == nil then config.endColor else parseColor3(ParseStructResult.endColor)
	
	if StartColor == nil or EndColor == nil then
		error(`Could not resolve gradient colors from input: {p3}`)
	end
	if ParseStructResult.startOpacity ~= nil and typeof(ParseStructResult.startOpacity) ~= "number" then
		error(`Could not resolve gradient startOpacity from input: {p3}`)
	end
	if ParseStructResult.endOpacity ~= nil and typeof(ParseStructResult.endOpacity) ~= "number" then
		error(`Could not resolve gradient endOpacity from input: {p3}`)
	end
	if ParseStructResult.degree ~= nil and typeof(ParseStructResult.degree) ~= "number" then
		error(`Could not resolve gradient degree from input: {p3}`)
	end
	return {
		startColor = StartColor,
		endColor = EndColor,
		startOpacity = if ParseStructResult.startOpacity == nil then config.startOpacity else ParseStructResult.startOpacity,
		endOpacity = if ParseStructResult.endOpacity == nil then config.endOpacity else ParseStructResult.endOpacity,
		degree = if ParseStructResult.degree == nil then config.degree else ParseStructResult.degree
	}
end

return {
	parseUDim = Callback1,
	parseUDim2 = Callback,
	parseNumber = parseNumber,
	applyTokenScaling = function(p3, p4)
		return p3 * (p4 and p4.Config.UI.Scale or 1)
	end,
	parseUiScaledNumber = function(p3, p4)
		-- upvalues: parseNumber (copy)
		return parseNumber(p3, p4, true)
	end,
	parseUiScaledUDim = function(p3, p4)
		-- upvalues: Callback1 (copy)
		return Callback1(p3, p4, true)
	end,
	parseUiScaledUDim2 = function(p3, p4)
		-- upvalues: Callback (copy)
		return Callback(p3, p4, true)
	end,
	parseStruct = parseStruct,
	parseArrayOfStruct = function(List)
		-- upvalues: parseStruct (copy)
		if typeof(List) ~= "table" then
			return List
		end
		local t = {}
		
		for i, value in List do
			t[i] = parseStruct(value)
		end
		return t
	end,
	parsePymkItems = require(SduiCoreSystem.ClientBinding.PropBuilder.parsePymkItems),
	parseStringArray = function(p3)
		return if typeof(p3) == "table" then p3.items or p3 else nil
	end,
	parseToString = function(p3)
		return if p3 == nil then nil else tostring(p3)
	end,
	parseColor3 = parseColor3,
	parseGradient = if FFlagSduiParseProtoGradientFields then parseGradient else nil,
	parseColorPropLegacy = function(p3)
		return if typeof(p3) == "string" then Color3.fromHex(p3) else p3
	end,
	parseFocusNavActions = function(p3)
		-- upvalues: InputHandlersModule (copy)
		if typeof(p3) ~= "table" then
			return nil
		end
		local Keys = {}
		
		if typeof(p3.keys) == "table" then
			for i, key in p3.keys do
				if typeof(key) == "EnumItem" and typeof(i) == "string" then
					Keys[key] = i
				end
			end
		end
		local Events = {}
		
		if typeof(p3.events) == "table" then
			for i1, event in p3.events do
				if typeof(i1) == "string" and typeof(event) == "function" then
					Events[i1] = { handler = InputHandlersModule.onRelease(event) }
				end
			end
		end
		return { keys = Keys, events = Events }
	end
}