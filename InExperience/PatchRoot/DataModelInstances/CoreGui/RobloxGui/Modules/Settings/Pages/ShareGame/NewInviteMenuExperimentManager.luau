local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local GetFStringInExperienceNotificationsLayerModule = require(Modules.Flags.GetFStringInExperienceNotificationsLayer)
local GetFFlagEnableNewInviteMenuIXPModule = require(Modules.Flags.GetFFlagEnableNewInviteMenuIXP)
local GetFFlagInviteListRerankFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank
local NewInviteMenuExperimentManager = {}
NewInviteMenuExperimentManager.__index = NewInviteMenuExperimentManager

function NewInviteMenuExperimentManager.new(p1) --[[ Line: 20 ]]
	-- upvalues: IXPServiceWrapper (copy), GetFFlagInviteListRerankFunction (copy), NewInviteMenuExperimentManager (copy)
	local config = {
		_styleEnabled = false,
		_customizationEnabled = false,
		_newSendEndpointEnabled = false,
		_ixpServiceWrapper = p1 or IXPServiceWrapper,
		_inviteListSortOrder = if GetFFlagInviteListRerankFunction() then 0 else nil
	}
	setmetatable(config, NewInviteMenuExperimentManager)
	
	return config
end

function NewInviteMenuExperimentManager:getStyleEnabled() --[[ Line: 32 ]]
	return self._styleEnabled
end

function NewInviteMenuExperimentManager:getCustomizationEnabled() --[[ Line: 36 ]]
	return self._customizationEnabled
end

function NewInviteMenuExperimentManager:getNewSendEndpointEnabled() --[[ Line: 40 ]]
	return self._newSendEndpointEnabled
end

if GetFFlagInviteListRerankFunction() then
	function NewInviteMenuExperimentManager:getInviteListSortOrder() --[[ Line: 45 ]]
		return self._inviteListSortOrder
	end
end
function NewInviteMenuExperimentManager.initialize(p1) --[[ Line: 50 ]]
	-- upvalues: GetFFlagEnableNewInviteMenuIXPModule (copy), GetFStringInExperienceNotificationsLayerModule (copy), GetFFlagInviteListRerankFunction (copy)
	if GetFFlagEnableNewInviteMenuIXPModule() then
		task.spawn(function() --[[ Line: 55 ]]
			-- upvalues: p1 (copy), GetFStringInExperienceNotificationsLayerModule (upval), GetFFlagInviteListRerankFunction (upval)
			p1._ixpServiceWrapper:WaitForInitialization()
			local LayerData = p1._ixpServiceWrapper:GetLayerData(GetFStringInExperienceNotificationsLayerModule())
			
			if LayerData then
				p1._styleEnabled = LayerData.NewInviteMenuStyleEnabled or false
				p1._customizationEnabled = LayerData.NewInviteMenuCustomizationEnabled or false
				p1._newSendEndpointEnabled = LayerData.NewInviteMenuEndpointEnabled or false
				p1._inviteListSortOrder = if GetFFlagInviteListRerankFunction() then LayerData.invite_list_sort_order or 0 else nil
			end
		end)
		
		return
	end
end

NewInviteMenuExperimentManager.default = NewInviteMenuExperimentManager.new()

return NewInviteMenuExperimentManager