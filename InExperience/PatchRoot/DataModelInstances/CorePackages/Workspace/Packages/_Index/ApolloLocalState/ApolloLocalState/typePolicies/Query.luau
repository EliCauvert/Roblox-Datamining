local parent = script:FindFirstAncestor("ApolloLocalState").Parent
local _ = require(parent.ApolloClient)
local cryoModule = require(parent.Cryo)
local mergeListsWithoutDuplicatesModule = require(script.Parent.utils.mergeListsWithoutDuplicates)

return {
	fields = {
		omniFeedItem = {},
		profilesInsightsByUserIds = {
			read = function(_, _, p0) --[[ line: 12 ]]
				local t = {}
				
				for i, v in pairs(p0.args.userIds) do
					local var3 = p0:toReference({ __typename = "ProfileInsights", targetUserId = v })
					table.insert(t, var3)
					
					if not p0:canRead(var3) then
						return nil
					end
				end
				return t
			end
		},
		userProfiles = {
			read = function(_, _, p1) --[[ line: 34 ]]
				local t = {}
				
				for i, v in p1.args.userIds do
					local var5 = p1:toReference({ __typename = "UserProfile", id = v })
					table.insert(t, var5)
					
					if not p1:canRead(var5) then
						return nil
					end
				end
				return t
			end
		},
		allFriendsByUserId = {
			keyArgs = { "userId", "sort" },
			merge = function(_, p2, p3) --[[ line: 57 ]]
				-- upvalues: mergeListsWithoutDuplicatesModule (ref), cryoModule (ref)
				return if p2 then if p2.nextCursor == p3.curCursor then cryoModule.Dictionary.join(p3, {
					friends = mergeListsWithoutDuplicatesModule(p2 and p2.friends, p3 and p3.friends, "__ref")
				}) else p2 else p3
			end
		},
		onlineFriendsByUserId = {
			keyArgs = { "userId", "sort" },
			read = function(_, p4, p5) --[[ line: 80 ]]
				-- upvalues: cryoModule (ref)
				return p4 and cryoModule.List.filter(p4, function(p6) --[[ line: 85 ]]
					-- upvalues: p5 (ref)
					local userPresenceType = p5:readField("userPresenceType", p5:readField("presence", p6))
					
					return userPresenceType and userPresenceType ~= "Offline"
				end)
			end
		}
	}
}