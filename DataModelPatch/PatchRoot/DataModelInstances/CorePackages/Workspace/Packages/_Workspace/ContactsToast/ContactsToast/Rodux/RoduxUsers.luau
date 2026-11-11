local ContactsToast = script:FindFirstAncestor("ContactsToast")

return require(ContactsToast.Parent.RoduxUsers).config({
	keyPath = require(ContactsToast.Common.Constants).RODUX_KEY .. ".Users"
})