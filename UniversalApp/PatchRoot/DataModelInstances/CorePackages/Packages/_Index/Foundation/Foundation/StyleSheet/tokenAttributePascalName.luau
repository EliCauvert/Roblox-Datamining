local ColorScopeKeepPrefixModule = require(script.Parent.colorScopeKeepPrefix)

local function kebabToPascal(Text: string) --[[ Line: 3 ]]
	return (Text:gsub("^%-?(.)", function(Text: string): string --[[ Line: 4 ]]
		return Text:upper()
	end):gsub("%-(.)", function(Text: string): string --[[ Line: 7 ]]
		return Text:upper()
	end))
end

return function(Segment, p1): string --[[ Line: 15 | Named "tokenAttributePascalName" ]]
	-- upvalues: kebabToPascal (copy), ColorScopeKeepPrefixModule (copy)
	local KebabToPascalResult: string = kebabToPascal(p1)
	
	return if ColorScopeKeepPrefixModule[Segment] and string.sub(KebabToPascalResult, 1, #Segment) == Segment then string.sub(KebabToPascalResult, #Segment + 1) else KebabToPascalResult
end