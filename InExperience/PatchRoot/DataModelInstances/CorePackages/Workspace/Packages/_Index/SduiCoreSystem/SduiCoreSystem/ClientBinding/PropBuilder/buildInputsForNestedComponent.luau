local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local splitDottedPathModule = require(sduiCoreSystem.ClientBinding.splitDottedPath)
local _ = require(parent.Signals)
local fFlagSduiLocalizedLiterals = require(parent.SharedFlags).FFlagSduiLocalizedLiterals
local fFlagSduiFormatArgFormatters = require(parent.SharedFlags).FFlagSduiFormatArgFormatters
local fFlagSduiClientPageScope = require(parent.SharedFlags).FFlagSduiClientPageScope
local fFlagSduiRenderPerf = require(parent.SharedFlags).FFlagSduiRenderPerf

return function(p0, p1, p2, p3, p4, p5) --[[ line: 29 | named "buildInputsForNestedComponent" ]]
	-- upvalues: fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), sduiPropUtilsModule (ref), fFlagSduiClientPageScope (ref), fFlagSduiLocalizedLiterals (ref), fFlagSduiFormatArgFormatters (ref)
	if p1 then
		for i, v in p1 do
			if v.kind then
				local type = v.kind.type
				
				if type == "binding_path" then
					local value = v.kind.value
					local var3, _ = sduiPropUtilsModule.resolveBindingPathValue(p3 or false, if fFlagSduiRenderPerf then splitDottedPathModule(value) else string.split(value, "."), p2, p0, nil, false, if fFlagSduiClientPageScope then p5 else nil)
					p4[i] = var3
				elseif type == "literal" then
					local value = v.kind.value and (v.kind.value.kind and v.kind.value.kind.value)
					
					if value == nil then
						error(`Failed to determine value for nested input arg {i}`)
					end
					p4[i] = value
				elseif fFlagSduiLocalizedLiterals and type == "translation" then
					if p5 and p5.resolveLocalizedLiteral then
						p4[i] = p5.resolveLocalizedLiteral(v.kind.value)
					end
				elseif fFlagSduiFormatArgFormatters and type == "format" then
					p4[i] = sduiPropUtilsModule.generateFormatStringPropValue(v.kind.value, p2, p5, p0)(p3 or false).data
				else
					error(`Unrecognized inputDataType for key {i}`)
				end
			end
		end
	end
end