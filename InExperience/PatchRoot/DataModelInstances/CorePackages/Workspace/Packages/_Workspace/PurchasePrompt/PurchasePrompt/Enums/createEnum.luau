local parent = script.Parent.Parent
local symbolModule = require(parent.Symbols.Symbol)
local strictModule = require(parent.strict)

return function(p1, p2)
	-- upvalues: symbolModule (ref), strictModule (ref)
	assert(typeof(p1) == "string", "Bad argument #1, expected string")
	assert(typeof(p2) == "table", "Bad argument #2, expected list of values")
	local t = {}
	
	for i, v in ipairs(p2) do
		assert(v ~= "isMember", "Shadowing 'isMember' function is not allowed")
		assert(typeof(v) == "string", "Only string names are supported for enum types")
		local var1 = symbolModule.named(v)
		local var2 = ("%s.%s"):format(p1, v)
		
		getmetatable(var1).__tostring = function()
			-- upvalues: var2 (ref)
			return var2
		end
		
		t[v] = var1
	end
	function t.isMember(p3)
		-- upvalues: t (ref)
		if typeof(p3) ~= "userdata" then
			return false
		end
		for i, v in pairs(t) do
			if p3 == v then
				return true
			end
		end
		return false
	end
	
	getmetatable(newproxy(true)).__index = t
	
	return strictModule(t, p1)
end