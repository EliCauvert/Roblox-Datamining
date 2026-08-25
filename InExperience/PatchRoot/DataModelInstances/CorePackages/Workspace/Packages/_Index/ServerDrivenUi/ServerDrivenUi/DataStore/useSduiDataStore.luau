local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local _ = require(parent.SduiCoreSystem)
local useSduiSocialDataModule = require(serverDrivenUi.DataStore.useSduiSocialData)

return function()
	-- upvalues: useSduiSocialDataModule (ref), reactModule (ref)
	local var3 = useSduiSocialDataModule()
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref)
		return { social = var3 }
	end, { var3 })
end