local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local roactModule = require(parent_1.Roact)
local adsDisplayOrderModule = require(parent.AdsDisplayOrder)
local appStyleProvider = require(parent_1.UIBlox).App.Style.AppStyleProvider
local localizationService = game:GetService("LocalizationService")
local localizationProvider = require(parent_1.Localization).LocalizationProvider
local localization = require(parent_1.RobloxAppLocales).Localization
local defaultTwoStepReportFlowModule = require(parent_1.GenericAbuseReporting.DefaultTwoStepReportFlow)
local playersService = game:GetService("Players")
local screenshotManager = require(parent_1.Screenshot).ScreenshotManager
local httpService = game:GetService("HttpService")
local getAppFeaturePolicies = require(parent_1.UniversalAppPolicy).getAppFeaturePolicies
local loggingProtocolModule = require(parent_1.LoggingProtocol)
local default = loggingProtocolModule.default
local reportAdFooterModule = require(parent.ReportAdFooter)
local flagsModule = require(script.Parent.Flags)
local enableHideReportAdModalDuringScreenshot = flagsModule.GetEnableHideReportAdModalDuringScreenshot()
local adsInteractivityTelemetryModule = require(parent.AdsInteractivityTelemetry)
local list = {
	{
		localizationKey = "CoreScripts.Ads.Label.InappropriateAd",
		value = "ABUSE_CATEGORY_INAPPROPRIATE_AD"
	}
}

function buildReport(p1, p2, p3, p4, p5)
	-- upvalues: httpService (ref)
	return httpService:JSONEncode({
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p1) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = p3 } } },
			PLACE_ID = { valueList = { { data = tostring(game.PlaceId) } } },
			REPORTER_COMMENT = { valueList = { { data = p4 } } },
			REPORTED_ABUSE_VECTOR = { valueList = { { data = "ad" } } },
			SCREENSHOT_ID = { valueList = { { data = p2 } } },
			IDENTIFIED_ADS = { valueList = { { data = p5 } } }
		}
	})
end

function ReportAdPopup(p1)
	-- upvalues: httpService (ref), getAppFeaturePolicies (ref), default (ref), loggingProtocolModule (ref), flagsModule (ref), reactModule (ref), enableHideReportAdModalDuringScreenshot (ref), screenshotManager (ref), playersService (ref), adsInteractivityTelemetryModule (ref), roactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), appStyleProvider (ref), defaultTwoStepReportFlowModule (ref), list (ref), reportAdFooterModule (ref), adsDisplayOrderModule (ref)
	local var1 = ""
	local list_1 = { table.clone(p1.adInfo) }
	local var2 = httpService:JSONEncode(list_1)
	local var3 = true
	local var4 = getAppFeaturePolicies()
	
	if var4 == nil then
		default:logRobloxTelemetryEvent({
			eventName = "UniversalAppPolicyCallFailed",
			description = "Call to UniversalAppPolicy (GUAC) failed in Report Ad popup",
			backends = { loggingProtocolModule.TelemetryBackends.Points },
			throttlingPercentage = flagsModule.GetFIntUniversalAppPolicyFailureTelemetryThrottleHundredthsPercent(),
			lastUpdated = { 24, 8, 22 }
		}, nil, {
			assetId = list_1[1].assetId,
			encryptedAdTrackingData = list_1[1].encryptedAdTrackingData,
			encryptionMetadata = list_1[1].encryptionMetadata
		})
	else
		local showIllegalContentReportingUI = var4.getShowIllegalContentReportingUI()
		var3 = showIllegalContentReportingUI ~= nil and showIllegalContentReportingUI
	end
	return roactModule.createElement("ScreenGui", {
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		AutoLocalize = false,
		DisplayOrder = adsDisplayOrderModule.Modal,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Enabled = p1.showReportAdPopup
	}, roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, 0),
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0.8, 0, 0.6, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			roactModule.createElement(localizationProvider, {
				localization = localization.new(localizationService.RobloxLocaleId)
			}, {
				roactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 20) }),
				roactModule.createElement(appStyleProvider, { style = { themeName = "Dark", fontName = "Gotham" } }, {
					AbuseReportFlow = roactModule.createElement(defaultTwoStepReportFlowModule, {
						analyticsContext = "Ad",
						isReportCategoryReadonly = true,
						onCloseProps = {
							hasPreviousSteps = false,
							onAbandon = function()
								-- upvalues: adsInteractivityTelemetryModule (copy), p1 (ref)
								adsInteractivityTelemetryModule.logReportAdEvent("close")
								p1.onClose()
							end
						},
						onSubmitProps = {
							hasNextSteps = false,
							onSubmit = reactModule.useCallback(function(p2, p3)
								-- upvalues: enableHideReportAdModalDuringScreenshot (copy), p1 (ref), screenshotManager (copy), playersService (copy), var1 (write), var2 (ref), adsInteractivityTelemetryModule (copy)
								if enableHideReportAdModalDuringScreenshot then
									p1.onClose()
								end
								screenshotManager:TakeScreenshotWithCallback(function(p4)
									-- upvalues: playersService (copy), var1 (copy), p2 (ref), p3 (ref), var2 (copy), adsInteractivityTelemetryModule (copy)
									local localPlayer = playersService.LocalPlayer
									
									if localPlayer ~= nil then
										var1 = buildReport(localPlayer.UserId, p4, p2, p3, var2)
										playersService:ReportAbuseV3(localPlayer, var1)
										adsInteractivityTelemetryModule.logReportAdEvent("submit")
									end
								end, nil)
								
								if enableHideReportAdModalDuringScreenshot and p1.onOpen then
									p1.onOpen()
								end
								return true
							end, {})
						},
						onComplete = p1.onClose,
						reportCategories = list,
						reportCategoryDefaultKey = list[1].value,
						localizationKeys = {
							formTitle = "CoreScripts.Ads.Label.ReportAd",
							completeTitle = "Feature.ReportAbuse.Title.SelectInSceneThankYou",
							completeDescription = "Feature.ReportAbuse.Label.SelectInSceneComplete"
						},
						scaleDialog = { X = 0.8, Y = 1 },
						footerContent = function()
							-- upvalues: var3 (write), roactModule (copy), reportAdFooterModule (copy), list_1 (ref)
							return if var3 then roactModule.createElement(reportAdFooterModule, { assetId = list_1[1].assetId }) else nil
						end
					})
				})
			})
		})
	}))
end

return ReportAdPopup