local _ = require(script:FindFirstAncestor("CrossPlay").Reducers.CrossPlaySettings)

return function(p1)
	local CrossPlaySettings = p1.CrossPlaySettings
	
	return CrossPlaySettings.Status.isEnabled and CrossPlaySettings.Status.isSystemPrivilegeEnabled or false
end