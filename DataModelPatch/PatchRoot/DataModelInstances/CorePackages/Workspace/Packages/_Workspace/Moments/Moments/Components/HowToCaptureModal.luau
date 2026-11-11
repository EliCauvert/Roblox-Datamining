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
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local config = {
	title = "Feature.Moments.Label.HowToUseCaptureTitle",
	step1 = "Feature.Moments.Description.HowToCaptureStep1",
	step2 = "Feature.Moments.Description.HowToCaptureStep2",
	step3 = "Feature.Moments.Description.HowToCaptureStep3",
	back = "Feature.Moments.Action.Back",
	done = "Feature.Moments.Action.Done",
	next = "Feature.Moments.Action.Continue"
}
local list = {
	{
		descriptionKey = "step1",
		image = ConstantsModule.HowToCaptureModalSteps.image1
	},
	{
		descriptionKey = "step2",
		image = ConstantsModule.HowToCaptureModalSteps.image2
	},
	{
		descriptionKey = "step3",
		image = ConstantsModule.HowToCaptureModalSteps.image3
	}
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseFormFactorFunction (copy), ReactModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), list (copy), View (copy), FormFactor (copy), Icon (copy), FoundationModule (copy), Text (copy), Image (copy), Button (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseFormFactorResult = UseFormFactorFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(1)
	local UseRefResult = ReactModule.useRef({ [1] = true })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult (copy), FireAnalyticsEventFunction (upval), EventNames (upval)
		if not UseRefResult.current[UseStateResult] then
			UseRefResult.current[UseStateResult] = true
			FireAnalyticsEventFunction(EventNames.FTUXHowToCaptureCarouselImpression)
		end
	end, { UseStateResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p2: number): number
			return (math.max(1, p2 - 1))
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), list (upval)
		UseStateResult2(function(p2: number): number
			-- upvalues: list (upval)
			return (math.min(#list, p2 + 1))
		end)
	end, {})
	local Entry = list[UseStateResult]
	local Elements = {}
	
	for i = 1, #list do
		Elements["dot_" .. i] = ReactModule.createElement(View, {
			LayoutOrder = i,
			Size = UDim2.fromOffset(8, 8),
			tag = {
				["radius-circle bg-system-contrast"] = i == UseStateResult,
				["radius-circle bg-system-emphasis"] = not (i == UseStateResult)
			}
		})
	end
	return ReactModule.createElement(View, {
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
			tag = "col align-x-center align-y-center gap-large size-full",
			padding = {
				top = UDim.new(0, UseDeviceInsetsResult.top + UseTokensResult.Padding.XLarge),
				bottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Medium))),
				left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.Large))),
				right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.Large)))
			}
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-large text-align-x-center content-emphasis",
				Text = UseLocalizationResult.title
			}),
			StepImage = ReactModule.createElement(Image, {
				LayoutOrder = 2,
				Image = Entry.image,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.fromScale(0.8, 0.45),
				SizeConstraint = Enum.SizeConstraint.RelativeXX
			}),
			Dots = ReactModule.createElement(View, {
				LayoutOrder = 3,
				tag = "row align-x-center align-y-center gap-small auto-xy"
			}, Elements),
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 4,
				tag = "auto-xy text-body-large text-align-x-center content-muted",
				Text = UseLocalizationResult[Entry.descriptionKey]
			}),
			Nav = ReactModule.createElement(View, {
				LayoutOrder = 5,
				tag = "row align-x-center align-y-center gap-medium size-full-0 auto-y"
			}, {
				BackButton = if UseStateResult > 1 then ReactModule.createElement(Button, {
					LayoutOrder = 1,
					fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
					onActivated = UseResult,
					size = FoundationModule.Enums.InputSize.Large,
					text = UseLocalizationResult.back,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					width = UDim.new(1, 0)
				}) else nil,
				NextButton = ReactModule.createElement(Button, {
					LayoutOrder = 2,
					fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
					onActivated = if UseStateResult < #list then UseResult1 else p1.onClose,
					size = FoundationModule.Enums.InputSize.Large,
					text = if UseStateResult < #list then UseLocalizationResult.next else UseLocalizationResult.done,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					width = UDim.new(1, 0)
				})
			})
		})
	})
end