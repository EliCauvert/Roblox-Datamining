local ShareTargetGame = game:GetService("CoreGui").RobloxGui.Modules.ShareTargetGame
local GetGameIconFunction = require(game:GetService("CorePackages").Workspace.Packages.GameIconRodux).GameIcons.getGameIcon
local GetGameDetailsModule = require(ShareTargetGame.Games.Selectors.getGameDetails)
local BuildConversationModelModule = require(ShareTargetGame.ChatConversations.Models.buildConversationModel)

return function(p1, p2)
	-- upvalues: GetGameIconFunction (copy), GetGameDetailsModule (copy), BuildConversationModelModule (copy)
	local PlaceInfo = p1.ChatAppReducer.PlaceInfos[p2.placeId] or {}
	local Conversations = p1.ChatAppReducer.Conversations
	local AppLoaded = p1.ChatAppReducer.AppLoaded
	local GameThumbnail = ""
	local Name = ""
	
	if PlaceInfo.universeId then
		GameThumbnail = GetGameIconFunction(p1, (tostring(PlaceInfo.universeId)))
		Name = GetGameDetailsModule(p1, (tostring(PlaceInfo.universeId))).name
	end
	local Conversations1 = {}
	
	for i, conversation in pairs(Conversations) do
		Conversations1[i] = BuildConversationModelModule(p1.Users, conversation, p1.ChatAppReducer.Aliases)
	end
	return {
		byBuilderText = "",
		appLoaded = AppLoaded,
		placeInfo = PlaceInfo,
		senderId = p1.LocalUserId,
		conversations = Conversations1,
		gameCreator = PlaceInfo.builder,
		gameThumbnail = GameThumbnail,
		gameName = Name
	}
end