local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag

local function createSlotInfo(Emotes)
	local t = {}
	
	for _, emote in Emotes do
		local Position = emote.position
		t[Position] = { assetId = tostring(emote.assetId), position = Position }
	end
	return t
end

local function _(p1, p2, p3)
	-- upvalues: CryoModule (copy)
	return CryoModule.Dictionary.join(p1, { [p2] = p3 })
end

local _ = function(p1, p2)
	-- upvalues: CryoModule (copy)
	return CryoModule.Dictionary.join(p1, { [p2] = CryoModule.None })
end

return require(CorePackages.Packages.Rodux).createReducer({ selectedSlot = 1, slotInfo = {} }, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData).name] = function(p1, p2)
		-- upvalues: createSlotInfo (copy), CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { slotInfo = createSlotInfo(p2.avatarData.emotes or {}) })
	end,
	[require(CorePackages.Workspace.Packages.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2)
		-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy), CryoModule (copy)
		return if FFlagAXRootSlotBasedEditorFlag and p2.equipped and next(p2.equipped) ~= nil and p2.equipped.EquippedEmotes then CryoModule.Dictionary.join(p1, { slotInfo = p2.equipped.EquippedEmotes.slotInfo }) else p1
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset).name] = function(p1, p2)
		-- upvalues: ConstantsModule (copy), CryoModule (copy)
		if p2.assetTypeId == ConstantsModule.AssetTypeIdStrings.EmoteAnimation then
			local Slot = p1.slotInfo[p1.selectedSlot]
			local config = { assetId = p2.assetId, position = p1.selectedSlot }
			
			return CryoModule.Dictionary.join(p1, {
				slotInfo = if Slot and Slot.assetId == config.assetId then CryoModule.Dictionary.join(p1.slotInfo, { [p1.selectedSlot] = CryoModule.None }) else CryoModule.Dictionary.join(p1.slotInfo, { [p1.selectedSlot] = config })
			})
		else
			return p1
		end
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetSelectedEmoteSlot).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { selectedSlot = p2.selectedSlot })
	end
})