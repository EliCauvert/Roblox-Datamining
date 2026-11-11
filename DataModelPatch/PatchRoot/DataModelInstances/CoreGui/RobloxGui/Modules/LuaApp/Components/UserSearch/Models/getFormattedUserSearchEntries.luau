local UserSearchEntryModule = require(script.Parent.UserSearchEntry)

return function(List)
	-- upvalues: UserSearchEntryModule (copy)
	local List1 = {}
	
	if not List then
		return {}
	end
	for _, value in List do
		UserSearchEntryModule.fromOmniJsonData(value):match(function(p1)
			-- upvalues: List1 (copy)
			table.insert(List1, p1)
		end):matchError(function(Text)
			warn("Failure in parsing UserSearchEntry: " .. Text)
		end)
	end
	return List1
end