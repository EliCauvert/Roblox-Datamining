local reactModule = require(game:GetService("CorePackages").Packages.React)
local contactListContextModule = require(script:FindFirstAncestor("ContactList").Context.ContactListContext)

return function() --[[ line: 10 ]]
	-- upvalues: reactModule (ref), contactListContextModule (ref)
	return {
		fireEvent = reactModule.useContext(contactListContextModule).fireAnalyticsEvent
	}
end