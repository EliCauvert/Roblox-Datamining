local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local ReactModule = require(Parent.React)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local BuildHomeSortDropDownOptionsModule = require(Home.HomeSortDetailPage.buildHomeSortDropDownOptions)
local HomeConstantsModule = require(Home.HomeConstants)

return function() --[[ Line: 10 | Named "useHomeSortDropDownOptions" ]]
	-- upvalues: SduiSharedUtilitiesModule (copy), HomeConstantsModule (copy), ReactModule (copy), BuildHomeSortDropDownOptionsModule (copy)
	local UseInputDataResult = SduiSharedUtilitiesModule.useInputData(HomeConstantsModule.ConfigKey, HomeConstantsModule.ContentIdentifier)
	
	return ReactModule.useMemo(function() --[[ Line: 12 ]]
		-- upvalues: BuildHomeSortDropDownOptionsModule (upval), UseInputDataResult (copy)
		return BuildHomeSortDropDownOptionsModule(UseInputDataResult)
	end, { UseInputDataResult })
end