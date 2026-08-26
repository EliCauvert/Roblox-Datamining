return function(p1)
	return if p1 then (table.find(p1, "WhoCanChatWithMeInApp") or (table.find(p1, "WhoCanGroupChatWithMeInApp") or (table.find(p1, "WhoCanOneOnOnePartyWithMe") or table.find(p1, "WhoCanGroupPartyWithMe")))) ~= nil else false
end