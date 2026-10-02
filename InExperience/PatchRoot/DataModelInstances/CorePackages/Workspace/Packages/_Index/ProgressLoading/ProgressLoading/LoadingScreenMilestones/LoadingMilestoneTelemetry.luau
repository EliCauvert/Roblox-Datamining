local progressLoading = script:FindFirstAncestor("ProgressLoading")
local _ = progressLoading.Parent
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local telemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.Types)
local constantsModule = require(script.Parent.Constants)
local forwardErrorToScriptContextModule = require(script.Parent.forwardErrorToScriptContext)
local fIntLoadingScreenMilestonesSampleRateModule = require(progressLoading.Flags.FIntLoadingScreenMilestonesSampleRate)

local function reportMilestoneError(p1)
	-- upvalues: forwardErrorToScriptContextModule (ref)
	forwardErrorToScriptContextModule(debug.traceback(tostring(p1), 2))
end

return {
	getMilestoneSessionMetadata = function(p1)
		-- upvalues: constantsModule (ref), runService (ref), userInputService (ref)
		return {
			category = constantsModule.CATEGORY,
			page = constantsModule.PAGE,
			subcategory = p1,
			AppVersion = runService:GetRobloxVersion(),
			CoreScriptVersion = runService:GetCoreScriptVersion(),
			Platform = tostring(userInputService:GetPlatform())
		}
	end,
	completeMilestoneTracker = function(p1)
		-- upvalues: constantsModule (ref), fIntLoadingScreenMilestonesSampleRateModule (ref), reportMilestoneError (ref)
		return xpcall(function()
			-- upvalues: p1 (ref), constantsModule (copy), fIntLoadingScreenMilestonesSampleRateModule (copy)
			p1.trackEnd(constantsModule.TILT_EVENT_NAME, {
				samplingRateOverride = fIntLoadingScreenMilestonesSampleRateModule
			})
		end, reportMilestoneError)
	end,
	discardMilestoneTracker = function(p1)
		-- upvalues: constantsModule (ref), reportMilestoneError (ref)
		return xpcall(function()
			-- upvalues: p1 (ref), constantsModule (copy)
			p1.destroyEvent(constantsModule.TILT_EVENT_NAME)
		end, reportMilestoneError)
	end,
	reportMilestoneError = reportMilestoneError,
	countMilestonesStarted = function(p1)
		-- upvalues: telemetryService (ref), reportMilestoneError (ref)
		return xpcall(function()
			-- upvalues: telemetryService (copy), p1 (ref)
			telemetryService:LogCounter({
				eventName = "TiltLoadingScreenMilestonesStarted",
				description = "Instrumented Tilt loading screens, before tracker initialization.",
				links = "https://roblox.atlassian.net/wiki/x/AAPROQE",
				backends = { "RobloxTelemetryCounter" },
				lastUpdated = { 2026, 9, 28 }
			}, { customFields = p1 }, 1)
		end, reportMilestoneError)
	end,
	countMilestonesOutcome = function(p1, p2)
		-- upvalues: telemetryService (ref), reportMilestoneError (ref)
		return xpcall(function()
			-- upvalues: p1 (ref), p2 (ref), telemetryService (copy)
			local cloned = table.clone(p1)
			cloned.outcome = p2
			telemetryService:LogCounter({
				eventName = "TiltLoadingScreenMilestonesOutcome",
				description = "Terminal outcomes of instrumented Tilt loading screens, independent of TTI sampling.",
				links = "https://roblox.atlassian.net/wiki/x/AAPROQE",
				backends = { "RobloxTelemetryCounter" },
				lastUpdated = { 2026, 9, 28 }
			}, { customFields = cloned }, 1)
		end, reportMilestoneError)
	end
}