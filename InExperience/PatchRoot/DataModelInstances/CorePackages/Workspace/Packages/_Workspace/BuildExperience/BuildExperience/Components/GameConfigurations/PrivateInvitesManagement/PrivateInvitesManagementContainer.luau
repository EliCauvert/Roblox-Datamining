local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local privateInvitesManagementViewModule = require(script.Parent.PrivateInvitesManagementView)
local usePrivateInvitesManagementViewModelModule = require(script.Parent.usePrivateInvitesManagementViewModel)

return function(p0)
	-- upvalues: usePrivateInvitesManagementViewModelModule (ref), reactModule (ref), privateInvitesManagementViewModule (ref)
	return reactModule.createElement(privateInvitesManagementViewModule, usePrivateInvitesManagementViewModelModule(p0))
end