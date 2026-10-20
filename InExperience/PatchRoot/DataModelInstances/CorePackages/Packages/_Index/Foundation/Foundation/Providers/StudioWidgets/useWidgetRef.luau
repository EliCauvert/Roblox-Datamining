local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local StudioUriModule = require(Foundation.Utility.Plugin.StudioUri)
local UseWidgetsContextModule = require(script.Parent.useWidgetsContext)

return function(p1, p2)
	-- upvalues: UseWidgetsContextModule (copy), UseRefFunction (copy), StudioUriModule (copy), UseEffectFunction (copy)
	local UseWidgetsContextModuleResult = UseWidgetsContextModule()
	local UseRefResult = UseRefFunction(nil)
	local P1 = p2 or UseRefResult
	UseEffectFunction(function()
		-- upvalues: P1 (copy), p1 (copy), UseWidgetsContextModuleResult (copy)
		local Current = P1.current
		
		if not Current then return end
		if p1 and typeof(Current) == "Instance" then
			UseWidgetsContextModuleResult.register(p1, Current)
			
			return function()
				-- upvalues: UseWidgetsContextModuleResult (upval), p1 (upval), Current (copy)
				UseWidgetsContextModuleResult.deregister(p1, Current)
			end
		else
			return nil
		end
	end, {
		StudioUriModule.toString(p1),
		P1.current,
		p1,
		UseWidgetsContextModuleResult.register,
		UseWidgetsContextModuleResult.deregister
	})
	
	return P1
end