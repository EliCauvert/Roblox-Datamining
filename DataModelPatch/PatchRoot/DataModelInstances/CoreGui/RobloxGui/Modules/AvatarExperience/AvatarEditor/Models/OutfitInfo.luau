local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GenerateStringIdFunction = require(CorePackages.Workspace.Packages.AppCommonLib).GenerateStringId
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Types)
local AssetMetadataModule = require(Modules.AvatarExperience.Common.Models.AssetMetadata)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local CryoModule = require(CorePackages.Packages.Cryo)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagParseHeadShapeFromAPIResponse = AvatarExperienceFlagsModule.FFlagParseHeadShapeFromAPIResponse
local FFlagAXEnableModeratedItemsFlowForDurables = AvatarExperienceFlagsModule.FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXModeratedItemIconUpdates = AvatarExperienceFlagsModule.FFlagAXModeratedItemIconUpdates
local FFlagAXBackgroundsOutfitPersistence = AvatarExperienceFlagsModule.FFlagAXBackgroundsOutfitPersistence
local InventoryItemAvailability = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability
local OutfitInfoModule = {
	new = function()
		return {}
	end,
	MockPantsAssetId = "123",
	MockHatAssetId = "124"
}

function OutfitInfoModule.mock()
	-- upvalues: OutfitInfoModule (copy), GenerateStringIdFunction (copy), UtilsModule (copy), ConstantsModule (copy)
	local NewOutfitInfo = OutfitInfoModule.new()
	NewOutfitInfo.outfitId = GenerateStringIdFunction()
	NewOutfitInfo.name = ""
	NewOutfitInfo.assets = {
		["66"] = {
			[OutfitInfoModule.MockPantsAssetId] = {
				version = "1",
				order = 2,
				isLayered = true,
				type = Enum.AccessoryType.Jacket
			}
		},
		["8"] = {
			[OutfitInfoModule.MockHatAssetId] = {
				version = "1",
				order = 1,
				isLayered = true,
				type = Enum.AccessoryType.Hat
			}
		}
	}
	NewOutfitInfo.bodyColor3s = {
		headColor3 = UtilsModule.bodyColorToBodyColor3(194),
		leftArmColor3 = UtilsModule.bodyColorToBodyColor3(194),
		leftLegColor3 = UtilsModule.bodyColorToBodyColor3(194),
		rightArmColor3 = UtilsModule.bodyColorToBodyColor3(194),
		rightLegColor3 = UtilsModule.bodyColorToBodyColor3(194),
		torsoColor3 = UtilsModule.bodyColorToBodyColor3(194)
	}
	NewOutfitInfo.scales = {
		height = 0,
		width = 0,
		head = 0,
		depth = 0,
		proportion = 0,
		bodyType = 0
	}
	NewOutfitInfo.avatarType = ConstantsModule.AvatarType.R15
	NewOutfitInfo.isEditable = true
	NewOutfitInfo.updateCounter = 0
	NewOutfitInfo.outfitType = "Avatar"
	
	return NewOutfitInfo
end

function OutfitInfoModule.mockWithData(p1)
	-- upvalues: OutfitInfoModule (copy), CryoModule (copy)
	return (CryoModule.Dictionary.join(OutfitInfoModule.mock(), p1))
end

function OutfitInfoModule.fromWebApi(OutfitId, p1, p2)
	-- upvalues: OutfitInfoModule (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXInventoryDurablesSupport (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), InventoryItemAvailability (copy), FFlagParseHeadShapeFromAPIResponse (copy), AssetMetadataModule (copy), ConstantsModule1 (copy), FFlagAXModeratedItemIconUpdates (copy), UtilsModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), FFlagAXBackgroundsOutfitPersistence (copy)
	local NewOutfitInfo = OutfitInfoModule.new()
	NewOutfitInfo.containsDynamicHead = false
	local Assets = {}
	local Count = if FFlagAXModeratedItemsFlow then 0 else nil
	local Count1 = if FFlagAXInventoryDurablesSupport then 0 else nil
	local Available = if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then InventoryItemAvailability.Available else nil
	
	if p2.assets then
		for _, asset in p2.assets do
			local Text = tostring(asset.assetType.id)
			local Text1 = tostring(asset.id)
			local SupportsHeadShapes = if FFlagParseHeadShapeFromAPIResponse then asset.supportsHeadShapes else nil
			local Asset = Assets[Text] or {}
			Asset[Text1] = AssetMetadataModule.fromMetadata(asset.meta, Text)
			
			if FFlagParseHeadShapeFromAPIResponse then
				Asset[Text1].supportsHeadShapes = SupportsHeadShapes
			end
			if FFlagAXModeratedItemsFlow then
				Asset[Text1].availabilityStatus = asset.availabilityStatus
				
				if asset.availabilityStatus == InventoryItemAvailability.Unavailable or asset.availabilityStatus == InventoryItemAvailability.Revoked then
					Count += 1
				elseif FFlagAXInventoryDurablesSupport and asset.availabilityStatus == InventoryItemAvailability.Expired then
					Count1 += 1
				end
			end
			if FFlagAXEnableModeratedItemsFlowForDurables and not FFlagAXModeratedItemsFlow then
				Asset[Text1].availabilityStatus = asset.availabilityStatus
				
				if FFlagAXInventoryDurablesSupport and asset.availabilityStatus == InventoryItemAvailability.Expired then
					Count1 += 1
				end
			end
			Assets[Text] = Asset
			
			if Text == ConstantsModule1.AssetTypeIdStrings.DynamicHead then
				NewOutfitInfo.containsDynamicHead = true
			end
		end
		if FFlagAXModeratedItemsFlow then
			if Count == #p2.assets and (not FFlagAXModeratedItemIconUpdates or #p2.assets > 0) then
				Available = InventoryItemAvailability.Unavailable
			elseif FFlagAXInventoryDurablesSupport and Count1 == #p2.assets and (not FFlagAXModeratedItemIconUpdates or #p2.assets > 0) then
				Available = InventoryItemAvailability.Expired
			elseif Count > 0 then
				Available = InventoryItemAvailability.PartiallyAvailableWithUnavailableSubitems
			elseif FFlagAXInventoryDurablesSupport and Count1 > 0 then
				Available = InventoryItemAvailability.PartiallyAvailableWithExpiredSubitems
			end
		end
		if FFlagAXEnableModeratedItemsFlowForDurables and not FFlagAXModeratedItemsFlow then
			if FFlagAXInventoryDurablesSupport and Count1 == #p2.assets then
				Available = InventoryItemAvailability.Expired
			elseif FFlagAXInventoryDurablesSupport and Count1 > 0 then
				Available = InventoryItemAvailability.PartiallyAvailableWithExpiredSubitems
			end
		end
	end
	NewOutfitInfo.outfitId = OutfitId
	NewOutfitInfo.name = p2.name
	NewOutfitInfo.assets = Assets
	NewOutfitInfo.bodyColor3s = UtilsModule.convertBodyColor3HexesToColor3s(p2.bodyColor3s)
	NewOutfitInfo.scales = p2.scale
	NewOutfitInfo.avatarType = p2.playerAvatarType
	NewOutfitInfo.isEditable = p2.isEditable
	NewOutfitInfo.outfitType = p2.outfitType
	NewOutfitInfo.inventoryType = if GetFFlagAXEnableSlotBasedEditorModule() then p2.inventoryType else nil
	NewOutfitInfo.creatingUniverseId = if p2.universeId == 0 or p2.universeId == nil then nil else tostring(p2.universeId)
	NewOutfitInfo.moderationStatus = p2.moderationStatus
	NewOutfitInfo.availabilityStatus = if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then Available else nil
	NewOutfitInfo.bundleId = tostring(p2.bundleId)
	
	if FFlagAXBackgroundsOutfitPersistence and p2.profileConfiguration ~= nil then
		NewOutfitInfo.profileConfiguration = {
			BackgroundAssetId = p2.profileConfiguration.backgroundAssetId
		}
	end
	NewOutfitInfo.updateCounter = p1 or 0
	
	return NewOutfitInfo
end

return OutfitInfoModule