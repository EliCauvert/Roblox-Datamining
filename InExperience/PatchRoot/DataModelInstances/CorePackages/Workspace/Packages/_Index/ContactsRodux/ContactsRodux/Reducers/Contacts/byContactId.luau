local parent = script.Parent.Parent.Parent
local types = parent.Types
local roduxModule = require(parent.Parent.Rodux)
local setContactsInStoreModule = require(script.Parent.utils.setContactsInStore)
local updateContactsInStoreModule = require(script.Parent.utils.updateContactsInStore)
local _ = require(types.ActionTypes)
local _ = require(types.ReducerTypes)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), setContactsInStoreModule (ref), updateContactsInStoreModule (ref)
	local networkingContacts = p1.networkingContacts
	
	return roduxModule.createReducer(t, {
		[networkingContacts.FindContactFriends.Succeeded.name] = function(_, p2)
			-- upvalues: setContactsInStoreModule (copy)
			return setContactsInStoreModule(p2)
		end,
		[networkingContacts.GetContactEntitiesByContactId.Succeeded.name] = function(p2, p3)
			-- upvalues: updateContactsInStoreModule (copy)
			return updateContactsInStoreModule(p2, p3)
		end
	})
end