local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local adGuiInteractivity = script:FindFirstAncestor("AdGuiInteractivity")
local parent = adGuiInteractivity.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local linkingProtocolModule = require(parent.LinkingProtocol)
local foundationModule = require(parent.Foundation)
local colorMode = foundationModule.Enums.ColorMode
local localizationModule = require(parent.Localization)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local httpModule = require(parent.Http)
local roactServicesModule = require(parent.RoactServices)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local screenshotModule = require(parent.Screenshot)
local loggingProtocolModule = require(parent.LoggingProtocol)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local adsInteractivityTelemetryModule = require(adGuiInteractivity.AdsInteractivityTelemetry)
local useRoactService = robloxAppHooksModule.useRoactService
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local constants = UIBloxModule.App.Style.Constants
local defaultTwoStepReportFlowModule = require(parent.GenericAbuseReporting.DefaultTwoStepReportFlow)
local button = foundationModule.Button
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local useLocalization = localizationModule.Hooks.useLocalization
local default = linkingProtocolModule.LinkingProtocol.default
local default_1 = loggingProtocolModule.default
local url = httpModule.Url
local list = {
	{
		localizationKey = "CoreScripts.Ads.Label.InappropriateAd",
		value = "ABUSE_CATEGORY_INAPPROPRIATE_AD"
	}
}
local var18 = urlBuilder.new({ path = "illegal-content-reporting", base = url.BASE_URL })
local var19 = urlBuilder.new({
	path = "store/asset/{assetId}",
	base = url.CREATOR_HUB_URL
})
local var20 = urlBuilder.new({
	path = "abuse-reporting/v1/abuse-report",
	base = url.APIS_URL
})
local t = {
	eventName = "ReportImmersiveBrandedAdTotalCounter",
	description = "This event is fired when the user initiates submitting an immersive branded ad abuse report (before success or failure is known).",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 26, 3, 11 }
}
local t_1 = {
	eventName = "ReportImmersiveBrandedAdSuccessCounter",
	description = "This event is fired when an immersive branded ad abuse report is successfully submitted to the server.",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 26, 3, 11 }
}
local t_2 = {
	eventName = "ReportImmersiveBrandedAdFailureCounter",
	description = "This event is fired when submitting an immersive branded ad abuse report fails.",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 26, 3, 11 }
}
local t_3 = {
	eventName = "ReportImmersiveBrandedAdHttpFaulreEvent",
	description = "This event is fired when the HTTP request to submit an immersive branded ad abuse report fails.",
	backends = { loggingProtocolModule.TelemetryBackends.Points },
	throttlingPercentage = game:DefineFastInt("ReportImmersiveBrandedAdHttpFaulreEventThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 11, 3 }
}

local function _() --[[ line: 93 | named "logReportImmersiveBrandedAdTotalCounter" ]]
	-- upvalues: default_1 (ref), t (ref)
	default_1:logRobloxTelemetryCounter(t)
end

local _ = function() --[[ line: 97 | named "logReportImmersiveBrandedAdSuccessCounter" ]]
	-- upvalues: default_1 (ref), t_1 (ref)
	default_1:logRobloxTelemetryCounter(t_1)
end

local _ = function(p0) --[[ line: 101 | named "logReportImmersiveBrandedAdFailureCounter" ]]
	-- upvalues: default_1 (ref), t_2 (ref)
	default_1:logRobloxTelemetryCounter(t_2, 1, { reason = p0 })
end

local function logReportImmersiveBrandedAdHttpFailureEvent(p1) --[[ line: 107 ]]
	-- upvalues: default_1 (ref), t_3 (ref)
	local t = {}
	
	if type(p1) == "string" then
		t.error = p1:sub(1, 500)
	elseif type(p1) == "table" then
		if p1.Body and type(p1.Body) == "string" then
			t.body = p1.Body:sub(1, 500)
		end
		if p1.StatusCode and type(p1.StatusCode) == "number" then
			t.statusCode = tostring(p1.StatusCode)
		end
	end
	default_1:logRobloxTelemetryEvent(t_3, nil, t)
end

local function sendImmersiveBrandedAdAbuseReport(p2, p3) --[[ line: 132 ]]
	-- upvalues: httpService (ref), default_1 (ref), t_2 (ref), var20 (ref), t_1 (ref), logReportImmersiveBrandedAdHttpFailureEvent (ref)
	local t = {
		abuseVector = "ad_v2",
		targetType = "ad_v2",
		category = p3.reason,
		comment = p3.comment,
		custom = { SCREENSHOT_ID = p3.screenshotId, PLACE_ID = p3.placeId },
		submitterId = p3.userId,
		targetIdStr = `immersiveBrandedAd/{p3.immersiveBrandedAdId}`
	}
	local ok, status = pcall(function() --[[ line: 146 ]]
		-- upvalues: httpService (copy), t (ref)
		return httpService:JSONEncode(t)
	end)
	
	if ok then
		task.spawn(function() --[[ line: 154 ]]
			-- upvalues: var20 (copy), p2 (ref), status (ref), default_1 (copy), t_1 (copy), t_2 (copy), logReportImmersiveBrandedAdHttpFailureEvent (copy)
			p2(var20(), "POST", { postBody = status }):andThen(function(_) --[[ line: 156 ]]
				-- upvalues: default_1 (copy), t_1 (copy)
				default_1:logRobloxTelemetryCounter(t_1)
			end, function(p4) --[[ line: 158 ]]
				-- upvalues: default_1 (copy), t_2 (copy), logReportImmersiveBrandedAdHttpFailureEvent (copy)
				default_1:logRobloxTelemetryCounter(t_2, 1, { reason = "http" })
				logReportImmersiveBrandedAdHttpFailureEvent(p4)
			end)
		end)
		
		return true
	end
	default_1:logRobloxTelemetryCounter(t_2, 1, { reason = "jsonEncode" })
	
	return false
end

local function ImmersiveBrandedAdReportAdDialog(p5) --[[ line: 172 ]]
	-- upvalues: useRoactService (ref), roactServiceTagsModule (ref), reactModule (ref), useLocalization (ref), useAppPolicy (ref), var19 (ref), urlBuilder (ref), var18 (ref), default (ref), adsInteractivityTelemetryModule (ref), view (ref), button (ref), buttonVariant (ref), inputSize (ref), runService (ref), default_1 (ref), t (ref), t_2 (ref), sendImmersiveBrandedAdAbuseReport (ref), screenshotModule (ref), defaultTwoStepReportFlowModule (ref), list (ref)
	local immersiveBrandedAdId = p5.immersiveBrandedAdId
	local var30 = useRoactService(roactServiceTagsModule.RoactNetworking)
	local var31 = reactModule.useRef(nil)
	local var32, var33 = reactModule.useState(false)
	local var34 = useLocalization({
		LinkText = "CoreScripts.Ads.Label.IllegalContentReportingLink"
	})
	local var35 = useAppPolicy(function(p6) --[[ line: 182 ]]
		return p6.getShowIllegalContentReportingUI()
	end)
	local var36 = reactModule.useCallback(function() --[[ line: 186 ]]
		-- upvalues: var19 (copy), immersiveBrandedAdId (ref), urlBuilder (copy), var18 (copy), default (copy), adsInteractivityTelemetryModule (copy), p5 (ref)
		default:openURL(urlBuilder.addQueryString(var18(), { contentURL = var19({ assetId = immersiveBrandedAdId }) })):catch(function(_) --[[ line: 192 ]]
			-- upvalues: adsInteractivityTelemetryModule (copy), p5 (copy)
			adsInteractivityTelemetryModule.logImmersiveBrandedAdLinkingFailedCounter("reportAd.eudsaIllegalContent")
			p5.onDismiss()
		end)
	end, { immersiveBrandedAdId, p5.onDismiss })
	local var37 = reactModule.useCallback(function() --[[ line: 198 ]]
		-- upvalues: reactModule (copy), view (copy), button (copy), var34 (ref), buttonVariant (copy), var36 (ref), inputSize (copy)
		return reactModule.createElement(view, {
			tag = "col margin-x-medium padding-top-medium size-full-0 auto-y"
		}, {
			linkButton = reactModule.createElement(button, {
				icon = "icons/navigation/externallink",
				text = var34.LinkText,
				variant = buttonVariant.Link,
				onActivated = var36,
				size = inputSize.Small
			})
		})
	end, { var36, var34.LinkText })
	local var38 = reactModule.useCallback(function(p7, p8) --[[ line: 212 ]]
		-- upvalues: runService (copy), default_1 (copy), t (copy), t_2 (copy), var31 (ref), sendImmersiveBrandedAdAbuseReport (copy), var30 (ref), immersiveBrandedAdId (ref)
		if runService:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ or _G.__TEST_SUITE_PACKAGE__ then
			return true
		end
		default_1:logRobloxTelemetryCounter(t)
		local localPlayer = game.Players.LocalPlayer
		
		if not localPlayer then
			default_1:logRobloxTelemetryCounter(t_2, 1, { reason = "noPlayer" })
			
			return false
		elseif var31.current then
			return sendImmersiveBrandedAdAbuseReport(var30, {
				reason = p7,
				comment = p8,
				immersiveBrandedAdId = immersiveBrandedAdId,
				screenshotId = var31.current,
				userId = localPlayer.UserId,
				placeId = game.PlaceId
			})
		end
		default_1:logRobloxTelemetryCounter(t_2, 1, { reason = "noScreenshot" })
		
		return false
	end, { immersiveBrandedAdId, var30 })
	reactModule.useEffect(function() --[[ line: 241 ]]
		-- upvalues: runService (copy), screenshotModule (copy), var31 (ref), var33 (ref)
		if not runService:IsStudio() and not _G.__TESTEZ_RUNNING_TEST__ and not _G.__TEST_SUITE_PACKAGE__ then
			screenshotModule.ScreenshotManager:TakeScreenshotWithCallback(function(p9) --[[ line: 244 ]]
				-- upvalues: var31 (copy)
				var31.current = p9
			end, nil)
		end
		task.defer(function() --[[ line: 250 ]]
			-- upvalues: var33 (copy)
			var33(true)
		end)
	end, {})
	
	return if var32 then reactModule.createElement(reactModule.Fragment, {}, {
		modal = reactModule.createElement("TextButton", {
			Text = "",
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		}),
		abuseReportFlow = reactModule.createElement(defaultTwoStepReportFlowModule, {
			analyticsContext = "Ad",
			isReportCategoryReadonly = true,
			onCloseProps = { hasPreviousSteps = false, onAbandon = p5.onDismiss },
			onSubmitProps = { hasNextSteps = false, onSubmit = var38 },
			onComplete = p5.onDismiss,
			reportCategories = list,
			reportCategoryDefaultKey = list[1].value,
			localizationKeys = {
				formTitle = "CoreScripts.Ads.Label.ReportAd",
				completeTitle = "Feature.ReportAbuse.Title.SelectInSceneThankYou",
				completeDescription = "Feature.ReportAbuse.Label.SelectInSceneComplete"
			},
			footerContent = if var35 then var37 else nil
		})
	}) else nil
end

return function(p10) --[[ line: 291 ]]
	-- upvalues: reactModule (ref), roactServicesModule (ref), roactServiceTagsModule (ref), httpModule (ref), httpService (ref), universalAppPolicyModule (ref), appStyleProvider (ref), colorMode (ref), constants (ref), ImmersiveBrandedAdReportAdDialog (ref)
	return reactModule.createElement(roactServicesModule.RoactServices.ServiceProvider, {
		services = {
			[roactServiceTagsModule.RoactNetworking] = httpModule.NetworkLayers.requestInternalWrapper(httpService)
		}
	}, {
		policyProvider = reactModule.createElement(universalAppPolicyModule.RoactAppPolicy.Provider, { policy = { universalAppPolicyModule.AppFeaturePolicies } }, {
			appStyleProvider = reactModule.createElement(appStyleProvider, {
				style = {
					themeName = colorMode.Dark,
					fontName = constants.FontName.Gotham
				}
			}, {
				resizeFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromScale(1, 0.6),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					reportAdDialog = reactModule.createElement(ImmersiveBrandedAdReportAdDialog, p10)
				})
			})
		})
	})
end