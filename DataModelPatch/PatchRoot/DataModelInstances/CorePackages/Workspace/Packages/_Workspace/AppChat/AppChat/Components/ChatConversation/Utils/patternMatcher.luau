local ArgCheckModule = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck)

return function(Text: string, p1)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Text, "string", "patternMatcher.string")
	ArgCheckModule.isType(p1, "string", "patternMatcher.pattern")
	local StartIndex, EndIndex = Text:lower():find(p1)
	
	if StartIndex then
		return true, {
			prefix = Text:sub(1, StartIndex - 1),
			suffix = Text:sub(EndIndex + 1)
		}
	else
		return false, nil
	end
end