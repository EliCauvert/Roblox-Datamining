local String1 = require(script.Parent.Parent.Parent.LuauPolyfill).String
local _ = require(script.Parent.source)

return {
	getLocation = function(p1, Column: number) --[[ Line: 27 ]]
		-- upvalues: String1 (copy)
		local list = { "\r\n", "\r", "\n" }
		local Line = 1
		local Column1: number = Column
		local Or = String1.findOr(p1.body, list)
		while Or ~= nil and Or.index < Column do
			local NewIndex = Or.index + string.len(Or.match)
			Line += 1
			Column1 = Column + 1 - NewIndex
			Or = String1.findOr(p1.body, list, NewIndex)
		end
		return { line = Line, column = Column1 }
	end
}