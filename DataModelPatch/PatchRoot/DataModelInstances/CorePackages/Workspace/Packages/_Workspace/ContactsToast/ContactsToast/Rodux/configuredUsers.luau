local Parent = script:FindFirstAncestor("ContactsToast").Parent
local ConvertActionsFunction = require(Parent.SocialReducerAdaptors).convertActions
local UsersActionAdaptorFunction = require(Parent.SocialReducerAdaptors).usersActionAdaptor
local RoduxUsersModule = require(script.Parent.RoduxUsers)
local config = { byUserId = {}, byUsername = {} }
local InstallReducerResult = RoduxUsersModule.installReducer()

return function()
	-- upvalues: ConvertActionsFunction (copy), InstallReducerResult (copy), UsersActionAdaptorFunction (copy), RoduxUsersModule (copy), config (copy)
	return ConvertActionsFunction(InstallReducerResult, UsersActionAdaptorFunction(RoduxUsersModule), config)
end