local Array = require(script.Parent.Parent.Parent.LuauPolyfill).Array
local _ = require(script.Parent.Parent.language.ast)

function concatAST(List)
	-- upvalues: Array (copy)
	local ConcatResult = {}
	
	for _, value in ipairs(List) do
		ConcatResult = Array.concat(ConcatResult, value.definitions)
	end
	return { kind = "Document", definitions = ConcatResult }
end

return { concatAST = concatAST }