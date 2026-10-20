local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local _ = require(Parent1.LuauPolyfill)
local PromiseModule = require(Parent1.Promise)
local _ = require(Parent.jsutils.PromiseOrValue)

return {
	coerceToPromise = function(p1)
		-- upvalues: PromiseModule (copy)
		return if PromiseModule.is(p1) then p1 else PromiseModule.resolve(p1)
	end
}