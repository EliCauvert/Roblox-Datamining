local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local PrivateInvitesPickerViewModule = require(script.Parent.PrivateInvitesPickerView)
local UsePrivateInvitesPickerViewModelModule = require(script.Parent.usePrivateInvitesPickerViewModel)

return function(p1) --[[ Line: 15 | Named "PrivateInvitesPickerContainer" ]]
	-- upvalues: UsePrivateInvitesPickerViewModelModule (copy), ReactModule (copy), PrivateInvitesPickerViewModule (copy)
	return ReactModule.createElement(PrivateInvitesPickerViewModule, (UsePrivateInvitesPickerViewModelModule(p1)))
end