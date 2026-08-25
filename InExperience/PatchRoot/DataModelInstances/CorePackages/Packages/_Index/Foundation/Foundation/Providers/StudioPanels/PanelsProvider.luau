local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Utility.Plugin.StudioUri)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)
local useWidgetsContextModule = require(foundation.Providers.StudioWidgets.useWidgetsContext)
local panelsContextModule = require(script.Parent.PanelsContext)
local popoverManagerModule = require(script.Parent.Managers.PopoverManager)
local _ = require(script.Parent.Types)

return function(p0)
	-- upvalues: usePluginModule (ref), flagsModule (ref), useWidgetsContextModule (ref), reactModule (ref), popoverManagerModule (ref), panelsContextModule (ref)
	local var7 = usePluginModule()
	
	if var7 == nil then
		error("PanelsProvider must be used within a plugin context")
	end
	local var8 = if flagsModule.FoundationPopoverPluginAnchorRefresh then useWidgetsContextModule() else nil
	local var9 = reactModule.useMemo(function()
		-- upvalues: popoverManagerModule (copy), var7 (ref), p0 (ref)
		return popoverManagerModule.new(var7, p0.uriScope)
	end, { var7, p0.uriScope })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref)
		local thread = task.spawn(function()
			-- upvalues: var9 (copy)
			var9:prewarmPoolAsync(2)
		end)
		
		return function()
			-- upvalues: thread (ref), var9 (copy)
			if thread then
				task.cancel(thread)
			end
			var9:destroy()
		end
	end, { var9 })
	local var10 = reactModule.useCallback(function(p1, p2, p3, p4, p5, p6)
		-- upvalues: flagsModule (copy), var8 (ref), var9 (ref)
		if flagsModule.FoundationPopoverPluginAnchorRefresh then
			var8.refreshAsync(p1)
		end
		local var12 = var9:openAtAsync({
			targetWidgetUri = p1,
			targetAnchorPoint = p2.targetAnchorPoint,
			subjectAnchorPoint = p2.subjectAnchorPoint,
			offset = p2.offset
		}, p3, p4, p5, if flagsModule.FoundationPopoverPluginFocusable then p6 else nil)
		
		return var12, function()
			-- upvalues: var12 (ref)
			var12.close()
		end
	end, { var9, var8 })
	
	return reactModule.createElement(panelsContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: var10 (ref)
			return { registerPopoverAsync = var10 }
		end, { var10 }) else { registerPopoverAsync = var10 }
	}, p0.children)
end