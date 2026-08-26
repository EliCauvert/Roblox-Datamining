local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local localization = require(parent.InExperienceLocales).Localization
local useRobloxLocaleModule = require(script.Parent.useRobloxLocale)

return function()
	-- upvalues: useRobloxLocaleModule (ref), reactModule (ref), localization (ref)
	local var1 = useRobloxLocaleModule()
	
	return reactModule.useMemo(function()
		-- upvalues: localization (copy), var1 (ref)
		local var2 = localization.new(var1)
		
		return function(p1, p2)
			-- upvalues: var2 (ref)
			return var2:Format(p1, p2)
		end
	end, { var1 })
end