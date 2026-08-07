local configModule = require(script:FindFirstAncestor("ExpChat").Config)

return function(p0, p1, p2) --[[ line: 4 ]]
	-- upvalues: configModule (ref)
	p1 = p1 or configModule.ChatWindowFont
	p1 = string.format("<font transparency='1.0' family='%s' weight='%s' size='%s'><stroke transparency='1.0'>%s</stroke></font>", p1.Family, string.gsub(tostring(p1.Weight), "Enum.FontWeight.", ""), p2 or configModule.ChatWindowTextSize, string.gsub(p0, "transparency=[\"']%d%.?%d*[\"']", "transparency='1.0'"))
	
	if p1.Style == Enum.FontStyle.Italic then
		p1 = "<i>" .. p1 .. "</i>"
	end
	return p1
end