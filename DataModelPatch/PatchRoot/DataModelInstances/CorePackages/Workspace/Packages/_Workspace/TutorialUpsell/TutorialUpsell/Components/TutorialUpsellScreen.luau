local TutorialUpsell = script:FindFirstAncestor("TutorialUpsell")
local Parent = TutorialUpsell.Parent
local TelemetryService = game:GetService("TelemetryService")
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Button = FoundationModule.Button
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ConstantsModule = require(TutorialUpsell.Constants)
local SystemThemeModule = require(Parent.SystemTheme)
local SetDarkThemeOverrideFunction = SystemThemeModule.Utils.SetDarkThemeOverride
local ClearThemeOverrideFunction = SystemThemeModule.Utils.ClearThemeOverride
local TutorialUpsellEventThrottleHundredthsPercent = game:DefineFastInt("TutorialUpsellEventThrottleHundredthsPercent", 0)
local TutorialUpsellPlaceId = game:DefineFastString("TutorialUpsellPlaceId", (tostring(ConstantsModule.TUTORIAL_EXPERIENCE_DEFAULT_PLACE_ID)))
local TutorialUpsellImageAssetId = game:DefineFastString("TutorialUpsellImageAssetId", (tostring(ConstantsModule.TUTORIAL_EXPERIENCE_DEFAULT_IMAGE_ASSET_ID)))

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseTokensFunction (copy), ReactModule (copy), InputSize (copy), ConstantsModule (copy), TutorialUpsellImageAssetId (copy), UseLocalizationFunction (copy), LoggingProtocolModule (copy), TutorialUpsellEventThrottleHundredthsPercent (copy), TelemetryService (copy), SetDarkThemeOverrideFunction (copy), ClearThemeOverrideFunction (copy), AppPage (copy), ExperienceService (copy), TutorialUpsellPlaceId (copy), View (copy), Image (copy), Text (copy), Button (copy), ButtonVariant (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Large = InputSize.Large
	local Formatted = string.format(ConstantsModule.IMAGE_ASSET_URL_TEMPLATE, TutorialUpsellImageAssetId)
	local UseLocalizationResult = UseLocalizationFunction({
		titleLabel = "MobilePlatform.TutorialUpsell.Label.StartWithATutorial",
		descriptionLabel = "MobilePlatform.TutorialUpsell.Label.TutorialDescription",
		beginTutorialAction = "MobilePlatform.TutorialUpsell.Action.BeginTutorial",
		skipAction = "MobilePlatform.TutorialUpsell.Action.Skip"
	})
	
	local function v26(EventName)
		-- upvalues: LoggingProtocolModule (upval), TutorialUpsellEventThrottleHundredthsPercent (upval)
		return {
			description = "Tutorial upsell screen event",
			links = "https://roblox.atlassian.net/browse/MOBAPP-1201",
			eventName = EventName,
			backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
			throttlingPercentage = TutorialUpsellEventThrottleHundredthsPercent,
			lastUpdated = { 2025, 8, 20 }
		}
	end
	
	local function v27(ButtonName)
		-- upvalues: TelemetryService (upval), v26 (copy), ConstantsModule (upval)
		TelemetryService:LogEvent(v26(ConstantsModule.EVENT_BUTTON_CLICK_EVENT), { customFields = { buttonName = ButtonName } })
	end
	
	ReactModule.useEffect(function()
		-- upvalues: TelemetryService (upval), v26 (copy), ConstantsModule (upval)
		TelemetryService:LogEvent(v26(ConstantsModule.EVENT_SCREEN_IMPRESSION_EVENT), {})
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), SetDarkThemeOverrideFunction (upval)
		if not UseStateResult then
			SetDarkThemeOverrideFunction()
		end
	end, { UseTokensResult })
	
	local function _()
		-- upvalues: UseStateResult2 (copy), ClearThemeOverrideFunction (upval)
		UseStateResult2(true)
		ClearThemeOverrideFunction()
	end
	
	return ReactModule.createElement(View, {
		tag = "size-full-full padding-xlarge",
		backgroundStyle = UseTokensResult.DarkMode.Surface.Surface_0
	}, {
		Contents = ReactModule.createElement(View, {
			tag = "col gap-large auto-xy size-full-full padding-y-xlarge",
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			SplashImage = ReactModule.createElement(Image, {
				tag = "size-full-0 auto-xy fill radius-large",
				LayoutOrder = 1,
				Image = Formatted,
				ScaleType = Enum.ScaleType.Crop
			}),
			TextContainer = ReactModule.createElement(View, {
				tag = "col gap-small auto-y size-full-0 align-x-center",
				LayoutOrder = 2
			}, {
				Title = ReactModule.createElement(Text, {
					tag = "text-heading-large text-wrap text-align-x-left size-full-0 auto-y",
					Text = UseLocalizationResult.titleLabel
				}),
				Body = ReactModule.createElement(Text, {
					tag = "text-body-large text-wrap text-align-x-left size-full-0 auto-y",
					Text = UseLocalizationResult.descriptionLabel
				})
			}),
			ButtonContainer = ReactModule.createElement(View, {
				tag = "col gap-small auto-y size-full-0 align-x-center position-bottom-center",
				LayoutOrder = 3
			}, {
				TutorialButton = ReactModule.createElement(Button, {
					text = UseLocalizationResult.beginTutorialAction,
					variant = ButtonVariant.Emphasis,
					onActivated = function()
						-- upvalues: v27 (copy), ConstantsModule (upval), ExperienceService (upval), TutorialUpsellPlaceId (upval), UseDispatchResult (copy), p1 (copy), AppPage (upval), UseStateResult2 (copy), ClearThemeOverrideFunction (upval)
						v27(ConstantsModule.EVENT_BUTTON_CLICK_EVENT_BTN.START)
						ExperienceService:LaunchExperience({ placeId = tonumber(TutorialUpsellPlaceId) }, "TutorialUpsell", function()
							-- upvalues: UseDispatchResult (upval), p1 (upval), AppPage (upval)
							UseDispatchResult(p1.resetNavigationHistory({ { name = AppPage.Home } }))
						end)
						UseStateResult2(true)
						ClearThemeOverrideFunction()
					end,
					size = Large,
					width = UDim.new(1, 0)
				}),
				SkipButton = ReactModule.createElement(Button, {
					text = UseLocalizationResult.skipAction,
					variant = ButtonVariant.Standard,
					onActivated = function()
						-- upvalues: v27 (copy), ConstantsModule (upval), UseDispatchResult (copy), p1 (copy), AppPage (upval), UseStateResult2 (copy), ClearThemeOverrideFunction (upval)
						v27(ConstantsModule.EVENT_BUTTON_CLICK_EVENT_BTN.SKIP)
						UseDispatchResult(p1.resetNavigationHistory({ { name = AppPage.Home } }))
						UseStateResult2(true)
						ClearThemeOverrideFunction()
					end,
					size = Large,
					width = UDim.new(1, 0)
				})
			})
		})
	})
end