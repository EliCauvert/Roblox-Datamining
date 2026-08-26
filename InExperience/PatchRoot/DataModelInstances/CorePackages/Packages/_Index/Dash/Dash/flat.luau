local parent = script.Parent
local appendModule = require(parent.append)
local forEachModule = require(parent.forEach)

return function(p1)
	-- upvalues: forEachModule (ref), appendModule (ref)
	local t = {}
	forEachModule(p1, function(p2)
		-- upvalues: appendModule (copy), t (ref)
		appendModule(t, p2)
	end)
	
	return t
end