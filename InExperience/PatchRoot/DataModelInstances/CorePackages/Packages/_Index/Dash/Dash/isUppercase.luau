local AssertEqualModule = require(script.Parent.assertEqual)

return function(Text: string): boolean
	-- upvalues: AssertEqualModule (copy)
	AssertEqualModule(#Text > 0, true, "Attempted to call Dash.isUppercase with an empty string")
	local Segment: string = Text:sub(1, 1)
	
	return Segment == Segment:upper()
end