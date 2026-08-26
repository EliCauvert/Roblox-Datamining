local userList = script:FindFirstAncestor("UserList")
local reactModule = require(userList.Parent.React)
local contactsContextModule = require(userList.Context.ContactsContext)
local _ = require(userList.Common.Types)

return function(p1)
	-- upvalues: reactModule (ref), contactsContextModule (ref)
	local var1 = reactModule.useContext(contactsContextModule).contacts[p1]
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return if var1 == nil then nil else {
			isLoading = var1.isLoading or false,
			name = var1.name or "",
			avatarThumbnailUrl = var1.avatarThumbnailUrl or ""
		}
	end, { p1, var1 })
end