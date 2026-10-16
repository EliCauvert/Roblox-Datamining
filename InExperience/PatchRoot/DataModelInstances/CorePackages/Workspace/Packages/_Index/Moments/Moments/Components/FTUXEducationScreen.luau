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
local howToCaptureModalModule = require(moments.Components.HowToCaptureModal)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local t = {
	title = "Feature.Moments.Label.CaptureLibrary",
	description = "Feature.Moments.Description.EmptyCapturesLibrary",
	howToCapture = "Feature.Moments.Action.HowToCapture",
	back = "Feature.Moments.Action.Back"
}

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), useDeviceInsets (ref), useTokens (ref), useFormFactor (ref), reactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), view (ref), formFactor (ref), icon (ref), foundationModule (ref), image (ref), constantsModule (ref), text (ref), button (ref), howToCaptureModalModule (ref)
	local var1 = useLocalization(t)
	local var2 = useDeviceInsets()
	local var3 = useTokens()
	local var4 = useFormFactor()
	local var5, var6 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy)
		fireAnalyticsEvent(eventNames.FTUXEducationScreenImpression)
	end, {})
	
	return reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center size-full-full",
		backgroundStyle = var3.Color.Common.Scrim
	}, {
		EducationCard = if not var5 then reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center size-full-full radius-large bg-surface-0",
			sizeConstraint = {
				MaxSize = if var4 == formFactor.Wide then Vector2.new(600, 700) else nil
			}
		}, {
			CloseButtonContainer = reactModule.createElement(view, {
				tag = "position-top-right anchor-top-right auto-xy",
				padding = {
					top = UDim.new(0, var2.top + var3.Padding.Medium),
					right = UDim.new(0, var2.right + var3.Padding.Medium)
				}
			}, {
				CloseButton = reactModule.createElement(view, {
					tag = "size-1100-1100 padding-medium radius-circle bg-over-media-0",
					onActivated = p1.onClose
				}, {
					CloseIcon = reactModule.createElement(icon, {
						name = "icons/navigation/close_small",
						ZIndex = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						size = foundationModule.Enums.IconSize.Small,
						style = var3.Color.ActionEmphasis.Foreground
					})
				})
			}),
			Body = reactModule.createElement(view, {
				padding = {
					top = UDim.new(0, var2.top + var3.Padding.XLarge),
					bottom = UDim.new(0, math.max(var2.bottom, var3.Padding.Medium)),
					left = UDim.new(0, math.max(var2.left, var3.Padding.Large)),
					right = UDim.new(0, math.max(var2.right, var3.Padding.Large))
				},
				tag = if var4 == formFactor.Wide then "col align-x-center align-y-center gap-large size-full" else "col align-x-center align-y-center gap-medium size-full"
			}, {
				Graphic = reactModule.createElement(image, {
					LayoutOrder = 1,
					Image = constantsModule.CapturesAssetId,
					ScaleType = Enum.ScaleType.Fit,
					Size = if var4 == formFactor.Wide then UDim2.fromScale(0.7, 0.39375) else UDim2.fromScale(0.6, 0.3375),
					SizeConstraint = Enum.SizeConstraint.RelativeXX
				}),
				Title = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-heading-large text-align-x-center content-emphasis",
					Text = var1.title
				}),
				Description = reactModule.createElement(text, {
					LayoutOrder = 3,
					tag = "auto-xy text-body-large text-align-x-center content-muted",
					Text = var1.description
				}),
				ButtonArea = reactModule.createElement(view, {
					LayoutOrder = 4,
					tag = "col align-x-center gap-medium size-full-0 auto-y"
				}, {
					HowToCaptureButton = reactModule.createElement(button, {
						LayoutOrder = 1,
						fillBehavior = foundationModule.Enums.FillBehavior.Fill,
						onActivated = reactModule.useCallback(function()
							-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var6 (ref)
							fireAnalyticsEvent(eventNames.FTUXHowToCaptureButtonPressed)
							var6(true)
						end, {}),
						size = foundationModule.Enums.InputSize.Large,
						text = var1.howToCapture,
						variant = foundationModule.Enums.ButtonVariant.Emphasis,
						width = UDim.new(1, 0)
					}),
					BackButton = reactModule.createElement(button, {
						LayoutOrder = 2,
						fillBehavior = foundationModule.Enums.FillBehavior.Fill,
						onActivated = p1.onClose,
						size = foundationModule.Enums.InputSize.Large,
						text = var1.back,
						variant = foundationModule.Enums.ButtonVariant.Standard,
						width = UDim.new(1, 0)
					})
				})
			})
		}) else nil,
		HowToCard = if var5 then reactModule.createElement(howToCaptureModalModule, {
			onClose = reactModule.useCallback(function()
				-- upvalues: var6 (ref)
				var6(false)
			end, {})
		}) else nil
	})
end