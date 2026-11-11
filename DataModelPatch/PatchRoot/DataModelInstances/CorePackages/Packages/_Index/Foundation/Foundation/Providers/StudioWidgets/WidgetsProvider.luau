local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Utility.Plugin.StudioUri)
local UsePluginModule = require(Foundation.Providers.Plugin.usePlugin)
local WidgetManagerModule = require(script.Parent.WidgetManager)
local WidgetsContextModule = require(script.Parent.WidgetsContext)
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: UsePluginModule (copy), ReactModule (copy), WidgetManagerModule (copy), WidgetsContextModule (copy)
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
	
	return ReactModule.createElement(WidgetsContextModule.Provider, {
		value = {
			register = ReactModule.useCallback(function(p2, p3)
				-- upvalues: UseMemoResult (copy)
				UseMemoResult:register(p2, p3)
			end, { UseMemoResult }),
			deregister = ReactModule.useCallback(function(p2, p3)
				-- upvalues: UseMemoResult (copy)
				UseMemoResult:deregister(p2, p3)
			end, { UseMemoResult }),
			nextId = ReactModule.useCallback(function()
				-- upvalues: UseMemoResult (copy)
				return UseMemoResult:nextId()
			end, { UseMemoResult })
		}
	}, p1.children)
end