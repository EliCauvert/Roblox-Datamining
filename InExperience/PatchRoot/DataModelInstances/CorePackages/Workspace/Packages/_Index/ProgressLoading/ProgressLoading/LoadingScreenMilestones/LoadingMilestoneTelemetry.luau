local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TelemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.Types)
local ConstantsModule = require(script.Parent.Constants)
local TryMilestoneOperationModule = require(script.Parent.tryMilestoneOperation)

return {
	reportHoldGateHit = function(Tbl, HoldGateHit)
		-- upvalues: TryMilestoneOperationModule (copy), ConstantsModule (copy), TelemetryService (copy)
		return TryMilestoneOperationModule(function()
			-- upvalues: Tbl (copy), ConstantsModule (upval), HoldGateHit (copy), TelemetryService (upval)
			local Copy = table.clone(Tbl)
			Copy.dismissSource = ConstantsModule.DismissSource.NormalReady
			Copy.holdGateHit = HoldGateHit
			TelemetryService:LogCounter({
				description = "Completed normal-first HoldOn screens without reduced motion, with readiness and gate-release observations, split by whether readiness preceded gate release.",
				links = "https://roblox.atlassian.net/wiki/x/AAPROQE",
				eventName = ConstantsModule.EVENT_NAME .. "_HoldGateHit",
				backends = { "RobloxTelemetryCounter" },
				lastUpdated = { 2026, 10, 12 }
			}, { customFields = Copy }, 1)
		end)
	end,
	reportContentVisibility = function(Tbl, TitleVisible, CreatorVisible, ThumbnailVisible)
		-- upvalues: TryMilestoneOperationModule (copy), TelemetryService (copy), ConstantsModule (copy)
		return TryMilestoneOperationModule(function()
			-- upvalues: Tbl (copy), TitleVisible (copy), CreatorVisible (copy), ThumbnailVisible (copy), TelemetryService (upval), ConstantsModule (upval)
			local Copy = table.clone(Tbl)
			Copy.titleVisible = TitleVisible
			Copy.creatorVisible = CreatorVisible
			Copy.thumbnailVisible = ThumbnailVisible
			Copy.allContentVisible = TitleVisible and (CreatorVisible and ThumbnailVisible)
			TelemetryService:LogCounter({
				description = "Completed loading screens with mount and dismissal-start observations, split by title, creator, thumbnail, and all-content visibility before dismissal.",
				links = "https://roblox.atlassian.net/wiki/x/AAPROQE",
				eventName = ConstantsModule.EVENT_NAME .. "_ContentVisibility",
				backends = { "RobloxTelemetryCounter" },
				lastUpdated = { 2026, 10, 11 }
			}, { customFields = Copy }, 1)
		end)
	end,
	reportAddedWait = function(Tbl, Value, DismissSource)
		-- upvalues: TryMilestoneOperationModule (copy), TelemetryService (copy)
		return TryMilestoneOperationModule(function()
			-- upvalues: Tbl (copy), DismissSource (copy), TelemetryService (upval), Value (copy)
			local Copy = table.clone(Tbl)
			Copy.dismissSource = DismissSource
			TelemetryService:LogStat({
				eventName = "TiltLoadingScreenAddedWait",
				description = "Milliseconds from the first dismissal request to dismissal start in completed loading screens.",
				links = "https://roblox.atlassian.net/wiki/x/AAPROQE",
				backends = { "RobloxTelemetryStat" },
				lastUpdated = { 2026, 10, 1 }
			}, { customFields = Copy }, Value)
		end)
	end,
	getMilestoneSessionMetadata = function(Subcategory)
		-- upvalues: ConstantsModule (copy), RunService (copy), UserInputService (copy)
		return {
			category = ConstantsModule.CATEGORY,
			page = ConstantsModule.PAGE,
			subcategory = Subcategory,
			AppVersion = RunService:GetRobloxVersion(),
			CoreScriptVersion = RunService:GetCoreScriptVersion(),
			Platform = tostring(UserInputService:GetPlatform())
		}
	end,
	countMilestonesStarted = function(CustomFields)
		-- upvalues: TryMilestoneOperationModule (copy), TelemetryService (copy), ConstantsModule (copy)
		return TryMilestoneOperationModule(function()
			-- upvalues: TelemetryService (upval), ConstantsModule (upval), CustomFields (copy)
			TelemetryService:LogCounter({
				description = "Instrumented Tilt loading screens, before tracker initialization.",
				links = "https://roblox.atlassian.net/wiki/x/AAPROQE",
				eventName = ConstantsModule.EVENT_NAME .. "_MilestonesStarted",
				backends = { "RobloxTelemetryCounter" },
				lastUpdated = { 2026, 9, 28 }
			}, { customFields = CustomFields }, 1)
		end)
	end,
	countMilestonesOutcome = function(Tbl, Outcome)
		-- upvalues: TryMilestoneOperationModule (copy), TelemetryService (copy), ConstantsModule (copy)
		return TryMilestoneOperationModule(function()
			-- upvalues: Tbl (copy), Outcome (copy), TelemetryService (upval), ConstantsModule (upval)
			local Copy = table.clone(Tbl)
			Copy.outcome = Outcome
			TelemetryService:LogCounter({
				description = "Terminal outcomes of instrumented Tilt loading screens, independent of TTI sampling.",
				links = "https://roblox.atlassian.net/wiki/x/AAPROQE",
				eventName = ConstantsModule.EVENT_NAME .. "_MilestonesOutcome",
				backends = { "RobloxTelemetryCounter" },
				lastUpdated = { 2026, 9, 28 }
			}, { customFields = Copy }, 1)
		end)
	end
}