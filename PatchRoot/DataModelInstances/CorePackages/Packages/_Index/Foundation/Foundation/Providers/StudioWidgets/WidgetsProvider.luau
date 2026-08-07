-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Utility.Plugin.StudioUri)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)
local widgetManagerModule = require(script.Parent.WidgetManager)
local widgetsContextModule = require(script.Parent.WidgetsContext)
local _ = require(script.Parent.Types)

return function(p0) --[[ line: 21 | named "WidgetsProvider" ]]
	-- upvalues: usePluginModule (ref), reactModule (ref), widgetManagerModule (ref), widgetsContextModule (ref)
	local var5 = usePluginModule()
	
	if var5 == nil then
		error("WidgetsProvider must be used within a Plugin context")
	end
	local var6 = reactModule.useMemo(function() --[[ line: 27 ]]
		-- upvalues: widgetManagerModule (copy), var5 (ref)
		return widgetManagerModule.new(var5:GetPluginComponent("Widgets"))
	end, { var5 })
	reactModule.useEffect(function() --[[ line: 31 ]]
		-- upvalues: var6 (ref)
		return function() --[[ line: 32 ]]
			-- upvalues: var6 (copy)
			var6:destroy()
		end
	end, { var6 })
	
	return reactModule.createElement(widgetsContextModule.Provider, {
		value = {
			register = reactModule.useCallback(function(p1, p2) --[[ line: 37 ]]
				-- upvalues: var6 (ref)
				var6:register(p1, p2)
			end, { var6 }),
			deregister = reactModule.useCallback(function(p3, p4) --[[ line: 41 ]]
				-- upvalues: var6 (ref)
				var6:deregister(p3, p4)
			end, { var6 }),
			nextId = reactModule.useCallback(function() --[[ line: 45 ]]
				-- upvalues: var6 (ref)
				return var6:nextId()
			end, { var6 })
		}
	}, p0.children)
end