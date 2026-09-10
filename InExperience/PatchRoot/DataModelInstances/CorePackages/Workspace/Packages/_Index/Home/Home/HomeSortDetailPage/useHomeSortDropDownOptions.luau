local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local reactModule = require(parent.React)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local buildHomeSortDropDownOptionsModule = require(home.HomeSortDetailPage.buildHomeSortDropDownOptions)
local homeConstantsModule = require(home.HomeConstants)

return function()
	-- upvalues: sduiSharedUtilitiesModule (ref), homeConstantsModule (ref), reactModule (ref), buildHomeSortDropDownOptionsModule (ref)
	local var1 = sduiSharedUtilitiesModule.useInputData(homeConstantsModule.ConfigKey, homeConstantsModule.ContentIdentifier)
	
	return reactModule.useMemo(function()
		-- upvalues: buildHomeSortDropDownOptionsModule (copy), var1 (ref)
		return buildHomeSortDropDownOptionsModule(var1)
	end, { var1 })
end