local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local studioUriModule = require(foundation.Utility.Plugin.StudioUri)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)
local useWidgetRefModule = require(script.Parent.useWidgetRef)
local useWidgetsContextModule = require(script.Parent.useWidgetsContext)

return function(p1)
	-- upvalues: usePluginModule (ref), useWidgetsContextModule (ref), reactModule (ref), studioUriModule (ref), useWidgetRefModule (ref)
	local var1 = usePluginModule()
	
	if var1 == nil then
		error("useUniqueWidget must be used within a Plugin context")
	end
	local var2 = useWidgetsContextModule()
	local var3 = reactModule.useMemo(function()
		-- upvalues: studioUriModule (copy), var1 (ref)
		return studioUriModule.wrap(var1:GetUri())
	end, { var1 })
	local var4 = reactModule.useRef(nil)
	
	if var4.current == nil then
		if p1 and p1.id then
			var4.current = p1.id
		else
			var4.current = var2.nextId()
		end
	end
	local var5 = reactModule.useMemo(function()
		-- upvalues: studioUriModule (copy), var3 (ref), var4 (ref)
		return studioUriModule.join(var3, { Category = "Actions", ItemId = var4.current })
	end, { var3, var4.current })
	
	return {
		ref = useWidgetRefModule(var5, p1 and p1.forwardRef),
		uri = var5
	}
end