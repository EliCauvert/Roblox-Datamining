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

local function applyTokenScaling(p0, p1) --[[ line: 17 ]]
	return p0 * (if p1 then p1.Config.UI.Scale else 1)
end

local function resolveTokenValueToNumber(p2, p3) --[[ line: 22 ]]
	-- upvalues: fFlagSduiRenderPerf (ref), splitDottedPathModule (ref)
	local var12 = string.sub(p3, 1, 1) == "-"
	local var13 = if var12 then string.sub(p3, 2) else p3
	local var14 = p2
	local var15 = if fFlagSduiRenderPerf then splitDottedPathModule(var13) else string.split(var13, ".")
	local var15Count = #var15
	
	for i, v in var15 do
		if i ~= var15Count and typeof(var14[v]) ~= "table" then
			error(`Token path {var13} invalid`)
		end
		var14 = var14[v]
	end
	if typeof(var14) ~= "number" then
		error(`Token path {var13} did not resolve to a number: {p3}`)
	end
	return if var12 then var14 * -1 else var14
end

local function getTokenOrNumber(p4, p5, p6, p7) --[[ line: 48 ]]
	-- upvalues: getSduiTokensStoreModule (ref), resolveTokenValueToNumber (ref)
	local var17 = tonumber(p4)
	
	if var17 then
		if p6 then
			local tokens = getSduiTokensStoreModule().getTokens(p5, p7)
			
			return var17 * (if tokens then tokens.Config.UI.Scale else 1)
		end
		return var17
	elseif typeof(p4) ~= "string" then
		error("Expected number or token string, got " .. typeof(p4))
		
		return
	end
	local ok, status = pcall(function() --[[ line: 63 ]]
		-- upvalues: resolveTokenValueToNumber (copy), getSduiTokensStoreModule (copy), p5 (ref), p7 (ref), p4 (ref)
		return resolveTokenValueToNumber(getSduiTokensStoreModule().getTokens(p5, p7), p4)
	end)
	
	if ok and status then
		return status
	end
	error(if typeof(status) == "string" then status else nil)
end

local var8 = if fFlagSduiPropParsersShouldHandleTokens then function(p11, p12, p13) --[[ line: 80 ]]
	-- upvalues: getTokenOrNumber (ref)
	local ok, status = pcall(function() --[[ line: 81 ]]
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
end else function(p8, p9, p10) --[[ line: 98 ]]
	-- upvalues: getSduiTokensStoreModule (ref)
	local ok, status = pcall(function() --[[ line: 99 ]]
		-- upvalues: p8 (ref), p10 (ref), getSduiTokensStoreModule (copy), p9 (ref)
		local parts = string.split(p8, ",")
		
		if #parts ~= 4 then
			error("Not enough components in string to parse UDim2")
			
			return
		end
		local var20 = tonumber(parts[2]) or 0
		local var21 = tonumber(parts[4]) or 0
		
		if p10 then
			local parseUDim2 = getSduiTokensStoreModule().getTokens(p9, "parseUDim2")
			var20 *= if parseUDim2 then parseUDim2.Config.UI.Scale else 1
			var21 *= if parseUDim2 then parseUDim2.Config.UI.Scale else 1
		end
		return UDim2.new(tonumber(parts[1]) or 0, var20, tonumber(parts[3]) or 0, var21)
	end)
	
	if ok and status then
		return status
	end
	error(if typeof(status) == "string" then status else nil)
end
local var9 = if fFlagSduiPropParsersShouldHandleTokens then function(p17, p18, p19) --[[ line: 126 ]]
	-- upvalues: getTokenOrNumber (ref)
	local ok, status = pcall(function() --[[ line: 127 ]]
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
end else function(p14, p15, p16) --[[ line: 143 ]]
	-- upvalues: getSduiTokensStoreModule (ref)
	local ok, status = pcall(function() --[[ line: 144 ]]
		-- upvalues: p14 (ref), p16 (ref), getSduiTokensStoreModule (copy), p15 (ref)
		local parts = string.split(p14, ",")
		
		if #parts ~= 2 then
			error("Not enough components in string to parse UDim")
			
			return
		end
		local var25 = tonumber(parts[2]) or 0
		
		if p16 then
			local parseUDim2 = getSduiTokensStoreModule().getTokens(p15, "parseUDim2")
			var25 *= if parseUDim2 then parseUDim2.Config.UI.Scale else 1
		end
		return UDim.new(tonumber(parts[1]) or 0, var25)
	end)
	
	if ok and status then
		return status
	end
	error(if typeof(status) == "string" then status else nil)
end

local function parseNumber(p20, p21, p22) --[[ line: 169 ]]
	-- upvalues: getSduiTokensStoreModule (ref)
	local ok, status = pcall(function() --[[ line: 174 ]]
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

local function parseStruct(p23) --[[ line: 202 ]]
	-- upvalues: protoVariableMapperModule (ref), parseStruct (ref)
	if typeof(p23) ~= "table" then
		return p23
	end
	local mapPropName = protoVariableMapperModule.mapPropName
	local t = {}
	
	for i, v in p23 do
		t[if typeof(i) == "string" then mapPropName(i) else i] = if typeof(v) == "table" then parseStruct(v) else v
	end
	return t
end

return {
	parseUDim = var9,
	parseUDim2 = var8,
	parseNumber = parseNumber,
	applyTokenScaling = applyTokenScaling,
	parseUiScaledNumber = function(p24, p25) --[[ line: 188 ]]
		-- upvalues: parseNumber (ref)
		return parseNumber(p24, p25, true)
	end,
	parseUiScaledUDim = function(p26, p27) --[[ line: 192 ]]
		-- upvalues: var9 (ref)
		return var9(p26, p27, true)
	end,
	parseUiScaledUDim2 = function(p28, p29) --[[ line: 196 ]]
		-- upvalues: var8 (ref)
		return var8(p28, p29, true)
	end,
	parseStruct = parseStruct,
	parseArrayOfStruct = function(p30) --[[ line: 217 ]]
		-- upvalues: parseStruct (ref)
		if typeof(p30) ~= "table" then
			return p30
		end
		local t = {}
		
		for i, v in p30 do
			t[i] = parseStruct(v)
		end
		return t
	end,
	parseStringArray = function(p31) --[[ line: 239 ]]
		return if typeof(p31) == "table" then p31.items or p31 else nil
	end,
	parseToString = if fFlagSduiStringPropToString then function(value) --[[ line: 228 | named "parseToString" ]]
		return if value == nil then nil else tostring(value)
	end else nil,
	parseColor3 = if fFlagLuaAppSduiColorPropMigration then function(p32) --[[ line: 249 | named "parseColor3" ]]
		if typeof(p32) == "Color3" then
			return p32
		elseif typeof(p32) == "string" then
			local ok, status = pcall(function() --[[ line: 254 ]]
				-- upvalues: p32 (ref)
				return Color3.fromHex(p32)
			end)
			
			return if ok then status else nil
		elseif typeof(p32) == "table" and typeof(p32.Color3) == "Color3" then
			return p32.Color3
		end
		error(`Could not resolve Color3 from input: {p32}`)
	end else nil,
	parseColorPropLegacy = if fFlagLuaAppSduiColorPropMigration then function(p33) --[[ line: 271 | named "parseColorPropLegacy" ]]
		return if typeof(p33) == "string" then Color3.fromHex(p33) else p33
	end else nil,
	parseFocusNavActions = if fFlagSduiFocusNavActionsStructured then function(p34) --[[ line: 281 | named "parseFocusNavActions" ]]
		-- upvalues: inputHandlersModule (ref)
		if typeof(p34) ~= "table" then
			return nil
		end
		local t = {}
		
		if typeof(p34.keys) == "table" then
			for i, v in p34.keys do
				if typeof(v) == "EnumItem" and typeof(i) == "string" then
					t[v] = i
				end
			end
		end
		local t_1 = {}
		
		if typeof(p34.events) == "table" then
			for i, v in p34.events do
				if typeof(i) == "string" and typeof(v) == "function" then
					t_1[i] = { handler = inputHandlersModule.onRelease(v) }
				end
			end
		end
		return { keys = t, events = t_1 }
	end else nil
}