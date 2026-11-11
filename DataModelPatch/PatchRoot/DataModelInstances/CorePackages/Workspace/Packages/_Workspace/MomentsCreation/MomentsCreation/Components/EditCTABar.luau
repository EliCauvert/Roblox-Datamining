local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(MomentsCreation.Types.CreationFlowTypes)

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Icon (copy), FoundationModule (copy), Text (copy), GradientBackdrop (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local LocalizationKeys = {}
	
	for _, tool in p1.tools do
		LocalizationKeys[tool.cta.localizationKey] = tool.cta.localizationKey
	end
	local UseLocalizationResult = UseLocalizationFunction(LocalizationKeys)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromScale(1, 0))
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(UDim2.new(0, 1.5 * Frame.AbsoluteSize.X, 1, 0))
	end, {})
	local Elements = {}
	
	for i, tool1 in p1.tools do
		local Kind = tool1.kind
		Elements["Tool_" .. Kind] = ReactModule.createElement(View, {
			tag = "row align-x-right align-y-center gap-medium auto-xy padding-xsmall radius-medium",
			LayoutOrder = tool1.cta.order or i,
			onActivated = function()
				-- upvalues: p1 (copy), Kind (copy)
				p1.onToolSelected(Kind)
			end
		}, {
			Icon = ReactModule.createElement(Icon, {
				LayoutOrder = 2,
				name = tool1.cta.icon,
				size = FoundationModule.Enums.IconSize.Large
			}),
			Text = if p1.showText then ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-label-medium content-emphasis",
				Text = UseLocalizationResult[tool1.cta.localizationKey]
			}) else nil
		})
	end
	return ReactModule.createElement(View, {
		tag = "position-center-right anchor-center-right size-0-full auto-x",
		ZIndex = p1.zIndex
	}, {
		GradientBackdrop = ReactModule.createElement(GradientBackdrop, {
			rotation = 180,
			color3 = UseTokensResult.Color.Common.Scrim.Color3,
			size = UseBindingResult
		}),
		EditCTABar = ReactModule.createElement(View, {
			tag = "col align-x-right align-y-center gap-small position-center-right anchor-center-right size-0-full auto-x",
			onAbsoluteSizeChanged = UseResult,
			padding = {
				left = UDim.new(0, UseTokensResult.Padding.Large),
				right = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Large)
			}
		}, Elements)
	})
end