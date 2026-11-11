local CorePackages = game:GetService("CorePackages")
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local Text = FoundationModule.Text
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local InputSize = FoundationModule.Enums.InputSize
local Popover = FoundationModule.Popover
local ControlState = FoundationModule.Enums.ControlState
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue

return ReactModule.memo(function(Frame)
	-- upvalues: UseLocalizationFunction (copy), UseScaledValueFunction (copy), ReactModule (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), ControlState (copy), View (copy), Text (copy), Popover (copy), Icon (copy), InputSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		SponsoredText = "Feature.GamePage.Label.Sponsored",
		SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic"
	})
	local UseScaledValueResult = UseScaledValueFunction(320)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Pointer
	local UseResult = ReactModule.useCallback(function(Default)
		-- upvalues: ControlState (upval), UseStateResult2 (copy)
		if Default == ControlState.Hover or Default == ControlState.Selected then
			UseStateResult2(true)
			
			return
		end
		if Default == ControlState.Default then
			UseStateResult2(false)
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p1): boolean
			return not p1
		end)
	end, {})
	
	return ReactModule.createElement(View, {
		tag = "row align-y-bottom align-x-center gap-xsmall flex-between auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		SponsoredText = ReactModule.createElement(Text, {
			tag = "size-full-0 text-no-wrap text-body-medium content-default text-align-x-left auto-xy",
			LayoutOrder = 1,
			Text = UseLocalizationResult.SponsoredText
		}),
		SponsoredTooltip = ReactModule.createElement(Popover.Root, { isOpen = UseStateResult }, {
			Anchor = ReactModule.createElement(Popover.Anchor, { LayoutOrder = 2 }, {
				IconView = ReactModule.createElement(View, {
					tag = "size-400-400 radius-circle",
					onStateChanged = if IsUsePreferredInputResultMatch then UseResult else nil,
					onActivated = if IsUsePreferredInputResultMatch then nil else UseResult1
				}, {
					Icon = ReactModule.createElement(Icon, { name = "icons/actions/info", size = InputSize.Small })
				})
			}),
			Content = ReactModule.createElement(Popover.Content, nil, {
				DescriptionView = ReactModule.createElement(View, {
					tag = "col gap-xsmall padding-small auto-xy size-full-2400",
					sizeConstraint = { MaxSize = Vector2.new(UseScaledValueResult, 1e999) }
				}, {
					Description = ReactModule.createElement(Text, {
						tag = "auto-xy text-body-small text-wrap",
						Text = UseLocalizationResult.SponsoredDisclosure
					})
				})
			})
		})
	})
end)