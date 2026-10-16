local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoduxModule = require(Parent1.Rodux)
local LlamaModule = require(Parent1.llama)
local RecommendationModule = require(Parent.Models.Recommendation)
local Actions = Parent.Actions
local RecommendationCreatedModule = require(Actions.RecommendationCreated)
local FriendshipCreatedModule = require(Actions.FriendshipCreated)
local RecommendationDestroyedModule = require(Actions.RecommendationDestroyed)
local _ = require(Parent.roduxFriendsTypes)
local t = {}

local function _(p1, p2) --[[ Line: 18 ]]
	-- upvalues: LlamaModule (copy)
	local v1 = p2[p1.baseUserId]
	
	return if v1 then LlamaModule.Dictionary.removeKey(v1, p1.recommendedUserId) else nil
end

local function v12(Payload, p1) --[[ Line: 27 ]]
	-- upvalues: LlamaModule (copy)
	local config = {
		baseUserId = Payload.userId1,
		recommendedUserId = Payload.userId2
	}
	local v1 = p1[config.baseUserId]
	local RemoveKeyResult = if v1 then LlamaModule.Dictionary.removeKey(v1, config.recommendedUserId) else nil
	local config1 = {
		baseUserId = Payload.userId2,
		recommendedUserId = Payload.userId1
	}
	local v2 = p1[config1.baseUserId]
	
	return LlamaModule.Dictionary.join(p1, {
		[Payload.userId1] = RemoveKeyResult,
		[Payload.userId2] = if v2 then LlamaModule.Dictionary.removeKey(v2, config1.recommendedUserId) else nil
	})
end

local _ = function(p1, p2) --[[ Line: 40 ]]
	-- upvalues: LlamaModule (copy), v12 (copy)
	local v1 = p2
	LlamaModule.Dictionary.map(p1.users, function(p3) --[[ Line: 43 ]]
		-- upvalues: v1 (ref), v12 (upval), p1 (copy)
		v1 = v12({ userId1 = p1.baseFriendId, userId2 = tostring(p3.id) }, v1)
	end)
	
	return v1
end

return function(p1) --[[ Line: 53 ]]
	-- upvalues: RoduxModule (copy), t (copy), RecommendationCreatedModule (copy), LlamaModule (copy), RecommendationModule (copy), RecommendationDestroyedModule (copy), FriendshipCreatedModule (copy), v12 (copy)
	local FriendsNetworking = p1.friendsNetworking
	
	return RoduxModule.createReducer(t, {
		[RecommendationCreatedModule.name] = function(p2, p3) --[[ Line: 58 ]]
			-- upvalues: LlamaModule (upval), RecommendationModule (upval)
			local Text = tostring(p3.payload.baseUserId)
			
			return LlamaModule.Dictionary.join(p2, {
				[Text] = LlamaModule.Dictionary.join(p2[Text] or {}, {
					[tostring(p3.payload.recommendedUser.id)] = RecommendationModule.format(p3.payload.recommendedUser)
				})
			})
		end,
		[RecommendationDestroyedModule.name] = function(p2, p3) --[[ Line: 75 ]]
			-- upvalues: LlamaModule (upval)
			local Payload = p3.payload
			local v1 = p2[Payload.baseUserId]
			
			return LlamaModule.Dictionary.join(p2, {
				[p3.payload.baseUserId] = if v1 then LlamaModule.Dictionary.removeKey(v1, Payload.recommendedUserId) else nil
			})
		end,
		[FriendsNetworking.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 84 ]]
			-- upvalues: LlamaModule (upval), RecommendationModule (upval)
			local Text = tostring(p3.namedIds.users)
			
			return LlamaModule.Dictionary.join(p2, {
				[Text] = LlamaModule.Dictionary.join(p2[Text] or {}, (LlamaModule.Dictionary.map(p3.responseBody.data, function(p4, _) --[[ Line: 91 ]]
					-- upvalues: RecommendationModule (upval)
					local ContactId = if p4.contextType == "Contacts" then p4.contactId else tostring(p4.id)
					
					return RecommendationModule.format({
						id = ContactId,
						contactId = p4.contactId,
						mutualFriendsList = p4.mutualFriendsList,
						rank = p4.rank,
						contextType = p4.contextType,
						thumbnailEntities = p4.thumbnailEntities,
						displayName = p4.displayName
					}), ContactId
				end)))
			})
		end,
		[FriendshipCreatedModule.name] = function(p2, p3) --[[ Line: 113 ]]
			-- upvalues: v12 (upval)
			return v12(p3.payload, p2)
		end,
		[FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 120 ]]
			-- upvalues: LlamaModule (upval), v12 (upval)
			local config = {
				baseFriendId = tostring(p3.namedIds.users),
				users = p3.responseBody.data
			}
			local v1 = p2
			LlamaModule.Dictionary.map(config.users, function(p4) --[[ Line: 43 ]]
				-- upvalues: v1 (ref), v12 (upval), config (copy)
				v1 = v12({ userId1 = config.baseFriendId, userId2 = tostring(p4.id) }, v1)
			end)
			
			return v1
		end,
		[FriendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 130 ]]
			-- upvalues: v12 (upval)
			return v12({
				userId1 = tostring(p3.additionalData.currentUserId),
				userId2 = tostring(p3.ids[1])
			}, p2)
		end,
		[p1.networkingBlocking.BlockUserById.Succeeded.name] = function(p2, p3) --[[ Line: 143 ]]
			-- upvalues: v12 (upval)
			return v12({
				userId1 = tostring(p3.additionalData.currentUserId),
				userId2 = tostring(p3.namedIds.users)
			}, p2)
		end
	})
end