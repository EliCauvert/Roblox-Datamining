local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Utility.Plugin.StudioUri)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)
local widgetManagerModule = require(script.Parent.WidgetManager)
local widgetsContextModule = require(script.Parent.WidgetsContext)
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: usePluginModule (ref), reactModule (ref), widgetManagerModule (ref), flagsModule (ref), widgetsContextModule (ref)
	local var1 = usePluginModule()
	
	if var1 == nil then
		error("WidgetsProvider must be used within a Plugin context")
	end
	local var2 = reactModule.useMemo(function()
		-- upvalues: widgetManagerModule (copy), var1 (ref)
		return widgetManagerModule.new(var1:GetPluginComponent("Widgets"))
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return function()
			-- upvalues: var2 (copy)
			var2:destroy()
		end
	end, { var2 })
	local var3 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref)
		var2:register(p2, p3)
	end, { var2 })
	local var4 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref)
		var2:deregister(p2, p3)
	end, { var2 })
	local var5 = if flagsModule.FoundationPopoverPluginAnchorRefresh then reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		return var2:refreshAsync(p2)
	end, { var2 }) else nil
	local var6 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		return var2:nextId()
	end, { var2 })
	
	return reactModule.createElement(widgetsContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: var3 (ref), var4 (ref), flagsModule (copy), var5 (ref), var6 (ref)
			return {
				register = var3,
				deregister = var4,
				refreshAsync = if flagsModule.FoundationPopoverPluginAnchorRefresh then var5 else nil,
				nextId = var6
			}
		end, { var3, var4, var5, var6 }) else {
			register = var3,
			deregister = var4,
			refreshAsync = if flagsModule.FoundationPopoverPluginAnchorRefresh then var5 else nil,
			nextId = var6
		}
	}, p1.children)
end