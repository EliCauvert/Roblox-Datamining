return function(Object, Callback)
	for _, descendant in ipairs(Object:GetDescendants()) do
		if Callback(descendant) then
			return descendant
		end
	end
	return nil
end