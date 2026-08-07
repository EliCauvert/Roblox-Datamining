local IXPServiceWrapper = require(game:GetService("CorePackages").Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local clientToastNotificationsRedirect4 = game:DefineFastFlag("ClientToastNotificationsRedirect4", false)
local enableClientToastNotificationsRedirectExperiment = game:DefineFastFlag("EnableClientToastNotificationsRedirectExperiment", false)
local clientToastNotificationsRedirectLayerName = game:DefineFastString("ClientToastNotificationsRedirectLayerName", "Notification.Toast")
local clientToastNotificationsRedirectLayerValue = game:DefineFastString("ClientToastNotificationsRedirectLayerValue", "NotificationRedirect")
local var4 = false
local var5 = nil
local var6 = nil

return function() --[[ line: 12 ]]
	-- upvalues: enableClientToastNotificationsRedirectExperiment (ref), var4 (write), var5 (write), var6 (write), IXPServiceWrapper (ref), clientToastNotificationsRedirectLayerName (ref), clientToastNotificationsRedirect4 (ref), clientToastNotificationsRedirectLayerValue (ref)
	if enableClientToastNotificationsRedirectExperiment and not var4 then
		local ok, status = pcall(function() --[[ line: 14 ]]
			-- upvalues: var4 (copy), IXPServiceWrapper (copy), clientToastNotificationsRedirectLayerName (copy)
			var4 = true
			
			return IXPServiceWrapper:GetLayerData(clientToastNotificationsRedirectLayerName)
		end)
		var5 = ok
		var6 = status
	end
	return clientToastNotificationsRedirect4 or var5 and (var6 and var6[clientToastNotificationsRedirectLayerValue])
end