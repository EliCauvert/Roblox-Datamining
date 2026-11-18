local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local Parent = ExperienceStoreServerDrivenUi.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local _ = require(ExperienceStoreServerDrivenUi.Utils.GameItemType)
local GetGameItemDetailsUrlModule = require(ExperienceStoreServerDrivenUi.Api.getGameItemDetailsUrl)
local GetGameItemDetailsPageKeyModule = require(ExperienceStoreServerDrivenUi.Utils.getGameItemDetailsPageKey)
local ReportMissingGameItemFieldsModule = require(ExperienceStoreServerDrivenUi.Utils.reportMissingGameItemFields)
local FStringDebugGameItemDetailsMockPageIdentifierModule = require(ExperienceStoreServerDrivenUi.Flags.FStringDebugGameItemDetailsMockPageIdentifier)

return function(p1, LoadTimer, p2)
	-- upvalues: Parent (copy), GetSduiApiStoreFunction (copy), FStringDebugGameItemDetailsMockPageIdentifierModule (copy), SduiResponseType (copy), GetGameItemDetailsUrlModule (copy), AppPage (copy), GetGameItemDetailsPageKeyModule (copy), ReportMissingGameItemFieldsModule (copy)
	return GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = if FStringDebugGameItemDetailsMockPageIdentifierModule == "" then SduiResponseType.Protobuf else SduiResponseType.ProtobufJson,
		url = GetGameItemDetailsUrlModule(p1),
		surfaceKey = AppPage.GameItemDetails,
		configKey = GetGameItemDetailsPageKeyModule(p1.itemType, p1.itemId),
		loadTimer = LoadTimer,
		apiProto = require(Parent.ServiceContractsProto).apppageplatform.devstore.game_item_details_page.GameItemDetailsPageResponse,
		onSuccess = function(_, p3)
			-- upvalues: ReportMissingGameItemFieldsModule (upval), p1 (copy)
			ReportMissingGameItemFieldsModule(p1, p3)
		end
	}, p2)
end