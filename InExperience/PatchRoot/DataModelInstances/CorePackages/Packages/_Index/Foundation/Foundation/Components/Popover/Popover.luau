local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local popoverContextModule = require(script.Parent.PopoverContext)
local _ = require(foundation.Utility.Plugin.StudioUri)
local _ = require(foundation.Components.Types)
local t = { testId = "--foundation-popover" }

return function(p0)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), flagsModule (ref), popoverContextModule (ref)
	local var6 = withDefaultsModule(p0, t)
	local var7, var8 = reactModule.useState(nil)
	local var9, var10 = reactModule.useState(nil)
	
	return reactModule.createElement(popoverContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: var7 (ref), var8 (ref), var9 (ref), var10 (ref), var6 (ref)
			return {
				anchor = var7,
				setAnchor = var8,
				anchorUri = var9,
				setAnchorUri = var10,
				isOpen = var6.isOpen,
				testId = var6.testId
			}
		end, { var7, var9, var6.isOpen, var6.testId }) else nil else {
			anchor = var7,
			setAnchor = var8,
			anchorUri = var9,
			setAnchorUri = var10,
			isOpen = var6.isOpen,
			testId = var6.testId
		}
	}, var6.children)
end