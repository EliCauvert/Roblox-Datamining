local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local ReactModule = require(Parent.React)
local _ = require(AccountRecovery.Components.Types)
local ModalStateModule = require(AccountRecovery.Enums.ModalState)
local UpdateEmailModule = require(AccountRecovery.Components.Modal.UpdateEmail)
local SaveOrDeleteTwoStepMethodModule = require(AccountRecovery.Components.Modal.SaveOrDeleteTwoStepMethod)
local AddNewPasskeyModule = require(AccountRecovery.Components.Modal.AddNewPasskey)

return require(Parent.AppCommonLib).memoize(function(p1)
	-- upvalues: ModalStateModule (copy), ReactModule (copy), UpdateEmailModule (copy), SaveOrDeleteTwoStepMethodModule (copy), AddNewPasskeyModule (copy)
	return if p1 == nil then nil elseif p1.modalState == ModalStateModule.UPDATE_EMAIL then ReactModule.createElement(UpdateEmailModule, p1.props) elseif p1.modalState == ModalStateModule.SAVE_OR_DELETE_TWO_STEP_METHOD then ReactModule.createElement(SaveOrDeleteTwoStepMethodModule, p1.props) elseif p1.modalState == ModalStateModule.ADD_NEW_PASSKEY then ReactModule.createElement(AddNewPasskeyModule, p1.props) else nil
end)