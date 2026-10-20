local Parent = script:FindFirstAncestor("ContactImporter").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y margin-y-small",
		LayoutOrder = p1.layoutOrder
	}, {
		text = ReactModule.createElement(Text, {
			tag = "auto-y size-full-0 text-align-x-left text-wrap radius-medium bg-action-alert padding-medium stroke-emphasis",
			Text = UseLocalizationFunction({ message = "Feature.Contacts.Message.ContactsSyncWarning" }).message
		})
	})
end