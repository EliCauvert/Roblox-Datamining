local IXPServiceWrapper = require(game:GetService("CorePackages").Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local clientToastNotificationsRedirect4 = game:DefineFastFlag("ClientToastNotificationsRedirect4", false)
local enableClientToastNotificationsRedirectExperiment = game:DefineFastFlag("EnableClientToastNotificationsRedirectExperiment", false)
local clientToastNotificationsRedirectLayerName = game:DefineFastString("ClientToastNotificationsRedirectLayerName", "Notification.Toast")
local clientToastNotificationsRedirectLayerValue = game:DefineFastString("ClientToastNotificationsRedirectLayerValue", "NotificationRedirect")
local var1 = false
local var2 = nil
local var3 = nil

return function()
	-- upvalues: enableClientToastNotificationsRedirectExperiment (ref), var1 (write), var2 (write), var3 (write), IXPServiceWrapper (ref), clientToastNotificationsRedirectLayerName (ref), clientToastNotificationsRedirect4 (ref), clientToastNotificationsRedirectLayerValue (ref)
	if enableClientToastNotificationsRedirectExperiment and not var1 then
		local ok, status = pcall(function()
			-- upvalues: var1 (copy), IXPServiceWrapper (copy), clientToastNotificationsRedirectLayerName (copy)
			var1 = true
			
			return IXPServiceWrapper:GetLayerData(clientToastNotificationsRedirectLayerName)
		end)
		var2 = ok
		var3 = status
	end
	return clientToastNotificationsRedirect4 or var2 and (var3 and var3[clientToastNotificationsRedirectLayerValue])
end