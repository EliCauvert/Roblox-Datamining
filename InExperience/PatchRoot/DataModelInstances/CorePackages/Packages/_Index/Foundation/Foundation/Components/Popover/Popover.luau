local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local popoverContextModule = require(script.Parent.PopoverContext)
local _ = require(foundation.Utility.Plugin.StudioUri)
local _ = require(foundation.Components.Types)
local t = { testId = "--foundation-popover" }

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), flagsModule (ref), popoverContextModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2, var3 = reactModule.useState(nil)
	local var4, var5 = reactModule.useState(nil)
	
	return reactModule.createElement(popoverContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: var2 (ref), var3 (ref), var4 (ref), var5 (ref), var1 (ref)
			return {
				anchor = var2,
				setAnchor = var3,
				anchorUri = var4,
				setAnchorUri = var5,
				isOpen = var1.isOpen,
				testId = var1.testId
			}
		end, { var2, var4, var1.isOpen, var1.testId }) else nil else {
			anchor = var2,
			setAnchor = var3,
			anchorUri = var4,
			setAnchorUri = var5,
			isOpen = var1.isOpen,
			testId = var1.testId
		}
	}, var1.children)
end