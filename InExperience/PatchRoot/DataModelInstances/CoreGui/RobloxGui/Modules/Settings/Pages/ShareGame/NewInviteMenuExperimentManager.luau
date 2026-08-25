local corePackagesService = game:GetService("CorePackages")
local modules = game:GetService("CoreGui").RobloxGui.Modules
local IXPServiceWrapper = require(corePackagesService.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local getFStringInExperienceNotificationsLayerModule = require(modules.Flags.GetFStringInExperienceNotificationsLayer)
local getFFlagEnableNewInviteMenuIXPModule = require(modules.Flags.GetFFlagEnableNewInviteMenuIXP)
local getFFlagInviteListRerank = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: IXPServiceWrapper (ref), getFFlagInviteListRerank (ref), t (ref)
	local t_1 = {
		_styleEnabled = false,
		_customizationEnabled = false,
		_newSendEndpointEnabled = false,
		_ixpServiceWrapper = p0 or IXPServiceWrapper,
		_inviteListSortOrder = if getFFlagInviteListRerank() then 0 else nil
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:getStyleEnabled()
	return self._styleEnabled
end

function t:getCustomizationEnabled()
	return self._customizationEnabled
end

function t:getNewSendEndpointEnabled()
	return self._newSendEndpointEnabled
end

if getFFlagInviteListRerank() then
	function t:getInviteListSortOrder()
		return self._inviteListSortOrder
	end
end
function t.initialize(p1)
	-- upvalues: getFFlagEnableNewInviteMenuIXPModule (ref), getFStringInExperienceNotificationsLayerModule (ref), getFFlagInviteListRerank (ref)
	if getFFlagEnableNewInviteMenuIXPModule() then
		task.spawn(function()
			-- upvalues: p1 (ref), getFStringInExperienceNotificationsLayerModule (copy), getFFlagInviteListRerank (copy)
			p1._ixpServiceWrapper:WaitForInitialization()
			local var5 = p1._ixpServiceWrapper:GetLayerData(getFStringInExperienceNotificationsLayerModule())
			
			if var5 then
				p1._styleEnabled = var5.NewInviteMenuStyleEnabled or false
				p1._customizationEnabled = var5.NewInviteMenuCustomizationEnabled or false
				p1._newSendEndpointEnabled = var5.NewInviteMenuEndpointEnabled or false
				p1._inviteListSortOrder = if getFFlagInviteListRerank() then var5.invite_list_sort_order or 0 else nil
			end
		end)
		
		return
	end
end

t.default = t.new()

return t