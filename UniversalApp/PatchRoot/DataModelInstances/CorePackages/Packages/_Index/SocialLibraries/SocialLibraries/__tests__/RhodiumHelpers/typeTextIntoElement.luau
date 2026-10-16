return function(p1, Text: string) --[[ Line: 2 ]]
	for i = 1, #Text do
		p1:sendText(Text:sub(i, i))
	end
	wait(0)
end