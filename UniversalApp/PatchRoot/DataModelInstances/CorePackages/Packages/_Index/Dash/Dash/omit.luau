local parent = script.Parent
local collectSetModule = require(parent.collectSet)
local forEachModule = require(parent.forEach)
local _ = require(parent.Types)

return function(p1, p2)
	-- upvalues: collectSetModule (ref), forEachModule (ref)
	local t = {}
	local var1 = collectSetModule(p2)
	forEachModule(p1, function(_, p3)
		-- upvalues: var1 (ref), t (ref), p1 (ref)
		if not var1[p3] then
			t[p3] = p1[p3]
		end
	end)
	
	return t
end