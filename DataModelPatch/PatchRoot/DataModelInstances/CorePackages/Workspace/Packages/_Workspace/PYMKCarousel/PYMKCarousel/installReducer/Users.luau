local DependenciesModule = require(script:FindFirstAncestor("PYMKCarousel").dependencies)
local RoduxUsers = DependenciesModule.RoduxUsers
local ConvertActionsFunction = DependenciesModule.convertActions
local Llama = DependenciesModule.llama
local UsersActionAdaptorFunction = DependenciesModule.usersActionAdaptor
local UsersOmniActionAdaptorModule = require(script.Parent.usersOmniActionAdaptor)
local config = { byUserId = {}, byUsername = {} }
local InstallReducerResult = RoduxUsers.installReducer()

local function _(p1)
	-- upvalues: Llama (copy), UsersActionAdaptorFunction (copy), RoduxUsers (copy), UsersOmniActionAdaptorModule (copy)
	return Llama.Dictionary.join(UsersActionAdaptorFunction(RoduxUsers), UsersOmniActionAdaptorModule(p1))
end

return function(p1)
	-- upvalues: ConvertActionsFunction (copy), InstallReducerResult (copy), Llama (copy), UsersActionAdaptorFunction (copy), RoduxUsers (copy), UsersOmniActionAdaptorModule (copy), config (copy)
	return ConvertActionsFunction(InstallReducerResult, Llama.Dictionary.join(UsersActionAdaptorFunction(RoduxUsers), UsersOmniActionAdaptorModule(p1)), config)
end