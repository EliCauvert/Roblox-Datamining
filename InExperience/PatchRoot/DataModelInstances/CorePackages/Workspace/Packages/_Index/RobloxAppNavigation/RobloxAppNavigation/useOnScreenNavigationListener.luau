local reactModule = require(script:FindFirstAncestor("RobloxAppNavigation").Parent.React)
local useIsRouteOnScreenModule = require(script.Parent.useIsRouteOnScreen)

return function(p1, p2)
	-- upvalues: useIsRouteOnScreenModule (ref), reactModule (ref)
	local var1 = useIsRouteOnScreenModule()
	local var2 = reactModule.useRef(var1)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), p1 (ref), p2 (ref)
		if var1 == var2.current then return end
		var2.current = var1
		
		if var1 then
			if p1 == nil then
				return
			else
				p1()
				
				return
			end
		elseif p2 ~= nil then
			p2()
		end
	end, { p1, p2, var1 })
end