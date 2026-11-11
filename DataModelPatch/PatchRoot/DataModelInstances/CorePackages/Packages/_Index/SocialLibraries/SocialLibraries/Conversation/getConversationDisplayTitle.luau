return function(p1): string
	if p1 then
		local Title = p1.title or p1.titleForViewer
		
		if Title then
			return string.gsub(tostring(Title), "\n", "")
		end
	end
	return ""
end