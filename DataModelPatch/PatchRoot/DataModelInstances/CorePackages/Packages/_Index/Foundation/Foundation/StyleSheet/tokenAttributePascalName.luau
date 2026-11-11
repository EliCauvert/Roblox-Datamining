local ColorScopeKeepPrefixModule = require(script.Parent.colorScopeKeepPrefix)

local function kebabToPascal(Text: string)
	return (Text:gsub("^%-?(.)", function(Text: string): string
		return Text:upper()
	end):gsub("%-(.)", function(Text: string): string
		return Text:upper()
	end))
end

return function(Segment, p1): string
	-- upvalues: kebabToPascal (copy), ColorScopeKeepPrefixModule (copy)
	local KebabToPascalResult: string = kebabToPascal(p1)
	
	return if ColorScopeKeepPrefixModule[Segment] and string.sub(KebabToPascalResult, 1, #Segment) == Segment then string.sub(KebabToPascalResult, #Segment + 1) else KebabToPascalResult
end