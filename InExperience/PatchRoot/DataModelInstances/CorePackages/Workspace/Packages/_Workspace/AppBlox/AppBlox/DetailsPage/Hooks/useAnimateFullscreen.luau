local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy), ReactOtterModule (copy)
	local v1 = p2 ~= nil
	local v2: number = if p1 and v1 then 0 else 1
	local UseStateResult, UseStateResult2 = ReactModule.useState(v2)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(v2, (ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end, {})))
	ReactModule.useEffect(function()
		-- upvalues: v2 (copy), UseStateResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), p3 (copy)
		if v2 == UseStateResult then
			return nil
		else
			UseStateResult2(v2)
			UseStateResult2_1(true)
			UseAnimatedBindingResult2(ReactOtterModule.spring(v2, p3))
			
			return nil
		end
	end, { v2, UseStateResult, p3 })
	
	return if UseStateResult1 then v1 else p1 and v1, UseAnimatedBindingResult
end