local _ = require(script:FindFirstAncestor("AppChat").Models.ConversationChannels)

return function(List, p1) --[[ Line: 8 ]]
	for i, value in List do
		if value and value.type == "one_to_one" and value.participants then
			for _, participant in value.participants do
				if participant == p1 then
					return i
				end
			end
		end
	end
	return nil
end