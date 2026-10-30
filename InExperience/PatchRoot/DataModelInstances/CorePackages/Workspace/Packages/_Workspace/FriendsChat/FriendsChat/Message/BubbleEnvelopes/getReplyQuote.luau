return function(p1, p2)
	local P1 = p2 or p1
	
	if P1 == nil then
		return nil
	elseif P1.type == "system" or P1.visibility == "hidden" then
		return nil
	elseif P1.status == "Moderated" or P1.status == "Failed" then
		return nil
	else
		local Content = P1.content
		
		return if type(Content) == "string" and Content ~= "" then Content else nil
	end
end