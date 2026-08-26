local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local useLocalization = require(parent.Localization).Hooks.useLocalization
local flyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local useFlyoutItemNavigationModule = require(script.Parent.Parent.Hooks.useFlyoutItemNavigation)

return function(p1)
	-- upvalues: flyoutContentSettingsModule (ref), useFlyoutItemNavigationModule (ref), useLocalization (ref), reactModule (ref), view (ref), text (ref)
	local terms = flyoutContentSettingsModule.ItemInfo[flyoutContentSettingsModule.ItemType.Terms]
	local privacy = flyoutContentSettingsModule.ItemInfo[flyoutContentSettingsModule.ItemType.Privacy]
	local var1 = useLocalization({ termsText = terms.textKey, privacyText = privacy.textKey })
	
	return reactModule.createElement(view, {
		tag = "row align-x-center align-y-center gap-xxlarge size-full-500 padding-x-xlarge",
		LayoutOrder = p1.layoutOrder
	}, {
		Terms = reactModule.createElement(view, {
			tag = "auto-xy",
			LayoutOrder = 1,
			onActivated = useFlyoutItemNavigationModule(terms, p1.closeDrawer)
		}, {
			Label = reactModule.createElement(text, {
				tag = "auto-xy text-label-medium content-default",
				Text = var1.termsText
			})
		}),
		Privacy = reactModule.createElement(view, {
			tag = "auto-xy",
			LayoutOrder = 2,
			onActivated = useFlyoutItemNavigationModule(privacy, p1.closeDrawer)
		}, {
			Label = reactModule.createElement(text, {
				tag = "auto-xy text-label-medium content-default",
				Text = var1.privacyText
			})
		})
	})
end