local configModule = require(script:FindFirstAncestor("ExpChat").Config)

return function(p1, p2, p3)
	-- upvalues: configModule (ref)
	p2 = p2 or configModule.ChatWindowFont
	p2 = string.format("<font transparency='1.0' family='%s' weight='%s' size='%s'><stroke transparency='1.0'>%s</stroke></font>", p2.Family, string.gsub(tostring(p2.Weight), "Enum.FontWeight.", ""), p3 or configModule.ChatWindowTextSize, string.gsub(p1, "transparency=[\"']%d%.?%d*[\"']", "transparency='1.0'"))
	
	if p2.Style == Enum.FontStyle.Italic then
		p2 = "<i>" .. p1 .. "</i>"
	end
	return p2
end