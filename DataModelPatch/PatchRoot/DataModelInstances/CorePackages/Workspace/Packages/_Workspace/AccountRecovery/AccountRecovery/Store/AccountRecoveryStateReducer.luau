local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local _ = require(AccountRecovery.Store.State)
local _ = require(AccountRecovery.Store.Action)
local ModalStateModule = require(AccountRecovery.Enums.ModalState)
local AccountRecoveryActionTypeModule = require(AccountRecovery.Enums.AccountRecoveryActionType)

return function(Tbl, p1, _)
	-- upvalues: AccountRecoveryActionTypeModule (copy), ModalStateModule (copy)
	local Copy = table.clone(Tbl)
	local Type = p1.type
	
	if Type == AccountRecoveryActionTypeModule.SET_RECOVERY_SESSION_ID then
		Copy.recoverySessionId = p1.data.recoverySessionId
		
		return Copy
	end
	if Type == AccountRecoveryActionTypeModule.SET_PHONE_PREFIX_LIST then
		Copy.phonePrefixList = p1.data.phonePrefixList
		
		return Copy
	end
	if Type == AccountRecoveryActionTypeModule.SET_MODAL_STATE_AND_PROPS then
		Copy.modalStateAndProps = p1.data.modalStateAndProps
		
		return Copy
	end
	if Type == AccountRecoveryActionTypeModule.SET_RECOVERY_INTENT then
		Copy.recover2sv = p1.data.recover2sv
		Copy.recoverPassword = p1.data.recoverPassword
		
		return Copy
	end
	if Type == AccountRecoveryActionTypeModule.RESET_RECOVERY_FLOW then
		Copy.continuingRecovery = p1.data.continuingRecovery
		Copy.recoverySessionId = p1.data.recoverySessionId
		Copy.autofillIdentifier = p1.data.autofillIdentifier
		Copy.recover2sv = p1.data.recover2sv
		Copy.recoverPassword = p1.data.recoverPassword
		Copy.deeplinkUuid = p1.data.deeplinkUuid
		Copy.modalStateAndProps = { props = nil, modalState = ModalStateModule.NONE }
	end
	return Copy
end