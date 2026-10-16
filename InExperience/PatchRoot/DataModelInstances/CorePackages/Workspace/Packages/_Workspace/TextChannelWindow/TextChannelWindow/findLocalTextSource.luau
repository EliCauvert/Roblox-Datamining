return function(Object, p1) --[[ Line: 3 | Named "findLocalTextSource" ]]
	if Object == nil or p1 == nil then
		return nil
	end
	for _, TextSource in Object:GetChildren() do
		if TextSource:IsA("TextSource") and tostring(TextSource.UserId) == p1 then
			return TextSource
		end
	end
	return nil
end