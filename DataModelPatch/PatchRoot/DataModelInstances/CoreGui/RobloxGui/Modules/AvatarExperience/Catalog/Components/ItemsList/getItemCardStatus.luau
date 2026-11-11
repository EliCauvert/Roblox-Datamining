local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogItemCardStatusIconTypeEnum = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum
local ItemTypeEnum = AvatarExperienceCommonModule.Enums.ItemTypeEnum
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Types)
local ItemStatus = AvatarExperienceCommonModule.Enums.ItemStatus
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXDurablesFooter = AvatarExperienceFlagsModule.FFlagAXDurablesFooter
local FFlagAXShowFaeUpsell = AvatarExperienceFlagsModule.FFlagAXShowFaeUpsell

local function getLookStatusFromModerationStatus(Moderated)
	-- upvalues: ConstantsModule (copy)
	return if Moderated == ConstantsModule.ModerationStatus.PendingModeration then { type = "icon", iconType = "PendingModeration" } elseif Moderated == ConstantsModule.ModerationStatus.Moderated then { type = "icon", iconType = "Moderated" } else nil
end

local function showDurableBadge(p1)
	-- upvalues: FFlagAXDurablesFooter (copy), CatalogItemCardStatusIconTypeEnum (copy)
	if FFlagAXDurablesFooter then
		return nil
	end
	if not p1 or not p1.timedOptions then
		return nil
	end
	for _, timedOption in p1.timedOptions do
		if timedOption.selected then
			return {
				type = "badge",
				iconType = CatalogItemCardStatusIconTypeEnum.Durable,
				text = if timedOption.days > 0 then tostring(timedOption.days) else ""
			}
		end
	end
	return {
		type = "badge",
		text = "",
		iconType = CatalogItemCardStatusIconTypeEnum.Durable
	}
end

local function _(p2, p3): boolean
	-- upvalues: ItemStatus (copy)
	return if p2 and p2.itemStatus then table.find(p2.itemStatus, ItemStatus.IsFAE) ~= nil and (if p3 then p3.showFaeUpsell == true and p3.canClaimFaeItem == false else false) else false
end

return function(p2, Look, p3, Text, p4, p5)
	-- upvalues: FFlagAXShowFaeUpsell (copy), ItemStatus (copy), CatalogItemCardStatusIconTypeEnum (copy), ItemTypeEnum (copy), getLookStatusFromModerationStatus (copy), showDurableBadge (copy)
	if p2 then
		return p2
	elseif FFlagAXShowFaeUpsell and (if p4 and p4.itemStatus then table.find(p4.itemStatus, ItemStatus.IsFAE) ~= nil and (if p5 and p5.showFaeUpsell == true then p5.canClaimFaeItem == false else false) else false) then
		return {
			type = "badge",
			iconType = CatalogItemCardStatusIconTypeEnum.FAE
		}
	else
		return if Look == ItemTypeEnum.Look then getLookStatusFromModerationStatus(p3) elseif Text then { type = "text", text = Text } else showDurableBadge(p4)
	end
end