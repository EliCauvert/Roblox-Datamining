local _ = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local Observable = require(script.Parent.Observable).Observable

return {
	fixObservableSubclass = function(Observables)
		-- upvalues: Observable (copy)
		local function _(Key)
			-- upvalues: Observables (copy), Observable (upval)
			Observables[Key] = Observable
		end
		
		Observables["@@species"] = Observable
		
		return Observables
	end
}