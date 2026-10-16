local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local Images = require(Parent.FoundationImages).Images
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent.InputHandlers)
local ExecuteActionModule = require(SduiCoreSystem.executeAction)
local _ = require(SduiCoreSystem.SduiActionType)
local SduiBuilderModule = require(SduiCoreSystem.SduiBuilder)
local SduiBuilderProcessingPhase = require(SduiCoreSystem.SduiBuilderTypes).SduiBuilderProcessingPhase
local _ = require(SduiCoreSystem.SduiComponentType)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local SduiResponsiveHelpersModule = require(SduiCoreSystem.SduiResponsiveHelpers)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiErrorType = SduiErrorsModule.SduiErrorType
local GetSduiComponentWrapperModule = require(SduiCoreSystem.getSduiComponentWrapper)
local GetSduiActionHandlerRegistryModule = require(SduiCoreSystem.getSduiActionHandlerRegistry)
local GetSduiTokensStoreModule = require(SduiCoreSystem.ClientBinding.getSduiTokensStore)
local _ = require(SduiCoreSystem.SduiContentTypes)
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local _ = require(SduiCoreSystem.SduiFocusNavigationTypes)

local function _(Callback) --[[ Line: 44 | Named "withErrorHandling" ]]
	-- upvalues: CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
	return function(p1, p2, p3, p4) --[[ Line: 45 ]]
		-- upvalues: Callback (copy), CryoModule (upval), SduiParseHelpersModule (upval), SduiErrorType (upval)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: Callback (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy)
			return Callback(p1, p2, p3, p4)
		end)
		
		if Success then
			return Result
		else
			p2.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p1) }), p2.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end
end

local function parseFoundationTokenHelper(Text: string, ValueType, ParserName, p1) --[[ Line: 80 ]]
	-- upvalues: GetSduiTokensStoreModule (copy)
	local ValueType1 = typeof(Text)
	
	if ValueType1 == ValueType then
		return Text
	end
	if ValueType1 ~= "string" then
		error({
			parserName = ParserName,
			message = `Invalid inputType. Expect string. {ValueType1}`
		})
	end
	local Tokens = GetSduiTokensStoreModule().getTokens(false, p1.appPage)
	
	for _, value in Text:split(".") do
		if typeof(Tokens) == "table" then
			Tokens = Tokens[value]
		else
			error({
				parserName = ParserName,
				message = `Invalid path for token for input {Text}`
			})
		end
		if Tokens == nil then
			error({
				parserName = ParserName,
				message = `Nil tokens for input {Text}`
			})
		end
	end
	if typeof(Tokens) ~= ValueType then
		error({
			parserName = ParserName,
			message = `Unexpected token type for {Text}. {typeof(Tokens)} ~= {ValueType}`
		})
	end
	return Tokens
end

local function parseNumberToken(p2, p3, _, _) --[[ Line: 121 ]]
	-- upvalues: parseFoundationTokenHelper (copy)
	return (parseFoundationTokenHelper(p2, "number", "parseNumberToken", p3))
end

local function parseTypographyToken(p2, p3, _, _) --[[ Line: 130 ]]
	-- upvalues: parseFoundationTokenHelper (copy)
	return (parseFoundationTokenHelper(p2, "table", "parseTypographyToken", p3))
end

local function parseFontFromTypographyToken(p2, p3, _, _) --[[ Line: 139 ]]
	-- upvalues: parseFoundationTokenHelper (copy)
	return (parseFoundationTokenHelper(p2, "EnumItem", "parseFontFromTypographyToken", p3))
end

local function parseColorToken(p2, p3, _, _) --[[ Line: 148 ]]
	-- upvalues: parseFoundationTokenHelper (copy)
	return (parseFoundationTokenHelper(p2, "table", "parseColorToken", p3))
end

local function parseLuaTableEnumHelper(p2, ValueType, FocusNavigationEventNameEnum, List) --[[ Line: 157 ]]
	local ValueType1 = typeof(p2)
	
	if ValueType1 == ValueType and List[p2] then
		return p2
	end
	if ValueType1 ~= "string" then
		error({
			parserName = "parseLuaTableEnumHelper",
			message = `Invalid input type to parser: {ValueType1}. Expected string.`
		})
	end
	local FocusNavigationEventNameEnumEntry = FocusNavigationEventNameEnum[p2]
	
	if FocusNavigationEventNameEnumEntry ~= nil then
		return FocusNavigationEventNameEnumEntry
	end
	local Text = ""
	
	for i in List do
		Text ..= i .. ", "
	end
	error({
		parserName = "parseLuaTableEnumHelper",
		message = `Failed to parse lua table enum. input: {p2} validValues: {Text}`
	})
end

local t = {}

local _ = function(List, p3) --[[ Line: 195 | Named "makeLuaTableEnumParser" ]]
	-- upvalues: parseLuaTableEnumHelper (copy)
	local t = {}
	
	for _, value in List do
		t[value] = true
	end
	return function(p4, _, _, _) --[[ Line: 200 ]]
		-- upvalues: parseLuaTableEnumHelper (upval), p3 (copy), List (copy), t (copy)
		return parseLuaTableEnumHelper(p4, p3, List, t)
	end
end

local function parseEngineEnumHelper(p4, KeyCode) --[[ Line: 217 ]]
	if typeof(p4) == "EnumItem" then
		return p4
	end
	if typeof(p4) ~= "string" then
		error({
			parserName = "parseEngineEnumHelper",
			message = `Invalid input type Engine Enum value. Expect string. received {p4}`
		})
	end
	local Success, Result = pcall(function() --[[ Line: 228 ]]
		-- upvalues: KeyCode (copy), p4 (copy)
		return KeyCode[p4]
	end)
	
	if Success then
		return Result
	else
		error({ parserName = "parseEngineEnumHelper", message = Result })
	end
end

local t1 = {}

local _ = function(p4) --[[ Line: 244 | Named "makeEngineEnumParser" ]]
	-- upvalues: parseEngineEnumHelper (copy)
	return function(p5, _, _, _) --[[ Line: 245 ]]
		-- upvalues: parseEngineEnumHelper (upval), p4 (copy)
		return parseEngineEnumHelper(p5, p4)
	end
end

local function parseUDim2(Entry, _, _, _) --[[ Line: 265 ]]
	local ValueType = typeof(Entry)
	
	if ValueType == "UDim2" then
		return Entry
	end
	local Success, Result = pcall(function(): UDim2? --[[ Line: 276 ]]
		-- upvalues: ValueType (copy), Entry (copy)
		if ValueType == "string" then
			local Parts = string.split(Entry, ",")
			
			if #Parts == 4 then
				return UDim2.new(tonumber(Parts[1]) or 0, tonumber(Parts[2]) or 0, tonumber(Parts[3]) or 0, tonumber(Parts[4]) or 0)
			else
				error("Not enough components in string to parse UDim2")
				
				return
			end
		elseif ValueType ~= "table" then
			error(`Invalid input type for parseUDim2: {ValueType}`)
			
			return
		else
			if #Entry == 4 then
				return UDim2.new(tonumber(Entry[1]) or 0, tonumber(Entry[2]) or 0, tonumber(Entry[3]) or 0, tonumber(Entry[4]) or 0)
			else
				error("Not enough components in table to parse UDim2")
			end
		end
	end)
	
	if Success and Result then
		return Result
	else
		error({
			parserName = "parseUDim2",
			message = if typeof(Result) == "string" then Result else nil
		})
	end
end

local function parseUDim(Entry, _, _, _) --[[ Line: 315 ]]
	local ValueType = typeof(Entry)
	
	if ValueType == "UDim" then
		return Entry
	end
	local Success, Result = pcall(function(): UDim? --[[ Line: 326 ]]
		-- upvalues: ValueType (copy), Entry (copy)
		if ValueType == "string" then
			local Parts = string.split(Entry, ",")
			
			if #Parts == 2 then
				return UDim.new(tonumber(Parts[1]) or 0, tonumber(Parts[2]) or 0)
			else
				error("Not enough components in string to parse UDim")
				
				return
			end
		elseif ValueType == "table" then
			if #Entry == 2 then
				return UDim.new(tonumber(Entry[1]) or 0, tonumber(Entry[2]) or 0)
			else
				error("Not enough components in table to parse UDim")
				
				return
			end
		elseif ValueType == "number" then
			return UDim.new(0, Entry)
		else
			error(`Invalid input type for parseUDim: {ValueType}`)
		end
	end)
	
	if Success and Result then
		return Result
	else
		error({
			parserName = "parseUDim",
			message = if typeof(Result) == "string" then Result else nil
		})
	end
end

local function parseColor3(EndColor, p4, p5, p6) --[[ Line: 357 ]]
	-- upvalues: parseFoundationTokenHelper (copy)
	local ValueType = typeof(EndColor)
	
	if ValueType == "Color3" then
		return EndColor
	end
	local Success, Result = pcall(function() --[[ Line: 368 ]]
		-- upvalues: ValueType (copy), EndColor (copy), p4 (copy), p5 (copy), p6 (copy), parseFoundationTokenHelper (upval)
		if ValueType == "string" then
			local Success, Result = pcall(function(): Color3 --[[ Line: 371 ]]
				-- upvalues: EndColor (upval)
				return Color3.fromHex(EndColor)
			end)
			
			if Success and Result then
				return Result
			end
			local Success1, Result1 = pcall(function() --[[ Line: 381 ]]
				-- upvalues: EndColor (upval), p4 (upval), p5 (upval), p6 (upval), parseFoundationTokenHelper (upval)
				return (parseFoundationTokenHelper(EndColor, "table", "parseColorToken", p4))
			end)
			
			if Success1 and typeof(Result1) == "table" and Result1.Color3 ~= nil then
				return Result1.Color3
			else
				error(`Invalid input for Color3: {EndColor}`)
				
				return
			end
		elseif ValueType == "table" then
			return Color3.fromRGB(EndColor.r, EndColor.g, EndColor.b)
		else
			error(`Invalid input type for parseColor3: {ValueType}`)
		end
	end)
	
	if Success and Result then
		return Result
	else
		error({
			parserName = "parseColor3",
			message = if typeof(Result) == "string" then Result elseif typeof(Result) == "table" then Result.message else nil
		})
	end
end

local _Color3 = Color3.new(0, 0, 0)
local config = {
	startOpacity = 0,
	endOpacity = 1,
	degree = 270,
	startColor = _Color3,
	endColor = _Color3
}

local function isValidGradient(p7): boolean --[[ Line: 419 ]]
	return typeof(p7) == "table" and (typeof(p7.startColor) == "Color3" and (typeof(p7.endColor) == "Color3" and (typeof(p7.startOpacity) == "number" and (typeof(p7.endOpacity) == "number" and typeof(p7.degree) == "number"))))
end

local function parseGradient(p7, p8, p9, p10) --[[ Line: 443 ]]
	-- upvalues: isValidGradient (copy), parseColor3 (copy), config (copy)
	local ValueType = typeof(p7)
	
	if ValueType ~= "table" then
		error({
			parserName = "parseGradient",
			message = `invalid input type for parseGradient: {ValueType}`
		})
	elseif isValidGradient(p7) then
		return p7
	end
	local Result = nil
	if p7.startColor then
		local Success
		Success, Result = pcall(function() --[[ Line: 463 ]]
			-- upvalues: parseColor3 (upval), p7 (copy), p8 (copy), p9 (copy), p10 (copy)
			return parseColor3(p7.startColor, p8, p9, p10)
		end)
		
		if not Success then
			error({
				parserName = "parseGradient",
				message = if typeof(Result) == "string" then Result else "failed to parse startColor field"
			})
		end
	else
		Result = config.startColor
	end
	local Result1 = nil
	if p7.endColor then
		local Success1
		Success1, Result1 = pcall(function() --[[ Line: 478 ]]
			-- upvalues: parseColor3 (upval), p7 (copy), p8 (copy), p9 (copy), p10 (copy)
			return parseColor3(p7.endColor, p8, p9, p10)
		end)
		
		if not Success1 then
			error({
				parserName = "parseGradient",
				message = if typeof(Result1) == "string" then Result1 else "failed to parse endColor field"
			})
		end
	else
		Result1 = config.endColor
	end
	local StartOpacity = nil
	
	if typeof(p7.startOpacity) == "number" then
		StartOpacity = p7.startOpacity
	elseif p7.startOpacity ~= nil then
		error({
			parserName = "parseGradient",
			message = `invalid input type for startOpacity: {typeof(p7.startOpacity)}`
		})
	end
	local EndOpacity = nil
	
	if typeof(p7.endOpacity) == "number" then
		EndOpacity = p7.endOpacity
	elseif p7.endOpacity ~= nil then
		error({
			parserName = "parseGradient",
			message = `invalid input type for endOpacity: {typeof(p7.endOpacity)}`
		})
	end
	local Degree = nil
	
	if typeof(p7.degree) == "number" then
		Degree = p7.degree
	elseif p7.degree ~= nil then
		error({
			parserName = "parseGradient",
			message = `invalid input type for degree: {typeof(p7.degree)}`
		})
	end
	return {
		startColor = Result,
		endColor = Result1,
		startOpacity = StartOpacity or config.startOpacity,
		endOpacity = EndOpacity or config.endOpacity,
		degree = Degree or config.degree
	}
end

local config1 = {
	truncate_arrows = true,
	squircles = true,
	gradient = true,
	component_assets = true,
	chat_bubble = true,
	icons = true
}

local _ = function(Text: string): boolean --[[ Line: 552 | Named "isValidIconString" ]]
	-- upvalues: config1 (copy)
	local Parts = Text:split("/")
	
	return if Parts and #Parts > 1 and config1[Parts[1]] then true else false
end

local function parseIcon(Image, _, _, _) --[[ Line: 565 ]]
	-- upvalues: GetImageDataFunction (copy), Images (copy)
	local v1 = nil
	
	if typeof(Image) == "table" and typeof(Image.ImageRectOffset) == "Vector2" and typeof(Image.Image) == "string" and typeof(Image.ImageRectSize) == "Vector2" then
		return Image
	end
	if typeof(Image) == "string" then
		local Success
		Success, v92 = pcall(function() --[[ Line: 575 ]]
			-- upvalues: GetImageDataFunction (upval), Image (copy), Images (upval)
			return GetImageDataFunction(Image) or Images[Image]
		end)
		
		if not Success or not v1 then
			error({
				parserName = "parseIcon",
				message = `No icon found for {Image}`
			})
		end
	end
	if not v1 then
		error({
			parserName = "parseIcon",
			message = `Bad input for icon: {Image}`
		})
	end
	return v1
end

local _ = function(p11): boolean --[[ Line: 608 | Named "isCallableTable" ]]
	if typeof(p11) == "table" then
		local Meta = getmetatable(p11)
		
		if Meta and type(Meta.__call) == "function" then
			return true
		end
	end
	return false
end

local function parseCallback(p11, SduiContext, AnalyticsContext, _) --[[ Line: 619 ]]
	-- upvalues: GetSduiActionHandlerRegistryModule (copy), ExecuteActionModule (copy), SduiErrorsModule (copy)
	local v2 = nil
	local Flag = nil
	
	if typeof(p11) == "function" then
		return p11
	end
	repeat
		if typeof(p11) == "table" then
			local Meta = getmetatable(p11)
			
			if Meta and type(Meta.__call) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	if Flag then
		p11.analyticsContext = AnalyticsContext
		p11.sduiContext = SduiContext
		
		return p11
	end
	local HasHandler = nil
	if typeof(p11) == "table" and typeof(p11.actionType) == "string" then
		local ActionHandlerConfig = GetSduiActionHandlerRegistryModule().getActionHandlerConfig(p11.actionType)
		HasHandler = ActionHandlerConfig ~= nil and (ActionHandlerConfig.handler ~= nil or ActionHandlerConfig.telemetryHandler ~= nil)
	else
		HasHandler = false
	end
	if HasHandler then
		v2 = p11
	end
	if not v2 then
		local ActionType = typeof(p11) == "table" and p11.actionType or "unknown"
		error({
			parserName = "parseCallback",
			message = `Could not find action for: {p11} actionType: {ActionType}`,
			overrideValue = function() --[[ Line: 656 ]]
				-- upvalues: SduiContext (copy), SduiErrorsModule (upval), ActionType (copy)
				SduiContext.dependencies.logger.reportCounter(SduiErrorsModule.SduiCounterName.ExecutedInvalidAction, { name = ActionType })
			end
		})
		
		return
	end
	local config = {
		analyticsContext = AnalyticsContext,
		sduiContext = SduiContext
	}
	setmetatable(config, {
		__call = function(p12, p13) --[[ Line: 644 ]]
			-- upvalues: ExecuteActionModule (upval), v2 (ref)
			return ExecuteActionModule(v2, p12.analyticsContext, p12.sduiContext, p13)
		end
	})
	
	return config
end

local function parseUiComponent(ComponentConfig, SduiContext, ParentAnalyticsContext, Eager) --[[ Line: 715 ]]
	-- upvalues: SduiBuilderProcessingPhase (copy), SduiBuilderModule (copy), GetSduiComponentWrapperModule (copy), ReactModule (copy)
	local Success = nil
	local Result = nil
	if Eager == SduiBuilderProcessingPhase.Eager then
		Success, Result = pcall(function() --[[ Line: 725 ]]
			-- upvalues: ComponentConfig (copy), SduiBuilderModule (upval), SduiContext (copy), ParentAnalyticsContext (copy)
			if typeof(ComponentConfig) ~= "table" then
				error(`Invalid input type {typeof(ComponentConfig)}`)
			end
			local ParseUiComponent, ParseUiComponent2 = SduiBuilderModule.tryCreateEagerProcessedComponentConfig(ComponentConfig, SduiContext, "parseUiComponent", ParentAnalyticsContext)
			
			if ParseUiComponent then
				return ParseUiComponent2
			else
				error("Unable to parse componentConfig during Eager phase")
			end
		end)
	else
		Success, Result = pcall(function() --[[ Line: 743 ]]
			-- upvalues: ComponentConfig (copy), GetSduiComponentWrapperModule (upval), ReactModule (upval), SduiContext (copy), ParentAnalyticsContext (copy)
			if typeof(ComponentConfig) == "table" then
				return ReactModule.createElement(GetSduiComponentWrapperModule(ComponentConfig), {
					componentConfig = ComponentConfig,
					sduiContext = SduiContext,
					parentAnalyticsContext = ParentAnalyticsContext,
					debugName = `parsedUiComponent-{ComponentConfig.componentType}`
				})
			else
				error(`Invalid input type {typeof(ComponentConfig)}`)
			end
		end)
	end
	if Success and Result then
		return Result
	else
		error({
			parserName = "parseUiComponent",
			message = if typeof(Result) == "string" then Result else nil
		})
	end
end

local function parseVector2(Entry, _, _, _) --[[ Line: 770 ]]
	local ValueType = typeof(Entry)
	
	if ValueType == "Vector2" then
		return Entry
	end
	local Success, Result = pcall(function(): Vector2? --[[ Line: 781 ]]
		-- upvalues: ValueType (copy), Entry (copy)
		if ValueType == "string" then
			local Parts = string.split(Entry, ",")
			
			if #Parts == 2 then
				return Vector2.new(tonumber(Parts[1]) or 0, tonumber(Parts[2]) or 0)
			else
				error("Not enough components in string to parse Vector2")
				
				return
			end
		elseif ValueType ~= "table" then
			error(`Invalid input type for parseVector2: {ValueType}`)
			
			return
		else
			if #Entry == 2 then
				return Vector2.new(tonumber(Entry[1]) or 0, tonumber(Entry[2]) or 0)
			else
				error("Not enough components in table to parse Vector2")
			end
		end
	end)
	
	if Success and Result then
		return Result
	else
		error({
			parserName = "parseVector2",
			message = if typeof(Result) == "string" then Result else nil
		})
	end
end

local function parseNumber(p12, p13, p14, p15) --[[ Line: 809 ]]
	-- upvalues: parseFoundationTokenHelper (copy)
	local ValueType = typeof(p12)
	
	if ValueType == "number" then
		return p12
	end
	if ValueType ~= "string" then
		error({
			parserName = "parseNumber",
			message = `Invalid input type for parseNumber: {ValueType}`
		})
		
		return
	end
	local Success, Result = pcall(function(): number --[[ Line: 819 ]]
		-- upvalues: p12 (copy)
		return (tonumber(p12))
	end)
	
	if not Success or Result == nil then
		Success, Result = pcall(function() --[[ Line: 825 ]]
			-- upvalues: p12 (copy), p13 (copy), p14 (copy), p15 (copy), parseFoundationTokenHelper (upval)
			return (parseFoundationTokenHelper(p12, "number", "parseNumberToken", p13))
		end)
	end
	if Success and Result then
		return Result
	else
		error({
			parserName = "parseNumber",
			message = if typeof(Result) == "string" then Result else `Failed to parse string {p12} to number`
		})
	end
end

local function parseInteger(p16, _, _, _) --[[ Line: 845 ]]
	local ValueType = typeof(p16)
	
	if ValueType == "number" then
		return p16
	end
	if ValueType ~= "string" then
		error({
			parserName = "parseInteger",
			message = `Invalid input type for parseInteger: {ValueType}`
		})
		
		return
	end
	local Success, Result = pcall(function(): number --[[ Line: 855 ]]
		-- upvalues: p16 (copy)
		return (tonumber(p16))
	end)
	
	if not Success or not Result then
		error({
			parserName = "parseInteger",
			message = if typeof(Result) == "string" then Result else `Failed to parse string {p16} to number`
		})
		
		return
	end
	if p16 ~= tostring((math.round(Result))) then
		error({
			parserName = "parseInteger",
			message = if typeof(Result) == "string" then Result else `Unexpected output {Result} does not match input {p16}.`
		})
	end
	return Result
end

local function parseBoolean(Text: string, _, _, _) --[[ Line: 883 ]]
	local ValueType = typeof(Text)
	
	if ValueType == "boolean" then
		return Text
	elseif ValueType == "number" then
		if Text == 1 then
			return true
		elseif Text == 0 then
			return false
		else
			error({
				parserName = "parseBoolean",
				message = `Failed to parse number {Text} to boolean`
			})
			
			return
		end
	elseif ValueType ~= "string" then
		error({
			parserName = "parseBoolean",
			message = `Invalid input type for parseBoolean: {ValueType}`
		})
		
		return
	else
		local Lowered = string.lower(Text)
		
		if Lowered == "t" or Lowered == "true" then
			return true
		elseif Lowered == "f" or Lowered == "false" then
			return false
		else
			error({
				parserName = "parseBoolean",
				message = `Failed to parse string {Text} to boolean`
			})
		end
	end
end

local function parseString(p17, _, _, _) --[[ Line: 921 ]]
	local ValueType = typeof(p17)
	
	if ValueType == "string" then
		return p17
	elseif ValueType == "number" or ValueType == "boolean" then
		return (tostring(p17))
	else
		error({
			parserName = "parseString",
			message = `Invalid input type for parseString: {ValueType}`
		})
	end
end

local function parseImageString(Text: string, _, _, _): string --[[ Line: 942 ]]
	-- upvalues: SduiResponsiveHelpersModule (copy)
	local ValueType = typeof(Text)
	
	if ValueType ~= "string" then
		error({
			parserName = "parseImageString",
			message = `Invalid input type for parseImageString: {ValueType}`
		})
	end
	local Parts = Text:split("://")
	
	if #Parts <= 1 or Parts[1] ~= "rbxthumb" then
		return Text
	end
	local t = {}
	
	for _, Text1 in Parts[2]:split("&") do
		local v3 = Text1:split("=")
		
		if #v3 == 2 then
			t[v3[1]] = v3[2]
		end
	end
	if t.mw == nil or t.mh == nil then
		return Text
	end
	local Number: number? = tonumber(t.w)
	local Number1: number? = tonumber(t.h)
	local Number2: number? = tonumber(t.mw)
	local Number3: number? = tonumber(t.mh)
	
	if Number == nil or Number1 == nil or Number2 == nil or Number3 == nil or t.type == nil or t.id == nil then
		error({
			parserName = "parseImageString",
			message = `Invalid params for rbxthumb in parseImageString: {Text}`
		})
	end
	assert(Number, "inputWidth must exist")
	assert(Number1, "inputHeight must exist")
	assert(Number2, "inputWidth must exist")
	assert(Number3, "inputHeight must exist")
	local AdaptThumbnailDimensionsResult, AdaptThumbnailDimensionsResult2 = SduiResponsiveHelpersModule.adaptThumbnailDimensions(Number, Number1, Number2, Number3, t.type)
	local RbxthumbName: string = `rbxthumb://type={t.type}&id={t.id}&w={AdaptThumbnailDimensionsResult}&h={AdaptThumbnailDimensionsResult2}`
	t.w = nil
	t.h = nil
	t.mw = nil
	t.mh = nil
	t.id = nil
	t.type = nil
	
	for i, value in t do
		RbxthumbName ..= string.format("&%s=%s", i, value)
	end
	return RbxthumbName
end

local function parseImageSetOrImage(Text: string, p18, p19, p20) --[[ Line: 1018 ]]
	-- upvalues: config1 (copy), parseIcon (copy), parseImageString (copy)
	local ValueType = typeof(Text)
	
	if ValueType == "table" then
		return Text
	end
	if ValueType ~= "string" then
		error({
			parserName = "parseImageSetOrImage",
			message = `Invalid input type for parseImageSetOrImage: {ValueType}`
		})
	end
	local Parts = Text:split("/")
	local v4: boolean = if Parts and #Parts > 1 and config1[Parts[1]] then true else false
	
	return if v4 then parseIcon(Text, p18, p19, p20) else parseImageString(Text, p18, p19, p20)
end

local function isValidFocusNavActions(p21): boolean --[[ Line: 1040 ]]
	-- upvalues: FocusNavigationEventNameEnum (copy)
	if typeof(p21) ~= "table" then
		return false
	end
	local Flag: boolean? = nil
	local Flag1: boolean? = nil
	local Keys = p21.keys
	
	if Keys then
		if typeof(Keys) ~= "table" then
			return false
		end
		for i, key in Keys do
			if typeof(i) ~= "EnumItem" then
				return false
			end
			if FocusNavigationEventNameEnum[key] == nil then
				return false
			end
			Flag = true
		end
	end
	local Events = p21.events
	
	if Events then
		if typeof(Events) ~= "table" then
			return false
		end
		for i1, event in Events do
			if FocusNavigationEventNameEnum[i1] == nil then
				return false
			end
			if typeof(event) ~= "table" then
				return false
			end
			if typeof(event.handler) ~= "function" then
				return false
			end
			Flag1 = true
		end
	end
	return Flag or (Flag1 or false)
end

local function parseFocusNavActions(p22, SduiContext, AnalyticsContext, p23) --[[ Line: 1098 ]]
	-- upvalues: isValidFocusNavActions (copy), FocusNavigationEventNameEnum (copy), t (copy), parseLuaTableEnumHelper (copy), t1 (copy), parseEngineEnumHelper (copy), InputHandlersModule (copy), parseCallback (copy)
	if isValidFocusNavActions(p22) then
		return p22
	end
	local ValueType = typeof(p22)
	
	if ValueType ~= "table" then
		error({
			parserName = "parseFocusNavActions",
			message = `Invalid input type for parseFocusNavActions: {ValueType}`
		})
	end
	assert(typeof(p22) == "table", "input must be table")
	local Success, Result = pcall(function() --[[ Line: 1117 ]]
		-- upvalues: FocusNavigationEventNameEnum (upval), t (upval), parseLuaTableEnumHelper (upval), p22 (copy), ValueType (copy), t1 (upval), parseEngineEnumHelper (upval), SduiContext (copy), AnalyticsContext (copy), p23 (copy), InputHandlersModule (upval), parseCallback (upval)
		if t[FocusNavigationEventNameEnum] == nil then
			local t2 = {}
			
			for _, value in FocusNavigationEventNameEnum do
				t2[value] = true
			end
			local v5 = "string"
			
			t[FocusNavigationEventNameEnum] = function(p24, _, _, _) --[[ Line: 200 ]]
				-- upvalues: parseLuaTableEnumHelper (upval), v5 (copy), FocusNavigationEventNameEnum (copy), t2 (copy)
				return parseLuaTableEnumHelper(p24, v5, FocusNavigationEventNameEnum, t2)
			end
		end
		local Entry = t[FocusNavigationEventNameEnum]
		local Flag: boolean? = nil
		local Flag1: boolean? = nil
		local Keys = p22.keys
		
		if Keys then
			if typeof(Keys) ~= "table" then
				error({
					parserName = "parseFocusNavActions",
					message = `Invalid input type for keys: {ValueType}`
				})
			end
			assert(typeof(Keys) == "table", "keys must be table")
			local KeyCode = Enum.KeyCode
			
			if t1[KeyCode] == nil then
				t1[KeyCode] = function(p24, _, _, _) --[[ Line: 245 ]]
					-- upvalues: parseEngineEnumHelper (upval), KeyCode (copy)
					return parseEngineEnumHelper(p24, KeyCode)
				end
			end
			local Entry1 = t1[KeyCode]
			
			for i, key in Keys do
				local v6 = nil
				
				if typeof(i) == "string" then
					Keys[i] = nil
					v6 = Entry1(i, SduiContext, AnalyticsContext, p23)
				end
				Keys[v6] = Entry(key, SduiContext, AnalyticsContext, p23)
				Flag = true
			end
		end
		local Events = p22.events
		
		if Events then
			if typeof(Events) ~= "table" then
				error({
					parserName = "parseFocusNavActions",
					message = `Invalid input type for events: {ValueType}`
				})
			end
			assert(typeof(Events) == "table", "events must be table")
			
			for i1, event in Events do
				if typeof(event) == "table" and typeof(event.handler) ~= "function" then
					Events[i1] = nil
					Events[Entry(i1, SduiContext, AnalyticsContext, p23)] = {
						handler = InputHandlersModule.onRelease(parseCallback(event, SduiContext, AnalyticsContext, p23))
					}
					Flag1 = true
				end
			end
		end
		if not Flag and not Flag1 then
			error("Invalid format. keys or events required")
		end
		return { keys = Keys, events = Events }
	end)
	
	if Success and Result then
		return Result
	elseif typeof(Result) == "table" then
		Result.parserName = "parseFocusNavActions"
		Result.overrideValue = nil
		error(Result)
		
		return
	else
		error({
			parserName = "parseFocusNavActions",
			message = if typeof(Result) == "string" then Result else "Failed to parse focus nav event"
		})
	end
end

local t2 = {}

return {
	parseBooleanProp_ = parseBoolean,
	parseCallbackProp_ = parseCallback,
	parseColor3Prop_ = parseColor3,
	parseGradientProp_ = parseGradient,
	parseIconProp_ = parseIcon,
	parseImageStringProp_ = parseImageString,
	parseIntegerProp_ = parseInteger,
	parseLazyCallbackProp_ = function(p24, _, _, _) --[[ Line: 666 ]]
		return p24
	end,
	parseLazyUiComponentProp_ = function(p24, p25, p26, Eager) --[[ Line: 676 ]]
		-- upvalues: SduiBuilderProcessingPhase (copy), SduiBuilderModule (copy)
		if Eager ~= SduiBuilderProcessingPhase.Eager then
			return p24
		end
		local Success, Result = pcall(function() --[[ Line: 684 ]]
			-- upvalues: p24 (copy), SduiBuilderModule (upval), p25 (copy), p26 (copy)
			if typeof(p24) ~= "table" then
				error(`Invalid input type {typeof(p24)}`)
			end
			local ParseUiComponent, ParseUiComponent2 = SduiBuilderModule.tryCreateEagerProcessedComponentConfig(p24, p25, "parseUiComponent", p26)
			
			if ParseUiComponent then
				return ParseUiComponent2
			else
				error("Unable to parse componentConfig during Eager phase")
			end
		end)
		
		if Success and Result then
			return Result
		else
			error({
				parserName = "parseLazyUiComponent",
				message = if typeof(Result) == "string" then Result else nil
			})
		end
	end,
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
	getArrayMetatableParser = function(Key) --[[ Line: 1198 ]]
		-- upvalues: t2 (copy)
		if t2[Key] == nil then
			t2[Key] = setmetatable({}, {
				__index = function(_, p24) --[[ Line: 1201 ]]
					-- upvalues: Key (copy)
					return if type(p24) == "number" then Key else nil
				end
			})
		end
		return t2[Key]
	end,
	getEngineEnumParser = function(Key) --[[ Line: 255 ]]
		-- upvalues: t1 (copy), parseEngineEnumHelper (copy)
		if t1[Key] == nil then
			t1[Key] = function(p24, _, _, _) --[[ Line: 245 ]]
				-- upvalues: parseEngineEnumHelper (upval), Key (copy)
				return parseEngineEnumHelper(p24, Key)
			end
		end
		return t1[Key]
	end,
	getLuaTableEnumParser = function(Key, p24) --[[ Line: 210 ]]
		-- upvalues: t (copy), parseLuaTableEnumHelper (copy)
		if t[Key] == nil then
			local t3 = {}
			
			for _, value in Key do
				t3[value] = true
			end
			t[Key] = function(p25, _, _, _) --[[ Line: 200 ]]
				-- upvalues: parseLuaTableEnumHelper (upval), p24 (copy), Key (copy), t3 (copy)
				return parseLuaTableEnumHelper(p25, p24, Key, t3)
			end
		end
		return t[Key]
	end,
	isValidActionConfig = function(p25, _): boolean --[[ Line: 596 ]]
		-- upvalues: GetSduiActionHandlerRegistryModule (copy)
		if typeof(p25) == "table" and typeof(p25.actionType) == "string" then
			local ActionHandlerConfig = GetSduiActionHandlerRegistryModule().getActionHandlerConfig(p25.actionType)
			
			return ActionHandlerConfig ~= nil and (ActionHandlerConfig.handler ~= nil or ActionHandlerConfig.telemetryHandler ~= nil)
		else
			return false
		end
	end,
	isValidImageSet = function(Image): boolean --[[ Line: 530 ]]
		return typeof(Image) == "table" and typeof(Image.ImageRectOffset) == "Vector2" and typeof(Image.Image) == "string" and typeof(Image.ImageRectSize) == "Vector2"
	end,
	isValidGradient = isValidGradient,
	isValidFocusNavActions = isValidFocusNavActions,
	safeParseBoolean = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseBoolean (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseBoolean (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseBoolean(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseCallback = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseCallback (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseCallback (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseCallback(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseColor3 = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseColor3 (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseColor3 (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseColor3(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseGradient = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseGradient (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseGradient (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseGradient(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseIcon = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseIcon (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseIcon (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseIcon(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseImageString = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseImageString (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseImageString (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseImageString(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseInteger = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseInteger (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseInteger (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseInteger(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseNumber = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseNumber (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseNumber (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseNumber(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseString = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseString (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseString (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseString(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseUDim = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseUDim (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseUDim (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseUDim(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseUDim2 = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseUDim2 (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseUDim2 (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseUDim2(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseUiComponent = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseUiComponent (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseUiComponent (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseUiComponent(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseVector2 = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseVector2 (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseVector2 (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseVector2(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseNumberToken = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseNumberToken (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseNumberToken (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseNumberToken(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseTypographyToken = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseTypographyToken (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseTypographyToken (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseTypographyToken(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseFontFromTypographyToken = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseFontFromTypographyToken (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseFontFromTypographyToken (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseFontFromTypographyToken(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseColorToken = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseColorToken (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseColorToken (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseColorToken(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseFocusNavActions = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseFocusNavActions (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseFocusNavActions (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseFocusNavActions(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end,
	safeParseImageSetOrImageProp_ = function(p25, p26, p27, p28) --[[ Line: 45 ]]
		-- upvalues: parseImageSetOrImage (copy), CryoModule (copy), SduiParseHelpersModule (copy), SduiErrorType (copy)
		local Success, Result = pcall(function() --[[ Line: 46 ]]
			-- upvalues: parseImageSetOrImage (upval), p25 (copy), p26 (copy), p27 (copy), p28 (copy)
			return parseImageSetOrImage(p25, p26, p27, p28)
		end)
		
		if Success then
			return Result
		else
			p26.dependencies.logger.reportError(SduiErrorType.FailedToParse, CryoModule.Dictionary.join(if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}, { value = SduiParseHelpersModule.stringifyValue(p25) }), p26.appPage)
			
			return if typeof(Result) == "table" then Result.overrideValue else nil
		end
	end
}