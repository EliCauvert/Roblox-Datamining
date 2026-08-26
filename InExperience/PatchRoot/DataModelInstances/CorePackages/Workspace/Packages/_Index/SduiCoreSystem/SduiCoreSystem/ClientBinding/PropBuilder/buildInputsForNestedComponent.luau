local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local splitDottedPathModule = require(sduiCoreSystem.ClientBinding.splitDottedPath)
local _ = require(parent.Signals)
local fFlagSduiFormatArgFormatters = require(parent.SharedFlags).FFlagSduiFormatArgFormatters
local fFlagSduiClientPageScope = require(parent.SharedFlags).FFlagSduiClientPageScope
local fFlagSduiRenderPerf = require(parent.SharedFlags).FFlagSduiRenderPerf

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), sduiPropUtilsModule (ref), fFlagSduiClientPageScope (ref), fFlagSduiFormatArgFormatters (ref)
	if p2 then
		for i, v in p2 do
			if v.kind then
				local type = v.kind.type
				
				if type == "binding_path" then
					local value = v.kind.value
					local var1, _ = sduiPropUtilsModule.resolveBindingPathValue(p4 or false, if fFlagSduiRenderPerf then splitDottedPathModule(value) else string.split(value, "."), p3, p1, nil, false, if fFlagSduiClientPageScope then p6 else nil)
					p5[i] = var1
				elseif type == "literal" then
					local value = v.kind.value and (v.kind.value.kind and v.kind.value.kind.value)
					
					if value == nil then
						error(`Failed to determine value for nested input arg {i}`)
					end
					p5[i] = value
				elseif type == "translation" then
					if p6 and p6.resolveLocalizedLiteral then
						p5[i] = p6.resolveLocalizedLiteral(v.kind.value)
					end
				elseif fFlagSduiFormatArgFormatters and type == "format" then
					p5[i] = sduiPropUtilsModule.generateFormatStringPropValue(v.kind.value, p3, p6, p1)(p4 or false).data
				else
					error(`Unrecognized inputDataType for key {i}`)
				end
			end
		end
	end
end