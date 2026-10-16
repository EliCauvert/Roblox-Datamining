local UserList = script:FindFirstAncestor("UserList")
local ReactModule = require(UserList.Parent.React)
local ContactsContextModule = require(UserList.Context.ContactsContext)
local _ = require(UserList.Common.Types)

return function(p1) --[[ Line: 16 | Named "useContactsData" ]]
	-- upvalues: ReactModule (copy), ContactsContextModule (copy)
	local Contact = ReactModule.useContext(ContactsContextModule).contacts[p1]
	
	return ReactModule.useMemo(function() --[[ Line: 20 ]]
		-- upvalues: Contact (copy)
		return if Contact == nil then nil else {
			isLoading = Contact.isLoading or false,
			name = Contact.name or "",
			avatarThumbnailUrl = Contact.avatarThumbnailUrl or ""
		}
	end, { p1, Contact })
end