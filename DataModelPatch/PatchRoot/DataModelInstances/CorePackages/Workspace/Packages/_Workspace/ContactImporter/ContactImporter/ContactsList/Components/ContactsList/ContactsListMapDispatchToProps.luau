local Parent = script.Parent.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local NetworkingFriends = DependenciesModule.NetworkingFriends
local _ = require(Parent.Common.LocalTypes)
local NetworkingContacts = DependenciesModule.NetworkingContacts
local RoduxContacts = DependenciesModule.RoduxContacts
local Promise = DependenciesModule.Promise
local Llama = DependenciesModule.llama

return function(Callback)
	-- upvalues: NetworkingFriends (copy), NetworkingContacts (copy), Llama (copy), Promise (copy), RoduxContacts (copy)
	return {
		requestFriendship = function(p1)
			-- upvalues: Callback (copy), NetworkingFriends (upval)
			return Callback(NetworkingFriends.RequestFriendshipFromContactId.API(p1))
		end,
		findContacts = function()
			-- upvalues: Callback (copy), NetworkingContacts (upval)
			return Callback(NetworkingContacts.FindContactFriends.API()):andThen(function(Result)
				return Result.responseBody.userContactIds
			end)
		end,
		getContactEntities = function(p1)
			-- upvalues: Llama (upval), Promise (upval), Callback (copy), NetworkingContacts (upval)
			return if Llama.isEmpty(p1) or not p1 then Promise.resolve() else Callback(NetworkingContacts.GetContactEntitiesByContactId.API(p1))
		end,
		uploadContacts = function(p1)
			-- upvalues: Callback (copy), NetworkingContacts (upval)
			return Callback(NetworkingContacts.UploadContactsByUser.API(p1))
		end,
		deviceContactsReceived = function(p1)
			-- upvalues: Callback (copy), RoduxContacts (upval)
			return Callback(RoduxContacts.Actions.DeviceContactsReceived(p1))
		end,
		requestSent = function(Id)
			-- upvalues: Callback (copy), RoduxContacts (upval)
			return Callback(RoduxContacts.Actions.RequestSent({ id = Id }))
		end
	}
end