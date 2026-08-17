local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local popoverContextModule = require(script.Parent.PopoverContext)
local _ = require(foundation.Utility.Plugin.StudioUri)
local _ = require(foundation.Components.Types)
local t = { testId = "--foundation-popover" }

return function(p0) --[[ line: 25 | named "Popover" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), popoverContextModule (ref)
	local var5 = withDefaultsModule(p0, t)
	local var6, var7 = reactModule.useState(nil)
	local var8, var9 = reactModule.useState(nil)
	
	return reactModule.createElement(popoverContextModule.Provider, {
		value = {
			anchor = var6,
			setAnchor = var7,
			anchorUri = var8,
			setAnchorUri = var9,
			isOpen = var5.isOpen,
			testId = var5.testId
		}
	}, var5.children)
end