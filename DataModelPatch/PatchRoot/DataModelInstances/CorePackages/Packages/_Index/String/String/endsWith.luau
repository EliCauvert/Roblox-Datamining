return function(Text: string, Text1, p1): boolean
	local Length: number = Text1:len()
	
	if Length == 0 then
		return true
	end
	local Length1 = Text:len()
	local P2 = p1 or Length1
	
	if Length1 < P2 then
		P2 = Length1
	end
	if P2 < 1 then
		return false
	else
		local NewP = P2 - Length + 1
		
		return Text:find(Text1, NewP, true) == NewP
	end
end