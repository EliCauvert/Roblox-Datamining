return function(p1)
	if p1 then
		local title = p1.title or p1.titleForViewer
		
		return if title then string.gsub(tostring(title), "\n", "") else ""
	end
end