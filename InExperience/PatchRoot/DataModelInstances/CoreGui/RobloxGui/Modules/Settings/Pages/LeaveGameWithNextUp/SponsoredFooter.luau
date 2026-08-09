local corePackagesService = game:GetService("CorePackages")
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local usePreferredInput = responsiveModule.usePreferredInput
local text = foundationModule.Text
local view = foundationModule.View
local icon = foundationModule.Icon
local inputSize = foundationModule.Enums.InputSize
local popover = foundationModule.Popover
local controlState = foundationModule.Enums.ControlState
local useScaledValue = foundationModule.Hooks.useScaledValue

return reactModule.memo(function(p0) --[[ line: 23 | named "SponsoredFooter" ]]
	-- upvalues: useLocalization (ref), useScaledValue (ref), reactModule (ref), usePreferredInput (ref), responsiveModule (ref), controlState (ref), view (ref), text (ref), popover (ref), icon (ref), inputSize (ref)
	local var4 = useLocalization({
		SponsoredText = "Feature.GamePage.Label.Sponsored",
		SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic"
	})
	local var5 = useScaledValue(320)
	local var6, var7 = reactModule.useState(false)
	local var8 = usePreferredInput() == responsiveModule.Input.Pointer
	
	return reactModule.createElement(view, {
		tag = "row align-y-bottom align-x-center gap-xsmall flex-between auto-y",
		LayoutOrder = p0.LayoutOrder
	}, {
		SponsoredText = reactModule.createElement(text, {
			tag = "size-full-0 text-no-wrap text-body-medium content-default text-align-x-left auto-xy",
			LayoutOrder = 1,
			Text = var4.SponsoredText
		}),
		SponsoredTooltip = reactModule.createElement(popover.Root, { isOpen = var6 }, {
			Anchor = reactModule.createElement(popover.Anchor, { LayoutOrder = 2 }, {
				IconView = reactModule.createElement(view, {
					tag = "size-400-400 radius-circle",
					onStateChanged = if var8 then reactModule.useCallback(function(p1) --[[ line: 32 ]]
						-- upvalues: controlState (copy), var7 (ref)
						if p1 == controlState.Hover or p1 == controlState.Selected then
							var7(true)
							
							return
						elseif p1 == controlState.Default then
							var7(false)
						end
					end, {}) else nil,
					onActivated = if var8 then nil else reactModule.useCallback(function() --[[ line: 39 ]]
						-- upvalues: var7 (ref)
						var7(function(p2) --[[ line: 40 ]]
							return not p2
						end)
					end, {})
				}, {
					Icon = reactModule.createElement(icon, { name = "icons/actions/info", size = inputSize.Small })
				})
			}),
			Content = reactModule.createElement(popover.Content, nil, {
				DescriptionView = reactModule.createElement(view, {
					tag = "col gap-xsmall padding-small auto-xy size-full-2400",
					sizeConstraint = { MaxSize = Vector2.new(var5, 1e999) }
				}, {
					Description = reactModule.createElement(text, {
						tag = "auto-xy text-body-small text-wrap",
						Text = var4.SponsoredDisclosure
					})
				})
			})
		})
	})
end)