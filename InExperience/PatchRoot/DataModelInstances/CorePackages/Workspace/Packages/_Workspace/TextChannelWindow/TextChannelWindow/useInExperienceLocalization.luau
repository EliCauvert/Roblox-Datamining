local parent = script.Parent.Parent
local reactModule = require(parent.React)
local localization = require(parent.InExperienceLocales).Localization
local useRobloxLocaleModule = require(script.Parent.useRobloxLocale)

return function() --[[ line: 12 | named "useInExperienceLocalization" ]]
	-- upvalues: useRobloxLocaleModule (ref), reactModule (ref), localization (ref)
	local var2 = useRobloxLocaleModule()
	
	return reactModule.useMemo(function() --[[ line: 14 ]]
		-- upvalues: localization (copy), var2 (ref)
		local var3 = localization.new(var2)
		
		return function(p0, p1) --[[ line: 16 ]]
			-- upvalues: var3 (ref)
			return var3:Format(p0, p1)
		end
	end, { var2 })
end