local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)
local ContactMethodTypeModule = require(AccountRecovery.Enums.ContactMethodType)
local IdentifierTypeModule = require(AccountRecovery.Enums.IdentifierType)
local AuthCommonModule = require(AccountRecovery.Parent.AuthCommon)
local IsStringEmailFunction = AuthCommonModule.Utils.isStringEmail
local IsStringPhoneFunction = AuthCommonModule.Utils.isStringPhone

function getIdentifierType(p1, p2)
	-- upvalues: IsStringPhoneFunction (copy), IdentifierTypeModule (copy), IsStringEmailFunction (copy)
	return if p2 or IsStringPhoneFunction(p1) then IdentifierTypeModule.Phone elseif IsStringEmailFunction(p1) then IdentifierTypeModule.Email else IdentifierTypeModule.Username
end

function identifierTypeToContactMethodType(Phone)
	-- upvalues: IdentifierTypeModule (copy), ContactMethodTypeModule (copy)
	return if Phone == IdentifierTypeModule.Phone then ContactMethodTypeModule.Phone else ContactMethodTypeModule.Email
end

return {
	getIdentifierType = getIdentifierType,
	identifierTypeToContactMethodType = identifierTypeToContactMethodType,
	formatIdentifier = function(Text, Phone, p1)
		-- upvalues: IdentifierTypeModule (copy)
		return if Phone == IdentifierTypeModule.Phone and (p1 and p1.prefix and p1.prefix ~= "") then "+" .. p1.prefix .. Text else Text
	end
}