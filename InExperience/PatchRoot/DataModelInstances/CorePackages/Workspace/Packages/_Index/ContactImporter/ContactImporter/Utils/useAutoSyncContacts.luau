local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local ReactModule = require(Parent1.React)
local ContactsProtocol = require(Parent1.ContactsProtocol).ContactsProtocol
local AppStorageService = game:GetService("AppStorageService")
local UseSelectorFunction = DependenciesModule.useSelector
local UseDispatchFunction = DependenciesModule.useDispatch
local UseEffectOnceFunction = DependenciesModule.useEffectOnce
local AutoSyncContactsModule = require(Parent.Networking.AutoSyncContacts)
local FFlagGateContactAutoSyncByPolicyModule = require(Parent.Flags.FFlagGateContactAutoSyncByPolicy)

return function(p1, p2) --[[ Line: 23 ]]
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), AutoSyncContactsModule (copy), ContactsProtocol (copy), AppStorageService (copy), FFlagGateContactAutoSyncByPolicyModule (copy), UseEffectOnceFunction (copy), ReactModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p3) --[[ Line: 25 ]]
		return p3.LocalUserId
	end)
	local v1 = if p2 then p2 else function() --[[ Line: 30 ]]
		-- upvalues: UseDispatchResult (copy), AutoSyncContactsModule (upval), UseSelectorResult (copy), ContactsProtocol (upval), AppStorageService (upval)
		UseDispatchResult(AutoSyncContactsModule(UseSelectorResult, ContactsProtocol.default, AppStorageService))
	end
	
	if FFlagGateContactAutoSyncByPolicyModule then
		UseEffectOnceFunction(v1, p1)
		
		return
	else
		ReactModule.useEffect(v1, {})
	end
end