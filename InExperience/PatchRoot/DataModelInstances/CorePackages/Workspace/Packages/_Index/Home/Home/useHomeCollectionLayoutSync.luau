local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local ReactModule = require(Parent.React)
local StartHomeCollectionLayoutSyncModule = require(Home.startHomeCollectionLayoutSync)
local FFlagEnableHomePageSduiPrefetch = require(Parent.SharedFlags).FFlagEnableHomePageSduiPrefetch

return function() --[[ Line: 11 | Named "useHomeCollectionLayoutSync" ]]
	-- upvalues: ReactModule (copy), FFlagEnableHomePageSduiPrefetch (copy), StartHomeCollectionLayoutSyncModule (copy)
	ReactModule.useEffect(function() --[[ Line: 12 ]]
		-- upvalues: FFlagEnableHomePageSduiPrefetch (upval), StartHomeCollectionLayoutSyncModule (upval)
		if not FFlagEnableHomePageSduiPrefetch then return end
		return StartHomeCollectionLayoutSyncModule()
	end, {})
end