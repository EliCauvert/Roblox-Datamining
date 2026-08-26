local parent = script:FindFirstAncestor("SocialCommon").Parent
local promiseModule = require(parent.Promise)
local cryoModule = require(parent.Cryo)
local _ = require(parent.LuauPolyfill)

return function(p1)
	-- upvalues: promiseModule (ref), cryoModule (ref)
	local ids = p1.ids
	local selector = p1.selector
	local hydrate = p1.hydrate
	
	if not ids then
		return promiseModule.resolve()
	end
	local var1 = cryoModule.List.filter(ids, function(p2)
		-- upvalues: selector (ref)
		return selector(p2) == nil
	end)
	
	return if #var1 > 0 then hydrate(var1) else promiseModule.resolve()
end