local parent = script.Parent.Parent
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local reactModule = require(parent_1.React)
local contactsProtocol = require(parent_1.ContactsProtocol).ContactsProtocol
local appStorageService = game:GetService("AppStorageService")
local useSelector = dependenciesModule.useSelector
local useDispatch = dependenciesModule.useDispatch
local useEffectOnce = dependenciesModule.useEffectOnce
local autoSyncContactsModule = require(parent.Networking.AutoSyncContacts)
local fFlagGateContactAutoSyncByPolicyModule = require(parent.Flags.FFlagGateContactAutoSyncByPolicy)

return function(p1, p2)
	-- upvalues: useDispatch (ref), useSelector (ref), autoSyncContactsModule (ref), contactsProtocol (ref), appStorageService (ref), fFlagGateContactAutoSyncByPolicyModule (ref), useEffectOnce (ref), reactModule (ref)
	local var1 = useDispatch()
	local var2 = useSelector(function(p3)
		return p3.LocalUserId
	end)
	local var3 = p2 or function()
		-- upvalues: var1 (ref), autoSyncContactsModule (copy), var2 (ref), contactsProtocol (copy), appStorageService (copy)
		var1(autoSyncContactsModule(var2, contactsProtocol.default, appStorageService))
	end
	
	if fFlagGateContactAutoSyncByPolicyModule then
		useEffectOnce(var3, p1)
		
		return
	end
	reactModule.useEffect(var3, {})
end