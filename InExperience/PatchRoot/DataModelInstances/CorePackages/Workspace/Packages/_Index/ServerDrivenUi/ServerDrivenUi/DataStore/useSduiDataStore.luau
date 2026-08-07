local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local _ = require(parent.SduiCoreSystem)
local useSduiSocialDataModule = require(serverDrivenUi.DataStore.useSduiSocialData)

return function() --[[ line: 16 | named "useSduiDataStore" ]]
	-- upvalues: useSduiSocialDataModule (ref), reactModule (ref)
	local var3 = useSduiSocialDataModule()
	
	return reactModule.useMemo(function() --[[ line: 19 ]]
		-- upvalues: var3 (ref)
		return { social = var3 }
	end, { var3 })
end