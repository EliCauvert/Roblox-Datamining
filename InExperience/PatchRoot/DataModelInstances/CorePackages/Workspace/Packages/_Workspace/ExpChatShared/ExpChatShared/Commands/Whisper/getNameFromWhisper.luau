local function getArgs(p1, p2)
	for i, v in pairs(p2) do
		local text = v .. " "
		local var1 = string.len(text)
		
		if string.sub(p1, 1, var1):lower() == text then
			return string.sub(p1, var1 + 1)
		end
	end
	return nil
end

return function(p3, p4)
	-- upvalues: getArgs (ref)
	local var2 = getArgs(p3, p4)
	
	return if var2 then string.split(var2, " ")[1] else nil
end