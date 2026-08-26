local parent = script.Parent.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.LuauPolyfill)
local promiseModule = require(parent_1.Promise)
local _ = require(parent.jsutils.PromiseOrValue)

return {
	coerceToPromise = function(p1)
		-- upvalues: promiseModule (ref)
		return if promiseModule.is(p1) then p1 else promiseModule.resolve(p1)
	end
}