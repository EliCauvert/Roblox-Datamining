local _ = require(script:FindFirstAncestor("AppChat").Models.ConversationChannels)

return function(p0, p1)
	for i, v in p0 do
		if v and v.type == "one_to_one" and v.participants then
			for i_1, v_1 in v.participants do
				if v_1 == p1 then
					return i
				end
			end
		end
	end
	return nil
end