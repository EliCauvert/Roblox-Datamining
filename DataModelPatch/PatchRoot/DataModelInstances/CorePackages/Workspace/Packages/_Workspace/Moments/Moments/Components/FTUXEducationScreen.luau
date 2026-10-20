local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FormFactor = MomentsCommonModule.Enums.FormFactor
local ConstantsModule = require(Moments.Constants)
local HowToCaptureModalModule = require(Moments.Components.HowToCaptureModal)
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local config = {
	title = "Feature.Moments.Label.CaptureLibrary",
	description = "Feature.Moments.Description.EmptyCapturesLibrary",
	howToCapture = "Feature.Moments.Action.HowToCapture",
	back = "Feature.Moments.Action.Back"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseFormFactorFunction (copy), ReactModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), View (copy), FormFactor (copy), Icon (copy), FoundationModule (copy), Image (copy), ConstantsModule (copy), Text (copy), Button (copy), HowToCaptureModalModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseFormFactorResult = UseFormFactorFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval)
		FireAnalyticsEventFunction(EventNames.FTUXEducationScreenImpression)
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), UseStateResult2 (copy)
		FireAnalyticsEventFunction(EventNames.FTUXHowToCaptureButtonPressed)
		UseStateResult2(true)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	
	return ReactModule.createElement(View, {
		tag = "position-center-center anchor-center-center size-full-full",
		backgroundStyle = UseTokensResult.Color.Common.Scrim
	}, {
		EducationCard = if UseStateResult then nil else ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center size-full-full radius-large bg-surface-0",
			sizeConstraint = {
				MaxSize = if UseFormFactorResult == FormFactor.Wide then Vector2.new(600, 700) else nil
			}
		}, {
			CloseButtonContainer = ReactModule.createElement(View, {
				tag = "position-top-right anchor-top-right auto-xy",
				padding = {
					top = UDim.new(0, UseDeviceInsetsResult.top + UseTokensResult.Padding.Medium),
					right = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Medium)
				}
			}, {
				CloseButton = ReactModule.createElement(View, {
					tag = "size-1100-1100 padding-medium radius-circle bg-over-media-0",
					onActivated = p1.onClose
				}, {
					CloseIcon = ReactModule.createElement(Icon, {
						name = "icons/navigation/close_small",
						ZIndex = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						size = FoundationModule.Enums.IconSize.Small,
						style = UseTokensResult.Color.ActionEmphasis.Foreground
					})
				})
			}),
			Body = ReactModule.createElement(View, {
				padding = {
					top = UDim.new(0, UseDeviceInsetsResult.top + UseTokensResult.Padding.XLarge),
					bottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Medium))),
					left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.Large))),
					right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.Large)))
				},
				tag = if UseFormFactorResult == FormFactor.Wide then "col align-x-center align-y-center gap-large size-full" else "col align-x-center align-y-center gap-medium size-full"
			}, {
				Graphic = ReactModule.createElement(Image, {
					LayoutOrder = 1,
					Image = ConstantsModule.CapturesAssetId,
					ScaleType = Enum.ScaleType.Fit,
					Size = if UseFormFactorResult == FormFactor.Wide then UDim2.fromScale(0.7, 0.39375) else UDim2.fromScale(0.6, 0.33749999999999997),
					SizeConstraint = Enum.SizeConstraint.RelativeXX
				}),
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-heading-large text-align-x-center content-emphasis",
					Text = UseLocalizationResult.title
				}),
				Description = ReactModule.createElement(Text, {
					LayoutOrder = 3,
					tag = "auto-xy text-body-large text-align-x-center content-muted",
					Text = UseLocalizationResult.description
				}),
				ButtonArea = ReactModule.createElement(View, {
					LayoutOrder = 4,
					tag = "col align-x-center gap-medium size-full-0 auto-y"
				}, {
					HowToCaptureButton = ReactModule.createElement(Button, {
						LayoutOrder = 1,
						fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
						onActivated = UseResult,
						size = FoundationModule.Enums.InputSize.Large,
						text = UseLocalizationResult.howToCapture,
						variant = FoundationModule.Enums.ButtonVariant.Emphasis,
						width = UDim.new(1, 0)
					}),
					BackButton = ReactModule.createElement(Button, {
						LayoutOrder = 2,
						fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
						onActivated = p1.onClose,
						size = FoundationModule.Enums.InputSize.Large,
						text = UseLocalizationResult.back,
						variant = FoundationModule.Enums.ButtonVariant.Standard,
						width = UDim.new(1, 0)
					})
				})
			})
		}),
		HowToCard = if UseStateResult then ReactModule.createElement(HowToCaptureModalModule, { onClose = UseResult1 }) else nil
	})
end