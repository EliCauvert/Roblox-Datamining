local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sharedFlagsModule = require(parent.SharedFlags)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiLogger = sduiCoreSystemModule.SduiLogger
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local sduiLoadTimerModule = require(sduiSharedUtilities.SduiLoadTimer)
local fetchSduiTemplatesModule = require(sduiSharedUtilities.fetchSduiTemplates)

local function _(p1)
	return `{p1}Prewarm`
end

local list = {
	{
		surfaceKeys = { appPage.ExperienceDetail },
		timerKey = `{appPage.ExperienceDetail}Prewarm`,
		isEnabled = function()
			-- upvalues: sharedFlagsModule (ref)
			return sharedFlagsModule.FFlagSduiEdpTemplatePrewarm
		end
	}
}

local function prewarmSurface(p1)
	-- upvalues: sduiLoadTimerModule (ref), fetchSduiTemplatesModule (ref), sduiLogger (ref), sduiErrors (ref), sduiParseHelpers (ref)
	local var1 = sduiLoadTimerModule.createLoadTimer(p1.timerKey)
	var1.start("preload")
	local var2 = fetchSduiTemplatesModule({ surfaceKeys = p1.surfaceKeys, loadTimer = var1 })
	local joined = table.concat(p1.surfaceKeys, ",")
	var2:catch(function(p2)
		-- upvalues: sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), joined (ref)
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPrewarmTemplates, {
			message = sduiParseHelpers.stringifyValue(p2),
			name = joined
		}, joined)
	end)
	
	return var2
end

return function()
	-- upvalues: list (ref), prewarmSurface (ref)
	local t = {}
	
	for i, v in list do
		if v.isEnabled() then
			table.insert(t, prewarmSurface(v))
		end
	end
	return t
end