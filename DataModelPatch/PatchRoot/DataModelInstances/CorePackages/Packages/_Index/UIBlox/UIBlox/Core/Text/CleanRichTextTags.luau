return function(Text: string): string
	local Text1 = ""
	local Count = 0
	
	for i = 1, #Text do
		local Segment = string.sub(Text, i, i)
		
		if Segment == "<" then
			Count += 1
		elseif Segment == ">" and Count > 0 then
			Count -= 1
		elseif Count == 0 then
			Text1 ..= Segment
		end
	end
	return if Count == 0 then Text1 else Text
end