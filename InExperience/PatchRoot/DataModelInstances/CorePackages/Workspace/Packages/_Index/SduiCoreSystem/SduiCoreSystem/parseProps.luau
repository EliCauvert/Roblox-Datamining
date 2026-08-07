local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local sduiBuilderTypesModule = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiComponentType)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorType = require(sduiCoreSystem.SduiErrors).SduiErrorType
local sduiParseHelpersModule = require(sduiCoreSystem.SduiParseHelpers)
local sduiBuilderProcessingPhase = sduiBuilderTypesModule.SduiBuilderProcessingPhase
local serverBindingPropMap = require(parent.SduiCompat).ServerBindingPropMap

local function parseProps(p0, p1, p2, p3, p4, p5, p6) --[[ line: 32 ]]
	-- upvalues: sduiBuilderProcessingPhase (ref), serverBindingPropMap (ref), parseProps (ref), reactModule (ref), sduiErrorType (ref), cryoModule (ref), sduiParseHelpersModule (ref)
	if not p1 then return end
	assert(p1, "props must exist")
	p5 = p5 or p3.componentDefinitions:getPropParsers(p0)
	
	if not p5 then return end
	assert(p5, "componentInterface must exist")
	
	for i, v in p1 do
		local var7 = p5[i]
		
		if var7 and (p6 ~= sduiBuilderProcessingPhase.Render or p3.componentDefinitions:doesParserRequireRenderContext(var7)) then
			local ok, status = pcall(function() --[[ line: 66 ]]
				-- upvalues: var7 (ref), v (ref), serverBindingPropMap (copy), parseProps (copy), p0 (ref), p2 (ref), p3 (ref), p4 (ref), p6 (ref), reactModule (copy)
				if typeof(var7) == "table" then
					if typeof(v) ~= "table" then
						error({
							message = `Invalid input {typeof(v)} for prop. Expected table`
						})
					end
					local var8 = nil
					
					for i, v_1 in v do
						local var9 = serverBindingPropMap[i]
						
						if var9 then
							var8 = var8 or {}
							var8[i] = var9
						end
					end
					if var8 then
						for i_1, v_2 in var8 do
							v[v_2] = v[i_1]
						end
					end
					parseProps(p0, v, p2, p3, p4, var7, p6)
					
					return v
				else
					return if v == "NULL_PROP" then reactModule.None else var7(v, p3, p4, p6)
				end
			end)
			
			if not ok then
				p3.dependencies.logger.reportError(sduiErrorType.FailedToParseProp, cryoModule.Dictionary.union({
					name = p2,
					componentType = p0,
					propName = i,
					value = sduiParseHelpersModule.stringifyValue(v)
				}, if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}), p3.appPage)
				
				if typeof(status) == "table" then
					if status.overrideValue then
						p1[i] = status.overrideValue
					else
						p1[i] = nil
					end
				end
			elseif status == reactModule.None then
				p1[i] = nil
			else
				p1[i] = status
			end
		end
	end
end

return parseProps