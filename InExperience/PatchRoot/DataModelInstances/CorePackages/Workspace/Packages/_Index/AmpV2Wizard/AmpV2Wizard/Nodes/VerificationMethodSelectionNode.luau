local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local InputLabel = FoundationModule.InputLabel
local ScrollView = FoundationModule.ScrollView
local OptionSelectorGroup = FoundationModule.OptionSelectorGroup
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local _ = require(AmpV2Wizard.Types)
local OdpAnalyticsModule = require(AmpV2Wizard.OdpAnalytics)
local FullPageChromeModule = require(AmpV2Wizard.FullPageChrome)
local config = {
	FAE = "square-person",
	IDV = "rectangle-person-with-three-horizontal-lines",
	CCV = "credit-card"
}

return function(p1)
	-- upvalues: OdpAnalyticsModule (copy), ReactModule (copy), OptionSelectorGroup (copy), config (copy), View (copy), Text (copy), InputLabel (copy), ScrollView (copy), Button (copy), ButtonVariant (copy), InputSize (copy), FullPageChromeModule (copy)
	local Props = p1.props
	local ReportFunction = p1.report
	local Methods = Props.methods or {}
	local UseOdpAnalyticsResult = OdpAnalyticsModule.useOdpAnalytics(p1.ctx)
	local Id = if Methods[1] == nil then nil else Methods[1].id
	local UseStateResult, UseStateResult2 = ReactModule.useState(Id)
	ReactModule.useEffect(function()
		-- upvalues: UseOdpAnalyticsResult (copy), Id (copy)
		UseOdpAnalyticsResult.verificationMethodSelectorShown(Id)
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseOdpAnalyticsResult (copy), ReportFunction (copy)
		if UseStateResult ~= nil then
			UseOdpAnalyticsResult.verificationMethodContinue(UseStateResult)
			ReportFunction(UseStateResult)
		end
	end, { UseStateResult, ReportFunction, UseOdpAnalyticsResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseOdpAnalyticsResult (copy), ReportFunction (copy)
		UseOdpAnalyticsResult.verificationMethodBack()
		ReportFunction("Back")
	end, { ReportFunction, UseOdpAnalyticsResult })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseOdpAnalyticsResult (copy), UseStateResult2 (copy)
		if p2 ~= nil then
			UseOdpAnalyticsResult.verificationMethodSelected(p2)
			UseStateResult2(p2)
		end
	end, { UseStateResult2, UseOdpAnalyticsResult })
	local Elements = {}
	
	for LayoutOrder, method in Methods do
		Elements[method.id] = ReactModule.createElement(OptionSelectorGroup.Item, {
			value = method.id,
			label = method.label,
			description = method.description,
			icon = config[method.id],
			LayoutOrder = LayoutOrder
		})
	end
	local HasBack: boolean = p1.transitions ~= nil and p1.transitions.Back ~= nil
	
	return ReactModule.createElement(FullPageChromeModule, {
		title = Props.headerTitle,
		onBack = if HasBack then UseResult1 else nil
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
				Content = ReactModule.createElement(View, {
					tag = "col gap-none size-full-0 auto-y padding-x-xlarge padding-y-xlarge"
				}, {
					Body = ReactModule.createElement(View, { tag = "col gap-xlarge size-full-0 auto-y" }, {
						TitleAndBody = ReactModule.createElement(View, {
							tag = "col gap-xsmall size-full-0 auto-y",
							LayoutOrder = 1
						}, {
							Title = ReactModule.createElement(Text, {
								tag = "size-full-0 auto-y text-heading-medium text-wrap text-align-x-left text-align-y-top content-emphasis",
								LayoutOrder = 1,
								Text = Props.title
							}),
							Description = ReactModule.createElement(Text, {
								tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left text-align-y-top content-default",
								LayoutOrder = 2,
								Text = Props.description
							})
						}),
						Options = ReactModule.createElement(View, {
							tag = "col gap-small size-full-0 auto-y padding-x-xsmall",
							LayoutOrder = 2
						}, {
							OptionsLabel = ReactModule.createElement(InputLabel, { LayoutOrder = 1, Text = Props.optionsLabel }),
							OptionList = ReactModule.createElement(OptionSelectorGroup.Root, {
								LayoutOrder = 2,
								value = UseStateResult,
								onValueChanged = UseResult2
							}, {
								Items = ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, Elements)
							})
						})
					})
				})
			}),
			Footer = if UseStateResult == nil then nil else ReactModule.createElement(View, {
				tag = "col gap-small size-full-0 auto-y padding-x-xlarge padding-bottom-large",
				LayoutOrder = 2
			}, {
				Continue = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					text = Props.continueLabel,
					onActivated = UseResult,
					variant = ButtonVariant.Emphasis,
					size = InputSize.Medium,
					width = UDim.new(1, 0)
				})
			})
		})
	})
end