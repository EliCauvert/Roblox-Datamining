local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Utility.Plugin.StudioUri)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)
local widgetManagerModule = require(script.Parent.WidgetManager)
local widgetsContextModule = require(script.Parent.WidgetsContext)
local _ = require(script.Parent.Types)

return function(p0)
	-- upvalues: usePluginModule (ref), reactModule (ref), widgetManagerModule (ref), flagsModule (ref), widgetsContextModule (ref)
	local var6 = usePluginModule()
	
	if var6 == nil then
		error("WidgetsProvider must be used within a Plugin context")
	end
	local var7 = reactModule.useMemo(function()
		-- upvalues: widgetManagerModule (copy), var6 (ref)
		return widgetManagerModule.new(var6:GetPluginComponent("Widgets"))
	end, { var6 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		return function()
			-- upvalues: var7 (copy)
			var7:destroy()
		end
	end, { var7 })
	local var8 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var7 (ref)
		var7:register(p1, p2)
	end, { var7 })
	local var9 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var7 (ref)
		var7:deregister(p3, p4)
	end, { var7 })
	local var10 = if flagsModule.FoundationPopoverPluginAnchorRefresh then reactModule.useCallback(function(p5)
		-- upvalues: var7 (ref)
		return var7:refreshAsync(p5)
	end, { var7 }) else nil
	local var11 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		return var7:nextId()
	end, { var7 })
	
	return reactModule.createElement(widgetsContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: var8 (ref), var9 (ref), flagsModule (copy), var10 (ref), var11 (ref)
			return {
				register = var8,
				deregister = var9,
				refreshAsync = if flagsModule.FoundationPopoverPluginAnchorRefresh then var10 else nil,
				nextId = var11
			}
		end, { var8, var9, var10, var11 }) else {
			register = var8,
			deregister = var9,
			refreshAsync = if flagsModule.FoundationPopoverPluginAnchorRefresh then var10 else nil,
			nextId = var11
		}
	}, p0.children)
end