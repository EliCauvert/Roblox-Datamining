local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.Signals)
local _ = require(Parent.Foundation)
local _ = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local GetSduiTokensStoreModule = require(SduiCoreSystem.ClientBinding.getSduiTokensStore)
local ProtoVariableMapperModule = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local SplitDottedPathModule = require(SduiCoreSystem.ClientBinding.splitDottedPath)
local FFlagSduiStringPropToString = require(Parent.SharedFlags).FFlagSduiStringPropToString
local FFlagSduiPropParsersShouldHandleTokens = require(Parent.SharedFlags).FFlagSduiPropParsersShouldHandleTokens
local FFlagSduiFocusNavActionsStructured = require(Parent.SharedFlags).FFlagSduiFocusNavActionsStructured
local FFlagSduiRenderPerf = require(Parent.SharedFlags).FFlagSduiRenderPerf

local function resolveTokenValueToNumber(Tokens, Text: string)
	-- upvalues: FFlagSduiRenderPerf (copy), SplitDottedPathModule (copy)
	local IsSegmentMatch = string.sub(Text, 1, 1) == "-"
	local Segment: string = if IsSegmentMatch then string.sub(Text, 2) else Text
	local Tokens1 = Tokens
	local SplitDottedPathModuleResult = if FFlagSduiRenderPerf then SplitDottedPathModule(Segment) else string.split(Segment, ".")
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

local function parseStruct(List)
	-- upvalues: ProtoVariableMapperModule (copy), parseStruct (copy)
	if typeof(List) ~= "table" then
		return List
	end
	local MapPropNameFunction = ProtoVariableMapperModule.mapPropName
	local t = {}
	
	for i, value in List do
		t[if typeof(i) == "string" then MapPropNameFunction(i) else i] = if typeof(value) == "table" then parseStruct(value) else value
	end
	return t
end

local function parseToString(p1)
	return if p1 == nil then nil else tostring(p1)
end

local function parseFocusNavActions(p1)
	-- upvalues: InputHandlersModule (copy)
	if typeof(p1) ~= "table" then
		return nil
	end
	local Keys = {}
	
	if typeof(p1.keys) == "table" then
		for i, key in p1.keys do
			if typeof(key) == "EnumItem" and typeof(i) == "string" then
				Keys[key] = i
			end
		end
	end
	local Events = {}
	
	if typeof(p1.events) == "table" then
		for i1, event in p1.events do
			if typeof(i1) == "string" and typeof(event) == "function" then
				Events[i1] = { handler = InputHandlersModule.onRelease(event) }
			end
		end
	end
	return { keys = Keys, events = Events }
end

return {
	parseUDim = Callback1,
	parseUDim2 = Callback,
	parseNumber = parseNumber,
	applyTokenScaling = function(p2, p3)
		return p2 * (p3 and p3.Config.UI.Scale or 1)
	end,
	parseUiScaledNumber = function(p2, p3)
		-- upvalues: parseNumber (copy)
		return parseNumber(p2, p3, true)
	end,
	parseUiScaledUDim = function(p2, p3)
		-- upvalues: Callback1 (copy)
		return Callback1(p2, p3, true)
	end,
	parseUiScaledUDim2 = function(p2, p3)
		-- upvalues: Callback (copy)
		return Callback(p2, p3, true)
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
	parseStringArray = function(p2)
		return if typeof(p2) == "table" then p2.items or p2 else nil
	end,
	parseToString = if FFlagSduiStringPropToString then parseToString else nil,
	parseFocusNavActions = if FFlagSduiFocusNavActionsStructured then parseFocusNavActions else nil
}