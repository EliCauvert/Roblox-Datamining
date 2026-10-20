local ConfigModule = require(script:FindFirstAncestor("ExpChat").Config)

return function(Text: string, p1, p2): string
	-- upvalues: ConfigModule (copy)
	local P0 = p1 or ConfigModule.ChatWindowFont
	local Formatted = string.format("<font transparency='1.0' family='%s' weight='%s' size='%s'><stroke transparency='1.0'>%s</stroke></font>", P0.Family, string.gsub(tostring(P0.Weight), "Enum.FontWeight.", ""), p2 or ConfigModule.ChatWindowTextSize, (string.gsub(Text, "transparency=[\"']%d%.?%d*[\"']", "transparency='1.0'")))
	
	if P0.Style == Enum.FontStyle.Italic then
		Formatted = "<i>" .. Formatted .. "</i>"
	end
	return Formatted
end