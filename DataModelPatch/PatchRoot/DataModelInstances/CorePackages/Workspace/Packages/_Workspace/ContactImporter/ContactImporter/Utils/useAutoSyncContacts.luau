local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local ReactModule = require(Parent1.React)
local ContactsProtocol = require(Parent1.ContactsProtocol).ContactsProtocol
local AppStorageService = game:GetService("AppStorageService")
local UseSelectorFunction = DependenciesModule.useSelector
local UseDispatchFunction = DependenciesModule.useDispatch
local AutoSyncContactsModule = require(Parent.Networking.AutoSyncContacts)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), AutoSyncContactsModule (copy), ContactsProtocol (copy), AppStorageService (copy), ReactModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.LocalUserId
	end)
	ReactModule.useEffect(if p1 then p1 else function()
		-- upvalues: UseDispatchResult (copy), AutoSyncContactsModule (upval), UseSelectorResult (copy), ContactsProtocol (upval), AppStorageService (upval)
		UseDispatchResult(AutoSyncContactsModule(UseSelectorResult, ContactsProtocol.default, AppStorageService))
	end, {})
end