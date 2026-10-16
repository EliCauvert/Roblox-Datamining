local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Utility.Plugin.StudioUri)
local UsePluginModule = require(Foundation.Providers.Plugin.usePlugin)
local UseWidgetsContextModule = require(Foundation.Providers.StudioWidgets.useWidgetsContext)
local PanelsContextModule = require(script.Parent.PanelsContext)
local PopoverManagerModule = require(script.Parent.Managers.PopoverManager)
local _ = require(script.Parent.Types)

return function(p1) --[[ Line: 28 | Named "PanelsProvider" ]]
	-- upvalues: UsePluginModule (copy), FlagsModule (copy), UseWidgetsContextModule (copy), ReactModule (copy), PopoverManagerModule (copy), PanelsContextModule (copy)
	local UsePluginModuleResult = UsePluginModule()
	
	if UsePluginModuleResult == nil then
		error("PanelsProvider must be used within a plugin context")
	end
	local UseWidgetsContextModuleResult = if FlagsModule.FoundationPopoverPluginAnchorRefresh then UseWidgetsContextModule() else nil
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 35 ]]
		-- upvalues: PopoverManagerModule (upval), UsePluginModuleResult (copy), p1 (copy)
		return PopoverManagerModule.new(UsePluginModuleResult, p1.uriScope)
	end, { UsePluginModuleResult, p1.uriScope })
	ReactModule.useEffect(function() --[[ Line: 39 ]]
		-- upvalues: UseMemoResult (copy)
		local SpawnedThread = task.spawn(function() --[[ Line: 40 ]]
			-- upvalues: UseMemoResult (upval)
			UseMemoResult:prewarmPoolAsync(2)
		end)
		
		return function() --[[ Line: 44 ]]
			-- upvalues: SpawnedThread (copy), UseMemoResult (upval)
			if SpawnedThread then
				task.cancel(SpawnedThread)
			end
			UseMemoResult:destroy()
		end
	end, { UseMemoResult })
	local UseResult = ReactModule.useCallback(function(TargetWidgetUri, p2, p3, p4, p5, p6) --[[ Line: 54 ]]
		-- upvalues: FlagsModule (upval), UseWidgetsContextModuleResult (copy), UseMemoResult (copy)
		if FlagsModule.FoundationPopoverPluginAnchorRefresh then
			UseWidgetsContextModuleResult.refreshAsync(TargetWidgetUri)
		end
		local OpenAtAsyncResult = UseMemoResult:openAtAsync({
			targetWidgetUri = TargetWidgetUri,
			targetAnchorPoint = p2.targetAnchorPoint,
			subjectAnchorPoint = p2.subjectAnchorPoint,
			offset = p2.offset
		}, p3, p4, p5, if FlagsModule.FoundationPopoverPluginFocusable then p6 else nil)
		
		return OpenAtAsyncResult, function() --[[ Line: 72 ]]
			-- upvalues: OpenAtAsyncResult (copy)
			OpenAtAsyncResult.close()
		end
	end, { UseMemoResult, UseWidgetsContextModuleResult })
	
	return ReactModule.createElement(PanelsContextModule.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 79 ]]
			-- upvalues: UseResult (copy)
			return { registerPopoverAsync = UseResult }
		end, { UseResult })
	}, p1.children)
end