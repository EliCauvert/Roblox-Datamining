local function getArgs(Text: string, List): string?
	local Length = nil
	for _, value in pairs(List) do
		local Text1 = value .. " "
		Length = string.len(Text1)
		
		if string.sub(Text, 1, Length):lower() == Text1 then
			return (string.sub(Text, Length + 1))
		end
	end
	return nil
end

return function(p1, p2)
	-- upvalues: getArgs (copy)
	local Args: string = getArgs(p1, p2)
	
	return if Args then string.split(Args, " ")[1] else nil
end