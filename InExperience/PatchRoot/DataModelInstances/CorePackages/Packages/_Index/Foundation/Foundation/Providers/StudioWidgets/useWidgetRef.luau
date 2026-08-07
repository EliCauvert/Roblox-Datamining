local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local studioUriModule = require(foundation.Utility.Plugin.StudioUri)
local useWidgetsContextModule = require(script.Parent.useWidgetsContext)

return function(p0, p1) --[[ line: 13 | named "useWidgetRef" ]]
	-- upvalues: useWidgetsContextModule (ref), useRef (ref), studioUriModule (ref), useEffect (ref)
	local var4 = useWidgetsContextModule()
	p1 = p1 or useRef(nil)
	useEffect(function() --[[ line: 20 ]]
		-- upvalues: p1 (ref), p0 (ref), var4 (ref)
		local current = p1.current
		
		if not current then return end
		if p0 and typeof(current) == "Instance" then
			var4.register(p0, current)
			
			return function() --[[ line: 27 ]]
				-- upvalues: var4 (copy), p0 (copy), current (ref)
				var4.deregister(p0, current)
			end
		end
		return nil
	end, {
		studioUriModule.toString(p0),
		p1.current,
		p0,
		var4.register,
		var4.deregister
	})
	
	return p1
end