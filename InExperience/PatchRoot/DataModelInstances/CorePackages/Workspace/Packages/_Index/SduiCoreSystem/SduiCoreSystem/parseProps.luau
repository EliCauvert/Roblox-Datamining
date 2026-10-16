local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local _ = require(SduiCoreSystem.SduiComponentType)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local SduiErrorType = require(SduiCoreSystem.SduiErrors).SduiErrorType
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local SduiBuilderProcessingPhase = require(SduiCoreSystem.SduiBuilderTypes).SduiBuilderProcessingPhase
local ServerBindingPropMap = require(Parent.SduiCompat).ServerBindingPropMap

local function parseProps(ComponentType, Messages, Name, p1, p2, p3, Render) --[[ Line: 32 ]]
	-- upvalues: SduiBuilderProcessingPhase (copy), ServerBindingPropMap (copy), parseProps (copy), ReactModule (copy), SduiErrorType (copy), CryoModule (copy), SduiParseHelpersModule (copy)
	if not Messages then return end
	assert(Messages, "props must exist")
	local P5 = p3 or p1.componentDefinitions:getPropParsers(ComponentType)
	
	if not P5 then return end
	assert(P5, "componentInterface must exist")
	
	for PropName, message in Messages do
		local Callback = P5[PropName]
		
		if Callback and (Render ~= SduiBuilderProcessingPhase.Render or p1.componentDefinitions:doesParserRequireRenderContext(Callback)) then
			local Success, Result = pcall(function() --[[ Line: 66 ]]
				-- upvalues: Callback (copy), message (copy), ServerBindingPropMap (upval), parseProps (upval), ComponentType (copy), Name (copy), p1 (copy), p2 (copy), Render (copy), ReactModule (upval)
				if typeof(Callback) ~= "table" then
					return if message == "NULL_PROP" then ReactModule.None else Callback(message, p1, p2, Render)
				end
				if typeof(message) ~= "table" then
					error({
						message = `Invalid input {typeof(message)} for prop. Expected table`
					})
				end
				local v1 = nil
				
				for i, _ in message do
					local ServerBindingProp = ServerBindingPropMap[i]
					
					if ServerBindingProp then
						v1 = v1 or {}
						v1[i] = ServerBindingProp
					end
				end
				if v1 then
					for i1, value in v1 do
						message[value] = message[i1]
					end
				end
				parseProps(ComponentType, message, Name, p1, p2, Callback, Render)
				
				return message
			end)
			
			if not Success then
				p1.dependencies.logger.reportError(SduiErrorType.FailedToParseProp, CryoModule.Dictionary.union({
					name = Name,
					componentType = ComponentType,
					propName = PropName,
					value = SduiParseHelpersModule.stringifyValue(message)
				}, if typeof(Result) == "table" then Result elseif typeof(Result) == "string" then { message = Result } else {}), p1.appPage)
				
				if typeof(Result) == "table" then
					if Result.overrideValue then
						Messages[PropName] = Result.overrideValue
					else
						Messages[PropName] = nil
					end
				end
			elseif Result == ReactModule.None then
				Messages[PropName] = nil
			else
				Messages[PropName] = Result
			end
		end
	end
end

return parseProps