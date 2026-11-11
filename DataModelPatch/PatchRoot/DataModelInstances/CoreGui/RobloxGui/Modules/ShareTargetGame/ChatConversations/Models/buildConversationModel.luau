local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local FormatAliasFunction = require(script:FindFirstAncestor("ShareTargetGame").dependencies).SocialLibraries.Utils.formatAlias
local ConstantsModule = require(CorePackages.Workspace.Packages.AppChat.Constants)
local FunctionalModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Functional)
local ConversationModule = require(CorePackages.Workspace.Packages.AppChat.Conversation)
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb

return function(p1, p2, p3)
	-- upvalues: Players (copy), FunctionalModule (copy), ConversationModule (copy), FormatAliasFunction (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), ConstantsModule (copy)
	local Text = tostring(Players.LocalPlayer.UserId)
	local FilterResult = FunctionalModule.Filter(p2.participants, function(p4): boolean
		-- upvalues: Text (copy)
		return p4 ~= Text
	end)
	local IsConversationTypeMatch = p2.conversationType == ConversationModule.Type.ONE_TO_ONE_CONVERSATION
	local LastLocation = nil
	local Presence = nil
	local Alias = ""
	
	if IsConversationTypeMatch then
		local v1 = p1[FilterResult[1]]
		
		if v1 then
			Presence = v1.presence
			LastLocation = v1.lastLocation
			local ByUserIdEntry = p3.byUserId[v1.id] or ""
			
			if ByUserIdEntry ~= "" then
				Alias = FormatAliasFunction(ByUserIdEntry)
			end
		end
	end
	local Thumbnails = {}
	
	for _, participant in pairs(p2.participants) do
		if IsConversationTypeMatch and participant ~= Text or not IsConversationTypeMatch then
			table.insert(Thumbnails, (GetStandardSizeAvatarHeadShotRbxthumbFunction(participant)))
		end
	end
	return {
		oneToOne = IsConversationTypeMatch,
		lastUpdated = if p2.lastUpdated then p2.lastUpdated:GetUnixTimestamp() else 0,
		conversationId = p2.id,
		lastLocation = LastLocation,
		presence = Presence,
		presenceImage = IsConversationTypeMatch and ConstantsModule.PresenceIndicatorImagesBySize[ConstantsModule:GetPresenceIndicatorSizeKey(14)][Presence] or "",
		title = p2.title,
		thumbnails = Thumbnails,
		participants = p2.participants,
		alias = Alias
	}
end