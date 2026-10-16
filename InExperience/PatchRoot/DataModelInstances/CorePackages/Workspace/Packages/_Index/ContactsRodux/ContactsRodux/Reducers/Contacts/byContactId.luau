local Parent = script.Parent.Parent.Parent
local Types = Parent.Types
local RoduxModule = require(Parent.Parent.Rodux)
local SetContactsInStoreModule = require(script.Parent.utils.setContactsInStore)
local UpdateContactsInStoreModule = require(script.Parent.utils.updateContactsInStore)
local _ = require(Types.ActionTypes)
local _ = require(Types.ReducerTypes)
local t = {}

return function(p1) --[[ Line: 13 ]]
	-- upvalues: RoduxModule (copy), t (copy), SetContactsInStoreModule (copy), UpdateContactsInStoreModule (copy)
	local NetworkingContacts = p1.networkingContacts
	
	return RoduxModule.createReducer(t, {
		[NetworkingContacts.FindContactFriends.Succeeded.name] = function(_, p2) --[[ Line: 17 ]]
			-- upvalues: SetContactsInStoreModule (upval)
			return SetContactsInStoreModule(p2)
		end,
		[NetworkingContacts.GetContactEntitiesByContactId.Succeeded.name] = function(p2, p3) --[[ Line: 27 ]]
			-- upvalues: UpdateContactsInStoreModule (upval)
			return UpdateContactsInStoreModule(p2, p3)
		end
	})
end