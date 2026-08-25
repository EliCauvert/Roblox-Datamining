local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local _ = require(script.Parent.Constants)
local useLayoutModeModule = require(script.Parent.useLayoutMode)
local usePresetSurfaceAvailableModule = require(script.Parent.usePresetSurfaceAvailable)

return reactModule.memo(function(value)
	-- upvalues: usePresetSurfaceAvailableModule (ref), useLayoutModeModule (ref), reactModule (ref)
	return if usePresetSurfaceAvailableModule(value.targetTextChannel) then if value.layoutMode == nil or useLayoutModeModule() == value.layoutMode then reactModule.createElement(reactModule.Fragment, nil, value.children) else nil else nil
end)