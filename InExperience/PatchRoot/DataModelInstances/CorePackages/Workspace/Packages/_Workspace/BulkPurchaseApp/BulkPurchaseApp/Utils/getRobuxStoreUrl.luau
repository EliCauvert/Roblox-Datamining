local replaced = string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "/m.", "/www.")

return function()
	-- upvalues: replaced (ref)
	return ("%sUpgrades/Robux.aspx"):format(replaced)
end