local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Utility.Plugin.StudioUri)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)
local useWidgetsContextModule = require(foundation.Providers.StudioWidgets.useWidgetsContext)
local panelsContextModule = require(script.Parent.PanelsContext)
local popoverManagerModule = require(script.Parent.Managers.PopoverManager)
local _ = require(script.Parent.Types)

return function(p0) --[[ line: 28 | named "PanelsProvider" ]]
	-- upvalues: usePluginModule (ref), flagsModule (ref), useWidgetsContextModule (ref), reactModule (ref), popoverManagerModule (ref), panelsContextModule (ref)
	local var7 = usePluginModule()
	
	if var7 == nil then
		error("PanelsProvider must be used within a plugin context")
	end
	local var8 = if flagsModule.FoundationPopoverPluginAnchorRefresh then useWidgetsContextModule() else nil
	local var9 = reactModule.useMemo(function() --[[ line: 35 ]]
		-- upvalues: popoverManagerModule (copy), var7 (ref), p0 (ref)
		return popoverManagerModule.new(var7, p0.uriScope)
	end, { var7, p0.uriScope })
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: var9 (ref)
		local thread = task.spawn(function() --[[ line: 40 ]]
			-- upvalues: var9 (copy)
			var9:prewarmPoolAsync(2)
		end)
		
		return function() --[[ line: 44 ]]
			-- upvalues: thread (ref), var9 (copy)
			if thread then
				task.cancel(thread)
			end
			var9:destroy()
		end
	end, { var9 })
	
	return reactModule.createElement(panelsContextModule.Provider, {
		value = {
			registerPopoverAsync = reactModule.useCallback(function(p1, p2, p3, p4, p5) --[[ line: 54 ]]
				-- upvalues: flagsModule (copy), var8 (ref), var9 (ref)
				if flagsModule.FoundationPopoverPluginAnchorRefresh then
					var8.refreshAsync(p1)
				end
				local var11 = var9:openAtAsync({
					targetWidgetUri = p1,
					targetAnchorPoint = p2.targetAnchorPoint,
					subjectAnchorPoint = p2.subjectAnchorPoint,
					offset = p2.offset
				}, p3, p4, p5)
				
				return var11, function() --[[ line: 71 ]]
					-- upvalues: var11 (ref)
					var11.close()
				end
			end, { var9, var8 })
		}
	}, p0.children)
end