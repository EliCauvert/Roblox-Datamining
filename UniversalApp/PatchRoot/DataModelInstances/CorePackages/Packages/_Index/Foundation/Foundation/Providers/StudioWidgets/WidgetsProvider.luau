local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Utility.Plugin.StudioUri)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)
local widgetManagerModule = require(script.Parent.WidgetManager)
local widgetsContextModule = require(script.Parent.WidgetsContext)
local _ = require(script.Parent.Types)

return function(p0) --[[ line: 22 | named "WidgetsProvider" ]]
	-- upvalues: usePluginModule (ref), reactModule (ref), widgetManagerModule (ref), flagsModule (ref), widgetsContextModule (ref)
	local var6 = usePluginModule()
	
	if var6 == nil then
		error("WidgetsProvider must be used within a Plugin context")
	end
	local var7 = reactModule.useMemo(function() --[[ line: 28 ]]
		-- upvalues: widgetManagerModule (copy), var6 (ref)
		return widgetManagerModule.new(var6:GetPluginComponent("Widgets"))
	end, { var6 })
	reactModule.useEffect(function() --[[ line: 32 ]]
		-- upvalues: var7 (ref)
		return function() --[[ line: 33 ]]
			-- upvalues: var7 (copy)
			var7:destroy()
		end
	end, { var7 })
	
	return reactModule.createElement(widgetsContextModule.Provider, {
		value = {
			register = reactModule.useCallback(function(p1, p2) --[[ line: 38 ]]
				-- upvalues: var7 (ref)
				var7:register(p1, p2)
			end, { var7 }),
			deregister = reactModule.useCallback(function(p3, p4) --[[ line: 42 ]]
				-- upvalues: var7 (ref)
				var7:deregister(p3, p4)
			end, { var7 }),
			refreshAsync = if flagsModule.FoundationPopoverPluginAnchorRefresh then if flagsModule.FoundationPopoverPluginAnchorRefresh then reactModule.useCallback(function(p5) --[[ line: 47 ]]
				-- upvalues: var7 (ref)
				return var7:refreshAsync(p5)
			end, { var7 }) else nil else nil,
			nextId = reactModule.useCallback(function() --[[ line: 52 ]]
				-- upvalues: var7 (ref)
				return var7:nextId()
			end, { var7 })
		}
	}, p0.children)
end