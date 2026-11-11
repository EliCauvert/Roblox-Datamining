local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Utility.Plugin.StudioUri)
local UsePluginModule = require(Foundation.Providers.Plugin.usePlugin)
local PanelsContextModule = require(script.Parent.PanelsContext)
local PopoverManagerModule = require(script.Parent.Managers.PopoverManager)
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: UsePluginModule (copy), ReactModule (copy), PopoverManagerModule (copy), FlagsModule (copy), PanelsContextModule (copy)
	local UsePluginModuleResult = UsePluginModule()
	
	if UsePluginModuleResult == nil then
		error("PanelsProvider must be used within a plugin context")
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PopoverManagerModule (upval), UsePluginModuleResult (copy), p1 (copy)
		return PopoverManagerModule.new(UsePluginModuleResult, p1.uriScope)
	end, { UsePluginModuleResult, p1.uriScope })
	ReactModule.useEffect(function()
		-- upvalues: FlagsModule (upval), UseMemoResult (copy)
		local SpawnedThread = if FlagsModule.FoundationPopoverPluginPrewarmDepthPool then task.spawn(function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult:prewarmPoolAsync(2)
		end) else nil
		
		return function()
			-- upvalues: SpawnedThread (ref), UseMemoResult (upval)
			if SpawnedThread then
				task.cancel(SpawnedThread)
			end
			UseMemoResult:destroy()
		end
	end, { UseMemoResult })
	
	return ReactModule.createElement(PanelsContextModule.Provider, {
		value = {
			registerPopoverAsync = ReactModule.useCallback(function(TargetWidgetUri, p2, p3, p4, p5)
				-- upvalues: UseMemoResult (copy)
				local OpenAtAsyncResult = UseMemoResult:openAtAsync({
					targetWidgetUri = TargetWidgetUri,
					targetAnchorPoint = p2.targetAnchorPoint,
					subjectAnchorPoint = p2.subjectAnchorPoint,
					offset = p2.offset
				}, p3, p4, p5)
				
				return OpenAtAsyncResult, function()
					-- upvalues: OpenAtAsyncResult (copy)
					OpenAtAsyncResult.close()
				end
			end, { UseMemoResult })
		}
	}, p1.children)
end