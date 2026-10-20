local Parent = script:FindFirstAncestor("ApolloLocalState").Parent
local _ = require(Parent.ApolloClient)
local CryoModule = require(Parent.Cryo)
local MergeListsWithoutDuplicatesModule = require(script.Parent.utils.mergeListsWithoutDuplicates)

return {
	fields = {
		omniFeedItem = {},
		profilesInsightsByUserIds = {
			read = function(_, _, p1)
				local List = {}
				
				for _, userId in pairs(p1.args.userIds) do
					local Reference = p1:toReference({ __typename = "ProfileInsights", targetUserId = userId })
					table.insert(List, Reference)
					
					if not p1:canRead(Reference) then
						return nil
					end
				end
				return List
			end
		},
		userProfiles = {
			read = function(_, _, p2)
				local List = {}
				
				for _, userId in p2.args.userIds do
					local Reference = p2:toReference({ __typename = "UserProfile", id = userId })
					table.insert(List, Reference)
					
					if not p2:canRead(Reference) then
						return nil
					end
				end
				return List
			end
		},
		allFriendsByUserId = {
			keyArgs = { "userId", "sort" },
			merge = function(_, p3, p4)
				-- upvalues: MergeListsWithoutDuplicatesModule (copy), CryoModule (copy)
				return if p3 then if p3.nextCursor == p4.curCursor then CryoModule.Dictionary.join(p4, {
					friends = MergeListsWithoutDuplicatesModule(p3 and p3.friends, p4 and p4.friends, "__ref")
				}) else p3 else p4
			end
		},
		onlineFriendsByUserId = {
			keyArgs = { "userId", "sort" },
			read = function(_, p3, p4)
				-- upvalues: CryoModule (copy)
				return if p3 then CryoModule.List.filter(p3, function(p5): boolean
					-- upvalues: p4 (copy)
					local UserPresenceType = p4:readField("userPresenceType", (p4:readField("presence", p5)))
					
					return UserPresenceType and UserPresenceType ~= "Offline"
				end) else p3
			end
		}
	}
}