local reactModule = require(script:FindFirstAncestor("EditProfile").Parent.React)
local editProfileToastModule = require(script.Parent.EditProfileToast)

return function(p0)
	-- upvalues: reactModule (ref), editProfileToastModule (ref)
	return reactModule.createElement(editProfileToastModule, { text = p0.navigation.getParam("text", "") })
end