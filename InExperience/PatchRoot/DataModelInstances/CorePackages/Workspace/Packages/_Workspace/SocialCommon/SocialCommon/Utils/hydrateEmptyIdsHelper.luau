local parent = script:FindFirstAncestor("SocialCommon").Parent
local promiseModule = require(parent.Promise)
local cryoModule = require(parent.Cryo)
local _ = require(parent.LuauPolyfill)

return function(p0)
	-- upvalues: promiseModule (ref), cryoModule (ref)
	local ids = p0.ids
	local selector = p0.selector
	local hydrate = p0.hydrate
	
	if not ids then
		return promiseModule.resolve()
	end
	local var2 = cryoModule.List.filter(ids, function(p1)
		-- upvalues: selector (ref)
		return selector(p1) == nil
	end)
	
	return if #var2 > 0 then hydrate(var2) else promiseModule.resolve()
end