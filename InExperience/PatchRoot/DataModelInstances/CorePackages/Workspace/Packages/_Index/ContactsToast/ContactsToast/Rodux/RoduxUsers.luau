local contactsToast = script:FindFirstAncestor("ContactsToast")

return require(contactsToast.Parent.RoduxUsers).config({
	keyPath = require(contactsToast.Common.Constants).RODUX_KEY .. ".Users"
})