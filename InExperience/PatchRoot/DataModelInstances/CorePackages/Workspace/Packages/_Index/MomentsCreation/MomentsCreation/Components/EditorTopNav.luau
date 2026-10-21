local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDeviceInsetsFunction (copy), UseCreationFlowStringsModule (copy), ReactModule (copy), GradientBackdrop (copy), View (copy), FoundationModule (copy), Icon (copy), BuilderIconsModule (copy), Button (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local ZIndex = p1.zIndex or 1
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		TopScrim = ReactModule.createElement(GradientBackdrop, {
			rotation = 90,
			startingTransparency = 0.4,
			color3 = Color3.new(0, 0, 0),
			cornerRadius = UDim.new(0, UseTokensResult.Radius.Large),
			size = UDim2.new(1, 0, 0, UseDeviceInsetsResult.top + UseTokensResult.Size.Size_2000 + UseTokensResult.Size.Size_1600),
			zIndex = ZIndex
		}),
		Nav = ReactModule.createElement(View, {
			tag = "row flex-x-between align-y-center position-top-center anchor-top-center size-full-0 auto-y",
			padding = {
				top = UDim.new(0, UseDeviceInsetsResult.top + UseTokensResult.Padding.Medium),
				left = UDim.new(0, UseDeviceInsetsResult.left + UseTokensResult.Padding.Medium),
				right = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Medium)
			},
			ZIndex = ZIndex + 1
		}, {
			BackButton = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "auto-xy padding-small radius-circle",
				onActivated = p1.onBack,
				stateLayer = {
					affordance = FoundationModule.Enums.StateLayerAffordance.Background
				},
				testId = p1.backTestId
			}, {
				BackIcon = ReactModule.createElement(Icon, {
					name = BuilderIconsModule.Icon.ChevronLargeLeft,
					size = FoundationModule.Enums.IconSize.Large,
					style = UseTokensResult.Color.Content.Emphasis
				})
			}),
			SaveButton = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseCreationFlowStringsModule().GeneralCtaSave,
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = p1.onSave,
				size = FoundationModule.Enums.InputSize.Medium,
				testId = p1.saveTestId
			})
		})
	})
end