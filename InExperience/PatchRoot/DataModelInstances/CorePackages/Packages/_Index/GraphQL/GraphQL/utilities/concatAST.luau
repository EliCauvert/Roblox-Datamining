local array = require(script.Parent.Parent.Parent.LuauPolyfill).Array
local _ = require(script.Parent.Parent.language.ast)

function concatAST(p1)
	-- upvalues: array (ref)
	local t = {}
	
	for i, v in ipairs(p1) do
		t = array.concat(t, v.definitions)
	end
	return { kind = "Document", definitions = t }
end

return { concatAST = concatAST }