local parent = script.Parent
local appendModule = require(parent.append)
local forEachModule = require(parent.forEach)

return function(p0) --[[ line: 14 | named "flat" ]]
	-- upvalues: forEachModule (ref), appendModule (ref)
	local t = {}
	forEachModule(p0, function(p1) --[[ line: 16 ]]
		-- upvalues: appendModule (copy), t (ref)
		appendModule(t, p1)
	end)
	
	return t
end