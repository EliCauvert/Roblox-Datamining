local parent = script:FindFirstAncestor("ApolloLocalState").Parent
local _ = require(parent.ApolloClient)
local cryoModule = require(parent.Cryo)
local mergeListsWithoutDuplicatesModule = require(script.Parent.utils.mergeListsWithoutDuplicates)

return {
	fields = {
		omniFeedItem = {},
		profilesInsightsByUserIds = {
			read = function(_, _, p1)
				local t = {}
				
				for i, v in pairs(p1.args.userIds) do
					local var1 = p1:toReference({ __typename = "ProfileInsights", targetUserId = v })
					table.insert(t, var1)
					
					if not p1:canRead(var1) then
						return nil
					end
				end
				return t
			end
		},
		userProfiles = {
			read = function(_, _, p2)
				local t = {}
				
				for i, v in p2.args.userIds do
					local var2 = p2:toReference({ __typename = "UserProfile", id = v })
					table.insert(t, var2)
					
					if not p2:canRead(var2) then
						return nil
					end
				end
				return t
			end
		},
		allFriendsByUserId = {
			keyArgs = { "userId", "sort" },
			merge = function(_, p3, p4)
				-- upvalues: mergeListsWithoutDuplicatesModule (ref), cryoModule (ref)
				return if p3 then if p3.nextCursor == p4.curCursor then cryoModule.Dictionary.join(p4, {
					friends = mergeListsWithoutDuplicatesModule(p3 and p3.friends, p4 and p4.friends, "__ref")
				}) else p3 else p4
			end
		},
		onlineFriendsByUserId = {
			keyArgs = { "userId", "sort" },
			read = function(_, p3, p4)
				-- upvalues: cryoModule (ref)
				return p3 and cryoModule.List.filter(p3, function(p5)
					-- upvalues: p4 (ref)
					local userPresenceType = p4:readField("userPresenceType", p4:readField("presence", p5))
					
					return userPresenceType and userPresenceType ~= "Offline"
				end)
			end
		}
	}
}