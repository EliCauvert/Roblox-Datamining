local ReactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)
local RegisterSharedActionsModule = require(script.Parent.Actions.registerSharedActions)
local RegisterSharedUiComponentsModule = require(script.Parent.Components.registerSharedUiComponents)

return ReactModule.memo(function()
	-- upvalues: ReactModule (copy), RegisterSharedActionsModule (copy), RegisterSharedUiComponentsModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: RegisterSharedActionsModule (upval), RegisterSharedUiComponentsModule (upval)
		RegisterSharedActionsModule()
		RegisterSharedUiComponentsModule()
	end, {})
	
	return nil
end)