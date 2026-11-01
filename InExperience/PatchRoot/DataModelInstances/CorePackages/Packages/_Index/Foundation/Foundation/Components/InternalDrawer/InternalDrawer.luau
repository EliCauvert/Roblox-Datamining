local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local InternalDrawerOverlayModule = require(script.Parent.InternalDrawerOverlay)
local _ = require(script.Parent.Types)
local config = {
	testId = "--foundation-internal-drawer",
	scrollBarVisibility = require(Foundation.Enums.ScrollBarVisibility).None
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), InternalDrawerOverlayModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.isOpen)
	
	if WithDefaultsModuleResult.isOpen and not UseStateResult then
		UseStateResult2(true)
	end
	local OnCloseCompleteFunction = WithDefaultsModuleResult.onCloseComplete
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), OnCloseCompleteFunction (copy)
		UseStateResult2(false)
		
		if OnCloseCompleteFunction then
			OnCloseCompleteFunction()
		end
	end, { OnCloseCompleteFunction })
	
	if UseStateResult then
		WithDefaultsModuleResult.ref = Ref
		WithDefaultsModuleResult.onExited = UseResult
		
		return ReactModule.createElement(InternalDrawerOverlayModule, WithDefaultsModuleResult)
	else
		return nil
	end
end))