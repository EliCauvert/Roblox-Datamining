local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Utility.Plugin.StudioUri)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)
local useWidgetsContextModule = require(foundation.Providers.StudioWidgets.useWidgetsContext)
local panelsContextModule = require(script.Parent.PanelsContext)
local popoverManagerModule = require(script.Parent.Managers.PopoverManager)
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: usePluginModule (ref), flagsModule (ref), useWidgetsContextModule (ref), reactModule (ref), popoverManagerModule (ref), panelsContextModule (ref)
	local var1 = usePluginModule()
	
	if var1 == nil then
		error("PanelsProvider must be used within a plugin context")
	end
	local var2 = if flagsModule.FoundationPopoverPluginAnchorRefresh then useWidgetsContextModule() else nil
	local var3 = reactModule.useMemo(function()
		-- upvalues: popoverManagerModule (copy), var1 (ref), p1 (ref)
		return popoverManagerModule.new(var1, p1.uriScope)
	end, { var1, p1.uriScope })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		local thread = task.spawn(function()
			-- upvalues: var3 (copy)
			var3:prewarmPoolAsync(2)
		end)
		
		return function()
			-- upvalues: thread (ref), var3 (copy)
			if thread then
				task.cancel(thread)
			end
			var3:destroy()
		end
	end, { var3 })
	local var4 = reactModule.useCallback(function(p2, p3, p4, p5, p6)
		-- upvalues: flagsModule (copy), var2 (ref), var3 (ref)
		if flagsModule.FoundationPopoverPluginAnchorRefresh then
			var2.refreshAsync(p2)
		end
		local var5 = var3:openAtAsync({
			targetWidgetUri = p2,
			targetAnchorPoint = p3.targetAnchorPoint,
			subjectAnchorPoint = p3.subjectAnchorPoint,
			offset = p3.offset
		}, p4, p5, p6)
		
		return var5, function()
			-- upvalues: var5 (ref)
			var5.close()
		end
	end, { var3, var2 })
	
	return reactModule.createElement(panelsContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: var4 (ref)
			return { registerPopoverAsync = var4 }
		end, { var4 }) else { registerPopoverAsync = var4 }
	}, p1.children)
end