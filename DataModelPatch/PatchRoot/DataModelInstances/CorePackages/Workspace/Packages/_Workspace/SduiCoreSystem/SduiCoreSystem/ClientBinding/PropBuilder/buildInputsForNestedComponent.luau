local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local SplitDottedPathModule = require(SduiCoreSystem.ClientBinding.splitDottedPath)
local _ = require(Parent.Signals)
local FFlagSduiLocalizedLiterals = require(Parent.SharedFlags).FFlagSduiLocalizedLiterals
local FFlagSduiFormatArgFormatters = require(Parent.SharedFlags).FFlagSduiFormatArgFormatters
local FFlagSduiClientPageScope = require(Parent.SharedFlags).FFlagSduiClientPageScope
local FFlagSduiRenderPerf = require(Parent.SharedFlags).FFlagSduiRenderPerf

return function(p1, List, p2, p3, ResolveLocalizedLiteralResults, p4)
	-- upvalues: FFlagSduiRenderPerf (copy), SplitDottedPathModule (copy), SduiPropUtilsModule (copy), FFlagSduiClientPageScope (copy), FFlagSduiLocalizedLiterals (copy), FFlagSduiFormatArgFormatters (copy)
	if List then
		for i, value in List do
			if value.kind then
				local Type = value.kind.type
				
				if Type == "binding_path" then
					local Value: string = value.kind.value
					local _
					ResolveLocalizedLiteralResults[i], _ = SduiPropUtilsModule.resolveBindingPathValue(p3 or false, if FFlagSduiRenderPerf then SplitDottedPathModule(Value) else string.split(Value, "."), p2, p1, nil, false, if FFlagSduiClientPageScope then p4 else nil)
				elseif Type == "literal" then
					local Value = value.kind.value and (value.kind.value.kind and value.kind.value.kind.value)
					
					if Value == nil then
						error(`Failed to determine value for nested input arg {i}`)
					end
					ResolveLocalizedLiteralResults[i] = Value
				elseif FFlagSduiLocalizedLiterals and Type == "translation" then
					if p4 and p4.resolveLocalizedLiteral then
						ResolveLocalizedLiteralResults[i] = p4.resolveLocalizedLiteral(value.kind.value)
					end
				elseif FFlagSduiFormatArgFormatters and Type == "format" then
					ResolveLocalizedLiteralResults[i] = SduiPropUtilsModule.generateFormatStringPropValue(value.kind.value, p2, p4, p1)(p3 or false).data
				else
					error(`Unrecognized inputDataType for key {i}`)
				end
			end
		end
	end
end