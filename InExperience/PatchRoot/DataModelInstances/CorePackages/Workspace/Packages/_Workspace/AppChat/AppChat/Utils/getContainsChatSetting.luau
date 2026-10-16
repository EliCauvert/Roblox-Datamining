return function(List): boolean --[[ Line: 1 ]]
	return if List then (table.find(List, "WhoCanChatWithMeInApp") or (table.find(List, "WhoCanGroupChatWithMeInApp") or (table.find(List, "WhoCanOneOnOnePartyWithMe") or table.find(List, "WhoCanGroupPartyWithMe")))) ~= nil else false
end