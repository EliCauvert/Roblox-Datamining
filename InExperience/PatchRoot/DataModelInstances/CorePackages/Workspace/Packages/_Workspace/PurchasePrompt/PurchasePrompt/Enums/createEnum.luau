local parent = script.Parent.Parent
local symbolModule = require(parent.Symbols.Symbol)
local strictModule = require(parent.strict)

return function(p0, p1)
	-- upvalues: symbolModule (ref), strictModule (ref)
	assert(typeof(p0) == "string", "Bad argument #1, expected string")
	assert(typeof(p1) == "table", "Bad argument #2, expected list of values")
	local t = {}
	
	for i, v in ipairs(p1) do
		assert(v ~= "isMember", "Shadowing 'isMember' function is not allowed")
		assert(typeof(v) == "string", "Only string names are supported for enum types")
		local var3 = symbolModule.named(v)
		local var4 = ("%s.%s"):format(p0, v)
		
		getmetatable(var3).__tostring = function()
			-- upvalues: var4 (ref)
			return var4
		end
		
		t[v] = var3
	end
	function t.isMember(p2)
		-- upvalues: t (ref)
		if typeof(p2) ~= "userdata" then
			return false
		end
		for i, v in pairs(t) do
			if p2 == v then
				return true
			end
		end
		return false
	end
	
	getmetatable(newproxy(true)).__index = t
	
	return strictModule(t, p0)
end