local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local ContactsProtocol = require(Parent.Parent.ContactsProtocol).ContactsProtocol
local AppStorageService = game:GetService("AppStorageService")
local UseSelectorFunction = DependenciesModule.useSelector
local UseDispatchFunction = DependenciesModule.useDispatch
local UseEffectOnceFunction = DependenciesModule.useEffectOnce
local AutoSyncContactsModule = require(Parent.Networking.AutoSyncContacts)

return function(p1, p2)
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), AutoSyncContactsModule (copy), ContactsProtocol (copy), AppStorageService (copy), UseEffectOnceFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p3)
		return p3.LocalUserId
	end)
	UseEffectOnceFunction(if p2 then p2 else function()
		-- upvalues: UseDispatchResult (copy), AutoSyncContactsModule (upval), UseSelectorResult (copy), ContactsProtocol (upval), AppStorageService (upval)
		UseDispatchResult(AutoSyncContactsModule(UseSelectorResult, ContactsProtocol.default, AppStorageService))
	end, p1)
end