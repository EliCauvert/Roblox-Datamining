local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local AdGuiInteractivity = script:FindFirstAncestor("AdGuiInteractivity")
local Parent = AdGuiInteractivity.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local HttpModule = require(Parent.Http)
local RoactServicesModule = require(Parent.RoactServices)
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local ScreenshotModule = require(Parent.Screenshot)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local AdsInteractivityTelemetryModule = require(AdGuiInteractivity.AdsInteractivityTelemetry)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseAppPolicyFunction = UniversalAppPolicyModule.useAppPolicy
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local Constants = UIBloxModule.App.Style.Constants
local DefaultTwoStepReportFlowModule = require(Parent.GenericAbuseReporting.DefaultTwoStepReportFlow)
local Button = FoundationModule.Button
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local Default1 = LoggingProtocolModule.default
local Url = HttpModule.Url
local ReportCategories = {
	{
		localizationKey = "CoreScripts.Ads.Label.InappropriateAd",
		value = "ABUSE_CATEGORY_INAPPROPRIATE_AD"
	}
}
local NewUrlBuilder = UrlBuilder.new({ path = "illegal-content-reporting", base = Url.BASE_URL })
local NewUrlBuilder1 = UrlBuilder.new({
	path = "store/asset/{assetId}",
	base = Url.CREATOR_HUB_URL
})
local NewUrlBuilder2 = UrlBuilder.new({
	path = "abuse-reporting/v1/abuse-report",
	base = Url.APIS_URL
})
local config = {
	eventName = "ReportImmersiveBrandedAdTotalCounter",
	description = "This event is fired when the user initiates submitting an immersive branded ad abuse report (before success or failure is known).",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 26, 3, 11 }
}
local config1 = {
	eventName = "ReportImmersiveBrandedAdSuccessCounter",
	description = "This event is fired when an immersive branded ad abuse report is successfully submitted to the server.",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 26, 3, 11 }
}
local config2 = {
	eventName = "ReportImmersiveBrandedAdFailureCounter",
	description = "This event is fired when submitting an immersive branded ad abuse report fails.",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 26, 3, 11 }
}
local config3 = {
	eventName = "ReportImmersiveBrandedAdHttpFaulreEvent",
	description = "This event is fired when the HTTP request to submit an immersive branded ad abuse report fails.",
	backends = { LoggingProtocolModule.TelemetryBackends.Points },
	throttlingPercentage = game:DefineFastInt("ReportImmersiveBrandedAdHttpFaulreEventThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 11, 3 }
}

local function _()
	-- upvalues: Default1 (copy), config (copy)
	Default1:logRobloxTelemetryCounter(config)
end

local _ = function()
	-- upvalues: Default1 (copy), config1 (copy)
	Default1:logRobloxTelemetryCounter(config1)
end

local _ = function(Reason)
	-- upvalues: Default1 (copy), config2 (copy)
	Default1:logRobloxTelemetryCounter(config2, 1, { reason = Reason })
end

local function logReportImmersiveBrandedAdHttpFailureEvent(Text: string)
	-- upvalues: Default1 (copy), config3 (copy)
	local t = {}
	
	if type(Text) == "string" then
		t.error = Text:sub(1, 500)
	elseif type(Text) == "table" then
		if Text.Body and type(Text.Body) == "string" then
			t.body = Text.Body:sub(1, 500)
		end
		if Text.StatusCode and type(Text.StatusCode) == "number" then
			t.statusCode = tostring(Text.StatusCode)
		end
	end
	Default1:logRobloxTelemetryEvent(config3, nil, t)
end

local function sendImmersiveBrandedAdAbuseReport(Callback, p1): boolean
	-- upvalues: HttpService (copy), Default1 (copy), config2 (copy), NewUrlBuilder2 (copy), config1 (copy), logReportImmersiveBrandedAdHttpFailureEvent (copy)
	local config = {
		abuseVector = "ad_v2",
		targetType = "ad_v2",
		category = p1.reason,
		comment = p1.comment,
		custom = { SCREENSHOT_ID = p1.screenshotId, PLACE_ID = p1.placeId },
		submitterId = p1.userId,
		targetIdStr = `immersiveBrandedAd/{p1.immersiveBrandedAdId}`
	}
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), config (copy)
		return HttpService:JSONEncode(config)
	end)
	
	if Success then
		task.spawn(function()
			-- upvalues: NewUrlBuilder2 (upval), Callback (copy), Result (copy), Default1 (upval), config1 (upval), config2 (upval), logReportImmersiveBrandedAdHttpFailureEvent (upval)
			Callback(NewUrlBuilder2(), "POST", { postBody = Result }):andThen(function(_)
				-- upvalues: Default1 (upval), config1 (upval)
				Default1:logRobloxTelemetryCounter(config1)
			end, function(p2)
				-- upvalues: Default1 (upval), config2 (upval), logReportImmersiveBrandedAdHttpFailureEvent (upval)
				Default1:logRobloxTelemetryCounter(config2, 1, { reason = "http" })
				logReportImmersiveBrandedAdHttpFailureEvent(p2)
			end)
		end)
		
		return true
	else
		Default1:logRobloxTelemetryCounter(config2, 1, { reason = "jsonEncode" })
		
		return false
	end
end

local function ImmersiveBrandedAdReportAdDialog(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactServiceTagsModule (copy), ReactModule (copy), UseLocalizationFunction (copy), UseAppPolicyFunction (copy), NewUrlBuilder1 (copy), UrlBuilder (copy), NewUrlBuilder (copy), Default (copy), AdsInteractivityTelemetryModule (copy), View (copy), Button (copy), ButtonVariant (copy), InputSize (copy), RunService (copy), Default1 (copy), config (copy), config2 (copy), sendImmersiveBrandedAdAbuseReport (copy), ScreenshotModule (copy), DefaultTwoStepReportFlowModule (copy), ReportCategories (copy)
	local ImmersiveBrandedAdId = p1.immersiveBrandedAdId
	local UseRoactServiceResult = UseRoactServiceFunction(RoactServiceTagsModule.RoactNetworking)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseLocalizationResult = UseLocalizationFunction({
		LinkText = "CoreScripts.Ads.Label.IllegalContentReportingLink"
	})
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getShowIllegalContentReportingUI()
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NewUrlBuilder1 (upval), ImmersiveBrandedAdId (copy), UrlBuilder (upval), NewUrlBuilder (upval), Default (upval), AdsInteractivityTelemetryModule (upval), p1 (copy)
		Default:openURL((UrlBuilder.addQueryString(NewUrlBuilder(), {
			contentURL = NewUrlBuilder1({ assetId = ImmersiveBrandedAdId })
		}))):catch(function(_)
			-- upvalues: AdsInteractivityTelemetryModule (upval), p1 (upval)
			AdsInteractivityTelemetryModule.logImmersiveBrandedAdLinkingFailedCounter("reportAd.eudsaIllegalContent")
			p1.onDismiss()
		end)
	end, { ImmersiveBrandedAdId, p1.onDismiss })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), View (upval), Button (upval), UseLocalizationResult (copy), ButtonVariant (upval), UseResult (copy), InputSize (upval)
		return ReactModule.createElement(View, {
			tag = "col margin-x-medium padding-top-medium size-full-0 auto-y"
		}, {
			linkButton = ReactModule.createElement(Button, {
				icon = "icons/navigation/externallink",
				text = UseLocalizationResult.LinkText,
				variant = ButtonVariant.Link,
				onActivated = UseResult,
				size = InputSize.Small
			})
		})
	end, { UseResult, UseLocalizationResult.LinkText })
	local UseResult2 = ReactModule.useCallback(function(Reason, Comment)
		-- upvalues: RunService (upval), Default1 (upval), config (upval), config2 (upval), UseRefResult (copy), sendImmersiveBrandedAdAbuseReport (upval), UseRoactServiceResult (copy), ImmersiveBrandedAdId (copy)
		if RunService:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ or _G.__TEST_SUITE_PACKAGE__ then
			return true
		end
		Default1:logRobloxTelemetryCounter(config)
		local LocalPlayer = game.Players.LocalPlayer
		
		if not LocalPlayer then
			Default1:logRobloxTelemetryCounter(config2, 1, { reason = "noPlayer" })
			
			return false
		elseif UseRefResult.current then
			return (sendImmersiveBrandedAdAbuseReport(UseRoactServiceResult, {
				reason = Reason,
				comment = Comment,
				immersiveBrandedAdId = ImmersiveBrandedAdId,
				screenshotId = UseRefResult.current,
				userId = LocalPlayer.UserId,
				placeId = game.PlaceId
			}))
		else
			Default1:logRobloxTelemetryCounter(config2, 1, { reason = "noScreenshot" })
			
			return false
		end
	end, { ImmersiveBrandedAdId, UseRoactServiceResult })
	ReactModule.useEffect(function()
		-- upvalues: RunService (upval), ScreenshotModule (upval), UseRefResult (copy), UseStateResult2 (copy)
		if not RunService:IsStudio() and not _G.__TESTEZ_RUNNING_TEST__ and not _G.__TEST_SUITE_PACKAGE__ then
			ScreenshotModule.ScreenshotManager:TakeScreenshotWithCallback(function(Current)
				-- upvalues: UseRefResult (upval)
				UseRefResult.current = Current
			end, nil)
		end
		task.defer(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end)
	end, {})
	
	return if UseStateResult then ReactModule.createElement(ReactModule.Fragment, {}, {
		modal = ReactModule.createElement("TextButton", {
			Text = "",
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		}),
		abuseReportFlow = ReactModule.createElement(DefaultTwoStepReportFlowModule, {
			analyticsContext = "Ad",
			isReportCategoryReadonly = true,
			onCloseProps = { hasPreviousSteps = false, onAbandon = p1.onDismiss },
			onSubmitProps = { hasNextSteps = false, onSubmit = UseResult2 },
			onComplete = p1.onDismiss,
			reportCategories = ReportCategories,
			reportCategoryDefaultKey = ReportCategories[1].value,
			localizationKeys = {
				formTitle = "CoreScripts.Ads.Label.ReportAd",
				completeTitle = "Feature.ReportAbuse.Title.SelectInSceneThankYou",
				completeDescription = "Feature.ReportAbuse.Label.SelectInSceneComplete"
			},
			footerContent = if UseAppPolicyResult then UseResult1 else nil
		})
	}) else nil
end

return function(p1)
	-- upvalues: ReactModule (copy), RoactServicesModule (copy), RoactServiceTagsModule (copy), HttpModule (copy), HttpService (copy), UniversalAppPolicyModule (copy), AppStyleProvider (copy), Constants (copy), ImmersiveBrandedAdReportAdDialog (copy)
	return ReactModule.createElement(RoactServicesModule.RoactServices.ServiceProvider, {
		services = {
			[RoactServiceTagsModule.RoactNetworking] = HttpModule.NetworkLayers.requestInternalWrapper(HttpService)
		}
	}, {
		policyProvider = ReactModule.createElement(UniversalAppPolicyModule.RoactAppPolicy.Provider, { policy = { UniversalAppPolicyModule.AppFeaturePolicies } }, {
			appStyleProvider = ReactModule.createElement(AppStyleProvider, {
				style = {
					themeName = Constants.ThemeName.Dark,
					fontName = Constants.FontName.Gotham
				}
			}, {
				resizeFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromScale(1, 0.6),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					reportAdDialog = ReactModule.createElement(ImmersiveBrandedAdReportAdDialog, p1)
				})
			})
		})
	})
end