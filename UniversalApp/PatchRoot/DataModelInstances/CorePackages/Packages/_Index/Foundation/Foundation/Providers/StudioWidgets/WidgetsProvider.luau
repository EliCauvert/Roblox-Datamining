local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Utility.Plugin.StudioUri)
local UsePluginModule = require(Foundation.Providers.Plugin.usePlugin)
local WidgetManagerModule = require(script.Parent.WidgetManager)
local WidgetsContextModule = require(script.Parent.WidgetsContext)
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: UsePluginModule (copy), ReactModule (copy), WidgetManagerModule (copy), FlagsModule (copy), WidgetsContextModule (copy)
	local UsePluginModuleResult = UsePluginModule()
	
	if UsePluginModuleResult == nil then
		error("WidgetsProvider must be used within a Plugin context")
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: WidgetManagerModule (upval), UsePluginModuleResult (copy)
		return WidgetManagerModule.new(UsePluginModuleResult:GetPluginComponent("Widgets"))
	end, { UsePluginModuleResult })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult:destroy()
		end
	end, { UseMemoResult })
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseMemoResult (copy)
		UseMemoResult:register(p2, p3)
	end, { UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseMemoResult (copy)
		UseMemoResult:deregister(p2, p3)
	end, { UseMemoResult })
	local UseResult2 = if FlagsModule.FoundationPopoverPluginAnchorRefresh then ReactModule.useCallback(function(p2)
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult:refreshAsync(p2)
	end, { UseMemoResult }) else nil
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult:nextId()
	end, { UseMemoResult })
	
	return ReactModule.createElement(WidgetsContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseResult (copy), UseResult1 (copy), FlagsModule (upval), UseResult2 (copy), UseResult3 (copy)
			return {
				register = UseResult,
				deregister = UseResult1,
				refreshAsync = if FlagsModule.FoundationPopoverPluginAnchorRefresh then UseResult2 else nil,
				nextId = UseResult3
			}
		end, { UseResult, UseResult1, UseResult2, UseResult3 })
	}, p1.children)
end