return {
	isNameLoading = function(p1): boolean
		local Name = if p1 == nil then nil else p1.name
		
		return Name == nil or Name == ""
	end
}