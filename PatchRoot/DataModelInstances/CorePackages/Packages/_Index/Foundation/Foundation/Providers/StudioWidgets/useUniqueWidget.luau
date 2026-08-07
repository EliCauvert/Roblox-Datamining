-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local studioUriModule = require(foundation.Utility.Plugin.StudioUri)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)
local useWidgetRefModule = require(script.Parent.useWidgetRef)
local useWidgetsContextModule = require(script.Parent.useWidgetsContext)

return function(p0) --[[ line: 16 | named "useUniqueWidget" ]]
	-- upvalues: usePluginModule (ref), useWidgetsContextModule (ref), reactModule (ref), studioUriModule (ref), useWidgetRefModule (ref)
	local var6 = usePluginModule()
	
	if var6 == nil then
		error("useUniqueWidget must be used within a Plugin context")
	end
	local var7 = useWidgetsContextModule()
	local var8 = reactModule.useMemo(function() --[[ line: 23 ]]
		-- upvalues: studioUriModule (copy), var6 (ref)
		return studioUriModule.wrap(var6:GetUri())
	end, { var6 })
	local var9 = reactModule.useRef(nil)
	
	if var9.current == nil then
		if p0 and p0.id then
			var9.current = p0.id
		else
			var9.current = var7.nextId()
		end
	end
	local var10 = reactModule.useMemo(function() --[[ line: 36 ]]
		-- upvalues: studioUriModule (copy), var8 (ref), var9 (ref)
		return studioUriModule.join(var8, { Category = "Actions", ItemId = var9.current })
	end, { var8, var9.current })
	
	return {
		ref = useWidgetRefModule(var10, p0 and p0.forwardRef),
		uri = var10
	}
end