local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local button = foundationModule.Button
local icon = foundationModule.Icon
local image = foundationModule.Image
local text = foundationModule.Text
local view = foundationModule.View
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local useLocalization = localizationModule.Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local formFactor = momentsCommonModule.Enums.FormFactor
local constantsModule = require(moments.Constants)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local t = {
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
		image = constantsModule.HowToCaptureModalSteps.image1
	},
	{
		descriptionKey = "step2",
		image = constantsModule.HowToCaptureModalSteps.image2
	},
	{
		descriptionKey = "step3",
		image = constantsModule.HowToCaptureModalSteps.image3
	}
}

return function(p0) --[[ line: 64 | named "HowToCaptureModal" ]]
	-- upvalues: useLocalization (ref), t (ref), useDeviceInsets (ref), useTokens (ref), useFormFactor (ref), reactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), list (ref), view (ref), formFactor (ref), icon (ref), foundationModule (ref), text (ref), image (ref), button (ref)
	local var8 = useLocalization(t)
	local var9 = useDeviceInsets()
	local var10 = useTokens()
	local var11 = useFormFactor()
	local var12, var13 = reactModule.useState(1)
	local var14 = reactModule.useRef({ [1] = true })
	reactModule.useEffect(function() --[[ line: 74 ]]
		-- upvalues: var14 (ref), var12 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if not var14.current[var12] then
			var14.current[var12] = true
			fireAnalyticsEvent(eventNames.FTUXHowToCaptureCarouselImpression)
		end
	end, { var12 })
	local var15 = reactModule.useCallback(function() --[[ line: 81 ]]
		-- upvalues: var13 (ref)
		var13(function(p1) --[[ line: 82 ]]
			return math.max(1, p1 - 1)
		end)
	end, {})
	local var16 = reactModule.useCallback(function() --[[ line: 87 ]]
		-- upvalues: var13 (ref), list (copy)
		var13(function(p2) --[[ line: 88 ]]
			-- upvalues: list (copy)
			return math.min(#list, p2 + 1)
		end)
	end, {})
	local var17 = list[var12]
	local t_1 = {}
	
	for i = 1, #list do
		t_1["dot_" .. i] = reactModule.createElement(view, {
			LayoutOrder = i,
			Size = UDim2.fromOffset(8, 8),
			tag = {
				["radius-circle bg-system-contrast"] = i == var12,
				["radius-circle bg-system-emphasis"] = not (i == var12)
			}
		})
	end
	return reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center size-full-full radius-large bg-surface-0",
		sizeConstraint = {
			MaxSize = if var11 == formFactor.Wide then Vector2.new(600, 700) else nil
		}
	}, {
		CloseButtonContainer = reactModule.createElement(view, {
			tag = "position-top-right anchor-top-right auto-xy",
			padding = {
				top = UDim.new(0, var9.top + var10.Padding.Medium),
				right = UDim.new(0, var9.right + var10.Padding.Medium)
			}
		}, {
			CloseButton = reactModule.createElement(view, {
				tag = "size-1100-1100 padding-medium radius-circle bg-over-media-0",
				onActivated = p0.onClose
			}, {
				CloseIcon = reactModule.createElement(icon, {
					name = "icons/navigation/close_small",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = foundationModule.Enums.IconSize.Small,
					style = var10.Color.ActionEmphasis.Foreground
				})
			})
		}),
		Body = reactModule.createElement(view, {
			tag = "col align-x-center align-y-center gap-large size-full",
			padding = {
				top = UDim.new(0, var9.top + var10.Padding.XLarge),
				bottom = UDim.new(0, math.max(var9.bottom, var10.Padding.Medium)),
				left = UDim.new(0, math.max(var9.left, var10.Padding.Large)),
				right = UDim.new(0, math.max(var9.right, var10.Padding.Large))
			}
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-large text-align-x-center content-emphasis",
				Text = var8.title
			}),
			StepImage = reactModule.createElement(image, {
				LayoutOrder = 2,
				Image = var17.image,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.fromScale(0.8, 0.45),
				SizeConstraint = Enum.SizeConstraint.RelativeXX
			}),
			Dots = reactModule.createElement(view, {
				LayoutOrder = 3,
				tag = "row align-x-center align-y-center gap-small auto-xy"
			}, t_1),
			Description = reactModule.createElement(text, {
				LayoutOrder = 4,
				tag = "auto-xy text-body-large text-align-x-center content-muted",
				Text = var8[var17.descriptionKey]
			}),
			Nav = reactModule.createElement(view, {
				LayoutOrder = 5,
				tag = "row align-x-center align-y-center gap-medium size-full-0 auto-y"
			}, {
				BackButton = if var12 > 1 then reactModule.createElement(button, {
					LayoutOrder = 1,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					onActivated = var15,
					size = foundationModule.Enums.InputSize.Large,
					text = var8.back,
					variant = foundationModule.Enums.ButtonVariant.Standard,
					width = UDim.new(1, 0)
				}) else nil,
				NextButton = reactModule.createElement(button, {
					LayoutOrder = 2,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					onActivated = if var12 < #list then var16 else p0.onClose,
					size = foundationModule.Enums.InputSize.Large,
					text = if var12 < #list then var8.next else var8.done,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					width = UDim.new(1, 0)
				})
			})
		})
	})
end