local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local images = require(parent.FoundationImages).Images
local getImageData = require(parent.RobloxAppAssets).GetImageData
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local inputHandlersModule = require(parent.InputHandlers)
local executeActionModule = require(sduiCoreSystem.executeAction)
local _ = require(sduiCoreSystem.SduiActionType)
local sduiBuilderModule = require(sduiCoreSystem.SduiBuilder)
local sduiBuilderProcessingPhase = require(sduiCoreSystem.SduiBuilderTypes).SduiBuilderProcessingPhase
local _ = require(sduiCoreSystem.SduiComponentType)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local sduiResponsiveHelpersModule = require(sduiCoreSystem.SduiResponsiveHelpers)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiErrorType = sduiErrorsModule.SduiErrorType
local getSduiComponentWrapperModule = require(sduiCoreSystem.getSduiComponentWrapper)
local getSduiActionHandlerRegistryModule = require(sduiCoreSystem.getSduiActionHandlerRegistry)
local getSduiTokensStoreModule = require(sduiCoreSystem.ClientBinding.getSduiTokensStore)
local fFlagSduiActionTelemetryHandler = require(parent.SharedFlags).FFlagSduiActionTelemetryHandler
local _ = require(sduiCoreSystem.SduiContentTypes)
local sduiParseHelpersModule = require(sduiCoreSystem.SduiParseHelpers)
local _ = require(sduiCoreSystem.SduiFocusNavigationTypes)

local function _(p0) --[[ line: 45 | named "withErrorHandling" ]]
	-- upvalues: cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
	return function(p1, p2, p3, p4) --[[ line: 46 ]]
		-- upvalues: p0 (ref), cryoModule (copy), sduiParseHelpersModule (copy), sduiErrorType (copy)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: p0 (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref)
			return p0(p1, p2, p3, p4)
		end)
		
		if ok then
			return status
		end
		p2.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p1) }), p2.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end
end

local function parseFoundationTokenHelper(p5, p6, p7, p8) --[[ line: 81 ]]
	-- upvalues: getSduiTokensStoreModule (ref)
	local var48 = typeof(p5)
	
	if var48 == p6 then
		return p5
	elseif var48 ~= "string" then
		error({
			parserName = p7,
			message = `Invalid inputType. Expect string. {var48}`
		})
	end
	local tokens = getSduiTokensStoreModule().getTokens(false, p8.appPage)
	
	for i, v in p5:split(".") do
		if typeof(tokens) == "table" then
			tokens = tokens[v]
		else
			error({
				parserName = p7,
				message = `Invalid path for token for input {p5}`
			})
		end
		if tokens == nil then
			error({ parserName = p7, message = `Nil tokens for input {p5}` })
		end
	end
	if typeof(tokens) ~= p6 then
		error({
			parserName = p7,
			message = `Unexpected token type for {p5}. {typeof(tokens)} ~= {p6}`
		})
	end
	return tokens
end

local function parseNumberToken(p9, p10, _, _) --[[ line: 122 ]]
	-- upvalues: parseFoundationTokenHelper (ref)
	return parseFoundationTokenHelper(p9, "number", "parseNumberToken", p10)
end

local function parseTypographyToken(value, p11, _, _) --[[ line: 131 ]]
	-- upvalues: parseFoundationTokenHelper (ref)
	return parseFoundationTokenHelper(value, "table", "parseTypographyToken", p11)
end

local function parseFontFromTypographyToken(p12, p13, _, _) --[[ line: 140 ]]
	-- upvalues: parseFoundationTokenHelper (ref)
	return parseFoundationTokenHelper(p12, "EnumItem", "parseFontFromTypographyToken", p13)
end

local function parseColorToken(p14, p15, _, _) --[[ line: 149 ]]
	-- upvalues: parseFoundationTokenHelper (ref)
	return parseFoundationTokenHelper(p14, "table", "parseColorToken", p15)
end

local function parseLuaTableEnumHelper(p16, p17, p18, p19) --[[ line: 158 ]]
	local var50 = typeof(p16)
	
	if var50 == p17 and p19[p16] then
		return p16
	elseif var50 ~= "string" then
		error({
			parserName = "parseLuaTableEnumHelper",
			message = `Invalid input type to parser: {var50}. Expected string.`
		})
	end
	local var51 = p18[p16]
	
	if var51 ~= nil then
		return var51
	end
	local var52 = ""
	
	for i in p19 do
		var52 ..= i .. ", "
	end
	error({
		parserName = "parseLuaTableEnumHelper",
		message = `Failed to parse lua table enum. input: {p16} validValues: {var52}`
	})
end

local t = {}

local _ = function(p20, p21) --[[ line: 196 | named "makeLuaTableEnumParser" ]]
	-- upvalues: parseLuaTableEnumHelper (ref)
	local t = {}
	
	for i, v in p20 do
		t[v] = true
	end
	return function(p22, _, _, _) --[[ line: 201 ]]
		-- upvalues: parseLuaTableEnumHelper (copy), p21 (ref), p20 (ref), t (ref)
		return parseLuaTableEnumHelper(p22, p21, p20, t)
	end
end

local function getLuaTableEnumParser(p23, p24) --[[ line: 211 ]]
	-- upvalues: t (ref), parseLuaTableEnumHelper (ref)
	if t[p23] == nil then
		local var54 = t
		local t_1 = {}
		
		for i, v in p23 do
			t_1[v] = true
		end
		var54[p23] = function(p25, _, _, _) --[[ line: 201 ]]
			-- upvalues: parseLuaTableEnumHelper (copy), p24 (ref), p23 (ref), t_1 (ref)
			return parseLuaTableEnumHelper(p25, p24, p23, t_1)
		end
	end
	return t[p23]
end

local function parseEngineEnumHelper(p26, p27) --[[ line: 218 ]]
	if typeof(p26) == "EnumItem" then
		return p26
	elseif typeof(p26) ~= "string" then
		error({
			parserName = "parseEngineEnumHelper",
			message = `Invalid input type Engine Enum value. Expect string. received {p26}`
		})
	end
	local ok, status = pcall(function() --[[ line: 229 ]]
		-- upvalues: p27 (ref), p26 (ref)
		return p27[p26]
	end)
	
	if ok then
		return status
	end
	error({ parserName = "parseEngineEnumHelper", message = status })
end

local t_1 = {}

local _ = function(p28) --[[ line: 245 | named "makeEngineEnumParser" ]]
	-- upvalues: parseEngineEnumHelper (ref)
	return function(p29, _, _, _) --[[ line: 246 ]]
		-- upvalues: parseEngineEnumHelper (copy), p28 (ref)
		return parseEngineEnumHelper(p29, p28)
	end
end

local function getEngineEnumParser(p30) --[[ line: 256 ]]
	-- upvalues: t_1 (ref), parseEngineEnumHelper (ref)
	if t_1[p30] == nil then
		t_1[p30] = function(p31, _, _, _) --[[ line: 246 ]]
			-- upvalues: parseEngineEnumHelper (copy), p30 (ref)
			return parseEngineEnumHelper(p31, p30)
		end
	end
	return t_1[p30]
end

local function parseUDim2(p32, _, _, _) --[[ line: 266 ]]
	local var56 = typeof(p32)
	
	if var56 == "UDim2" then
		return p32
	end
	local ok, status = pcall(function() --[[ line: 277 ]]
		-- upvalues: var56 (ref), p32 (ref)
		if var56 == "string" then
			local parts = string.split(p32, ",")
			
			if #parts == 4 then
				return UDim2.new(tonumber(parts[1]) or 0, tonumber(parts[2]) or 0, tonumber(parts[3]) or 0, tonumber(parts[4]) or 0)
			end
			error("Not enough components in string to parse UDim2")
			
			return
		elseif var56 ~= "table" then
			error(`Invalid input type for parseUDim2: {var56}`)
			
			return
		elseif #p32 == 4 then
			return UDim2.new(tonumber(p32[1]) or 0, tonumber(p32[2]) or 0, tonumber(p32[3]) or 0, tonumber(p32[4]) or 0)
		end
		error("Not enough components in table to parse UDim2")
	end)
	
	if ok and status then
		return status
	end
	error({
		parserName = "parseUDim2",
		message = if typeof(status) == "string" then status else nil
	})
end

local function parseUDim(p33, _, _, _) --[[ line: 316 ]]
	local var58 = typeof(p33)
	
	if var58 == "UDim" then
		return p33
	end
	local ok, status = pcall(function() --[[ line: 327 ]]
		-- upvalues: var58 (ref), p33 (ref)
		if var58 == "string" then
			local parts = string.split(p33, ",")
			
			if #parts == 2 then
				return UDim.new(tonumber(parts[1]) or 0, tonumber(parts[2]) or 0)
			end
			error("Not enough components in string to parse UDim")
			
			return
		elseif var58 == "table" then
			if #p33 == 2 then
				return UDim.new(tonumber(p33[1]) or 0, tonumber(p33[2]) or 0)
			end
			error("Not enough components in table to parse UDim")
			
			return
		elseif var58 == "number" then
			return UDim.new(0, p33)
		end
		error(`Invalid input type for parseUDim: {var58}`)
	end)
	
	if ok and status then
		return status
	end
	error({
		parserName = "parseUDim",
		message = if typeof(status) == "string" then status else nil
	})
end

local function parseColor3(p34, p35, p36, p37) --[[ line: 358 ]]
	-- upvalues: parseFoundationTokenHelper (ref)
	local var60 = typeof(p34)
	
	if var60 == "Color3" then
		return p34
	end
	local ok, status = pcall(function() --[[ line: 369 ]]
		-- upvalues: var60 (ref), p34 (ref), p35 (ref), p36 (ref), p37 (ref), parseFoundationTokenHelper (copy)
		if var60 == "string" then
			local ok, status = pcall(function() --[[ line: 372 ]]
				-- upvalues: p34 (copy)
				return Color3.fromHex(p34)
			end)
			
			if ok and status then
				return status
			end
			local _ = nil
			local ok_1, status_1 = pcall(function() --[[ line: 382 ]]
				-- upvalues: p34 (copy), p35 (copy), p36 (copy), p37 (copy), parseFoundationTokenHelper (copy)
				return parseFoundationTokenHelper(p34, "table", "parseColorToken", p35)
			end)
			local var61 = status_1
			
			if ok_1 and typeof(var61) == "table" and var61.Color3 ~= nil then
				return var61.Color3
			end
			error(`Invalid input for Color3: {p34}`)
			
			return
		elseif var60 == "table" then
			return Color3.fromRGB(p34.r, p34.g, p34.b)
		end
		error(`Invalid input type for parseColor3: {var60}`)
	end)
	
	if ok and status then
		return status
	end
	error({
		parserName = "parseColor3",
		message = if typeof(status) == "string" then status elseif typeof(status) == "table" then status.message else nil
	})
end

local color3 = Color3.new(0, 0, 0)
local t_2 = {
	startOpacity = 0,
	endOpacity = 1,
	degree = 270,
	startColor = color3,
	endColor = color3
}

local function isValidGradient(p38) --[[ line: 420 ]]
	return typeof(p38) == "table" and (typeof(p38.startColor) == "Color3" and (typeof(p38.endColor) == "Color3" and (typeof(p38.startOpacity) == "number" and (typeof(p38.endOpacity) == "number" and typeof(p38.degree) == "number"))))
end

local function parseGradient(p39, p40, p41, p42) --[[ line: 444 ]]
	-- upvalues: isValidGradient (ref), parseColor3 (ref), t_2 (ref)
	local var62 = typeof(p39)
	
	if var62 == "table" then
		if isValidGradient(p39) then
			return p39
		end
	else
		error({
			parserName = "parseGradient",
			message = `invalid input type for parseGradient: {var62}`
		})
	end
	local var63
	local _ = nil
	local _ = nil
	
	if p39.startColor then
		local ok, status = pcall(function() --[[ line: 464 ]]
			-- upvalues: parseColor3 (copy), p39 (ref), p40 (ref), p41 (ref), p42 (ref)
			return parseColor3(p39.startColor, p40, p41, p42)
		end)
		var63 = status
		
		if not ok then
			error({
				parserName = "parseGradient",
				message = if typeof(var63) == "string" then var63 else "failed to parse startColor field"
			})
		end
	else
		var63 = t_2.startColor
	end
	local var64
	local _ = nil
	
	if p39.endColor then
		local ok, status = pcall(function() --[[ line: 479 ]]
			-- upvalues: parseColor3 (copy), p39 (ref), p40 (ref), p41 (ref), p42 (ref)
			return parseColor3(p39.endColor, p40, p41, p42)
		end)
		var64 = status
		
		if not ok then
			error({
				parserName = "parseGradient",
				message = if typeof(var64) == "string" then var64 else "failed to parse endColor field"
			})
		end
	else
		var64 = t_2.endColor
	end
	local startOpacity = nil
	
	if typeof(p39.startOpacity) == "number" then
		startOpacity = p39.startOpacity
	elseif p39.startOpacity ~= nil then
		error({
			parserName = "parseGradient",
			message = `invalid input type for startOpacity: {typeof(p39.startOpacity)}`
		})
	end
	local endOpacity = nil
	
	if typeof(p39.endOpacity) == "number" then
		endOpacity = p39.endOpacity
	elseif p39.endOpacity ~= nil then
		error({
			parserName = "parseGradient",
			message = `invalid input type for endOpacity: {typeof(p39.endOpacity)}`
		})
	end
	local degree = nil
	
	if typeof(p39.degree) == "number" then
		degree = p39.degree
	elseif p39.degree ~= nil then
		error({
			parserName = "parseGradient",
			message = `invalid input type for degree: {typeof(p39.degree)}`
		})
	end
	return {
		startColor = var63,
		endColor = var64,
		startOpacity = startOpacity or t_2.startOpacity,
		endOpacity = endOpacity or t_2.endOpacity,
		degree = degree or t_2.degree
	}
end

local function isValidImageSet(value) --[[ line: 531 ]]
	return typeof(value) == "table" and typeof(value.ImageRectOffset) == "Vector2" and (typeof(value.Image) == "string" and typeof(value.ImageRectSize) == "Vector2")
end

local t_3 = {
	truncate_arrows = true,
	squircles = true,
	gradient = true,
	component_assets = true,
	chat_bubble = true,
	icons = true
}

local _ = function(p43) --[[ line: 553 | named "isValidIconString" ]]
	-- upvalues: t_3 (ref)
	local var65 = p43:split("/")
	
	return var65 and #var65 > 1 and t_3[var65[1]]
end

local function parseIcon(p44, _, _, _) --[[ line: 566 ]]
	-- upvalues: getImageData (ref), images (ref)
	local isNotVector2
	local _ = nil
	local var66 = nil
	
	if typeof(p44) == "table" and typeof(p44.ImageRectOffset) == "Vector2" and typeof(p44.Image) == "string" then
		isNotVector2 = typeof(p44.ImageRectSize) ~= "Vector2"
	end
	if isNotVector2 then
		return p44
	elseif typeof(p44) == "string" then
		local ok, status = pcall(function() --[[ line: 576 ]]
			-- upvalues: getImageData (copy), p44 (ref), images (copy)
			return getImageData(p44) or images[p44]
		end)
		var66 = status
		
		if not ok or not var66 then
			error({
				parserName = "parseIcon",
				message = `No icon found for {p44}`
			})
		end
	end
	if not var66 then
		error({
			parserName = "parseIcon",
			message = `Bad input for icon: {p44}`
		})
	end
	return var66
end

local function isValidActionConfig(p45, _) --[[ line: 597 ]]
	-- upvalues: getSduiActionHandlerRegistryModule (ref), fFlagSduiActionTelemetryHandler (ref)
	if typeof(p45) ~= "table" or typeof(p45.actionType) ~= "string" then
		return false
	end
	local actionHandlerConfig = getSduiActionHandlerRegistryModule().getActionHandlerConfig(p45.actionType)
	
	return if fFlagSduiActionTelemetryHandler then actionHandlerConfig ~= nil and (if actionHandlerConfig.handler == nil then actionHandlerConfig.telemetryHandler ~= nil else true) else actionHandlerConfig ~= nil and actionHandlerConfig.handler ~= nil
end

local _ = function(p46) --[[ line: 613 | named "isCallableTable" ]]
	if typeof(p46) == "table" then
		local var69 = getmetatable(p46)
		
		return var69 and type(var69.__call) == "function"
	end
end

local function parseCallback(p47, p48, p49, _) --[[ line: 624 ]]
	-- upvalues: isValidActionConfig (ref), executeActionModule (ref), sduiErrorsModule (ref)
	local isNotFunction
	local var70 = nil
	
	if typeof(p47) == "function" then
		return p47
	elseif typeof(p47) == "table" then
		local var71 = getmetatable(p47)
		
		if var71 then
			isNotFunction = type(var71.__call) ~= "function"
		end
	end
	if isNotFunction then
		p47.analyticsContext = p49
		p47.sduiContext = p48
		
		return p47
	elseif isValidActionConfig(p47, p48) then
		var70 = p47
	end
	if var70 then
		local t = { analyticsContext = p49, sduiContext = p48 }
		setmetatable(t, {
			__call = function(p50, p51) --[[ line: 649 ]]
				-- upvalues: executeActionModule (copy), var70 (write)
				return executeActionModule(var70, p50.analyticsContext, p50.sduiContext, p51)
			end
		})
		
		return t
	end
	local var74 = if typeof(p47) == "table" then p47.actionType else "unknown"
	error({
		parserName = "parseCallback",
		message = `Could not find action for: {p47} actionType: {var74}`,
		overrideValue = function() --[[ line: 661 ]]
			-- upvalues: p48 (ref), sduiErrorsModule (copy), var74 (ref)
			p48.dependencies.logger.reportCounter(sduiErrorsModule.SduiCounterName.ExecutedInvalidAction, { name = var74 })
		end
	})
end

local function parseLazyCallback(p52, _, _, _) --[[ line: 671 ]]
	return p52
end

local function parseLazyUiComponent(p53, p54, p55, p56) --[[ line: 681 ]]
	-- upvalues: sduiBuilderProcessingPhase (ref), sduiBuilderModule (ref)
	if p56 ~= sduiBuilderProcessingPhase.Eager then
		return p53
	end
	local ok, status = pcall(function() --[[ line: 689 ]]
		-- upvalues: p53 (ref), sduiBuilderModule (copy), p54 (ref), p55 (ref)
		if typeof(p53) ~= "table" then
			error(`Invalid input type {typeof(p53)}`)
		end
		local parseUiComponent, parseUiComponent_1 = sduiBuilderModule.tryCreateEagerProcessedComponentConfig(p53, p54, "parseUiComponent", p55)
		
		if parseUiComponent then
			return parseUiComponent_1
		end
		error("Unable to parse componentConfig during Eager phase")
	end)
	
	if ok and status then
		return status
	end
	error({
		parserName = "parseLazyUiComponent",
		message = if typeof(status) == "string" then status else nil
	})
end

local function parseUiComponent(p57, p58, p59, p60) --[[ line: 720 ]]
	-- upvalues: sduiBuilderProcessingPhase (ref), sduiBuilderModule (ref), getSduiComponentWrapperModule (ref), reactModule (ref)
	local var77, var78
	local _ = nil
	local _ = nil
	
	if p60 == sduiBuilderProcessingPhase.Eager then
		local ok, status = pcall(function() --[[ line: 730 ]]
			-- upvalues: p57 (ref), sduiBuilderModule (copy), p58 (ref), p59 (ref)
			if typeof(p57) ~= "table" then
				error(`Invalid input type {typeof(p57)}`)
			end
			local parseUiComponent, parseUiComponent_1 = sduiBuilderModule.tryCreateEagerProcessedComponentConfig(p57, p58, "parseUiComponent", p59)
			
			if parseUiComponent then
				return parseUiComponent_1
			end
			error("Unable to parse componentConfig during Eager phase")
		end)
		var77 = ok
		var78 = status
	else
		local ok, status = pcall(function() --[[ line: 748 ]]
			-- upvalues: p57 (ref), getSduiComponentWrapperModule (copy), reactModule (copy), p58 (ref), p59 (ref)
			if typeof(p57) == "table" then
				return reactModule.createElement(getSduiComponentWrapperModule(p57), {
					componentConfig = p57,
					sduiContext = p58,
					parentAnalyticsContext = p59,
					debugName = `parsedUiComponent-{p57.componentType}`
				})
			end
			error(`Invalid input type {typeof(p57)}`)
		end)
		var77 = ok
		var78 = status
	end
	if var77 and var78 then
		return var78
	end
	error({
		parserName = "parseUiComponent",
		message = if typeof(var78) == "string" then var78 else nil
	})
end

local function parseVector2(p61, _, _, _) --[[ line: 775 ]]
	local var81 = typeof(p61)
	
	if var81 == "Vector2" then
		return p61
	end
	local ok, status = pcall(function() --[[ line: 786 ]]
		-- upvalues: var81 (ref), p61 (ref)
		if var81 == "string" then
			local parts = string.split(p61, ",")
			
			if #parts == 2 then
				return Vector2.new(tonumber(parts[1]) or 0, tonumber(parts[2]) or 0)
			end
			error("Not enough components in string to parse Vector2")
			
			return
		elseif var81 ~= "table" then
			error(`Invalid input type for parseVector2: {var81}`)
			
			return
		elseif #p61 == 2 then
			return Vector2.new(tonumber(p61[1]) or 0, tonumber(p61[2]) or 0)
		end
		error("Not enough components in table to parse Vector2")
	end)
	
	if ok and status then
		return status
	end
	error({
		parserName = "parseVector2",
		message = if typeof(status) == "string" then status else nil
	})
end

local function parseNumber(p62, p63, p64, p65) --[[ line: 814 ]]
	-- upvalues: parseFoundationTokenHelper (ref)
	local var83 = typeof(p62)
	
	if var83 == "number" then
		return p62
	elseif var83 ~= "string" then
		error({
			parserName = "parseNumber",
			message = `Invalid input type for parseNumber: {var83}`
		})
		
		return
	end
	local ok, status = pcall(function() --[[ line: 824 ]]
		-- upvalues: p62 (ref)
		return tonumber(p62)
	end)
	
	if not ok or status == nil then
		local ok_1, status_1 = pcall(function() --[[ line: 830 ]]
			-- upvalues: p62 (ref), p63 (ref), p64 (ref), p65 (ref), parseFoundationTokenHelper (copy)
			return parseFoundationTokenHelper(p62, "number", "parseNumberToken", p63)
		end)
		ok = ok_1
		status = status_1
	end
	if ok and status then
		return status
	end
	error({
		parserName = "parseNumber",
		message = if typeof(status) == "string" then status else `Failed to parse string {p62} to number`
	})
end

local function parseInteger(p66, _, _, _) --[[ line: 850 ]]
	local var84 = typeof(p66)
	
	if var84 == "number" then
		return p66
	elseif var84 ~= "string" then
		error({
			parserName = "parseInteger",
			message = `Invalid input type for parseInteger: {var84}`
		})
		
		return
	end
	local ok, status = pcall(function() --[[ line: 860 ]]
		-- upvalues: p66 (ref)
		return tonumber(p66)
	end)
	
	if ok and status then
		if p66 ~= tostring(math.round(status)) then
			error({
				parserName = "parseInteger",
				message = if typeof(status) == "string" then status else `Unexpected output {status} does not match input {p66}.`
			})
		end
		return status
	else
		error({
			parserName = "parseInteger",
			message = if typeof(status) == "string" then status else `Failed to parse string {p66} to number`
		})
	end
end

local function parseBoolean(p67, _, _, _) --[[ line: 888 ]]
	local var85 = typeof(p67)
	
	if var85 == "boolean" then
		return p67
	elseif var85 == "number" then
		if p67 == 1 then
			return true
		elseif p67 == 0 then
			return false
		end
		error({
			parserName = "parseBoolean",
			message = `Failed to parse number {p67} to boolean`
		})
		
		return
	elseif var85 ~= "string" then
		error({
			parserName = "parseBoolean",
			message = `Invalid input type for parseBoolean: {var85}`
		})
		
		return
	end
	local lowerText = string.lower(p67)
	
	if lowerText == "t" or lowerText == "true" then
		return true
	elseif lowerText == "f" or lowerText == "false" then
		return false
	end
	error({
		parserName = "parseBoolean",
		message = `Failed to parse string {p67} to boolean`
	})
end

local function parseString(p68, _, _, _) --[[ line: 926 ]]
	local var87 = typeof(p68)
	
	if var87 == "string" then
		return p68
	elseif var87 == "number" or var87 == "boolean" then
		return tostring(p68)
	end
	error({
		parserName = "parseString",
		message = `Invalid input type for parseString: {var87}`
	})
end

local function parseImageString(p69, _, _, _) --[[ line: 947 ]]
	-- upvalues: sduiResponsiveHelpersModule (ref)
	local var88 = typeof(p69)
	
	if var88 ~= "string" then
		error({
			parserName = "parseImageString",
			message = `Invalid input type for parseImageString: {var88}`
		})
	end
	local var89 = p69:split("://")
	
	if not (#var89 > 1 and var89[1] == "rbxthumb") then
		return p69
	end
	local t = {}
	
	for i, v in var89[2]:split("&") do
		local var98 = v:split("=")
		
		if #var98 == 2 then
			t[var98[1]] = var98[2]
		end
	end
	if t.mw == nil or t.mh == nil then
		return p69
	end
	local var91 = tonumber(t.w)
	local var92 = tonumber(t.h)
	local var93 = tonumber(t.mw)
	local var94 = tonumber(t.mh)
	
	if var91 == nil or var92 == nil or (var93 == nil or var94 == nil) or (t.type == nil or t.id == nil) then
		error({
			parserName = "parseImageString",
			message = `Invalid params for rbxthumb in parseImageString: {p69}`
		})
	end
	assert(var91, "inputWidth must exist")
	assert(var92, "inputHeight must exist")
	assert(var93, "inputWidth must exist")
	assert(var94, "inputHeight must exist")
	local var95, var96 = sduiResponsiveHelpersModule.adaptThumbnailDimensions(var91, var92, var93, var94, t.type)
	local type = `rbxthumb://type={t.type}&id={t.id}&w={var95}&h={var96}`
	t.w = nil
	t.h = nil
	t.mw = nil
	t.mh = nil
	t.id = nil
	t.type = nil
	
	for i_1, v_1 in t do
		type ..= string.format("&%s=%s", i_1, v_1)
	end
	return type
end

local function parseImageSetOrImage(value, p70, p71, p72) --[[ line: 1023 ]]
	-- upvalues: t_3 (ref), parseIcon (ref), parseImageString (ref)
	local var99 = typeof(value)
	
	if var99 == "table" then
		return value
	elseif var99 ~= "string" then
		error({
			parserName = "parseImageSetOrImage",
			message = `Invalid input type for parseImageSetOrImage: {var99}`
		})
	end
	local var100 = value:split("/")
	
	return if if var100 and #var100 > 1 and t_3[var100[1]] then true else false then parseIcon(value, p70, p71, p72) else parseImageString(value, p70, p71, p72)
end

local function isValidFocusNavActions(p73) --[[ line: 1045 ]]
	-- upvalues: focusNavigationEventNameEnum (ref)
	if typeof(p73) ~= "table" then
		return false
	end
	local var101 = nil
	local var102 = nil
	local keys = p73.keys
	
	if keys then
		if typeof(keys) ~= "table" then
			return false
		end
		for i, v in keys do
			if typeof(i) == "EnumItem" then
				if focusNavigationEventNameEnum[v] ~= nil then
					var101 = true
					continue
				end
				return false
			end
			return false
		end
	end
	local events = p73.events
	
	if events then
		if typeof(events) ~= "table" then
			return false
		end
		for v, v_1 in events do
			if focusNavigationEventNameEnum[v] ~= nil then
				if typeof(v_1) == "table" then
					if typeof(v_1.handler) == "function" then
						var102 = true
						continue
					end
					return false
				end
				return false
			end
			return false
		end
	end
	return var101 or (var102 or false)
end

local function parseFocusNavActions(p74, p75, p76, p77) --[[ line: 1103 ]]
	-- upvalues: isValidFocusNavActions (ref), focusNavigationEventNameEnum (ref), t (ref), parseLuaTableEnumHelper (ref), t_1 (ref), parseEngineEnumHelper (ref), inputHandlersModule (ref), parseCallback (ref)
	if isValidFocusNavActions(p74) then
		return p74
	end
	local var103 = typeof(p74)
	
	if var103 ~= "table" then
		error({
			parserName = "parseFocusNavActions",
			message = `Invalid input type for parseFocusNavActions: {var103}`
		})
	end
	assert(typeof(p74) == "table", "input must be table")
	local ok, status = pcall(function() --[[ line: 1122 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), t (copy), parseLuaTableEnumHelper (copy), p74 (ref), var103 (ref), t_1 (copy), parseEngineEnumHelper (copy), p75 (ref), p76 (ref), p77 (ref), inputHandlersModule (copy), parseCallback (copy)
		if t[focusNavigationEventNameEnum] == nil then
			local var104 = t
			local t_2 = {}
			
			for i, v in focusNavigationEventNameEnum do
				t_2[v] = true
			end
			local var106 = "string"
			
			var104[focusNavigationEventNameEnum] = function(p78, _, _, _) --[[ line: 201 ]]
				-- upvalues: parseLuaTableEnumHelper (copy), var106 (ref), focusNavigationEventNameEnum (ref), t_2 (ref)
				return parseLuaTableEnumHelper(p78, var106, focusNavigationEventNameEnum, t_2)
			end
		end
		local var107 = t[focusNavigationEventNameEnum]
		local var108 = nil
		local var109 = nil
		local keys = p74.keys
		
		if keys then
			if typeof(keys) ~= "table" then
				error({
					parserName = "parseFocusNavActions",
					message = `Invalid input type for keys: {var103}`
				})
			end
			assert(typeof(keys) == "table", "keys must be table")
			local keyCode = Enum.KeyCode
			
			if t_1[keyCode] == nil then
				t_1[keyCode] = function(p79, _, _, _) --[[ line: 246 ]]
					-- upvalues: parseEngineEnumHelper (copy), keyCode (ref)
					return parseEngineEnumHelper(p79, keyCode)
				end
			end
			local var110 = t_1[keyCode]
			
			for i, v in keys do
				local var111 = nil
				
				if typeof(i) == "string" then
					keys[i] = nil
					var111 = var110(i, p75, p76, p77)
				end
				keys[var111] = var107(v, p75, p76, p77)
				var108 = true
			end
		end
		local events = p74.events
		
		if events then
			if typeof(events) ~= "table" then
				error({
					parserName = "parseFocusNavActions",
					message = `Invalid input type for events: {var103}`
				})
			end
			assert(typeof(events) == "table", "events must be table")
			
			for i, v in events do
				if typeof(v) == "table" and typeof(v.handler) ~= "function" then
					events[i] = nil
					events[var107(i, p75, p76, p77)] = {
						handler = inputHandlersModule.onRelease(parseCallback(v, p75, p76, p77))
					}
					var109 = true
				end
			end
		end
		if not var108 and not var109 then
			error("Invalid format. keys or events required")
		end
		return { keys = keys, events = events }
	end)
	
	if ok and status then
		return status
	elseif typeof(status) == "table" then
		status.parserName = "parseFocusNavActions"
		status.overrideValue = nil
		error(status)
		
		return
	end
	error({
		parserName = "parseFocusNavActions",
		message = if typeof(status) == "string" then status else "Failed to parse focus nav event"
	})
end

local t_4 = {}

return {
	parseBooleanProp_ = parseBoolean,
	parseCallbackProp_ = parseCallback,
	parseColor3Prop_ = parseColor3,
	parseGradientProp_ = parseGradient,
	parseIconProp_ = parseIcon,
	parseImageStringProp_ = parseImageString,
	parseIntegerProp_ = parseInteger,
	parseLazyCallbackProp_ = parseLazyCallback,
	parseLazyUiComponentProp_ = parseLazyUiComponent,
	parseNumberProp_ = parseNumber,
	parseStringProp_ = parseString,
	parseUDimProp_ = parseUDim,
	parseUDim2Prop_ = parseUDim2,
	parseUiComponentProp_ = parseUiComponent,
	parseVector2Prop_ = parseVector2,
	parseNumberTokenProp_ = parseNumberToken,
	parseTypographyTokenProp_ = parseTypographyToken,
	parseColorTokenProp_ = parseColorToken,
	parseFontFromTypographyTokenProp_ = parseFontFromTypographyToken,
	parseFocusNavActionsProp_ = parseFocusNavActions,
	parseImageSetOrImageProp_ = parseImageSetOrImage,
	getArrayMetatableParser = function(p80) --[[ line: 1203 ]]
		-- upvalues: t_4 (ref)
		if t_4[p80] == nil then
			t_4[p80] = setmetatable({}, {
				__index = function(_, p81) --[[ line: 1206 ]]
					-- upvalues: p80 (ref)
					return if type(p81) == "number" then p80 else nil
				end
			})
		end
		return t_4[p80]
	end,
	getEngineEnumParser = getEngineEnumParser,
	getLuaTableEnumParser = getLuaTableEnumParser,
	isValidActionConfig = isValidActionConfig,
	isValidImageSet = isValidImageSet,
	isValidGradient = isValidGradient,
	isValidFocusNavActions = isValidFocusNavActions,
	safeParseBoolean = function(p82, p83, p84, p85) --[[ line: 46 ]]
		-- upvalues: parseBoolean (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseBoolean (copy), p82 (ref), p83 (ref), p84 (ref), p85 (ref)
			return parseBoolean(p82, p83, p84, p85)
		end)
		
		if ok then
			return status
		end
		p83.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p82) }), p83.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseCallback = function(p86, p87, p88, p89) --[[ line: 46 ]]
		-- upvalues: parseCallback (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseCallback (copy), p86 (ref), p87 (ref), p88 (ref), p89 (ref)
			return parseCallback(p86, p87, p88, p89)
		end)
		
		if ok then
			return status
		end
		p87.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p86) }), p87.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseColor3 = function(p90, p91, p92, p93) --[[ line: 46 ]]
		-- upvalues: parseColor3 (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseColor3 (copy), p90 (ref), p91 (ref), p92 (ref), p93 (ref)
			return parseColor3(p90, p91, p92, p93)
		end)
		
		if ok then
			return status
		end
		p91.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p90) }), p91.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseGradient = function(p94, p95, p96, p97) --[[ line: 46 ]]
		-- upvalues: parseGradient (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseGradient (copy), p94 (ref), p95 (ref), p96 (ref), p97 (ref)
			return parseGradient(p94, p95, p96, p97)
		end)
		
		if ok then
			return status
		end
		p95.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p94) }), p95.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseIcon = function(p98, p99, p100, p101) --[[ line: 46 ]]
		-- upvalues: parseIcon (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseIcon (copy), p98 (ref), p99 (ref), p100 (ref), p101 (ref)
			return parseIcon(p98, p99, p100, p101)
		end)
		
		if ok then
			return status
		end
		p99.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p98) }), p99.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseImageString = function(p102, p103, p104, p105) --[[ line: 46 ]]
		-- upvalues: parseImageString (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseImageString (copy), p102 (ref), p103 (ref), p104 (ref), p105 (ref)
			return parseImageString(p102, p103, p104, p105)
		end)
		
		if ok then
			return status
		end
		p103.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p102) }), p103.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseInteger = function(p106, p107, p108, p109) --[[ line: 46 ]]
		-- upvalues: parseInteger (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseInteger (copy), p106 (ref), p107 (ref), p108 (ref), p109 (ref)
			return parseInteger(p106, p107, p108, p109)
		end)
		
		if ok then
			return status
		end
		p107.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p106) }), p107.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseNumber = function(p110, p111, p112, p113) --[[ line: 46 ]]
		-- upvalues: parseNumber (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseNumber (copy), p110 (ref), p111 (ref), p112 (ref), p113 (ref)
			return parseNumber(p110, p111, p112, p113)
		end)
		
		if ok then
			return status
		end
		p111.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p110) }), p111.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseString = function(p114, p115, p116, p117) --[[ line: 46 ]]
		-- upvalues: parseString (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseString (copy), p114 (ref), p115 (ref), p116 (ref), p117 (ref)
			return parseString(p114, p115, p116, p117)
		end)
		
		if ok then
			return status
		end
		p115.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p114) }), p115.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseUDim = function(p118, p119, p120, p121) --[[ line: 46 ]]
		-- upvalues: parseUDim (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseUDim (copy), p118 (ref), p119 (ref), p120 (ref), p121 (ref)
			return parseUDim(p118, p119, p120, p121)
		end)
		
		if ok then
			return status
		end
		p119.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p118) }), p119.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseUDim2 = function(p122, p123, p124, p125) --[[ line: 46 ]]
		-- upvalues: parseUDim2 (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseUDim2 (copy), p122 (ref), p123 (ref), p124 (ref), p125 (ref)
			return parseUDim2(p122, p123, p124, p125)
		end)
		
		if ok then
			return status
		end
		p123.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p122) }), p123.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseUiComponent = function(p126, p127, p128, p129) --[[ line: 46 ]]
		-- upvalues: parseUiComponent (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseUiComponent (copy), p126 (ref), p127 (ref), p128 (ref), p129 (ref)
			return parseUiComponent(p126, p127, p128, p129)
		end)
		
		if ok then
			return status
		end
		p127.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p126) }), p127.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseVector2 = function(p130, p131, p132, p133) --[[ line: 46 ]]
		-- upvalues: parseVector2 (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseVector2 (copy), p130 (ref), p131 (ref), p132 (ref), p133 (ref)
			return parseVector2(p130, p131, p132, p133)
		end)
		
		if ok then
			return status
		end
		p131.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p130) }), p131.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseNumberToken = function(p134, p135, p136, p137) --[[ line: 46 ]]
		-- upvalues: parseNumberToken (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseNumberToken (copy), p134 (ref), p135 (ref), p136 (ref), p137 (ref)
			return parseNumberToken(p134, p135, p136, p137)
		end)
		
		if ok then
			return status
		end
		p135.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p134) }), p135.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseTypographyToken = function(p138, p139, p140, p141) --[[ line: 46 ]]
		-- upvalues: parseTypographyToken (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseTypographyToken (copy), p138 (ref), p139 (ref), p140 (ref), p141 (ref)
			return parseTypographyToken(p138, p139, p140, p141)
		end)
		
		if ok then
			return status
		end
		p139.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p138) }), p139.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseFontFromTypographyToken = function(p142, p143, p144, p145) --[[ line: 46 ]]
		-- upvalues: parseFontFromTypographyToken (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseFontFromTypographyToken (copy), p142 (ref), p143 (ref), p144 (ref), p145 (ref)
			return parseFontFromTypographyToken(p142, p143, p144, p145)
		end)
		
		if ok then
			return status
		end
		p143.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p142) }), p143.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseColorToken = function(p146, p147, p148, p149) --[[ line: 46 ]]
		-- upvalues: parseColorToken (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseColorToken (copy), p146 (ref), p147 (ref), p148 (ref), p149 (ref)
			return parseColorToken(p146, p147, p148, p149)
		end)
		
		if ok then
			return status
		end
		p147.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p146) }), p147.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseFocusNavActions = function(p150, p151, p152, p153) --[[ line: 46 ]]
		-- upvalues: parseFocusNavActions (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseFocusNavActions (copy), p150 (ref), p151 (ref), p152 (ref), p153 (ref)
			return parseFocusNavActions(p150, p151, p152, p153)
		end)
		
		if ok then
			return status
		end
		p151.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p150) }), p151.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseImageSetOrImageProp_ = function(p154, p155, p156, p157) --[[ line: 46 ]]
		-- upvalues: parseImageSetOrImage (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function() --[[ line: 47 ]]
			-- upvalues: parseImageSetOrImage (copy), p154 (ref), p155 (ref), p156 (ref), p157 (ref)
			return parseImageSetOrImage(p154, p155, p156, p157)
		end)
		
		if ok then
			return status
		end
		p155.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p154) }), p155.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end
}