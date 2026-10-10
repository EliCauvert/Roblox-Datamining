local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local telemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.Types)
local constantsModule = require(script.Parent.Constants)
local tryMilestoneOperationModule = require(script.Parent.tryMilestoneOperation)

return {
	reportAddedWait = function(p1, p2, p3)
		-- upvalues: tryMilestoneOperationModule (ref), telemetryService (ref)
		return tryMilestoneOperationModule(function()
			-- upvalues: p1 (ref), p3 (ref), telemetryService (copy), p2 (ref)
			local cloned = table.clone(p1)
			cloned.dismissSource = p3
			telemetryService:LogStat({
				eventName = "TiltLoadingScreenAddedWait",
				description = "Milliseconds from the first dismissal request to dismissal start in completed loading screens.",
				links = "https://roblox.atlassian.net/wiki/x/AAPROQE",
				backends = { "RobloxTelemetryStat" },
				lastUpdated = { 2026, 10, 1 }
			}, { customFields = cloned }, p2)
		end)
	end,
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
	countMilestonesStarted = function(p1)
		-- upvalues: tryMilestoneOperationModule (ref), telemetryService (ref), constantsModule (ref)
		return tryMilestoneOperationModule(function()
			-- upvalues: telemetryService (copy), constantsModule (copy), p1 (ref)
			telemetryService:LogCounter({
				description = "Instrumented Tilt loading screens, before tracker initialization.",
				links = "https://roblox.atlassian.net/wiki/x/AAPROQE",
				eventName = constantsModule.EVENT_NAME .. "_MilestonesStarted",
				backends = { "RobloxTelemetryCounter" },
				lastUpdated = { 2026, 9, 28 }
			}, { customFields = p1 }, 1)
		end)
	end,
	countMilestonesOutcome = function(p1, p2)
		-- upvalues: tryMilestoneOperationModule (ref), telemetryService (ref), constantsModule (ref)
		return tryMilestoneOperationModule(function()
			-- upvalues: p1 (ref), p2 (ref), telemetryService (copy), constantsModule (copy)
			local cloned = table.clone(p1)
			cloned.outcome = p2
			telemetryService:LogCounter({
				description = "Terminal outcomes of instrumented Tilt loading screens, independent of TTI sampling.",
				links = "https://roblox.atlassian.net/wiki/x/AAPROQE",
				eventName = constantsModule.EVENT_NAME .. "_MilestonesOutcome",
				backends = { "RobloxTelemetryCounter" },
				lastUpdated = { 2026, 9, 28 }
			}, { customFields = cloned }, 1)
		end)
	end
}