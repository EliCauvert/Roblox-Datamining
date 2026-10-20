local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local Localization = require(Parent.InExperienceLocales).Localization
local UseRobloxLocaleModule = require(script.Parent.useRobloxLocale)

return function()
	-- upvalues: UseRobloxLocaleModule (copy), ReactModule (copy), Localization (copy)
	local UseRobloxLocaleModuleResult = UseRobloxLocaleModule()
	
	return ReactModule.useMemo(function()
		-- upvalues: Localization (upval), UseRobloxLocaleModuleResult (copy)
		local NewLocalization = Localization.new(UseRobloxLocaleModuleResult)
		
		return function(p1, p2)
			-- upvalues: NewLocalization (copy)
			return NewLocalization:Format(p1, p2)
		end
	end, { UseRobloxLocaleModuleResult })
end