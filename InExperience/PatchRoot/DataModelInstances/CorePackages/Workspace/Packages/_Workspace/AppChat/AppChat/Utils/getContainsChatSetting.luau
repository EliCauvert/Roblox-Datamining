return function(p0) --[[ line: 1 ]]
	return if p0 then (table.find(p0, "WhoCanChatWithMeInApp") or (table.find(p0, "WhoCanGroupChatWithMeInApp") or (table.find(p0, "WhoCanOneOnOnePartyWithMe") or table.find(p0, "WhoCanGroupPartyWithMe")))) ~= nil else false
end