local parent = script.Parent.Parent
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local reactModule = require(parent_1.React)
local contactsProtocol = require(parent_1.ContactsProtocol).ContactsProtocol
local appStorageService = game:GetService("AppStorageService")
local useSelector = dependenciesModule.useSelector
local useDispatch = dependenciesModule.useDispatch
local autoSyncContactsModule = require(parent.Networking.AutoSyncContacts)

return function(p1)
	-- upvalues: useDispatch (ref), useSelector (ref), autoSyncContactsModule (ref), contactsProtocol (ref), appStorageService (ref), reactModule (ref)
	local var1 = useDispatch()
	local var2 = useSelector(function(p2)
		return p2.LocalUserId
	end)
	reactModule.useEffect(p1 or function()
		-- upvalues: var1 (ref), autoSyncContactsModule (copy), var2 (ref), contactsProtocol (copy), appStorageService (copy)
		var1(autoSyncContactsModule(var2, contactsProtocol.default, appStorageService))
	end, {})
end