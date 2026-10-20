local IXPServiceWrapper = require(game:GetService("CorePackages").Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local ClientToastNotificationsRedirect4 = game:DefineFastFlag("ClientToastNotificationsRedirect4", false)
local EnableClientToastNotificationsRedirectExperiment = game:DefineFastFlag("EnableClientToastNotificationsRedirectExperiment", false)
local ClientToastNotificationsRedirectLayerName = game:DefineFastString("ClientToastNotificationsRedirectLayerName", "Notification.Toast")
local ClientToastNotificationsRedirectLayerValue = game:DefineFastString("ClientToastNotificationsRedirectLayerValue", "NotificationRedirect")
local Flag = false
local v1 = nil
local v2 = nil

return function()
	-- upvalues: EnableClientToastNotificationsRedirectExperiment (copy), Flag (ref), v1 (ref), v2 (ref), IXPServiceWrapper (copy), ClientToastNotificationsRedirectLayerName (copy), ClientToastNotificationsRedirect4 (copy), ClientToastNotificationsRedirectLayerValue (copy)
	if EnableClientToastNotificationsRedirectExperiment and not Flag then
		v1, v7 = pcall(function()
			-- upvalues: Flag (upval), IXPServiceWrapper (upval), ClientToastNotificationsRedirectLayerName (upval)
			Flag = true
			
			return IXPServiceWrapper:GetLayerData(ClientToastNotificationsRedirectLayerName)
		end)
	end
	return ClientToastNotificationsRedirect4 or v1 and (v2 and v2[ClientToastNotificationsRedirectLayerValue])
end