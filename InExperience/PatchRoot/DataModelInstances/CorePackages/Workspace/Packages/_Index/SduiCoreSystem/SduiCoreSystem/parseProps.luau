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

local function parseProps(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: sduiBuilderProcessingPhase (ref), serverBindingPropMap (ref), parseProps (ref), reactModule (ref), sduiErrorType (ref), cryoModule (ref), sduiParseHelpersModule (ref)
	if not p2 then return end
	assert(p2, "props must exist")
	p6 = p6 or p4.componentDefinitions:getPropParsers(p1)
	
	if not p6 then return end
	assert(p6, "componentInterface must exist")
	
	for i, v in p2 do
		local var1 = p6[i]
		
		if var1 and (p7 ~= sduiBuilderProcessingPhase.Render or p4.componentDefinitions:doesParserRequireRenderContext(var1)) then
			local ok, status = pcall(function()
				-- upvalues: var1 (ref), v (ref), serverBindingPropMap (copy), parseProps (copy), p1 (ref), p3 (ref), p4 (ref), p5 (ref), p7 (ref), reactModule (copy)
				if typeof(var1) == "table" then
					if typeof(v) ~= "table" then
						error({
							message = `Invalid input {typeof(v)} for prop. Expected table`
						})
					end
					local var2 = nil
					
					for i, v_1 in v do
						local var3 = serverBindingPropMap[i]
						
						if var3 then
							var2 = var2 or {}
							var2[i] = var3
						end
					end
					if var2 then
						for i_1, v_2 in var2 do
							v[v_2] = v[i_1]
						end
					end
					parseProps(p1, v, p3, p4, p5, var1, p7)
					
					return v
				else
					return if v == "NULL_PROP" then reactModule.None else var1(v, p4, p5, p7)
				end
			end)
			
			if not ok then
				p4.dependencies.logger.reportError(sduiErrorType.FailedToParseProp, cryoModule.Dictionary.union({
					name = p3,
					componentType = p1,
					propName = i,
					value = sduiParseHelpersModule.stringifyValue(v)
				}, if typeof(status) == "table" then status elseif typeof(status) == "string" then { message = status } else {}), p4.appPage)
				
				if typeof(status) == "table" then
					if status.overrideValue then
						p2[i] = status.overrideValue
					else
						p2[i] = nil
					end
				end
			elseif status == reactModule.None then
				p2[i] = nil
			else
				p2[i] = status
			end
		end
	end
end

return parseProps