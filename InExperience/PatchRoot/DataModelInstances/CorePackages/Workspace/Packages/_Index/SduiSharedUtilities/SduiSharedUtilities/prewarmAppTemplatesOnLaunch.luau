local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SharedFlagsModule = require(Parent.SharedFlags)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiLogger = SduiCoreSystemModule.SduiLogger
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local SduiLoadTimerModule = require(SduiSharedUtilities.SduiLoadTimer)
local FetchSduiTemplatesModule = require(SduiSharedUtilities.fetchSduiTemplates)

local function _(p1): string --[[ Line: 23 | Named "makePrewarmTimerKey" ]]
	return `{p1}Prewarm`
end

local list = {
	{
		surfaceKeys = { AppPage.ExperienceDetail },
		timerKey = `{AppPage.ExperienceDetail}Prewarm`,
		isEnabled = function() --[[ Line: 39 ]]
			-- upvalues: SharedFlagsModule (copy)
			return SharedFlagsModule.FFlagSduiEdpTemplatePrewarm
		end
	}
}

local function prewarmSurface(p1) --[[ Line: 56 ]]
	-- upvalues: SduiLoadTimerModule (copy), FetchSduiTemplatesModule (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy)
	local LoadTimer = SduiLoadTimerModule.createLoadTimer(p1.timerKey)
	LoadTimer.start("preload")
	local SduiTemplatesModule = FetchSduiTemplatesModule({ surfaceKeys = p1.surfaceKeys, loadTimer = LoadTimer })
	local Joined = table.concat(p1.surfaceKeys, ",")
	SduiTemplatesModule:catch(function(Err) --[[ Line: 66 ]]
		-- upvalues: SduiLogger (upval), SduiErrors (upval), SduiParseHelpers (upval), Joined (copy)
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToPrewarmTemplates, {
			message = SduiParseHelpers.stringifyValue(Err),
			name = Joined
		}, Joined)
	end)
	
	return SduiTemplatesModule
end

return function() --[[ Line: 80 | Named "prewarmAppTemplatesOnLaunch" ]]
	-- upvalues: list (copy), prewarmSurface (copy)
	local List = {}
	
	for _, value in list do
		if value.isEnabled() then
			table.insert(List, (prewarmSurface(value)))
		end
	end
	return List
end