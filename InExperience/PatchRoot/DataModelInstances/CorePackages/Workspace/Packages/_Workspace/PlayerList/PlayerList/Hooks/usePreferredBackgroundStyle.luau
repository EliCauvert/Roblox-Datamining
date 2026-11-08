local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UsePreferencesFunction = require(Parent1.Foundation).Hooks.usePreferences
local UsePreferredTransparencyBindingModule = require(Parent.Hooks.usePreferredTransparencyBinding)
local FFlagPlayerListContrastingTeamTextModule = require(Parent.Flags.FFlagPlayerListContrastingTeamText)

return function(p1)
	-- upvalues: FFlagPlayerListContrastingTeamTextModule (copy), UsePreferencesFunction (copy), ReactModule (copy), UsePreferredTransparencyBindingModule (copy)
	local _Color3 = p1.Color3
	local Transparency = p1.Transparency
	
	if FFlagPlayerListContrastingTeamTextModule then
		local UsePreferencesResult = UsePreferencesFunction()
		local PreferredTransparency = if UsePreferencesResult.preferredTransparency == nil then 1 else UsePreferencesResult.preferredTransparency
		
		return ReactModule.useMemo(function()
			-- upvalues: ReactModule (upval), _Color3 (copy), Transparency (copy), PreferredTransparency (copy)
			return ReactModule.createBinding({
				Color3 = _Color3,
				Transparency = Transparency * PreferredTransparency
			})
		end, { _Color3, Transparency, PreferredTransparency })
	else
		local UsePreferredTransparencyBindingModuleResult = UsePreferredTransparencyBindingModule()
		
		return ReactModule.useMemo(function()
			-- upvalues: UsePreferredTransparencyBindingModuleResult (copy), _Color3 (copy), Transparency (copy)
			return UsePreferredTransparencyBindingModuleResult:map(function(p2)
				-- upvalues: _Color3 (upval), Transparency (upval)
				return { Color3 = _Color3, Transparency = Transparency * p2 }
			end)
		end, {
			UsePreferredTransparencyBindingModuleResult,
			_Color3,
			Transparency
		})
	end
end