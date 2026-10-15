return function(p1, p2, p3)
	if p3 and p3:IsA("TextChatMessageProperties") then
		if p3.Text ~= "" then
			p1 = p3.Text
		end
		if p3.Translation == "" then
			return p1, p2
		else
			p2 = p3.Translation
			
			return p1, p2
		end
	end
end