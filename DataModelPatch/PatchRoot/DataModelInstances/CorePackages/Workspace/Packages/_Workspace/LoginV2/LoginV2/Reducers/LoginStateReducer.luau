local LoginV2 = script:FindFirstAncestor("LoginV2")
local CryoModule = require(LoginV2.Parent.Cryo)
local _ = require(LoginV2.Components.Types)
local LoginActionTypeModule = require(LoginV2.Enums.LoginActionType)

return function(Tbl, p1, _)
	-- upvalues: LoginActionTypeModule (copy), CryoModule (copy)
	local Copy = table.clone(Tbl)
	local Type = p1.type
	
	if Type == LoginActionTypeModule.SetUserIdentifierAndType then
		Copy.userIdentifier = p1.data.userIdentifier
		Copy.userIdentifierType = p1.data.userIdentifierType
		
		return Copy
	end
	if Type == LoginActionTypeModule.IncrementLoginAttempts then
		Copy.numLoginAttempts += 1
		
		return Copy
	end
	if Type == LoginActionTypeModule.ResetLoginAttempts then
		Copy.numLoginAttempts = 0
		
		return Copy
	end
	if Type == LoginActionTypeModule.SetAvailableLoginMethods then
		Copy.availableLoginMethods = p1.data
		
		return Copy
	end
	if Type == LoginActionTypeModule.UpdateCredentialsProtocolStatus then
		Copy.credentialsProtocolStatus = CryoModule.Dictionary.join(Copy.credentialsProtocolStatus, p1.data)
		Copy.credentialsProtocolStatus.initialStateUpdated = true
		
		return Copy
	end
	if Type == LoginActionTypeModule.SetCredentialAutoPopupShown then
		Copy.shouldAutoShowCredentialPopup = false
		
		return Copy
	end
	if Type == LoginActionTypeModule.SetComponentState then
		Copy.componentState[p1.data.component] = CryoModule.Dictionary.join(Copy.componentState[p1.data.component], p1.data.payload)
		
		return Copy
	end
	if Type == LoginActionTypeModule.ForceLoginByUsername then
		Copy.forceLoginByUsername = true
		
		return Copy
	end
	if Type == LoginActionTypeModule.ClearForcedUsernameOverride and Copy.extraProps then
		Copy.extraProps.forcedUsernameOverride = nil
	end
	return Copy
end