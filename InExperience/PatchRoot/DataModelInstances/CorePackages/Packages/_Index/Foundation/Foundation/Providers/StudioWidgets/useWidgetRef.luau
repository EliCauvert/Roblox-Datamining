local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local studioUriModule = require(foundation.Utility.Plugin.StudioUri)
local useWidgetsContextModule = require(script.Parent.useWidgetsContext)

return function(p1, p2)
	-- upvalues: useWidgetsContextModule (ref), useRef (ref), studioUriModule (ref), useEffect (ref)
	local var1 = useWidgetsContextModule()
	p2 = p2 or useRef(nil)
	useEffect(function()
		-- upvalues: p2 (ref), p1 (ref), var1 (ref)
		local current = p2.current
		
		if not current then return end
		if p1 and typeof(current) == "Instance" then
			var1.register(p1, current)
			
			return function()
				-- upvalues: var1 (copy), p1 (copy), current (ref)
				var1.deregister(p1, current)
			end
		end
		return nil
	end, {
		studioUriModule.toString(p1),
		p2.current,
		p1,
		var1.register,
		var1.deregister
	})
	
	return p2
end