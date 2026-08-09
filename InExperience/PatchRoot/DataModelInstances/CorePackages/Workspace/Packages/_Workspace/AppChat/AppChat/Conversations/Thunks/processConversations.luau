local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local networkingPresenceModule = require(appChat.Http.NetworkingPresence)
local llama = require(parent.LuaSocialLibrariesDeps).llama
local userModel = require(parent.UserLib).Models.UserModel
local addUsers = require(parent.UserLib).Actions.AddUsers

local function extractConversationsAndUsers(p0, p1) --[[ line: 9 ]]
	-- upvalues: userModel (ref), llama (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p0 do
		local v_1
		table.insert(t, v.id)
		
		if not v.participant_user_ids then
			for i_1, v_1 in ipairs(v.participants) do
				if not t_1[tostring(v_1.targetId)] then
					local targetId = p1[tostring(v_1.targetId)] or userModel.fromDataTable({
						isFriend = false,
						id = v_1.targetId,
						name = v_1.name,
						displayName = v_1.displayName
					})
					t_1[targetId.id] = targetId
				end
			end
		end
		for i_1, v_1 in v.participant_user_ids do
			v_1 = tostring(v_1)
			
			if not t_1[v_1] then
				local userData = v.user_data
				
				if userData then
					local var5 = userData[v_1]
					
					if var5 then
						local var6 = p1[v_1]
						local var7 = userModel.fromDataTable({
							id = var5.id,
							name = var5.name,
							displayName = if var6 then var6.displayName else var5.display_name,
							isFriend = if var6 then var6.isFriend else false
						})
						t_1[var7.id] = var7
					end
				end
			end
		end
	end
	return t, t_1, llama.Dictionary.keys(t_1)
end

return function(p2) --[[ line: 62 ]]
	-- upvalues: extractConversationsAndUsers (ref), addUsers (ref), networkingPresenceModule (ref)
	return function(p3) --[[ line: 63 ]]
		-- upvalues: p2 (ref), extractConversationsAndUsers (copy), addUsers (copy), networkingPresenceModule (copy)
		if p2 then
			local _, var9, var10 = extractConversationsAndUsers(p2, p3:getState().Users or {})
			p3:dispatch(addUsers(var9))
			p3:dispatch(networkingPresenceModule.GetPresencesFromUserIds.API(var10)):catch(function(p4) --[[ line: 72 ]]
				warn("NetworkingPresence failure in processConversations, Status: " .. tostring(p4))
			end)
			
			return
		end
	end
end