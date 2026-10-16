local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local RoactModule = require(Parent1.Roact)
local AdsDisplayOrderModule = require(Parent.AdsDisplayOrder)
local AppStyleProvider = require(Parent1.UIBlox).App.Style.AppStyleProvider
local LocalizationService = game:GetService("LocalizationService")
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local Localization = require(Parent1.RobloxAppLocales).Localization
local DefaultTwoStepReportFlowModule = require(Parent1.GenericAbuseReporting.DefaultTwoStepReportFlow)
local Players = game:GetService("Players")
local ScreenshotManager = require(Parent1.Screenshot).ScreenshotManager
local HttpService = game:GetService("HttpService")
local GetAppFeaturePoliciesFunction = require(Parent1.UniversalAppPolicy).getAppFeaturePolicies
local LoggingProtocolModule = require(Parent1.LoggingProtocol)
local Default = LoggingProtocolModule.default
local ReportAdFooterModule = require(Parent.ReportAdFooter)
local FlagsModule = require(script.Parent.Flags)
local EnableHideReportAdModalDuringScreenshot = FlagsModule.GetEnableHideReportAdModalDuringScreenshot()
local AdsInteractivityTelemetryModule = require(Parent.AdsInteractivityTelemetry)
local ReportCategories = {
	{
		localizationKey = "CoreScripts.Ads.Label.InappropriateAd",
		value = "ABUSE_CATEGORY_INAPPROPRIATE_AD"
	}
}

function buildReport(p1, Data, Data1, Data2, Data3) --[[ Line: 54 ]]
	-- upvalues: HttpService (copy)
	return HttpService:JSONEncode({
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p1) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = Data1 } } },
			PLACE_ID = { valueList = { { data = tostring(game.PlaceId) } } },
			REPORTER_COMMENT = { valueList = { { data = Data2 } } },
			REPORTED_ABUSE_VECTOR = { valueList = { { data = "ad" } } },
			SCREENSHOT_ID = { valueList = { { data = Data } } },
			IDENTIFIED_ADS = { valueList = { { data = Data3 } } }
		}
	})
end

function ReportAdPopup(p1) --[[ Line: 109 ]]
	-- upvalues: HttpService (copy), GetAppFeaturePoliciesFunction (copy), Default (copy), LoggingProtocolModule (copy), FlagsModule (copy), ReactModule (copy), EnableHideReportAdModalDuringScreenshot (copy), ScreenshotManager (copy), Players (copy), AdsInteractivityTelemetryModule (copy), RoactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), AppStyleProvider (copy), DefaultTwoStepReportFlowModule (copy), ReportCategories (copy), ReportAdFooterModule (copy), AdsDisplayOrderModule (copy)
	local Report = ""
	local Input = { table.clone(p1.adInfo) }
	local Json = HttpService:JSONEncode(Input)
	local v1 = true
	local AppFeaturePolicies = GetAppFeaturePoliciesFunction()
	
	if AppFeaturePolicies == nil then
		Default:logRobloxTelemetryEvent({
			eventName = "UniversalAppPolicyCallFailed",
			description = "Call to UniversalAppPolicy (GUAC) failed in Report Ad popup",
			backends = { LoggingProtocolModule.TelemetryBackends.Points },
			throttlingPercentage = FlagsModule.GetFIntUniversalAppPolicyFailureTelemetryThrottleHundredthsPercent(),
			lastUpdated = { 24, 8, 22 }
		}, nil, {
			assetId = Input[1].assetId,
			encryptedAdTrackingData = Input[1].encryptedAdTrackingData,
			encryptionMetadata = Input[1].encryptionMetadata
		})
	else
		local ShowIllegalContentReportingUI = AppFeaturePolicies.getShowIllegalContentReportingUI()
		v1 = ShowIllegalContentReportingUI ~= nil and ShowIllegalContentReportingUI
	end
	return RoactModule.createElement("ScreenGui", {
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		AutoLocalize = false,
		DisplayOrder = AdsDisplayOrderModule.Modal,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Enabled = p1.showReportAdPopup
	}, RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, 0),
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0.8, 0, 0.6, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			(RoactModule.createElement(LocalizationProvider, {
				localization = Localization.new(LocalizationService.RobloxLocaleId)
			}, {
				RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 20) }),
				RoactModule.createElement(AppStyleProvider, { style = { themeName = "Dark", fontName = "Gotham" } }, {
					AbuseReportFlow = RoactModule.createElement(DefaultTwoStepReportFlowModule, {
						analyticsContext = "Ad",
						isReportCategoryReadonly = true,
						onCloseProps = {
							hasPreviousSteps = false,
							onAbandon = function() --[[ Line: 175 ]]
								-- upvalues: AdsInteractivityTelemetryModule (upval), p1 (copy)
								AdsInteractivityTelemetryModule.logReportAdEvent("close")
								p1.onClose()
							end
						},
						onSubmitProps = {
							hasNextSteps = false,
							onSubmit = ReactModule.useCallback(function(p2, p3): boolean --[[ Line: 139 ]]
								-- upvalues: EnableHideReportAdModalDuringScreenshot (upval), p1 (copy), ScreenshotManager (upval), Players (upval), Report (ref), Json (copy), AdsInteractivityTelemetryModule (upval)
								if EnableHideReportAdModalDuringScreenshot then
									p1.onClose()
								end
								ScreenshotManager:TakeScreenshotWithCallback(function(p4) --[[ Line: 143 ]]
									-- upvalues: Players (upval), Report (upval), p2 (copy), p3 (copy), Json (upval), AdsInteractivityTelemetryModule (upval)
									local LocalPlayer = Players.LocalPlayer
									
									if LocalPlayer ~= nil then
										Report = buildReport(LocalPlayer.UserId, p4, p2, p3, Json)
										Players:ReportAbuseV3(LocalPlayer, Report)
										AdsInteractivityTelemetryModule.logReportAdEvent("submit")
									end
								end, nil)
								
								if EnableHideReportAdModalDuringScreenshot and p1.onOpen then
									p1.onOpen()
								end
								return true
							end, {})
						},
						onComplete = p1.onClose,
						reportCategories = ReportCategories,
						reportCategoryDefaultKey = ReportCategories[1].value,
						localizationKeys = {
							formTitle = "CoreScripts.Ads.Label.ReportAd",
							completeTitle = "Feature.ReportAbuse.Title.SelectInSceneThankYou",
							completeDescription = "Feature.ReportAbuse.Label.SelectInSceneComplete"
						},
						scaleDialog = { X = 0.8, Y = 1 },
						footerContent = function() --[[ Line: 198 ]]
							-- upvalues: v1 (ref), RoactModule (upval), ReportAdFooterModule (upval), Input (copy)
							return if v1 then RoactModule.createElement(ReportAdFooterModule, { assetId = Input[1].assetId }) else nil
						end
					})
				})
			}))
		})
	}))
end

return ReportAdPopup