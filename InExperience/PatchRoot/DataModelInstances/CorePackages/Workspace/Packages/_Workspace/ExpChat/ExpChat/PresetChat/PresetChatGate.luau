local ReactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local _ = require(script.Parent.Constants)
local UseLayoutModeModule = require(script.Parent.useLayoutMode)
local UsePresetSurfaceAvailableModule = require(script.Parent.usePresetSurfaceAvailable)

return ReactModule.memo(function(p1)
	-- upvalues: UsePresetSurfaceAvailableModule (copy), UseLayoutModeModule (copy), ReactModule (copy)
	local UsePresetSurfaceAvailableModuleResult = UsePresetSurfaceAvailableModule(p1.targetTextChannel)
	local UseLayoutModeModuleResult = UseLayoutModeModule()
	
	return if UsePresetSurfaceAvailableModuleResult and (p1.layoutMode == nil or UseLayoutModeModuleResult == p1.layoutMode) then ReactModule.createElement(ReactModule.Fragment, nil, p1.children) else nil
end)