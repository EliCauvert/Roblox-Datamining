local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseStateFunction = ReactModule.useState
local _ = require(Parent.cache)
local config = { __value = "nil placeholder" }

return {
	useReactiveVar = function(Callback) --[[ Line: 25 ]]
		-- upvalues: UseStateFunction (copy), UseEffectFunction (copy), config (copy)
		local CallbackResult = Callback()
		local _, UseStateResult2 = UseStateFunction(CallbackResult)
		UseEffectFunction(function() --[[ Line: 34 ]]
			-- upvalues: Callback (copy), CallbackResult (copy), UseStateResult2 (copy)
			local CallbackResult1 = Callback()
			
			if CallbackResult == CallbackResult1 then
				return Callback:onNextChange(UseStateResult2)
			else
				UseStateResult2(CallbackResult1)
			end
		end, { CallbackResult or config })
		
		return CallbackResult
	end
}