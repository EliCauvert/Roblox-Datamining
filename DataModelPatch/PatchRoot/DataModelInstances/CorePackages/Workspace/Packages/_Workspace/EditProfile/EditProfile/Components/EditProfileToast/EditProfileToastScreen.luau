local ReactModule = require(script:FindFirstAncestor("EditProfile").Parent.React)
local EditProfileToastModule = require(script.Parent.EditProfileToast)

return function(p1)
	-- upvalues: ReactModule (copy), EditProfileToastModule (copy)
	return ReactModule.createElement(EditProfileToastModule, { text = p1.navigation.getParam("text", "") })
end