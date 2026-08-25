local parent = script.Parent
local appendModule = require(parent.append)
local forEachModule = require(parent.forEach)

return function(p0)
	-- upvalues: forEachModule (ref), appendModule (ref)
	local t = {}
	forEachModule(p0, function(p1)
		-- upvalues: appendModule (copy), t (ref)
		appendModule(t, p1)
	end)
	
	return t
end