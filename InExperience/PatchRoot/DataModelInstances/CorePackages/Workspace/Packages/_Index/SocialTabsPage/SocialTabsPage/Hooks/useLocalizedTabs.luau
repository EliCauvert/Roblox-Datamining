local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(socialTabsPage.Common.Types)

return function(value)
	-- upvalues: reactModule (ref), useLocalization (ref), cryoModule (ref)
	local var1 = useLocalization(reactModule.useMemo(function()
		-- upvalues: value (ref)
		local t = {}
		
		for i, v in value do
			t[v.id] = v.tabLabelKey
		end
		return t
	end, { value }))
	
	return reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), value (ref), var1 (ref)
		return cryoModule.List.map(value, function(p1)
			-- upvalues: var1 (copy)
			return { id = p1.id, text = var1[p1.id] }
		end)
	end, { value, var1 })
end