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
local _ = require(sduiCoreSystem.SduiContentTypes)
local sduiParseHelpersModule = require(sduiCoreSystem.SduiParseHelpers)
local _ = require(sduiCoreSystem.SduiFocusNavigationTypes)

local function _(p1)
	-- upvalues: cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
	return function(p2, p3, p4, p5)
		-- upvalues: p1 (ref), cryoModule (copy), sduiParseHelpersModule (copy), sduiErrorType (copy)
		local ok, status = pcall(function()
			-- upvalues: p1 (copy), p2 (ref), p3 (ref), p4 (ref), p5 (ref)
			return p1(p2, p3, p4, p5)
		end)
		
		if ok then
			return status
		end
		p3.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p2) }), p3.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end
end

local function parseFoundationTokenHelper(p1, p2, p3, p4)
	-- upvalues: getSduiTokensStoreModule (ref)
	local var1 = typeof(p1)
	
	if var1 == p2 then
		return p1
	elseif var1 ~= "string" then
		error({
			parserName = p3,
			message = `Invalid inputType. Expect string. {var1}`
		})
	end
	local tokens = getSduiTokensStoreModule().getTokens(false, p4.appPage)
	
	for i, v in p1:split(".") do
		if typeof(tokens) == "table" then
			tokens = tokens[v]
		else
			error({
				parserName = p3,
				message = `Invalid path for token for input {p1}`
			})
		end
		if tokens == nil then
			error({ parserName = p3, message = `Nil tokens for input {p1}` })
		end
	end
	if typeof(tokens) ~= p2 then
		error({
			parserName = p3,
			message = `Unexpected token type for {p1}. {typeof(tokens)} ~= {p2}`
		})
	end
	return tokens
end

local function parseNumberToken(p5, p6, _, _)
	-- upvalues: parseFoundationTokenHelper (ref)
	return parseFoundationTokenHelper(p5, "number", "parseNumberToken", p6)
end

local function parseTypographyToken(value, p5, _, _)
	-- upvalues: parseFoundationTokenHelper (ref)
	return parseFoundationTokenHelper(value, "table", "parseTypographyToken", p5)
end

local function parseFontFromTypographyToken(p5, p6, _, _)
	-- upvalues: parseFoundationTokenHelper (ref)
	return parseFoundationTokenHelper(p5, "EnumItem", "parseFontFromTypographyToken", p6)
end

local function parseColorToken(p5, p6, _, _)
	-- upvalues: parseFoundationTokenHelper (ref)
	return parseFoundationTokenHelper(p5, "table", "parseColorToken", p6)
end

local function parseLuaTableEnumHelper(p5, p6, p7, p8)
	local var2 = typeof(p5)
	
	if var2 == p6 and p8[p5] then
		return p5
	elseif var2 ~= "string" then
		error({
			parserName = "parseLuaTableEnumHelper",
			message = `Invalid input type to parser: {var2}. Expected string.`
		})
	end
	local var3 = p7[p5]
	
	if var3 ~= nil then
		return var3
	end
	local var4 = ""
	
	for i in p8 do
		var4 ..= i .. ", "
	end
	error({
		parserName = "parseLuaTableEnumHelper",
		message = `Failed to parse lua table enum. input: {p5} validValues: {var4}`
	})
end

local t = {}

local _ = function(p9, p10)
	-- upvalues: parseLuaTableEnumHelper (ref)
	local t = {}
	
	for i, v in p9 do
		t[v] = true
	end
	return function(p11, _, _, _)
		-- upvalues: parseLuaTableEnumHelper (copy), p10 (ref), p9 (ref), t (ref)
		return parseLuaTableEnumHelper(p11, p10, p9, t)
	end
end

local function getLuaTableEnumParser(p11, p12)
	-- upvalues: t (ref), parseLuaTableEnumHelper (ref)
	if t[p11] == nil then
		local var5 = t
		local t_1 = {}
		
		for i, v in p11 do
			t_1[v] = true
		end
		var5[p11] = function(p13, _, _, _)
			-- upvalues: parseLuaTableEnumHelper (copy), p12 (ref), p11 (ref), t_1 (ref)
			return parseLuaTableEnumHelper(p13, p12, p11, t_1)
		end
	end
	return t[p11]
end

local function parseEngineEnumHelper(p13, p14)
	if typeof(p13) == "EnumItem" then
		return p13
	elseif typeof(p13) ~= "string" then
		error({
			parserName = "parseEngineEnumHelper",
			message = `Invalid input type Engine Enum value. Expect string. received {p13}`
		})
	end
	local ok, status = pcall(function()
		-- upvalues: p14 (ref), p13 (ref)
		return p14[p13]
	end)
	
	if ok then
		return status
	end
	error({ parserName = "parseEngineEnumHelper", message = status })
end

local t_1 = {}

local _ = function(p13)
	-- upvalues: parseEngineEnumHelper (ref)
	return function(p14, _, _, _)
		-- upvalues: parseEngineEnumHelper (copy), p13 (ref)
		return parseEngineEnumHelper(p14, p13)
	end
end

local function getEngineEnumParser(p13)
	-- upvalues: t_1 (ref), parseEngineEnumHelper (ref)
	if t_1[p13] == nil then
		t_1[p13] = function(p14, _, _, _)
			-- upvalues: parseEngineEnumHelper (copy), p13 (ref)
			return parseEngineEnumHelper(p14, p13)
		end
	end
	return t_1[p13]
end

local function parseUDim2(p13, _, _, _)
	local var6 = typeof(p13)
	
	if var6 == "UDim2" then
		return p13
	end
	local ok, status = pcall(function()
		-- upvalues: var6 (ref), p13 (ref)
		if var6 == "string" then
			local parts = string.split(p13, ",")
			
			if #parts == 4 then
				return UDim2.new(tonumber(parts[1]) or 0, tonumber(parts[2]) or 0, tonumber(parts[3]) or 0, tonumber(parts[4]) or 0)
			end
			error("Not enough components in string to parse UDim2")
			
			return
		elseif var6 ~= "table" then
			error(`Invalid input type for parseUDim2: {var6}`)
			
			return
		elseif #p13 == 4 then
			return UDim2.new(tonumber(p13[1]) or 0, tonumber(p13[2]) or 0, tonumber(p13[3]) or 0, tonumber(p13[4]) or 0)
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

local function parseUDim(p14, _, _, _)
	local var7 = typeof(p14)
	
	if var7 == "UDim" then
		return p14
	end
	local ok, status = pcall(function()
		-- upvalues: var7 (ref), p14 (ref)
		if var7 == "string" then
			local parts = string.split(p14, ",")
			
			if #parts == 2 then
				return UDim.new(tonumber(parts[1]) or 0, tonumber(parts[2]) or 0)
			end
			error("Not enough components in string to parse UDim")
			
			return
		elseif var7 == "table" then
			if #p14 == 2 then
				return UDim.new(tonumber(p14[1]) or 0, tonumber(p14[2]) or 0)
			end
			error("Not enough components in table to parse UDim")
			
			return
		elseif var7 == "number" then
			return UDim.new(0, p14)
		end
		error(`Invalid input type for parseUDim: {var7}`)
	end)
	
	if ok and status then
		return status
	end
	error({
		parserName = "parseUDim",
		message = if typeof(status) == "string" then status else nil
	})
end

local function parseColor3(p15, p16, p17, p18)
	-- upvalues: parseFoundationTokenHelper (ref)
	local var8 = typeof(p15)
	
	if var8 == "Color3" then
		return p15
	end
	local ok, status = pcall(function()
		-- upvalues: var8 (ref), p15 (ref), p16 (ref), p17 (ref), p18 (ref), parseFoundationTokenHelper (copy)
		if var8 == "string" then
			local ok, status = pcall(function()
				-- upvalues: p15 (copy)
				return Color3.fromHex(p15)
			end)
			
			if ok and status then
				return status
			end
			local _ = nil
			local ok_1, status_1 = pcall(function()
				-- upvalues: p15 (copy), p16 (copy), p17 (copy), p18 (copy), parseFoundationTokenHelper (copy)
				return parseFoundationTokenHelper(p15, "table", "parseColorToken", p16)
			end)
			local var9 = status_1
			
			if ok_1 and typeof(var9) == "table" and var9.Color3 ~= nil then
				return var9.Color3
			end
			error(`Invalid input for Color3: {p15}`)
			
			return
		elseif var8 == "table" then
			return Color3.fromRGB(p15.r, p15.g, p15.b)
		end
		error(`Invalid input type for parseColor3: {var8}`)
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

local function isValidGradient(p19)
	return typeof(p19) == "table" and (typeof(p19.startColor) == "Color3" and (typeof(p19.endColor) == "Color3" and (typeof(p19.startOpacity) == "number" and (typeof(p19.endOpacity) == "number" and typeof(p19.degree) == "number"))))
end

local function parseGradient(p19, p20, p21, p22)
	-- upvalues: isValidGradient (ref), parseColor3 (ref), t_2 (ref)
	local var10 = typeof(p19)
	
	if var10 == "table" then
		if isValidGradient(p19) then
			return p19
		end
	else
		error({
			parserName = "parseGradient",
			message = `invalid input type for parseGradient: {var10}`
		})
	end
	local var11
	local _ = nil
	local _ = nil
	
	if p19.startColor then
		local ok, status = pcall(function()
			-- upvalues: parseColor3 (copy), p19 (ref), p20 (ref), p21 (ref), p22 (ref)
			return parseColor3(p19.startColor, p20, p21, p22)
		end)
		var11 = status
		
		if not ok then
			error({
				parserName = "parseGradient",
				message = if typeof(var11) == "string" then var11 else "failed to parse startColor field"
			})
		end
	else
		var11 = t_2.startColor
	end
	local var12
	local _ = nil
	
	if p19.endColor then
		local ok, status = pcall(function()
			-- upvalues: parseColor3 (copy), p19 (ref), p20 (ref), p21 (ref), p22 (ref)
			return parseColor3(p19.endColor, p20, p21, p22)
		end)
		var12 = status
		
		if not ok then
			error({
				parserName = "parseGradient",
				message = if typeof(var12) == "string" then var12 else "failed to parse endColor field"
			})
		end
	else
		var12 = t_2.endColor
	end
	local startOpacity = nil
	
	if typeof(p19.startOpacity) == "number" then
		startOpacity = p19.startOpacity
	elseif p19.startOpacity ~= nil then
		error({
			parserName = "parseGradient",
			message = `invalid input type for startOpacity: {typeof(p19.startOpacity)}`
		})
	end
	local endOpacity = nil
	
	if typeof(p19.endOpacity) == "number" then
		endOpacity = p19.endOpacity
	elseif p19.endOpacity ~= nil then
		error({
			parserName = "parseGradient",
			message = `invalid input type for endOpacity: {typeof(p19.endOpacity)}`
		})
	end
	local degree = nil
	
	if typeof(p19.degree) == "number" then
		degree = p19.degree
	elseif p19.degree ~= nil then
		error({
			parserName = "parseGradient",
			message = `invalid input type for degree: {typeof(p19.degree)}`
		})
	end
	return {
		startColor = var11,
		endColor = var12,
		startOpacity = startOpacity or t_2.startOpacity,
		endOpacity = endOpacity or t_2.endOpacity,
		degree = degree or t_2.degree
	}
end

local function isValidImageSet(value)
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

local _ = function(p23)
	-- upvalues: t_3 (ref)
	local var13 = p23:split("/")
	
	return var13 and #var13 > 1 and t_3[var13[1]]
end

local function parseIcon(p23, _, _, _)
	-- upvalues: getImageData (ref), images (ref)
	local isNotVector2
	local _ = nil
	local var13 = nil
	
	if typeof(p23) == "table" and typeof(p23.ImageRectOffset) == "Vector2" and typeof(p23.Image) == "string" then
		isNotVector2 = typeof(p23.ImageRectSize) ~= "Vector2"
	end
	if isNotVector2 then
		return p23
	elseif typeof(p23) == "string" then
		local ok, status = pcall(function()
			-- upvalues: getImageData (copy), p23 (ref), images (copy)
			return getImageData(p23) or images[p23]
		end)
		var13 = status
		
		if not ok or not var13 then
			error({
				parserName = "parseIcon",
				message = `No icon found for {p23}`
			})
		end
	end
	if not var13 then
		error({
			parserName = "parseIcon",
			message = `Bad input for icon: {p23}`
		})
	end
	return var13
end

local function isValidActionConfig(p24, _)
	-- upvalues: getSduiActionHandlerRegistryModule (ref)
	if typeof(p24) ~= "table" or typeof(p24.actionType) ~= "string" then
		return false
	end
	local actionHandlerConfig = getSduiActionHandlerRegistryModule().getActionHandlerConfig(p24.actionType)
	
	return actionHandlerConfig ~= nil and (if actionHandlerConfig.handler == nil then actionHandlerConfig.telemetryHandler ~= nil else true)
end

local _ = function(p24)
	if typeof(p24) == "table" then
		local var14 = getmetatable(p24)
		
		return var14 and type(var14.__call) == "function"
	end
end

local function parseCallback(p24, p25, p26, _)
	-- upvalues: getSduiActionHandlerRegistryModule (ref), executeActionModule (ref), sduiErrorsModule (ref)
	local isNotFunction
	local var14 = nil
	
	if typeof(p24) == "function" then
		return p24
	elseif typeof(p24) == "table" then
		local var15
		local var16 = getmetatable(p24)
		
		if var16 then
			isNotFunction = type(var16.__call) ~= "function"
		end
	end
	if isNotFunction then
		p24.analyticsContext = p26
		p24.sduiContext = p25
		
		return p24
	elseif typeof(p24) == "table" and typeof(p24.actionType) == "string" then
		local actionHandlerConfig = getSduiActionHandlerRegistryModule().getActionHandlerConfig(p24.actionType)
		var15 = false
		
		if actionHandlerConfig ~= nil then
			var15 = true
			
			if actionHandlerConfig.handler == nil then
				local _ = actionHandlerConfig.telemetryHandler ~= nil
			end
		end
	else
		var15 = false
	end
	if var15 then
		var14 = p24
	end
	if var14 then
		local t = { analyticsContext = p26, sduiContext = p25 }
		setmetatable(t, {
			__call = function(p27, p28)
				-- upvalues: executeActionModule (copy), var14 (write)
				return executeActionModule(var14, p27.analyticsContext, p27.sduiContext, p28)
			end
		})
		
		return t
	end
	local var17 = if typeof(p24) == "table" then p24.actionType else "unknown"
	error({
		parserName = "parseCallback",
		message = `Could not find action for: {p24} actionType: {var17}`,
		overrideValue = function()
			-- upvalues: p25 (ref), sduiErrorsModule (copy), var17 (ref)
			p25.dependencies.logger.reportCounter(sduiErrorsModule.SduiCounterName.ExecutedInvalidAction, { name = var17 })
		end
	})
end

local function parseLazyCallback(p27, _, _, _)
	return p27
end

local function parseLazyUiComponent(p27, p28, p29, p30)
	-- upvalues: sduiBuilderProcessingPhase (ref), sduiBuilderModule (ref)
	if p30 ~= sduiBuilderProcessingPhase.Eager then
		return p27
	end
	local ok, status = pcall(function()
		-- upvalues: p27 (ref), sduiBuilderModule (copy), p28 (ref), p29 (ref)
		if typeof(p27) ~= "table" then
			error(`Invalid input type {typeof(p27)}`)
		end
		local parseUiComponent, parseUiComponent_1 = sduiBuilderModule.tryCreateEagerProcessedComponentConfig(p27, p28, "parseUiComponent", p29)
		
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

local function parseUiComponent(p27, p28, p29, p30)
	-- upvalues: sduiBuilderProcessingPhase (ref), sduiBuilderModule (ref), getSduiComponentWrapperModule (ref), reactModule (ref)
	local var18, var19
	local _ = nil
	local _ = nil
	
	if p30 == sduiBuilderProcessingPhase.Eager then
		local ok, status = pcall(function()
			-- upvalues: p27 (ref), sduiBuilderModule (copy), p28 (ref), p29 (ref)
			if typeof(p27) ~= "table" then
				error(`Invalid input type {typeof(p27)}`)
			end
			local parseUiComponent, parseUiComponent_1 = sduiBuilderModule.tryCreateEagerProcessedComponentConfig(p27, p28, "parseUiComponent", p29)
			
			if parseUiComponent then
				return parseUiComponent_1
			end
			error("Unable to parse componentConfig during Eager phase")
		end)
		var18 = ok
		var19 = status
	else
		local ok, status = pcall(function()
			-- upvalues: p27 (ref), getSduiComponentWrapperModule (copy), reactModule (copy), p28 (ref), p29 (ref)
			if typeof(p27) == "table" then
				return reactModule.createElement(getSduiComponentWrapperModule(p27), {
					componentConfig = p27,
					sduiContext = p28,
					parentAnalyticsContext = p29,
					debugName = `parsedUiComponent-{p27.componentType}`
				})
			end
			error(`Invalid input type {typeof(p27)}`)
		end)
		var18 = ok
		var19 = status
	end
	if var18 and var19 then
		return var19
	end
	error({
		parserName = "parseUiComponent",
		message = if typeof(var19) == "string" then var19 else nil
	})
end

local function parseVector2(p27, _, _, _)
	local var18 = typeof(p27)
	
	if var18 == "Vector2" then
		return p27
	end
	local ok, status = pcall(function()
		-- upvalues: var18 (ref), p27 (ref)
		if var18 == "string" then
			local parts = string.split(p27, ",")
			
			if #parts == 2 then
				return Vector2.new(tonumber(parts[1]) or 0, tonumber(parts[2]) or 0)
			end
			error("Not enough components in string to parse Vector2")
			
			return
		elseif var18 ~= "table" then
			error(`Invalid input type for parseVector2: {var18}`)
			
			return
		elseif #p27 == 2 then
			return Vector2.new(tonumber(p27[1]) or 0, tonumber(p27[2]) or 0)
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

local function parseNumber(p28, p29, p30, p31)
	-- upvalues: parseFoundationTokenHelper (ref)
	local var19 = typeof(p28)
	
	if var19 == "number" then
		return p28
	elseif var19 ~= "string" then
		error({
			parserName = "parseNumber",
			message = `Invalid input type for parseNumber: {var19}`
		})
		
		return
	end
	local ok, status = pcall(function()
		-- upvalues: p28 (ref)
		return tonumber(p28)
	end)
	
	if not ok or status == nil then
		local ok_1, status_1 = pcall(function()
			-- upvalues: p28 (ref), p29 (ref), p30 (ref), p31 (ref), parseFoundationTokenHelper (copy)
			return parseFoundationTokenHelper(p28, "number", "parseNumberToken", p29)
		end)
		ok = ok_1
		status = status_1
	end
	if ok and status then
		return status
	end
	error({
		parserName = "parseNumber",
		message = if typeof(status) == "string" then status else `Failed to parse string {p28} to number`
	})
end

local function parseInteger(p32, _, _, _)
	local var20 = typeof(p32)
	
	if var20 == "number" then
		return p32
	elseif var20 ~= "string" then
		error({
			parserName = "parseInteger",
			message = `Invalid input type for parseInteger: {var20}`
		})
		
		return
	end
	local ok, status = pcall(function()
		-- upvalues: p32 (ref)
		return tonumber(p32)
	end)
	
	if ok and status then
		if p32 ~= tostring(math.round(status)) then
			error({
				parserName = "parseInteger",
				message = if typeof(status) == "string" then status else `Unexpected output {status} does not match input {p32}.`
			})
		end
		return status
	else
		error({
			parserName = "parseInteger",
			message = if typeof(status) == "string" then status else `Failed to parse string {p32} to number`
		})
	end
end

local function parseBoolean(p33, _, _, _)
	local var21 = typeof(p33)
	
	if var21 == "boolean" then
		return p33
	elseif var21 == "number" then
		if p33 == 1 then
			return true
		elseif p33 == 0 then
			return false
		end
		error({
			parserName = "parseBoolean",
			message = `Failed to parse number {p33} to boolean`
		})
		
		return
	elseif var21 ~= "string" then
		error({
			parserName = "parseBoolean",
			message = `Invalid input type for parseBoolean: {var21}`
		})
		
		return
	end
	local lowerText = string.lower(p33)
	
	if lowerText == "t" or lowerText == "true" then
		return true
	elseif lowerText == "f" or lowerText == "false" then
		return false
	end
	error({
		parserName = "parseBoolean",
		message = `Failed to parse string {p33} to boolean`
	})
end

local function parseString(p34, _, _, _)
	local var22 = typeof(p34)
	
	if var22 == "string" then
		return p34
	elseif var22 == "number" or var22 == "boolean" then
		return tostring(p34)
	end
	error({
		parserName = "parseString",
		message = `Invalid input type for parseString: {var22}`
	})
end

local function parseImageString(p35, _, _, _)
	-- upvalues: sduiResponsiveHelpersModule (ref)
	local var23 = typeof(p35)
	
	if var23 ~= "string" then
		error({
			parserName = "parseImageString",
			message = `Invalid input type for parseImageString: {var23}`
		})
	end
	local var24 = p35:split("://")
	
	if not (#var24 > 1 and var24[1] == "rbxthumb") then
		return p35
	end
	local t = {}
	
	for i, v in var24[2]:split("&") do
		local var25 = v:split("=")
		
		if #var25 == 2 then
			t[var25[1]] = var25[2]
		end
	end
	if t.mw == nil or t.mh == nil then
		return p35
	end
	local var26 = tonumber(t.w)
	local var27 = tonumber(t.h)
	local var28 = tonumber(t.mw)
	local var29 = tonumber(t.mh)
	
	if var26 == nil or var27 == nil or (var28 == nil or var29 == nil) or (t.type == nil or t.id == nil) then
		error({
			parserName = "parseImageString",
			message = `Invalid params for rbxthumb in parseImageString: {p35}`
		})
	end
	assert(var26, "inputWidth must exist")
	assert(var27, "inputHeight must exist")
	assert(var28, "inputWidth must exist")
	assert(var29, "inputHeight must exist")
	local var30, var31 = sduiResponsiveHelpersModule.adaptThumbnailDimensions(var26, var27, var28, var29, t.type)
	local type = `rbxthumb://type={t.type}&id={t.id}&w={var30}&h={var31}`
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

local function parseImageSetOrImage(value, p36, p37, p38)
	-- upvalues: t_3 (ref), parseIcon (ref), parseImageString (ref)
	local var32 = typeof(value)
	
	if var32 == "table" then
		return value
	elseif var32 ~= "string" then
		error({
			parserName = "parseImageSetOrImage",
			message = `Invalid input type for parseImageSetOrImage: {var32}`
		})
	end
	local var33 = value:split("/")
	
	return if if var33 and #var33 > 1 and t_3[var33[1]] then true else false then parseIcon(value, p36, p37, p38) else parseImageString(value, p36, p37, p38)
end

local function isValidFocusNavActions(p39)
	-- upvalues: focusNavigationEventNameEnum (ref)
	if typeof(p39) ~= "table" then
		return false
	end
	local var34 = nil
	local var35 = nil
	local keys = p39.keys
	
	if keys then
		if typeof(keys) ~= "table" then
			return false
		end
		for i, v in keys do
			if typeof(i) == "EnumItem" then
				if focusNavigationEventNameEnum[v] ~= nil then
					var34 = true
					continue
				end
				return false
			end
			return false
		end
	end
	local events = p39.events
	
	if events then
		if typeof(events) ~= "table" then
			return false
		end
		for v, v_1 in events do
			if focusNavigationEventNameEnum[v] ~= nil then
				if typeof(v_1) == "table" then
					if typeof(v_1.handler) == "function" then
						var35 = true
						continue
					end
					return false
				end
				return false
			end
			return false
		end
	end
	return var34 or (var35 or false)
end

local function parseFocusNavActions(p40, p41, p42, p43)
	-- upvalues: isValidFocusNavActions (ref), focusNavigationEventNameEnum (ref), t (ref), parseLuaTableEnumHelper (ref), t_1 (ref), parseEngineEnumHelper (ref), inputHandlersModule (ref), parseCallback (ref)
	if isValidFocusNavActions(p40) then
		return p40
	end
	local var36 = typeof(p40)
	
	if var36 ~= "table" then
		error({
			parserName = "parseFocusNavActions",
			message = `Invalid input type for parseFocusNavActions: {var36}`
		})
	end
	assert(typeof(p40) == "table", "input must be table")
	local ok, status = pcall(function()
		-- upvalues: focusNavigationEventNameEnum (copy), t (copy), parseLuaTableEnumHelper (copy), p40 (ref), var36 (ref), t_1 (copy), parseEngineEnumHelper (copy), p41 (ref), p42 (ref), p43 (ref), inputHandlersModule (copy), parseCallback (copy)
		if t[focusNavigationEventNameEnum] == nil then
			local var37 = t
			local t_2 = {}
			
			for i, v in focusNavigationEventNameEnum do
				t_2[v] = true
			end
			local var38 = "string"
			
			var37[focusNavigationEventNameEnum] = function(p44, _, _, _)
				-- upvalues: parseLuaTableEnumHelper (copy), var38 (ref), focusNavigationEventNameEnum (ref), t_2 (ref)
				return parseLuaTableEnumHelper(p44, var38, focusNavigationEventNameEnum, t_2)
			end
		end
		local var39 = t[focusNavigationEventNameEnum]
		local var40 = nil
		local var41 = nil
		local keys = p40.keys
		
		if keys then
			if typeof(keys) ~= "table" then
				error({
					parserName = "parseFocusNavActions",
					message = `Invalid input type for keys: {var36}`
				})
			end
			assert(typeof(keys) == "table", "keys must be table")
			local keyCode = Enum.KeyCode
			
			if t_1[keyCode] == nil then
				t_1[keyCode] = function(p44, _, _, _)
					-- upvalues: parseEngineEnumHelper (copy), keyCode (ref)
					return parseEngineEnumHelper(p44, keyCode)
				end
			end
			local var42 = t_1[keyCode]
			
			for i, v in keys do
				local var43 = nil
				
				if typeof(i) == "string" then
					keys[i] = nil
					var43 = var42(i, p41, p42, p43)
				end
				keys[var43] = var39(v, p41, p42, p43)
				var40 = true
			end
		end
		local events = p40.events
		
		if events then
			if typeof(events) ~= "table" then
				error({
					parserName = "parseFocusNavActions",
					message = `Invalid input type for events: {var36}`
				})
			end
			assert(typeof(events) == "table", "events must be table")
			
			for i, v in events do
				if typeof(v) == "table" and typeof(v.handler) ~= "function" then
					events[i] = nil
					events[var39(i, p41, p42, p43)] = {
						handler = inputHandlersModule.onRelease(parseCallback(v, p41, p42, p43))
					}
					var41 = true
				end
			end
		end
		if not var40 and not var41 then
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
	getArrayMetatableParser = function(p44)
		-- upvalues: t_4 (ref)
		if t_4[p44] == nil then
			t_4[p44] = setmetatable({}, {
				__index = function(_, p45)
					-- upvalues: p44 (ref)
					return if type(p45) == "number" then p44 else nil
				end
			})
		end
		return t_4[p44]
	end,
	getEngineEnumParser = getEngineEnumParser,
	getLuaTableEnumParser = getLuaTableEnumParser,
	isValidActionConfig = isValidActionConfig,
	isValidImageSet = isValidImageSet,
	isValidGradient = isValidGradient,
	isValidFocusNavActions = isValidFocusNavActions,
	safeParseBoolean = function(p44, p45, p46, p47)
		-- upvalues: parseBoolean (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseBoolean (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseBoolean(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseCallback = function(p44, p45, p46, p47)
		-- upvalues: parseCallback (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseCallback (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseCallback(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseColor3 = function(p44, p45, p46, p47)
		-- upvalues: parseColor3 (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseColor3 (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseColor3(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseGradient = function(p44, p45, p46, p47)
		-- upvalues: parseGradient (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseGradient (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseGradient(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseIcon = function(p44, p45, p46, p47)
		-- upvalues: parseIcon (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseIcon (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseIcon(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseImageString = function(p44, p45, p46, p47)
		-- upvalues: parseImageString (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseImageString (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseImageString(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseInteger = function(p44, p45, p46, p47)
		-- upvalues: parseInteger (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseInteger (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseInteger(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseNumber = function(p44, p45, p46, p47)
		-- upvalues: parseNumber (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseNumber (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseNumber(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseString = function(p44, p45, p46, p47)
		-- upvalues: parseString (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseString (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseString(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseUDim = function(p44, p45, p46, p47)
		-- upvalues: parseUDim (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseUDim (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseUDim(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseUDim2 = function(p44, p45, p46, p47)
		-- upvalues: parseUDim2 (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseUDim2 (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseUDim2(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseUiComponent = function(p44, p45, p46, p47)
		-- upvalues: parseUiComponent (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseUiComponent (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseUiComponent(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseVector2 = function(p44, p45, p46, p47)
		-- upvalues: parseVector2 (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseVector2 (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseVector2(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseNumberToken = function(p44, p45, p46, p47)
		-- upvalues: parseNumberToken (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseNumberToken (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseNumberToken(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseTypographyToken = function(p44, p45, p46, p47)
		-- upvalues: parseTypographyToken (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseTypographyToken (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseTypographyToken(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseFontFromTypographyToken = function(p44, p45, p46, p47)
		-- upvalues: parseFontFromTypographyToken (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseFontFromTypographyToken (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseFontFromTypographyToken(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseColorToken = function(p44, p45, p46, p47)
		-- upvalues: parseColorToken (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseColorToken (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseColorToken(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseFocusNavActions = function(p44, p45, p46, p47)
		-- upvalues: parseFocusNavActions (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseFocusNavActions (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseFocusNavActions(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end,
	safeParseImageSetOrImageProp_ = function(p44, p45, p46, p47)
		-- upvalues: parseImageSetOrImage (ref), cryoModule (ref), sduiParseHelpersModule (ref), sduiErrorType (ref)
		local ok, status = pcall(function()
			-- upvalues: parseImageSetOrImage (copy), p44 (ref), p45 (ref), p46 (ref), p47 (ref)
			return parseImageSetOrImage(p44, p45, p46, p47)
		end)
		
		if ok then
			return status
		end
		p45.dependencies.logger.reportError(sduiErrorType.FailedToParse, cryoModule.Dictionary.join(if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}, { value = sduiParseHelpersModule.stringifyValue(p44) }), p45.appPage)
		
		return if typeof(status) == "table" then status.overrideValue else nil
	end
}