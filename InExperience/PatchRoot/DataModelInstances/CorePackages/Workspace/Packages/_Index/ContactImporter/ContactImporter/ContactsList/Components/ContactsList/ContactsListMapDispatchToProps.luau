local parent = script.Parent.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local networkingFriends = dependenciesModule.NetworkingFriends
local _ = require(parent.Common.LocalTypes)
local networkingContacts = dependenciesModule.NetworkingContacts
local roduxContacts = dependenciesModule.RoduxContacts
local promise = dependenciesModule.Promise
local llama = dependenciesModule.llama

return function(p0) --[[ line: 11 ]]
	-- upvalues: networkingFriends (ref), networkingContacts (ref), llama (ref), promise (ref), roduxContacts (ref)
	return {
		requestFriendship = function(p1) --[[ line: 13 ]]
			-- upvalues: p0 (ref), networkingFriends (copy)
			return p0(networkingFriends.RequestFriendshipFromContactId.API(p1))
		end,
		findContacts = function() --[[ line: 16 ]]
			-- upvalues: p0 (ref), networkingContacts (copy)
			return p0(networkingContacts.FindContactFriends.API()):andThen(function(p2) --[[ line: 17 ]]
				return p2.responseBody.userContactIds
			end)
		end,
		getContactEntities = function(p3) --[[ line: 21 ]]
			-- upvalues: llama (copy), promise (copy), p0 (ref), networkingContacts (copy)
			return if llama.isEmpty(p3) or not p3 then promise.resolve() else p0(networkingContacts.GetContactEntitiesByContactId.API(p3))
		end,
		uploadContacts = function(p4) --[[ line: 28 ]]
			-- upvalues: p0 (ref), networkingContacts (copy)
			return p0(networkingContacts.UploadContactsByUser.API(p4))
		end,
		deviceContactsReceived = function(p5) --[[ line: 31 ]]
			-- upvalues: p0 (ref), roduxContacts (copy)
			return p0(roduxContacts.Actions.DeviceContactsReceived(p5))
		end,
		requestSent = function(p6) --[[ line: 34 ]]
			-- upvalues: p0 (ref), roduxContacts (copy)
			return p0(roduxContacts.Actions.RequestSent({ id = p6 }))
		end
	}
end