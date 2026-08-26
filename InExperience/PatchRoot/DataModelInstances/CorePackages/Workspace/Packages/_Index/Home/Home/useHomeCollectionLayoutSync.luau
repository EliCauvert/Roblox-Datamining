local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local reactModule = require(parent.React)
local startHomeCollectionLayoutSyncModule = require(home.startHomeCollectionLayoutSync)
local fFlagEnableHomePageSduiPrefetch = require(parent.SharedFlags).FFlagEnableHomePageSduiPrefetch

return function()
	-- upvalues: reactModule (ref), fFlagEnableHomePageSduiPrefetch (ref), startHomeCollectionLayoutSyncModule (ref)
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableHomePageSduiPrefetch (copy), startHomeCollectionLayoutSyncModule (copy)
		if fFlagEnableHomePageSduiPrefetch then
			return startHomeCollectionLayoutSyncModule()
		end
	end, {})
end