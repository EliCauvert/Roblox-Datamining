local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local Parent = ExperienceStoreServerDrivenUi.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local DataHydrationModule = require(Parent.DataHydration)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GameItemTypeModule = require(ExperienceStoreServerDrivenUi.Utils.GameItemType)
local GetGameItemDetailsUrlModule = require(ExperienceStoreServerDrivenUi.Api.getGameItemDetailsUrl)
local GetGameItemDetailsPageKeyModule = require(ExperienceStoreServerDrivenUi.Utils.getGameItemDetailsPageKey)
local ReportMissingGameItemFieldsModule = require(ExperienceStoreServerDrivenUi.Utils.reportMissingGameItemFields)
local FStringDebugGameItemDetailsMockPageIdentifierModule = require(ExperienceStoreServerDrivenUi.Flags.FStringDebugGameItemDetailsMockPageIdentifier)
local FFlagSduiToggleGamePassVote = require(Parent.SharedFlags).FFlagSduiToggleGamePassVote

local function _(p1, p2)
	-- upvalues: GameItemTypeModule (copy), DataHydrationModule (copy)
	if p1.itemType ~= GameItemTypeModule.GamePass then return end
	local HydrationData = if p2 then p2.hydration_data else nil
	local GamePassVote = if HydrationData then HydrationData.gamePassVote else nil
	
	if GamePassVote == nil or GamePassVote[p1.itemId] == nil then
		DataHydrationModule.Game.getGamePassVoteStore(false).markGamePassVoteUnavailable(p1.itemId)
	end
end

return function(p1, LoadTimer, p2)
	-- upvalues: Parent (copy), GetSduiApiStoreFunction (copy), FStringDebugGameItemDetailsMockPageIdentifierModule (copy), SduiResponseType (copy), GetGameItemDetailsUrlModule (copy), AppPage (copy), GetGameItemDetailsPageKeyModule (copy), ReportMissingGameItemFieldsModule (copy), FFlagSduiToggleGamePassVote (copy), GameItemTypeModule (copy), DataHydrationModule (copy)
	return GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = if FStringDebugGameItemDetailsMockPageIdentifierModule == "" then SduiResponseType.Protobuf else SduiResponseType.ProtobufJson,
		url = GetGameItemDetailsUrlModule(p1),
		surfaceKey = AppPage.GameItemDetails,
		configKey = GetGameItemDetailsPageKeyModule(p1.itemType, p1.itemId),
		loadTimer = LoadTimer,
		apiProto = require(Parent.ServiceContractsProto).apppageplatform.devstore.game_item_details_page.GameItemDetailsPageResponse,
		onSuccess = function(_, p3)
			-- upvalues: ReportMissingGameItemFieldsModule (upval), p1 (copy), FFlagSduiToggleGamePassVote (upval), GameItemTypeModule (upval), DataHydrationModule (upval)
			ReportMissingGameItemFieldsModule(p1, p3)
			
			if FFlagSduiToggleGamePassVote then
				if p1.itemType ~= GameItemTypeModule.GamePass then return end
				local HydrationData = if p3 then p3.hydration_data else nil
				local GamePassVote = if HydrationData then HydrationData.gamePassVote else nil
				
				if GamePassVote == nil or GamePassVote[p1.itemId] == nil then
					DataHydrationModule.Game.getGamePassVoteStore(false).markGamePassVoteUnavailable(p1.itemId)
				end
			end
		end
	}, p2)
end