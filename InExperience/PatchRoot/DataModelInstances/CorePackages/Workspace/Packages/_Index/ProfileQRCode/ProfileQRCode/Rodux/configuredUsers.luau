local parent = script:FindFirstAncestor("ProfileQRCode").Parent
local convertActions = require(parent.SocialReducerAdaptors).convertActions
local usersActionAdaptor = require(parent.SocialReducerAdaptors).usersActionAdaptor
local roduxUsersModule = require(script.Parent.RoduxUsers)
local t = { byUserId = {}, byUsername = {} }
local var2 = roduxUsersModule.installReducer()

return function()
	-- upvalues: convertActions (ref), var2 (ref), usersActionAdaptor (ref), roduxUsersModule (ref), t (ref)
	return convertActions(var2, usersActionAdaptor(roduxUsersModule), t)
end