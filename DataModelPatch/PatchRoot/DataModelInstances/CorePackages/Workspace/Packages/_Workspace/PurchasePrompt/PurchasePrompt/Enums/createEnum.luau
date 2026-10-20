local Parent = script.Parent.Parent
local SymbolModule = require(Parent.Symbols.Symbol)
local StrictModule = require(Parent.strict)

return function(p1, List)
	-- upvalues: SymbolModule (copy), StrictModule (copy)
	assert(typeof(p1) == "string", "Bad argument #1, expected string")
	assert(typeof(List) == "table", "Bad argument #2, expected list of values")
	local NamedResults = {}
	
	for _, value in ipairs(List) do
		assert(value ~= "isMember", "Shadowing 'isMember' function is not allowed")
		assert(typeof(value) == "string", "Only string names are supported for enum types")
		local NamedResult = SymbolModule.named(value)
		local Text: string = ("%s.%s"):format(p1, value)
		
		getmetatable(NamedResult).__tostring = function()
			-- upvalues: Text (copy)
			return Text
		end
		
		NamedResults[value] = NamedResult
	end
	function NamedResults.isMember(p2): boolean
		-- upvalues: NamedResults (copy)
		if typeof(p2) ~= "userdata" then
			return false
		end
		for _, namedResult in pairs(NamedResults) do
			if p2 == namedResult then
				return true
			end
		end
		return false
	end
	
	getmetatable((newproxy(true))).__index = NamedResults
	
	return StrictModule(NamedResults, p1)
end