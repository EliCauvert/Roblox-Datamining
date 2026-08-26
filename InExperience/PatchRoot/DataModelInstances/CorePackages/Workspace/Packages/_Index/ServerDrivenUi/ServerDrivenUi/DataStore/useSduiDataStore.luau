local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local _ = require(parent.SduiCoreSystem)
local useSduiSocialDataModule = require(serverDrivenUi.DataStore.useSduiSocialData)

return function()
	-- upvalues: useSduiSocialDataModule (ref), reactModule (ref)
	local var1 = useSduiSocialDataModule()
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return { social = var1 }
	end, { var1 })
end