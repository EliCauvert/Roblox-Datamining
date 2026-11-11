local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local PromiseModule = require(Modules.LuaApp.Promise)
local GetReminderOfNormsModule = require(Modules.LuaApp.Http.Requests.ModerationAPI.GetReminderOfNorms)
local NewResult = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))
local NewResult1 = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local ReminderAPIFetchErrorLogging = game:DefineFastFlag("ReminderAPIFetchErrorLogging", false)

function VerifyReminderOfNormsResponse(p1): boolean
	local ContentVariant = p1.contentVariant
	
	return if ContentVariant and (ContentVariant == "positive" or ContentVariant == "warning") and (p1.policyViolation and p1.interventionId and p1.reminderNumber and p1.experimentVariant) then true else false
end

return function(p1)
	-- upvalues: GetReminderOfNormsModule (copy), PromiseModule (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy), NewResult (copy), ReminderAPIFetchErrorLogging (copy), NewResult1 (copy)
	return function(p2)
		-- upvalues: GetReminderOfNormsModule (upval), p1 (copy), PromiseModule (upval), SetCentralOverlayModule (upval), OverlayTypeModule (upval), NewResult (upval), ReminderAPIFetchErrorLogging (upval), NewResult1 (upval)
		return GetReminderOfNormsModule(p1):andThen(function(Result)
			-- upvalues: PromiseModule (upval), p2 (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval), NewResult (upval)
			local ResponseBody = Result.responseBody
			
			if not ResponseBody or not ResponseBody.shouldSurfaceReminder then
				return PromiseModule.resolve()
			elseif VerifyReminderOfNormsResponse(ResponseBody) then
				p2:dispatch(SetCentralOverlayModule(OverlayTypeModule.ReminderOfNormsPopup, {
					interventionId = ResponseBody.interventionId,
					contentVariant = ResponseBody.contentVariant,
					policyViolation = ResponseBody.policyViolation,
					reminderNumber = ResponseBody.reminderNumber,
					experimentVariant = ResponseBody.experimentVariant,
					eventIngest = NewResult
				}))
				
				return PromiseModule.resolve()
			else
				return PromiseModule.reject(nil, ResponseBody)
			end
		end):catch(function(Err)
			-- upvalues: ReminderAPIFetchErrorLogging (upval), NewResult1 (upval)
			if ReminderAPIFetchErrorLogging then
				NewResult1:warning("(Moderation) Failed to fetch reminder {}", Err)
			end
		end)
	end
end