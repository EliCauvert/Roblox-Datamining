local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local NetworkingPresenceModule = require(AppChat.Http.NetworkingPresence)
local Llama = require(Parent.LuaSocialLibrariesDeps).llama
local UserModel = require(Parent.UserLib).Models.UserModel
local AddUsersFunction = require(Parent.UserLib).Actions.AddUsers
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)

local function extractConversationsAndUsers(List, Users)
	-- upvalues: UserModel (copy), Llama (copy)
	local Ids = {}
	local FromDataTableResults = {}
	
	for _, value in List do
		table.insert(Ids, value.id)
		
		if value.participant_user_ids then
			for _, participantUserId in value.participant_user_ids do
				local Text = tostring(participantUserId)
				
				if not FromDataTableResults[Text] then
					local UserData = value.user_data
					
					if UserData then
						local User = UserData[Text]
						
						if User then
							local User1 = Users[Text]
							local FromDataTableResult = UserModel.fromDataTable({
								id = User.id,
								name = User.name,
								displayName = if User1 then User1.displayName else User.display_name,
								isFriend = if User1 then User1.isFriend else false
							})
							FromDataTableResults[FromDataTableResult.id] = FromDataTableResult
						end
					end
				end
			end
		else
			for _, participant in ipairs(value.participants) do
				if not FromDataTableResults[tostring(participant.targetId)] then
					local User = Users[tostring(participant.targetId)] or UserModel.fromDataTable({
						isFriend = false,
						id = participant.targetId,
						name = participant.name,
						displayName = participant.displayName
					})
					FromDataTableResults[User.id] = User
				end
			end
		end
	end
	return Ids, FromDataTableResults, (Llama.Dictionary.keys(FromDataTableResults))
end

return function(p1)
	-- upvalues: extractConversationsAndUsers (copy), AddUsersFunction (copy), FFlagAppChatPresenceStoreMigrationModule (copy), NetworkingPresenceModule (copy)
	return function(p2)
		-- upvalues: p1 (copy), extractConversationsAndUsers (upval), AddUsersFunction (upval), FFlagAppChatPresenceStoreMigrationModule (upval), NetworkingPresenceModule (upval)
		if not p1 then return end
		local _, ExtractConversationsAndUsersResult2, ExtractConversationsAndUsersResult3 = extractConversationsAndUsers(p1, p2:getState().Users or {})
		p2:dispatch(AddUsersFunction(ExtractConversationsAndUsersResult2))
		
		if not FFlagAppChatPresenceStoreMigrationModule then
			p2:dispatch(NetworkingPresenceModule.GetPresencesFromUserIds.API(ExtractConversationsAndUsersResult3)):catch(function(Err)
				warn("NetworkingPresence failure in processConversations, Status: " .. tostring(Err))
			end)
		end
	end
end