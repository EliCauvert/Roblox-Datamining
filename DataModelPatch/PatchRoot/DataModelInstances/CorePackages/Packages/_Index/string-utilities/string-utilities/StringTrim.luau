return function(p1, Text1: string, p2)
	if not Text1 then
		Text1 = "%s"
	end
	if #Text1 == 0 then
		return p1
	end
	if not p2 then
		p2 = { left = true, right = true }
	end
	local Text: string = p1
	
	if p2.left then
		local FoundAt: number? = string.find(Text, "[^" .. Text1 .. "]")
		
		if not FoundAt then
			return ""
		end
		Text = string.sub(Text, FoundAt)
	end
	if p2.right then
		local FoundAt: number? = string.find(Text, "[" .. Text1 .. "]+$")
		
		if not FoundAt then
			return Text
		end
		Text = string.sub(Text, 1, FoundAt - 1)
	end
	return Text
end