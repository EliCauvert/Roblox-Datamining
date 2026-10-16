return function(Text, p1, p2): string --[[ Line: 23 | Named "rightPad" ]]
	local P2 = p2 or " "
	local v1 = p1 - Text:len()
	local v2 = v1 % P2:len()
	
	return Text .. string.rep(p2 or " ", (v1 - v2) / P2:len()) .. P2:sub(1, v2)
end