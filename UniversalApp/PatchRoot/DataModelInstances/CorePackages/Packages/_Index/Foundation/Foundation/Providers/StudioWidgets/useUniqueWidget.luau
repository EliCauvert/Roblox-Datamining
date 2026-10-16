local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local StudioUriModule = require(Foundation.Utility.Plugin.StudioUri)
local UsePluginModule = require(Foundation.Providers.Plugin.usePlugin)
local UseWidgetRefModule = require(script.Parent.useWidgetRef)
local UseWidgetsContextModule = require(script.Parent.useWidgetsContext)

return function(p1) --[[ Line: 16 | Named "useUniqueWidget" ]]
	-- upvalues: UsePluginModule (copy), UseWidgetsContextModule (copy), ReactModule (copy), StudioUriModule (copy), UseWidgetRefModule (copy)
	local UsePluginModuleResult = UsePluginModule()
	
	if UsePluginModuleResult == nil then
		error("useUniqueWidget must be used within a Plugin context")
	end
	local UseWidgetsContextModuleResult = UseWidgetsContextModule()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 23 ]]
		-- upvalues: StudioUriModule (upval), UsePluginModuleResult (copy)
		return StudioUriModule.wrap(UsePluginModuleResult:GetUri())
	end, { UsePluginModuleResult })
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		if p1 and p1.id then
			UseRefResult.current = p1.id
		else
			UseRefResult.current = UseWidgetsContextModuleResult.nextId()
		end
	end
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 36 ]]
		-- upvalues: StudioUriModule (upval), UseMemoResult (copy), UseRefResult (copy)
		return StudioUriModule.join(UseMemoResult, { Category = "Actions", ItemId = UseRefResult.current })
	end, { UseMemoResult, UseRefResult.current })
	
	return {
		ref = UseWidgetRefModule(UseMemoResult1, p1 and p1.forwardRef),
		uri = UseMemoResult1
	}
end