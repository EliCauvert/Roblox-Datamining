local ReactModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.React)

return function(ConfigKey, AppPage, p1) --[[ Line: 5 | Named "useLocalAnalyticsData" ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.useMemo(function() --[[ Line: 6 ]]
		-- upvalues: p1 (copy), ConfigKey (copy), AppPage (copy)
		local T = if p1 then p1 else {}
		T.configKey = ConfigKey
		T.appPage = AppPage
		
		return T
	end, { ConfigKey, AppPage, p1 })
end