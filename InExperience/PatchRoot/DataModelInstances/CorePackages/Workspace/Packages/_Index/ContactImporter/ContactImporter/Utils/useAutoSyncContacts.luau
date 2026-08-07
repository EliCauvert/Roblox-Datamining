local parent = script.Parent.Parent
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local reactModule = require(parent_1.React)
local contactsProtocol = require(parent_1.ContactsProtocol).ContactsProtocol
local appStorageService = game:GetService("AppStorageService")
local useSelector = dependenciesModule.useSelector
local useDispatch = dependenciesModule.useDispatch
local autoSyncContactsModule = require(parent.Networking.AutoSyncContacts)

return function(p0) --[[ line: 20 ]]
	-- upvalues: useDispatch (ref), useSelector (ref), autoSyncContactsModule (ref), contactsProtocol (ref), appStorageService (ref), reactModule (ref)
	local var4 = useDispatch()
	local var5 = useSelector(function(p1) --[[ line: 22 ]]
		return p1.LocalUserId
	end)
	reactModule.useEffect(p0 or function() --[[ line: 27 ]]
		-- upvalues: var4 (ref), autoSyncContactsModule (copy), var5 (ref), contactsProtocol (copy), appStorageService (copy)
		var4(autoSyncContactsModule(var5, contactsProtocol.default, appStorageService))
	end, {})
end