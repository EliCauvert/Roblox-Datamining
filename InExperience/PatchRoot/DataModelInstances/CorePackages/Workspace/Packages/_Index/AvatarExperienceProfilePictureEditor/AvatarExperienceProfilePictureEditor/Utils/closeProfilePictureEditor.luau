return function(p1)
	if not p1 then return end
	local var1 = if p1.getParam then p1.getParam("prevNavPage") else nil
	
	if var1 and p1.navigate then
		p1.navigate(var1)
		
		return
	elseif p1.goBack then
		p1.goBack()
		
		return
	elseif p1.pop then
		p1.pop()
	end
end