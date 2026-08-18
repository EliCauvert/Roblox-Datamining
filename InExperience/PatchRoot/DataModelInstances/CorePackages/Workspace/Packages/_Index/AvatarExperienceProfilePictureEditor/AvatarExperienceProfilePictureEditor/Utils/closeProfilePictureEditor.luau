return function(p0) --[[ line: 5 | named "closeProfilePictureEditor" ]]
	if not p0 then return end
	local var0 = if p0.getParam then p0.getParam("prevNavPage") else nil
	
	if var0 and p0.navigate then
		p0.navigate(var0)
		
		return
	elseif p0.goBack then
		p0.goBack()
		
		return
	elseif p0.pop then
		p0.pop()
	end
end