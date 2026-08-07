-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:05 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local llamaModule = require(parent_1.llama)
local actions = parent.Actions
local aliasUpdatedModule = require(actions.AliasUpdated)
local aliasRemovedModule = require(actions.AliasRemoved)
local receivedCanShowUserAliasModule = require(actions.ReceivedCanShowUserAlias)
local _ = require(parent.RoduxAliasesTypes)

local function addUserIdsToState(p0, p1) --[[ line: 17 ]]
	-- upvalues: llamaModule (ref)
	return llamaModule.Dictionary.join(p0, p1)
end

local function addUsersIdsToInternalState(p2, p3) --[[ line: 21 ]]
	-- upvalues: llamaModule (ref)
	return llamaModule.Dictionary.join(p2, {
		_INTERNAL_HIDDEN_DATA = llamaModule.Dictionary.join(p2._INTERNAL_HIDDEN_DATA, p3)
	})
end

local t = { ShowUserAlias = true }

return function(p4) --[[ line: 33 ]]
	-- upvalues: roduxModule (ref), t (ref), aliasUpdatedModule (ref), addUserIdsToState (ref), addUsersIdsToInternalState (ref), aliasRemovedModule (ref), llamaModule (ref), receivedCanShowUserAliasModule (ref)
	local aliasNetworking = p4.aliasNetworking
	
	return roduxModule.createReducer(t, {
		[aliasUpdatedModule.name] = function(p5, p6) --[[ line: 37 ]]
			-- upvalues: addUserIdsToState (copy), addUsersIdsToInternalState (copy)
			assert(type(p6.payload.userId) == "string", "Expected userId to be a string")
			assert(type(p6.payload.newAlias) == "string", "Expected newAlias to be a string")
			local t = { [p6.payload.userId] = p6.payload.newAlias }
			
			return if p5.ShowUserAlias or p5.ShowUserAlias == nil then addUserIdsToState(p5, t) else addUsersIdsToInternalState(p5, t)
		end,
		[aliasRemovedModule.name] = function(p7, p8) --[[ line: 51 ]]
			-- upvalues: llamaModule (copy), addUserIdsToState (copy), addUsersIdsToInternalState (copy)
			assert(type(p8.payload.userId) == "string", "Expected userId to be a string")
			local t = { [p8.payload.userId] = llamaModule.None }
			
			return if p7.ShowUserAlias or p7.ShowUserAlias == nil then addUserIdsToState(p7, t) else addUsersIdsToInternalState(p7, t)
		end,
		[receivedCanShowUserAliasModule.name] = function(p9, p10) --[[ line: 64 ]]
			-- upvalues: llamaModule (copy)
			assert(type(p10.payload.showUserAlias) == "boolean", "Expected showUserAlias to be a boolean")
			
			return if p10.payload.showUserAlias == p9.ShowUserAlias then p9 elseif p10.payload.showUserAlias then llamaModule.Dictionary.join(p9._INTERNAL_HIDDEN_DATA or {}, {
				ShowUserAlias = p10.payload.showUserAlias,
				_INTERNAL_HIDDEN_DATA = llamaModule.None
			}) else {
				ShowUserAlias = p10.payload.showUserAlias,
				_INTERNAL_HIDDEN_DATA = llamaModule.Dictionary.join(p9, {
					ShowUserAlias = llamaModule.None,
					_INTERNAL_HIDDEN_DATA = llamaModule.None
				})
			}
		end,
		[aliasNetworking.GetTagsFromUserIds.Succeeded.name] = function(p11, p12) --[[ line: 88 ]]
			-- upvalues: addUserIdsToState (copy), addUsersIdsToInternalState (copy)
			local t = {}
			
			for i, v in ipairs(p12.responseBody) do
				t[tostring(v.targetUserId)] = v.targetUserTag
			end
			return if p11.ShowUserAlias or p11.ShowUserAlias == nil then addUserIdsToState(p11, t) else addUsersIdsToInternalState(p11, t)
		end,
		[aliasNetworking.SetUserTag.Succeeded.name] = function(p13, p14) --[[ line: 102 ]]
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p13, {
				[tostring(p14.postBody.targetUserId)] = p14.postBody.userTag
			})
		end
	})
end