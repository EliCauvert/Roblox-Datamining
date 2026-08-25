local parent = script.Parent
local collectSetModule = require(parent.collectSet)
local forEachModule = require(parent.forEach)
local _ = require(parent.Types)

return function(p0, p1)
	-- upvalues: collectSetModule (ref), forEachModule (ref)
	local t = {}
	local var3 = collectSetModule(p1)
	forEachModule(p0, function(_, p2)
		-- upvalues: var3 (ref), t (ref), p0 (ref)
		if not var3[p2] then
			t[p2] = p0[p2]
		end
	end)
	
	return t
end