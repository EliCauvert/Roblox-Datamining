local parent = script:FindFirstAncestor("ContactImporter").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local view = foundationModule.View
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(p0) --[[ line: 16 | named "ContactsSyncWarningMessage" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y margin-y-small",
		LayoutOrder = p0.layoutOrder
	}, {
		text = reactModule.createElement(text, {
			tag = "auto-y size-full-0 text-align-x-left text-wrap radius-medium bg-action-alert padding-medium stroke-emphasis",
			Text = useLocalization({ message = "Feature.Contacts.Message.ContactsSyncWarning" }).message
		})
	})
end