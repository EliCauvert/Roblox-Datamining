local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local localization = require(parent.InExperienceLocales).Localization
local useRobloxLocaleModule = require(script.Parent.useRobloxLocale)

return function() --[[ line: 20 | named "useInExperienceLocalization" ]]
	-- upvalues: useRobloxLocaleModule (ref), reactModule (ref), localization (ref)
	local var2 = useRobloxLocaleModule()
	
	return reactModule.useMemo(function() --[[ line: 22 ]]
		-- upvalues: localization (copy), var2 (ref)
		local var3 = localization.new(var2)
		
		return function(p0, p1) --[[ line: 24 ]]
			-- upvalues: var3 (ref)
			return var3:Format(p0, p1)
		end
	end, { var2 })
end