return function(p1, p2, TextChatMessageProperties)
	if TextChatMessageProperties and TextChatMessageProperties:IsA("TextChatMessageProperties") then
		if TextChatMessageProperties.Text ~= "" then
			p1 = TextChatMessageProperties.Text
		end
		if TextChatMessageProperties.Translation ~= "" then
			p2 = TextChatMessageProperties.Translation
			
			return p1, p2
		end
	end
	return p1, p2
end