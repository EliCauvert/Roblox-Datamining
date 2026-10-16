local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.SduiCoreSystem)
local UseSduiSocialDataModule = require(ServerDrivenUi.DataStore.useSduiSocialData)

return function() --[[ Line: 16 | Named "useSduiDataStore" ]]
	-- upvalues: UseSduiSocialDataModule (copy), ReactModule (copy)
	local UseSduiSocialDataModuleResult = UseSduiSocialDataModule()
	
	return ReactModule.useMemo(function() --[[ Line: 19 ]]
		-- upvalues: UseSduiSocialDataModuleResult (copy)
		return { social = UseSduiSocialDataModuleResult }
	end, { UseSduiSocialDataModuleResult })
end