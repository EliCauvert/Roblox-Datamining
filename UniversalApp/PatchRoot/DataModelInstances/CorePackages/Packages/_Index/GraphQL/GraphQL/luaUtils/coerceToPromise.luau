local parent = script.Parent.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.LuauPolyfill)
local promiseModule = require(parent_1.Promise)
local _ = require(parent.jsutils.PromiseOrValue)

return {
	coerceToPromise = function(p0)
		-- upvalues: promiseModule (ref)
		return if promiseModule.is(p0) then p0 else promiseModule.resolve(p0)
	end
}