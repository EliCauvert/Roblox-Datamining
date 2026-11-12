local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local ScrollView = FoundationModule.ScrollView
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local _ = require(AmpV2Wizard.Types)
local FullPageChromeModule = require(AmpV2Wizard.FullPageChrome)
local ODPTiltedCardsArtModule = require(AmpV2Wizard.ODPTiltedCardsArt)
local OdpAnalyticsModule = require(AmpV2Wizard.OdpAnalytics)

return function(p1)
	-- upvalues: OdpAnalyticsModule (copy), ReactModule (copy), View (copy), ScrollView (copy), ODPTiltedCardsArtModule (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy), FullPageChromeModule (copy)
	local Props = p1.props
	local ReportFunction = p1.report
	local Transitions = p1.transitions
	local UseOdpAnalyticsResult = OdpAnalyticsModule.useOdpAnalytics(p1.ctx)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseOdpAnalyticsResult (copy)
		if not UseRefResult.current then
			UseRefResult.current = true
			UseOdpAnalyticsResult.handoffShown()
		end
	end, { UseOdpAnalyticsResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseOdpAnalyticsResult (copy), ReportFunction (copy)
		UseOdpAnalyticsResult.handoffBack()
		ReportFunction("Back")
	end, { ReportFunction, UseOdpAnalyticsResult })
	local HasBack: boolean = Transitions ~= nil and Transitions.Back ~= nil
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: ReportFunction (copy)
		ReportFunction("Cancel")
	end, { ReportFunction })
	local HasCancel: boolean = Transitions ~= nil and Transitions.Cancel ~= nil
	
	return ReactModule.createElement(FullPageChromeModule, {
		title = Props.headerTitle,
		onBack = if HasBack then UseResult else nil,
		onClose = if HasBack or not HasCancel then nil else UseResult1
	}, {
		Content = ReactModule.createElement(View, { tag = "col size-full" }, {
			Body = ReactModule.createElement(ScrollView, {
				LayoutOrder = 1,
				flexItem = { FlexMode = Enum.UIFlexMode.Fill },
				Size = UDim2.fromScale(1, 0),
				scroll = {
					ScrollingDirection = Enum.ScrollingDirection.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(0, 1)
				}
			}, {
				Content = ReactModule.createElement(View, { tag = "col gap-none size-full-0 auto-y" }, {
					Hero = ReactModule.createElement(ODPTiltedCardsArtModule, { LayoutOrder = 1 }),
					Copy = ReactModule.createElement(View, {
						tag = "col gap-xlarge size-full-0 auto-y padding-x-xlarge padding-y-xlarge",
						LayoutOrder = 2
					}, {
						Intro = ReactModule.createElement(View, { tag = "col gap-none size-full-0 auto-y", LayoutOrder = 1 }, {
							Title = ReactModule.createElement(Text, {
								tag = "size-full-0 auto-y text-heading-medium text-wrap text-align-x-left content-emphasis",
								LayoutOrder = 1,
								Text = Props.title
							}),
							Description = if Props.description == nil or Props.description == "" then nil else ReactModule.createElement(Text, {
								tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-default",
								LayoutOrder = 2,
								Text = Props.description
							})
						})
					})
				})
			}),
			Footer = ReactModule.createElement(View, {
				tag = "col gap-small size-full-0 auto-y padding-x-xlarge padding-bottom-large",
				LayoutOrder = 2
			}, {
				Continue = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					text = Props.continueLabel or "",
					onActivated = ReactModule.useCallback(function()
						-- upvalues: UseOdpAnalyticsResult (copy), ReportFunction (copy)
						UseOdpAnalyticsResult.handoffContinue()
						ReportFunction("Continue")
					end, { ReportFunction, UseOdpAnalyticsResult }),
					variant = ButtonVariant.Emphasis,
					size = InputSize.Medium,
					width = UDim.new(1, 0)
				})
			})
		})
	})
end