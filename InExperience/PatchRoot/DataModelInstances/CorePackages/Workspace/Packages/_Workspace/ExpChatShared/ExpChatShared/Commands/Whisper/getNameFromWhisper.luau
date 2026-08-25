local function getArgs(p0, p1)
	for i, v in pairs(p1) do
		local text = v .. " "
		local var2 = string.len(text)
		
		if string.sub(p0, 1, var2):lower() == text then
			return string.sub(p0, var2 + 1)
		end
	end
	return nil
end

return function(p2, p3)
	-- upvalues: getArgs (ref)
	local var3 = getArgs(p2, p3)
	
	return if var3 then string.split(var3, " ")[1] else nil
end