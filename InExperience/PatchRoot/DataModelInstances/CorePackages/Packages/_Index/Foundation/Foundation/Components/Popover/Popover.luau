local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local PopoverContextModule = require(script.Parent.PopoverContext)
local _ = require(Foundation.Utility.Plugin.StudioUri)
local _ = require(Foundation.Components.Types)
local config = { testId = "--foundation-popover" }

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), PopoverContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	
	return ReactModule.createElement(PopoverContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseStateResult (copy), UseStateResult2 (copy), UseStateResult1 (copy), UseStateResult2_1 (copy), WithDefaultsModuleResult (copy)
			return {
				anchor = UseStateResult,
				setAnchor = UseStateResult2,
				anchorUri = UseStateResult1,
				setAnchorUri = UseStateResult2_1,
				isOpen = WithDefaultsModuleResult.isOpen,
				testId = WithDefaultsModuleResult.testId
			}
		end, {
			UseStateResult,
			UseStateResult1,
			WithDefaultsModuleResult.isOpen,
			WithDefaultsModuleResult.testId
		})
	}, WithDefaultsModuleResult.children)
end