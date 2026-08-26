local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local llamaModule = require(parent_1.llama)
local actions = parent.Actions
local aliasUpdatedModule = require(actions.AliasUpdated)
local aliasRemovedModule = require(actions.AliasRemoved)
local receivedCanShowUserAliasModule = require(actions.ReceivedCanShowUserAlias)
local _ = require(parent.RoduxAliasesTypes)

local function addUserIdsToState(p1, p2)
	-- upvalues: llamaModule (ref)
	return llamaModule.Dictionary.join(p1, p2)
end

local function addUsersIdsToInternalState(p1, p2)
	-- upvalues: llamaModule (ref)
	return llamaModule.Dictionary.join(p1, {
		_INTERNAL_HIDDEN_DATA = llamaModule.Dictionary.join(p1._INTERNAL_HIDDEN_DATA, p2)
	})
end

local t = { ShowUserAlias = true }

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), aliasUpdatedModule (ref), addUserIdsToState (ref), addUsersIdsToInternalState (ref), aliasRemovedModule (ref), llamaModule (ref), receivedCanShowUserAliasModule (ref)
	local aliasNetworking = p1.aliasNetworking
	
	return roduxModule.createReducer(t, {
		[aliasUpdatedModule.name] = function(p2, p3)
			-- upvalues: addUserIdsToState (copy), addUsersIdsToInternalState (copy)
			assert(type(p3.payload.userId) == "string", "Expected userId to be a string")
			assert(type(p3.payload.newAlias) == "string", "Expected newAlias to be a string")
			local t = { [p3.payload.userId] = p3.payload.newAlias }
			
			return if p2.ShowUserAlias or p2.ShowUserAlias == nil then addUserIdsToState(p2, t) else addUsersIdsToInternalState(p2, t)
		end,
		[aliasRemovedModule.name] = function(p2, p3)
			-- upvalues: llamaModule (copy), addUserIdsToState (copy), addUsersIdsToInternalState (copy)
			assert(type(p3.payload.userId) == "string", "Expected userId to be a string")
			local t = { [p3.payload.userId] = llamaModule.None }
			
			return if p2.ShowUserAlias or p2.ShowUserAlias == nil then addUserIdsToState(p2, t) else addUsersIdsToInternalState(p2, t)
		end,
		[receivedCanShowUserAliasModule.name] = function(p2, p3)
			-- upvalues: llamaModule (copy)
			assert(type(p3.payload.showUserAlias) == "boolean", "Expected showUserAlias to be a boolean")
			
			return if p3.payload.showUserAlias == p2.ShowUserAlias then p2 elseif p3.payload.showUserAlias then llamaModule.Dictionary.join(p2._INTERNAL_HIDDEN_DATA or {}, {
				ShowUserAlias = p3.payload.showUserAlias,
				_INTERNAL_HIDDEN_DATA = llamaModule.None
			}) else {
				ShowUserAlias = p3.payload.showUserAlias,
				_INTERNAL_HIDDEN_DATA = llamaModule.Dictionary.join(p2, {
					ShowUserAlias = llamaModule.None,
					_INTERNAL_HIDDEN_DATA = llamaModule.None
				})
			}
		end,
		[aliasNetworking.GetTagsFromUserIds.Succeeded.name] = function(p2, p3)
			-- upvalues: addUserIdsToState (copy), addUsersIdsToInternalState (copy)
			local t = {}
			
			for i, v in ipairs(p3.responseBody) do
				t[tostring(v.targetUserId)] = v.targetUserTag
			end
			return if p2.ShowUserAlias or p2.ShowUserAlias == nil then addUserIdsToState(p2, t) else addUsersIdsToInternalState(p2, t)
		end,
		[aliasNetworking.SetUserTag.Succeeded.name] = function(p4, p5)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p4, {
				[tostring(p5.postBody.targetUserId)] = p5.postBody.userTag
			})
		end
	})
end