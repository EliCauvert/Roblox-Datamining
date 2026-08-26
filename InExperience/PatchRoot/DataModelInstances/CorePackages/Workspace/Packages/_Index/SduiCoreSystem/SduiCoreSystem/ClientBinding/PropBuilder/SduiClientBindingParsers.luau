local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.Signals)
local _ = require(parent.Foundation)
local _ = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local getSduiTokensStoreModule = require(sduiCoreSystem.ClientBinding.getSduiTokensStore)
local protoVariableMapperModule = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper)
local splitDottedPathModule = require(sduiCoreSystem.ClientBinding.splitDottedPath)
local fFlagSduiStringPropToString = require(parent.SharedFlags).FFlagSduiStringPropToString
local fFlagSduiPropParsersShouldHandleTokens = require(parent.SharedFlags).FFlagSduiPropParsersShouldHandleTokens
local fFlagLuaAppSduiColorPropMigration = require(parent.SharedFlags).FFlagLuaAppSduiColorPropMigration
local fFlagSduiFocusNavActionsStructured = require(parent.SharedFlags).FFlagSduiFocusNavActionsStructured
local fFlagSduiRenderPerf = require(parent.SharedFlags).FFlagSduiRenderPerf
local fFlagSduiUnwrapStructPropEnvelope = require(parent.SharedFlags).FFlagSduiUnwrapStructPropEnvelope

local function applyTokenScaling(p1, p2)
	return p1 * (if p2 then p2.Config.UI.Scale else 1)
end

local function resolveTokenValueToNumber(p1, p2)
	-- upvalues: fFlagSduiRenderPerf (ref), splitDottedPathModule (ref)
	local var1 = string.sub(p2, 1, 1) == "-"
	local var2 = if var1 then string.sub(p2, 2) else p2
	local var3 = p1
	local var4 = if fFlagSduiRenderPerf then splitDottedPathModule(var2) else string.split(var2, ".")
	local var22Count = #var4
	
	for i, v in var4 do
		if i ~= var22Count and typeof(var3[v]) ~= "table" then
			error(`Token path {var2} invalid`)
		end
		var3 = var3[v]
	end
	if typeof(var3) ~= "number" then
		error(`Token path {var2} did not resolve to a number: {p2}`)
	end
	return if var1 then var3 * -1 else var3
end

local function getTokenOrNumber(p3, p4, p5, p6)
	-- upvalues: getSduiTokensStoreModule (ref), resolveTokenValueToNumber (ref)
	local var5 = tonumber(p3)
	
	if var5 then
		if p5 then
			local tokens = getSduiTokensStoreModule().getTokens(p4, p6)
			
			return var5 * (if tokens then tokens.Config.UI.Scale else 1)
		end
		return var5
	elseif typeof(p3) ~= "string" then
		error("Expected number or token string, got " .. typeof(p3))
		
		return
	end
	local ok, status = pcall(function()
		-- upvalues: resolveTokenValueToNumber (copy), getSduiTokensStoreModule (copy), p4 (ref), p6 (ref), p3 (ref)
		return resolveTokenValueToNumber(getSduiTokensStoreModule().getTokens(p4, p6), p3)
	end)
	
	if ok and status then
		return status
	end
	error(if typeof(status) == "string" then status else nil)
end

local var5 = if fFlagSduiPropParsersShouldHandleTokens then function(p3, p4, p5)
	-- upvalues: getTokenOrNumber (ref)
	local ok, status = pcall(function()
		-- upvalues: p3 (ref), getTokenOrNumber (copy), p4 (ref), p5 (ref)
		local parts = string.split(p3, ",")
		
		if #parts == 4 then
			return UDim2.new(tonumber(parts[1]) or 0, getTokenOrNumber(parts[2], p4, p5, "parseUDim2"), tonumber(parts[3]) or 0, getTokenOrNumber(parts[4], p4, p5, "parseUDim2"))
		end
		error("Not enough components in string to parse UDim2")
	end)
	
	if ok and status then
		return status
	end
	error(if typeof(status) == "string" then status else nil)
end else function(p3, p4, p5)
	-- upvalues: getSduiTokensStoreModule (ref)
	local ok, status = pcall(function()
		-- upvalues: p3 (ref), p5 (ref), getSduiTokensStoreModule (copy), p4 (ref)
		local parts = string.split(p3, ",")
		
		if #parts ~= 4 then
			error("Not enough components in string to parse UDim2")
			
			return
		end
		local var6 = tonumber(parts[2]) or 0
		local var7 = tonumber(parts[4]) or 0
		
		if p5 then
			local parseUDim2 = getSduiTokensStoreModule().getTokens(p4, "parseUDim2")
			var6 *= if parseUDim2 then parseUDim2.Config.UI.Scale else 1
			var7 *= if parseUDim2 then parseUDim2.Config.UI.Scale else 1
		end
		return UDim2.new(tonumber(parts[1]) or 0, var6, tonumber(parts[3]) or 0, var7)
	end)
	
	if ok and status then
		return status
	end
	error(if typeof(status) == "string" then status else nil)
end
local var6 = if fFlagSduiPropParsersShouldHandleTokens then function(p3, p4, p5)
	-- upvalues: getTokenOrNumber (ref)
	local ok, status = pcall(function()
		-- upvalues: p3 (ref), getTokenOrNumber (copy), p4 (ref), p5 (ref)
		local parts = string.split(p3, ",")
		
		if #parts == 2 then
			return UDim.new(tonumber(parts[1]) or 0, getTokenOrNumber(parts[2], p4, p5, "parseUDim"))
		end
		error("Not enough components in string to parse UDim")
	end)
	
	if ok and status then
		return status
	end
	error(if typeof(status) == "string" then status else nil)
end else function(p3, p4, p5)
	-- upvalues: getSduiTokensStoreModule (ref)
	local ok, status = pcall(function()
		-- upvalues: p3 (ref), p5 (ref), getSduiTokensStoreModule (copy), p4 (ref)
		local parts = string.split(p3, ",")
		
		if #parts ~= 2 then
			error("Not enough components in string to parse UDim")
			
			return
		end
		local var7 = tonumber(parts[2]) or 0
		
		if p5 then
			local parseUDim2 = getSduiTokensStoreModule().getTokens(p4, "parseUDim2")
			var7 *= if parseUDim2 then parseUDim2.Config.UI.Scale else 1
		end
		return UDim.new(tonumber(parts[1]) or 0, var7)
	end)
	
	if ok and status then
		return status
	end
	error(if typeof(status) == "string" then status else nil)
end

local function parseNumber(p3, p4, p5)
	-- upvalues: getSduiTokensStoreModule (ref)
	local ok, status = pcall(function()
		-- upvalues: p3 (ref)
		return tonumber(p3)
	end)
	
	if not ok or not status then
		error(if typeof(status) == "string" then status else nil)
		
		return
	elseif p5 then
		local parseUDim2 = getSduiTokensStoreModule().getTokens(p4, "parseUDim2")
		
		return status * (if parseUDim2 then parseUDim2.Config.UI.Scale else 1)
	end
	return status
end

local function parseUiScaledNumber(p3, p4)
	-- upvalues: parseNumber (ref)
	return parseNumber(p3, p4, true)
end

local function parseUiScaledUDim(p3, p4)
	-- upvalues: var6 (ref)
	return var6(p3, p4, true)
end

local function parseUiScaledUDim2(p3, p4)
	-- upvalues: var5 (ref)
	return var5(p3, p4, true)
end

local unwrapStruct = nil

local function isStructEnvelope(p3)
	local fields = p3.fields
	
	if typeof(fields) ~= "table" then
		return false
	end
	for i in p3 do
		if i ~= "fields" then
			return false
		end
	end
	local var7 = false
	
	for i_1, v in fields do
		if typeof(v) == "table" then
			if typeof(v.kind) == "table" and typeof(v.kind.type) == "string" then
				var7 = true
			end
		end
		return false
	end
	return var7 or next(fields) == nil
end

local function parseStruct(p4)
	-- upvalues: fFlagSduiUnwrapStructPropEnvelope (ref), isStructEnvelope (ref), unwrapStruct (write), protoVariableMapperModule (ref), parseStruct (ref)
	if typeof(p4) ~= "table" then
		return p4
	elseif fFlagSduiUnwrapStructPropEnvelope and isStructEnvelope(p4) then
		return unwrapStruct(p4)
	end
	local mapPropName = protoVariableMapperModule.mapPropName
	local t = {}
	
	for i, v in p4 do
		t[if typeof(i) == "string" then mapPropName(i) else i] = if typeof(v) == "table" then parseStruct(v) else v
	end
	return t
end

local unwrapStructValue = nil

local function unwrapStructList(p5)
	-- upvalues: unwrapStructValue (write)
	local t = {}
	local var8 = if typeof(p5) == "table" then p5.values else nil
	
	if typeof(var8) ~= "table" then
		return t
	end
	for i, v in var8 do
		t[i] = unwrapStructValue(v)
	end
	return t
end

unwrapStructValue = function(p6)
	-- upvalues: parseStruct (ref), unwrapStructList (ref)
	if typeof(p6) ~= "table" then
		return p6
	end
	local kind = p6.kind
	
	return if not (typeof(kind) ~= "table" or typeof(kind.type) ~= "string") then if kind.type == "null_value" then nil elseif kind.type == "struct_value" then parseStruct(kind.value) elseif kind.type == "list_value" then unwrapStructList(kind.value) else kind.value else parseStruct(p6)
end

unwrapStruct = function(p6)
	-- upvalues: protoVariableMapperModule (ref), unwrapStructValue (write)
	local mapPropName = protoVariableMapperModule.mapPropName
	local t = {}
	
	for i, v in p6.fields do
		t[if typeof(i) == "string" then mapPropName(i) else i] = unwrapStructValue(v)
	end
	return t
end

return {
	parseUDim = var6,
	parseUDim2 = var5,
	parseNumber = parseNumber,
	applyTokenScaling = applyTokenScaling,
	parseUiScaledNumber = parseUiScaledNumber,
	parseUiScaledUDim = parseUiScaledUDim,
	parseUiScaledUDim2 = parseUiScaledUDim2,
	parseStruct = parseStruct,
	parseArrayOfStruct = function(p7)
		-- upvalues: parseStruct (ref)
		if typeof(p7) ~= "table" then
			return p7
		end
		local t = {}
		
		for i, v in p7 do
			t[i] = parseStruct(v)
		end
		return t
	end,
	parseStringArray = function(p8)
		return if typeof(p8) == "table" then p8.items or p8 else nil
	end,
	parseToString = if fFlagSduiStringPropToString then function(value)
		return if value == nil then nil else tostring(value)
	end else nil,
	parseColor3 = if fFlagLuaAppSduiColorPropMigration then function(p8)
		if typeof(p8) == "Color3" then
			return p8
		elseif typeof(p8) == "string" then
			local ok, status = pcall(function()
				-- upvalues: p8 (ref)
				return Color3.fromHex(p8)
			end)
			
			return if ok then status else nil
		elseif typeof(p8) == "table" and typeof(p8.Color3) == "Color3" then
			return p8.Color3
		end
		error(`Could not resolve Color3 from input: {p8}`)
	end else nil,
	parseColorPropLegacy = if fFlagLuaAppSduiColorPropMigration then function(p8)
		return if typeof(p8) == "string" then Color3.fromHex(p8) else p8
	end else nil,
	parseFocusNavActions = if fFlagSduiFocusNavActionsStructured then function(p8)
		-- upvalues: inputHandlersModule (ref)
		if typeof(p8) ~= "table" then
			return nil
		end
		local t = {}
		
		if typeof(p8.keys) == "table" then
			for i, v in p8.keys do
				if typeof(v) == "EnumItem" and typeof(i) == "string" then
					t[v] = i
				end
			end
		end
		local t_1 = {}
		
		if typeof(p8.events) == "table" then
			for i, v in p8.events do
				if typeof(i) == "string" and typeof(v) == "function" then
					t_1[i] = { handler = inputHandlersModule.onRelease(v) }
				end
			end
		end
		return { keys = t, events = t_1 }
	end else nil
}