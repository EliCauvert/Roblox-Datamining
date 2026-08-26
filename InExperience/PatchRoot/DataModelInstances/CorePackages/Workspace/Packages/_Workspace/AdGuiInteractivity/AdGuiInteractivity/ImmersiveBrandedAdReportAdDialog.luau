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
local var1 = urlBuilder.new({ path = "illegal-content-reporting", base = url.BASE_URL })
local var2 = urlBuilder.new({
	path = "store/asset/{assetId}",
	base = url.CREATOR_HUB_URL
})
local var3 = urlBuilder.new({
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

local function _()
	-- upvalues: default_1 (ref), t (ref)
	default_1:logRobloxTelemetryCounter(t)
end

local _ = function()
	-- upvalues: default_1 (ref), t_1 (ref)
	default_1:logRobloxTelemetryCounter(t_1)
end

local _ = function(p1)
	-- upvalues: default_1 (ref), t_2 (ref)
	default_1:logRobloxTelemetryCounter(t_2, 1, { reason = p1 })
end

local function logReportImmersiveBrandedAdHttpFailureEvent(p1)
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

local function sendImmersiveBrandedAdAbuseReport(p1, p2)
	-- upvalues: httpService (ref), default_1 (ref), t_2 (ref), var3 (ref), t_1 (ref), logReportImmersiveBrandedAdHttpFailureEvent (ref)
	local t = {
		abuseVector = "ad_v2",
		targetType = "ad_v2",
		category = p2.reason,
		comment = p2.comment,
		custom = { SCREENSHOT_ID = p2.screenshotId, PLACE_ID = p2.placeId },
		submitterId = p2.userId,
		targetIdStr = `immersiveBrandedAd/{p2.immersiveBrandedAdId}`
	}
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), t (ref)
		return httpService:JSONEncode(t)
	end)
	
	if ok then
		task.spawn(function()
			-- upvalues: var3 (copy), p1 (ref), status (ref), default_1 (copy), t_1 (copy), t_2 (copy), logReportImmersiveBrandedAdHttpFailureEvent (copy)
			p1(var3(), "POST", { postBody = status }):andThen(function(_)
				-- upvalues: default_1 (copy), t_1 (copy)
				default_1:logRobloxTelemetryCounter(t_1)
			end, function(p3)
				-- upvalues: default_1 (copy), t_2 (copy), logReportImmersiveBrandedAdHttpFailureEvent (copy)
				default_1:logRobloxTelemetryCounter(t_2, 1, { reason = "http" })
				logReportImmersiveBrandedAdHttpFailureEvent(p3)
			end)
		end)
		
		return true
	end
	default_1:logRobloxTelemetryCounter(t_2, 1, { reason = "jsonEncode" })
	
	return false
end

local function ImmersiveBrandedAdReportAdDialog(p1)
	-- upvalues: useRoactService (ref), roactServiceTagsModule (ref), reactModule (ref), useLocalization (ref), useAppPolicy (ref), var2 (ref), urlBuilder (ref), var1 (ref), default (ref), adsInteractivityTelemetryModule (ref), view (ref), button (ref), buttonVariant (ref), inputSize (ref), runService (ref), default_1 (ref), t (ref), t_2 (ref), sendImmersiveBrandedAdAbuseReport (ref), screenshotModule (ref), defaultTwoStepReportFlowModule (ref), list (ref)
	local immersiveBrandedAdId = p1.immersiveBrandedAdId
	local var4 = useRoactService(roactServiceTagsModule.RoactNetworking)
	local var5 = reactModule.useRef(nil)
	local var6, var7 = reactModule.useState(false)
	local var8 = useLocalization({
		LinkText = "CoreScripts.Ads.Label.IllegalContentReportingLink"
	})
	local var9 = useAppPolicy(function(p2)
		return p2.getShowIllegalContentReportingUI()
	end)
	local var10 = reactModule.useCallback(function()
		-- upvalues: var2 (copy), immersiveBrandedAdId (ref), urlBuilder (copy), var1 (copy), default (copy), adsInteractivityTelemetryModule (copy), p1 (ref)
		default:openURL(urlBuilder.addQueryString(var1(), { contentURL = var2({ assetId = immersiveBrandedAdId }) })):catch(function(_)
			-- upvalues: adsInteractivityTelemetryModule (copy), p1 (copy)
			adsInteractivityTelemetryModule.logImmersiveBrandedAdLinkingFailedCounter("reportAd.eudsaIllegalContent")
			p1.onDismiss()
		end)
	end, { immersiveBrandedAdId, p1.onDismiss })
	local var11 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), view (copy), button (copy), var8 (ref), buttonVariant (copy), var10 (ref), inputSize (copy)
		return reactModule.createElement(view, {
			tag = "col margin-x-medium padding-top-medium size-full-0 auto-y"
		}, {
			linkButton = reactModule.createElement(button, {
				icon = "icons/navigation/externallink",
				text = var8.LinkText,
				variant = buttonVariant.Link,
				onActivated = var10,
				size = inputSize.Small
			})
		})
	end, { var10, var8.LinkText })
	local var12 = reactModule.useCallback(function(p2, p3)
		-- upvalues: runService (copy), default_1 (copy), t (copy), t_2 (copy), var5 (ref), sendImmersiveBrandedAdAbuseReport (copy), var4 (ref), immersiveBrandedAdId (ref)
		if runService:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ or _G.__TEST_SUITE_PACKAGE__ then
			return true
		end
		default_1:logRobloxTelemetryCounter(t)
		local localPlayer = game.Players.LocalPlayer
		
		if not localPlayer then
			default_1:logRobloxTelemetryCounter(t_2, 1, { reason = "noPlayer" })
			
			return false
		elseif var5.current then
			return sendImmersiveBrandedAdAbuseReport(var4, {
				reason = p2,
				comment = p3,
				immersiveBrandedAdId = immersiveBrandedAdId,
				screenshotId = var5.current,
				userId = localPlayer.UserId,
				placeId = game.PlaceId
			})
		end
		default_1:logRobloxTelemetryCounter(t_2, 1, { reason = "noScreenshot" })
		
		return false
	end, { immersiveBrandedAdId, var4 })
	reactModule.useEffect(function()
		-- upvalues: runService (copy), screenshotModule (copy), var5 (ref), var7 (ref)
		if not runService:IsStudio() and not _G.__TESTEZ_RUNNING_TEST__ and not _G.__TEST_SUITE_PACKAGE__ then
			screenshotModule.ScreenshotManager:TakeScreenshotWithCallback(function(p2)
				-- upvalues: var5 (copy)
				var5.current = p2
			end, nil)
		end
		task.defer(function()
			-- upvalues: var7 (copy)
			var7(true)
		end)
	end, {})
	
	return if var6 then reactModule.createElement(reactModule.Fragment, {}, {
		modal = reactModule.createElement("TextButton", {
			Text = "",
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		}),
		abuseReportFlow = reactModule.createElement(defaultTwoStepReportFlowModule, {
			analyticsContext = "Ad",
			isReportCategoryReadonly = true,
			onCloseProps = { hasPreviousSteps = false, onAbandon = p1.onDismiss },
			onSubmitProps = { hasNextSteps = false, onSubmit = var12 },
			onComplete = p1.onDismiss,
			reportCategories = list,
			reportCategoryDefaultKey = list[1].value,
			localizationKeys = {
				formTitle = "CoreScripts.Ads.Label.ReportAd",
				completeTitle = "Feature.ReportAbuse.Title.SelectInSceneThankYou",
				completeDescription = "Feature.ReportAbuse.Label.SelectInSceneComplete"
			},
			footerContent = if var9 then var11 else nil
		})
	}) else nil
end

return function(p1)
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
					reportAdDialog = reactModule.createElement(ImmersiveBrandedAdReportAdDialog, p1)
				})
			})
		})
	})
end