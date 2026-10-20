local Replaced = string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "/m.", "/www.")

return function(): string
	-- upvalues: Replaced (copy)
	return ("%sUpgrades/Robux.aspx"):format(Replaced)
end