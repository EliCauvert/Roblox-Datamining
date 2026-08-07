local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(socialTabsPage.Common.Types)

return function(value) --[[ line: 11 | named "useLocalizedTabs" ]]
	-- upvalues: reactModule (ref), useLocalization (ref), cryoModule (ref)
	local var3 = useLocalization(reactModule.useMemo(function() --[[ line: 12 ]]
		-- upvalues: value (ref)
		local t = {}
		
		for i, v in value do
			t[v.id] = v.tabLabelKey
		end
		return t
	end, { value }))
	
	return reactModule.useMemo(function() --[[ line: 22 ]]
		-- upvalues: cryoModule (copy), value (ref), var3 (ref)
		return cryoModule.List.map(value, function(p0) --[[ line: 23 ]]
			-- upvalues: var3 (copy)
			return { id = p0.id, text = var3[p0.id] }
		end)
	end, { value, var3 })
end