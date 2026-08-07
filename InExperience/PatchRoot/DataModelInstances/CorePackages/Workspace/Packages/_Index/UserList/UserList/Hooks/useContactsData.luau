local userList = script:FindFirstAncestor("UserList")
local reactModule = require(userList.Parent.React)
local contactsContextModule = require(userList.Context.ContactsContext)
local _ = require(userList.Common.Types)

return function(p0) --[[ line: 16 | named "useContactsData" ]]
	-- upvalues: reactModule (ref), contactsContextModule (ref)
	local var3 = reactModule.useContext(contactsContextModule).contacts[p0]
	
	return reactModule.useMemo(function() --[[ line: 20 ]]
		-- upvalues: var3 (ref)
		return if var3 == nil then nil else {
			isLoading = var3.isLoading or false,
			name = var3.name or "",
			avatarThumbnailUrl = var3.avatarThumbnailUrl or ""
		}
	end, { p0, var3 })
end