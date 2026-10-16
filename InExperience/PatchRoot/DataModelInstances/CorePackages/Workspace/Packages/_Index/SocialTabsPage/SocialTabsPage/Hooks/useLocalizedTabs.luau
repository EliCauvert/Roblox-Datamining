local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(SocialTabsPage.Common.Types)

return function(p1) --[[ Line: 11 | Named "useLocalizedTabs" ]]
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), CryoModule (copy)
	local UseLocalizationResult = UseLocalizationFunction((ReactModule.useMemo(function() --[[ Line: 12 ]]
		-- upvalues: p1 (copy)
		local TabLabelKeys = {}
		
		for _, value in p1 do
			TabLabelKeys[value.id] = value.tabLabelKey
		end
		return TabLabelKeys
	end, { p1 })))
	
	return ReactModule.useMemo(function() --[[ Line: 22 ]]
		-- upvalues: CryoModule (upval), p1 (copy), UseLocalizationResult (copy)
		return CryoModule.List.map(p1, function(p2) --[[ Line: 23 ]]
			-- upvalues: UseLocalizationResult (upval)
			return { id = p2.id, text = UseLocalizationResult[p2.id] }
		end)
	end, { p1, UseLocalizationResult })
end