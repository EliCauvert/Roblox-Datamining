local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local useTokens = require(parent_1.Foundation).Hooks.useTokens
local usePreferredBackgroundStyleModule = require(parent.Hooks.usePreferredBackgroundStyle)

return function(p1)
	-- upvalues: useTokens (ref), usePreferredBackgroundStyleModule (ref), reactModule (ref)
	return {
		panelTag = reactModule.useMemo(function()
			return {
				["col fill size-full-0 padding-large gap-medium align-x-center align-y-center"] = true
			}
		end, {}),
		backgroundStyle = if p1 == true then nil else usePreferredBackgroundStyleModule(useTokens().Color.OverMedia.OverMedia_0)
	}
end