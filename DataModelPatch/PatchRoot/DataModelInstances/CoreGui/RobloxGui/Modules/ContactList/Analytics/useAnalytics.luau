local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ContactListContextModule = require(script:FindFirstAncestor("ContactList").Context.ContactListContext)

return function()
	-- upvalues: ReactModule (copy), ContactListContextModule (copy)
	return {
		fireEvent = ReactModule.useContext(ContactListContextModule).fireAnalyticsEvent
	}
end