local ResultModule = require(game:GetService("CorePackages").Packages.Result)
local UserSearchEntryModule = {
	new = function()
		return {}
	end
}

function UserSearchEntryModule.fromOmniJsonData(p1)
	-- upvalues: ResultModule (copy), UserSearchEntryModule (copy)
	if type(p1) ~= "table" then
		return ResultModule.error("UserSearchEntry.fromOmniJsonData expects userSearchEntryJson to be a table")
	elseif p1.previousUsernames and type(p1.previousUsernames) ~= "table" then
		return ResultModule.error("UserSearchEntry.entries expects entry.previousUsernames to be a table or null")
	elseif type(p1.contentId) ~= "number" then
		return ResultModule.error("UserSearchEntry.entries expects entry.contentId to be a number")
	elseif type(p1.username) ~= "string" then
		return ResultModule.error("UserSearchEntry.entries expects entry.username to be a string")
	elseif type(p1.displayName) ~= "string" then
		return ResultModule.error("UserSearchEntry.entries expects entry.displayName to be a string")
	elseif p1.contentType == "User" then
		local NewUserSearchEntry = UserSearchEntryModule.new()
		NewUserSearchEntry.previousUsernames = p1.previousUsernames or {}
		NewUserSearchEntry.id = tostring(p1.contentId)
		NewUserSearchEntry.name = p1.username
		NewUserSearchEntry.displayName = p1.displayName
		
		return ResultModule.success(NewUserSearchEntry)
	else
		return ResultModule.error("UserSearchEntry.entries expects entry.contentType to be 'User'")
	end
end

function UserSearchEntryModule.mock(p1)
	-- upvalues: UserSearchEntryModule (copy)
	local NewUserSearchEntry = UserSearchEntryModule.new()
	NewUserSearchEntry.previousUsernames = { "tester001", "tester002" }
	NewUserSearchEntry.id = p1 or "123456"
	NewUserSearchEntry.name = "tester003"
	NewUserSearchEntry.displayName = "tester003"
	
	return NewUserSearchEntry
end

return UserSearchEntryModule