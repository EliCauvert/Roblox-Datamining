local _ = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local Observable = require(script.Parent.Observable).Observable

return {
	fixObservableSubclass = function(Observables) --[[ Line: 30 ]]
		-- upvalues: Observable (copy)
		local function _(Key) --[[ Line: 32 | Named "set" ]]
			-- upvalues: Observables (copy), Observable (upval)
			Observables[Key] = Observable
		end
		
		Observables["@@species"] = Observable
		
		return Observables
	end
}