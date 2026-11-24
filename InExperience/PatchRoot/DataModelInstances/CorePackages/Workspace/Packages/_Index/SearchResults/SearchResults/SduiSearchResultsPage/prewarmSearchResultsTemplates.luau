local Parent = script:FindFirstAncestor("SearchResults").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiLogger = SduiCoreSystemModule.SduiLogger
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer

return function()
	-- upvalues: SduiLoadTimer (copy), AppPage (copy), SduiSharedUtilitiesModule (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy)
	local LoadTimer = SduiLoadTimer.createLoadTimer(`{AppPage.SearchPage}Prewarm`)
	LoadTimer.start("preload")
	local SduiTemplates = SduiSharedUtilitiesModule.fetchSduiTemplates({
		surfaceKeys = { AppPage.SearchPage },
		loadTimer = LoadTimer
	})
	SduiTemplates:catch(function(Err)
		-- upvalues: SduiLogger (upval), SduiErrors (upval), SduiParseHelpers (upval), AppPage (upval)
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToPrewarmTemplates, {
			message = SduiParseHelpers.stringifyValue(Err),
			name = AppPage.SearchPage
		}, AppPage.SearchPage)
	end)
	
	return SduiTemplates
end