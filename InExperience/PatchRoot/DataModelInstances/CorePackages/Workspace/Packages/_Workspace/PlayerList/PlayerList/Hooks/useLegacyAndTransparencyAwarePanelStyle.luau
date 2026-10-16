local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UseTokensFunction = require(Parent1.Foundation).Hooks.useTokens
local UsePreferredBackgroundStyleModule = require(Parent.Hooks.usePreferredBackgroundStyle)

return function(Enabled) --[[ Line: 22 | Named "useLegacyAndTransparencyAwarePanelStyle" ]]
	-- upvalues: UseTokensFunction (copy), UsePreferredBackgroundStyleModule (copy), ReactModule (copy)
	local UsePreferredBackgroundStyleModuleResult = UsePreferredBackgroundStyleModule(UseTokensFunction().Color.OverMedia.OverMedia_0)
	local IsEnabled = Enabled == true
	
	return {
		panelTag = ReactModule.useMemo(function() --[[ Line: 28 ]]
			return {
				["col fill size-full-0 padding-large gap-medium align-x-center align-y-center"] = true
			}
		end, {}),
		backgroundStyle = if IsEnabled then nil else UsePreferredBackgroundStyleModuleResult
	}
end