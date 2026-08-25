local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local privateInvitesPickerViewModule = require(script.Parent.PrivateInvitesPickerView)
local usePrivateInvitesPickerViewModelModule = require(script.Parent.usePrivateInvitesPickerViewModel)

return function(p0)
	-- upvalues: usePrivateInvitesPickerViewModelModule (ref), reactModule (ref), privateInvitesPickerViewModule (ref)
	return reactModule.createElement(privateInvitesPickerViewModule, usePrivateInvitesPickerViewModelModule(p0))
end