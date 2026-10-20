local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local PrivateInvitesManagementViewModule = require(script.Parent.PrivateInvitesManagementView)
local UsePrivateInvitesManagementViewModelModule = require(script.Parent.usePrivateInvitesManagementViewModel)

return function(p1)
	-- upvalues: UsePrivateInvitesManagementViewModelModule (copy), ReactModule (copy), PrivateInvitesManagementViewModule (copy)
	return ReactModule.createElement(PrivateInvitesManagementViewModule, (UsePrivateInvitesManagementViewModelModule(p1)))
end