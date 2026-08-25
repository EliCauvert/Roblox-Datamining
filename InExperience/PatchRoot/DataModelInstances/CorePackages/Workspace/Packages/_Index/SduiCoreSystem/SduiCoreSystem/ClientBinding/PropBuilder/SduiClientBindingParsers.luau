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

local function applyTokenScaling(p0, p1)
	return p0 * (if p1 then p1.Config.UI.Scale else 1)
end

local function resolveTokenValueToNumber(p2, p3)
	-- upvalues: fFlagSduiRenderPerf (ref), splitDottedPathModule (ref)
	local var19 = string.sub(p3, 1, 1) == "-"
	local var20 = if var19 then string.sub(p3, 2) else p3
	local var21 = p2
	local var22 = if fFlagSduiRenderPerf then splitDottedPathModule(var20) else string.split(var20, ".")
	local var22Count = #var22
	
	for i, v in var22 do
		if i ~= var22Count and typeof(var21[v]) ~= "table" then
			error(`Token path {var20} invalid`)
		end
		var21 = var21[v]
	end
	if typeof(var21) ~= "number" then
		error(`Token path {var20} did not resolve to a number: {p3}`)
	end
	return if var19 then var21 * -1 else var21
end

local function getTokenOrNumber(p4, p5, p6, p7)
	-- upvalues: getSduiTokensStoreModule (ref), resolveTokenValueToNumber (ref)
	local var24 = tonumber(p4)
	
	if var24 then
		if p6 then
			local tokens = getSduiTokensStoreModule().getTokens(p5, p7)
			
			return var24 * (if tokens then tokens.Config.UI.Scale else 1)
		end
		return var24
	elseif typeof(p4) ~= "string" then
		error("Expected number or token string, got " .. typeof(p4))
		
		return
	end
	local ok, status = pcall(function()
		-- upvalues: resolveTokenValueToNumber (copy), getSduiTokensStoreModule (copy), p5 (ref), p7 (ref), p4 (ref)
		return resolveTokenValueToNumber(getSduiTokensStoreModule().getTokens(p5, p7), p4)
	end)
	
	if ok and status then
		return status
	end
	error(if typeof(status) == "string" then status else nil)
end

local var8 = if fFlagSduiPropParsersShouldHandleTokens then function(p11, p12, p13)
	-- upvalues: getTokenOrNumber (ref)
	local ok, status = pcall(function()
		-- upvalues: p11 (ref), getTokenOrNumber (copy), p12 (ref), p13 (ref)
		local parts = string.split(p11, ",")
		
		if #parts == 4 then
			return UDim2.new(tonumber(parts[1]) or 0, getTokenOrNumber(parts[2], p12, p13, "parseUDim2"), tonumber(parts[3]) or 0, getTokenOrNumber(parts[4], p12, p13, "parseUDim2"))
		end
		error("Not enough components in string to parse UDim2")
	end)
	
	if ok and status then
		return status
	end
	error(if typeof(status) == "string" then status else nil)
end else function(p8, p9, p10)
	-- upvalues: getSduiTokensStoreModule (ref)
	local ok, status = pcall(function()
		-- upvalues: p8 (ref), p10 (ref), getSduiTokensStoreModule (copy), p9 (ref)
		local parts = string.split(p8, ",")
		
		if #parts ~= 4 then
			error("Not enough components in string to parse UDim2")
			
			return
		end
		local var27 = tonumber(parts[2]) or 0
		local var28 = tonumber(parts[4]) or 0
		
		if p10 then
			local parseUDim2 = getSduiTokensStoreModule().getTokens(p9, "parseUDim2")
			var27 *= if parseUDim2 then parseUDim2.Config.UI.Scale else 1
			var28 *= if parseUDim2 then parseUDim2.Config.UI.Scale else 1
		end
		return UDim2.new(tonumber(parts[1]) or 0, var27, tonumber(parts[3]) or 0, var28)
	end)
	
	if ok and status then
		return status
	end
	error(if typeof(status) == "string" then status else nil)
end
local var9 = if fFlagSduiPropParsersShouldHandleTokens then function(p17, p18, p19)
	-- upvalues: getTokenOrNumber (ref)
	local ok, status = pcall(function()
		-- upvalues: p17 (ref), getTokenOrNumber (copy), p18 (ref), p19 (ref)
		local parts = string.split(p17, ",")
		
		if #parts == 2 then
			return UDim.new(tonumber(parts[1]) or 0, getTokenOrNumber(parts[2], p18, p19, "parseUDim"))
		end
		error("Not enough components in string to parse UDim")
	end)
	
	if ok and status then
		return status
	end
	error(if typeof(status) == "string" then status else nil)
end else function(p14, p15, p16)
	-- upvalues: getSduiTokensStoreModule (ref)
	local ok, status = pcall(function()
		-- upvalues: p14 (ref), p16 (ref), getSduiTokensStoreModule (copy), p15 (ref)
		local parts = string.split(p14, ",")
		
		if #parts ~= 2 then
			error("Not enough components in string to parse UDim")
			
			return
		end
		local var32 = tonumber(parts[2]) or 0
		
		if p16 then
			local parseUDim2 = getSduiTokensStoreModule().getTokens(p15, "parseUDim2")
			var32 *= if parseUDim2 then parseUDim2.Config.UI.Scale else 1
		end
		return UDim.new(tonumber(parts[1]) or 0, var32)
	end)
	
	if ok and status then
		return status
	end
	error(if typeof(status) == "string" then status else nil)
end

local function parseNumber(p20, p21, p22)
	-- upvalues: getSduiTokensStoreModule (ref)
	local ok, status = pcall(function()
		-- upvalues: p20 (ref)
		return tonumber(p20)
	end)
	
	if not ok or not status then
		error(if typeof(status) == "string" then status else nil)
		
		return
	elseif p22 then
		local parseUDim2 = getSduiTokensStoreModule().getTokens(p21, "parseUDim2")
		
		return status * (if parseUDim2 then parseUDim2.Config.UI.Scale else 1)
	end
	return status
end

local function parseUiScaledNumber(p23, p24)
	-- upvalues: parseNumber (ref)
	return parseNumber(p23, p24, true)
end

local function parseUiScaledUDim(p25, p26)
	-- upvalues: var9 (ref)
	return var9(p25, p26, true)
end

local function parseUiScaledUDim2(p27, p28)
	-- upvalues: var8 (ref)
	return var8(p27, p28, true)
end

local unwrapStruct = nil

local function isStructEnvelope(p29)
	local fields = p29.fields
	
	if typeof(fields) ~= "table" then
		return false
	end
	for i in p29 do
		if i ~= "fields" then
			return false
		end
	end
	local var36 = false
	
	for i_1, v in fields do
		if typeof(v) == "table" then
			if typeof(v.kind) == "table" and typeof(v.kind.type) == "string" then
				var36 = true
			end
		end
		return false
	end
	return var36 or next(fields) == nil
end

local function parseStruct(p30)
	-- upvalues: fFlagSduiUnwrapStructPropEnvelope (ref), isStructEnvelope (ref), unwrapStruct (write), protoVariableMapperModule (ref), parseStruct (ref)
	if typeof(p30) ~= "table" then
		return p30
	elseif fFlagSduiUnwrapStructPropEnvelope and isStructEnvelope(p30) then
		return unwrapStruct(p30)
	end
	local mapPropName = protoVariableMapperModule.mapPropName
	local t = {}
	
	for i, v in p30 do
		t[if typeof(i) == "string" then mapPropName(i) else i] = if typeof(v) == "table" then parseStruct(v) else v
	end
	return t
end

local unwrapStructValue = nil

local function unwrapStructList(p31)
	-- upvalues: unwrapStructValue (write)
	local t = {}
	local var39 = if typeof(p31) == "table" then p31.values else nil
	
	if typeof(var39) ~= "table" then
		return t
	end
	for i, v in var39 do
		t[i] = unwrapStructValue(v)
	end
	return t
end

unwrapStructValue = function(p32)
	-- upvalues: parseStruct (ref), unwrapStructList (ref)
	if typeof(p32) ~= "table" then
		return p32
	end
	local kind = p32.kind
	
	return if not (typeof(kind) ~= "table" or typeof(kind.type) ~= "string") then if kind.type == "null_value" then nil elseif kind.type == "struct_value" then parseStruct(kind.value) elseif kind.type == "list_value" then unwrapStructList(kind.value) else kind.value else parseStruct(p32)
end

unwrapStruct = function(p33)
	-- upvalues: protoVariableMapperModule (ref), unwrapStructValue (write)
	local mapPropName = protoVariableMapperModule.mapPropName
	local t = {}
	
	for i, v in p33.fields do
		t[if typeof(i) == "string" then mapPropName(i) else i] = unwrapStructValue(v)
	end
	return t
end

return {
	parseUDim = var9,
	parseUDim2 = var8,
	parseNumber = parseNumber,
	applyTokenScaling = applyTokenScaling,
	parseUiScaledNumber = parseUiScaledNumber,
	parseUiScaledUDim = parseUiScaledUDim,
	parseUiScaledUDim2 = parseUiScaledUDim2,
	parseStruct = parseStruct,
	parseArrayOfStruct = function(p34)
		-- upvalues: parseStruct (ref)
		if typeof(p34) ~= "table" then
			return p34
		end
		local t = {}
		
		for i, v in p34 do
			t[i] = parseStruct(v)
		end
		return t
	end,
	parseStringArray = function(p35)
		return if typeof(p35) == "table" then p35.items or p35 else nil
	end,
	parseToString = if fFlagSduiStringPropToString then function(value)
		return if value == nil then nil else tostring(value)
	end else nil,
	parseColor3 = if fFlagLuaAppSduiColorPropMigration then function(p36)
		if typeof(p36) == "Color3" then
			return p36
		elseif typeof(p36) == "string" then
			local ok, status = pcall(function()
				-- upvalues: p36 (ref)
				return Color3.fromHex(p36)
			end)
			
			return if ok then status else nil
		elseif typeof(p36) == "table" and typeof(p36.Color3) == "Color3" then
			return p36.Color3
		end
		error(`Could not resolve Color3 from input: {p36}`)
	end else nil,
	parseColorPropLegacy = if fFlagLuaAppSduiColorPropMigration then function(p37)
		return if typeof(p37) == "string" then Color3.fromHex(p37) else p37
	end else nil,
	parseFocusNavActions = if fFlagSduiFocusNavActionsStructured then function(p38)
		-- upvalues: inputHandlersModule (ref)
		if typeof(p38) ~= "table" then
			return nil
		end
		local t = {}
		
		if typeof(p38.keys) == "table" then
			for i, v in p38.keys do
				if typeof(v) == "EnumItem" and typeof(i) == "string" then
					t[v] = i
				end
			end
		end
		local t_1 = {}
		
		if typeof(p38.events) == "table" then
			for i, v in p38.events do
				if typeof(i) == "string" and typeof(v) == "function" then
					t_1[i] = { handler = inputHandlersModule.onRelease(v) }
				end
			end
		end
		return { keys = t, events = t_1 }
	end else nil
}