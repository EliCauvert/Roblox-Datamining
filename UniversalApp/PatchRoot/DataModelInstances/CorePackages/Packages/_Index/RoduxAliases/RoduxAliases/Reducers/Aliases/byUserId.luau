local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoduxModule = require(Parent1.Rodux)
local LlamaModule = require(Parent1.llama)
local Actions = Parent.Actions
local AliasUpdatedModule = require(Actions.AliasUpdated)
local AliasRemovedModule = require(Actions.AliasRemoved)
local ReceivedCanShowUserAliasModule = require(Actions.ReceivedCanShowUserAlias)
local _ = require(Parent.RoduxAliasesTypes)

local function addUserIdsToState(p1, TargetUserTags) --[[ Line: 17 ]]
	-- upvalues: LlamaModule (copy)
	return LlamaModule.Dictionary.join(p1, TargetUserTags)
end

local function addUsersIdsToInternalState(p1, TargetUserTags) --[[ Line: 21 ]]
	-- upvalues: LlamaModule (copy)
	return LlamaModule.Dictionary.join(p1, {
		_INTERNAL_HIDDEN_DATA = LlamaModule.Dictionary.join(p1._INTERNAL_HIDDEN_DATA, TargetUserTags)
	})
end

local config = { ShowUserAlias = true }

return function(p1) --[[ Line: 33 ]]
	-- upvalues: RoduxModule (copy), config (copy), AliasUpdatedModule (copy), addUserIdsToState (copy), addUsersIdsToInternalState (copy), AliasRemovedModule (copy), LlamaModule (copy), ReceivedCanShowUserAliasModule (copy)
	local AliasNetworking = p1.aliasNetworking
	
	return RoduxModule.createReducer(config, {
		[AliasUpdatedModule.name] = function(p2, p3) --[[ Line: 37 ]]
			-- upvalues: addUserIdsToState (upval), addUsersIdsToInternalState (upval)
			assert(type(p3.payload.userId) == "string", "Expected userId to be a string")
			assert(type(p3.payload.newAlias) == "string", "Expected newAlias to be a string")
			local config = { [p3.payload.userId] = p3.payload.newAlias }
			
			return if p2.ShowUserAlias or p2.ShowUserAlias == nil then addUserIdsToState(p2, config) else addUsersIdsToInternalState(p2, config)
		end,
		[AliasRemovedModule.name] = function(p2, p3) --[[ Line: 51 ]]
			-- upvalues: LlamaModule (upval), addUserIdsToState (upval), addUsersIdsToInternalState (upval)
			assert(type(p3.payload.userId) == "string", "Expected userId to be a string")
			local config = { [p3.payload.userId] = LlamaModule.None }
			
			return if p2.ShowUserAlias or p2.ShowUserAlias == nil then addUserIdsToState(p2, config) else addUsersIdsToInternalState(p2, config)
		end,
		[ReceivedCanShowUserAliasModule.name] = function(p2, p3) --[[ Line: 64 ]]
			-- upvalues: LlamaModule (upval)
			assert(type(p3.payload.showUserAlias) == "boolean", "Expected showUserAlias to be a boolean")
			
			return if p3.payload.showUserAlias == p2.ShowUserAlias then p2 elseif p3.payload.showUserAlias then LlamaModule.Dictionary.join(p2._INTERNAL_HIDDEN_DATA or {}, {
				ShowUserAlias = p3.payload.showUserAlias,
				_INTERNAL_HIDDEN_DATA = LlamaModule.None
			}) else {
				ShowUserAlias = p3.payload.showUserAlias,
				_INTERNAL_HIDDEN_DATA = LlamaModule.Dictionary.join(p2, {
					ShowUserAlias = LlamaModule.None,
					_INTERNAL_HIDDEN_DATA = LlamaModule.None
				})
			}
		end,
		[AliasNetworking.GetTagsFromUserIds.Succeeded.name] = function(p2, p3) --[[ Line: 88 ]]
			-- upvalues: addUserIdsToState (upval), addUsersIdsToInternalState (upval)
			local TargetUserTags = {}
			
			for _, value in ipairs(p3.responseBody) do
				TargetUserTags[tostring(value.targetUserId)] = value.targetUserTag
			end
			return if p2.ShowUserAlias or p2.ShowUserAlias == nil then addUserIdsToState(p2, TargetUserTags) else addUsersIdsToInternalState(p2, TargetUserTags)
		end,
		[AliasNetworking.SetUserTag.Succeeded.name] = function(p4, p5) --[[ Line: 102 ]]
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p4, {
				[tostring(p5.postBody.targetUserId)] = p5.postBody.userTag
			})
		end
	})
end