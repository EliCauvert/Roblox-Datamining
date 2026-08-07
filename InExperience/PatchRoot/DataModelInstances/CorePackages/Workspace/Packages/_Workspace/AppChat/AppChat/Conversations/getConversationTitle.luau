return function(p0) --[[ line: 1 ]]
	if p0 then
		local title = p0.title or p0.titleForViewer
		
		return if title then string.gsub(tostring(title), "\n", "") else ""
	end
end