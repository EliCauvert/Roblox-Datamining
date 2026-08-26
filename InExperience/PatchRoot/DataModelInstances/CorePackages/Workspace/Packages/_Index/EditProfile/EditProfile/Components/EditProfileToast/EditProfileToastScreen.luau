local reactModule = require(script:FindFirstAncestor("EditProfile").Parent.React)
local editProfileToastModule = require(script.Parent.EditProfileToast)

return function(p1)
	-- upvalues: reactModule (ref), editProfileToastModule (ref)
	return reactModule.createElement(editProfileToastModule, { text = p1.navigation.getParam("text", "") })
end