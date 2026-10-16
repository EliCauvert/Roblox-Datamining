local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FlyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local UseFlyoutItemNavigationModule = require(script.Parent.Parent.Hooks.useFlyoutItemNavigation)

return function(p1) --[[ Line: 17 | Named "TermsPrivacyFooter" ]]
	-- upvalues: FlyoutContentSettingsModule (copy), UseFlyoutItemNavigationModule (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy)
	local Item = FlyoutContentSettingsModule.ItemInfo[FlyoutContentSettingsModule.ItemType.Terms]
	local Item1 = FlyoutContentSettingsModule.ItemInfo[FlyoutContentSettingsModule.ItemType.Privacy]
	local UseFlyoutItemNavigationModuleResult = UseFlyoutItemNavigationModule(Item, p1.closeDrawer)
	local UseFlyoutItemNavigationModuleResult1 = UseFlyoutItemNavigationModule(Item1, p1.closeDrawer)
	local UseLocalizationResult = UseLocalizationFunction({ termsText = Item.textKey, privacyText = Item1.textKey })
	
	return ReactModule.createElement(View, {
		tag = "row align-x-center align-y-center gap-xxlarge size-full-500 padding-x-xlarge",
		LayoutOrder = p1.layoutOrder
	}, {
		Terms = ReactModule.createElement(View, {
			tag = "auto-xy",
			testId = "--core-ui-flyout-terms",
			LayoutOrder = 1,
			onActivated = UseFlyoutItemNavigationModuleResult
		}, {
			Label = ReactModule.createElement(Text, {
				tag = "auto-xy text-label-medium content-default",
				Text = UseLocalizationResult.termsText
			})
		}),
		Privacy = ReactModule.createElement(View, {
			tag = "auto-xy",
			testId = "--core-ui-flyout-privacy",
			LayoutOrder = 2,
			onActivated = UseFlyoutItemNavigationModuleResult1
		}, {
			Label = ReactModule.createElement(Text, {
				tag = "auto-xy text-label-medium content-default",
				Text = UseLocalizationResult.privacyText
			})
		})
	})
end