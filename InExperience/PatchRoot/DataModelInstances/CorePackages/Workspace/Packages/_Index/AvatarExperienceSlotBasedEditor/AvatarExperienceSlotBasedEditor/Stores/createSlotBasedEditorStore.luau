local avatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local parent = avatarExperienceSlotBasedEditor.Parent
local signalsModule = require(parent.Signals)
local deviceOrientationMode = require(parent.RobloxAppEnums).DeviceOrientationMode
local constantsModule = require(avatarExperienceSlotBasedEditor.Constants)
local categoriesModule = require(avatarExperienceSlotBasedEditor.Enums.Categories)
local createSelectorSignal = require(parent.AXCommon).Utils.createSelectorSignal
local buildSlotsModule = require(avatarExperienceSlotBasedEditor.Utils.buildSlots)
local _ = require(avatarExperienceSlotBasedEditor.Types)
local fFlagAXSlotsDesktopRedesign = require(parent.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign

return function(p1)
	-- upvalues: createSelectorSignal (ref), deviceOrientationMode (ref), fFlagAXSlotsDesktopRedesign (ref), categoriesModule (ref), signalsModule (ref), buildSlotsModule (ref), constantsModule (ref)
	local var1 = createSelectorSignal(p1, function(p2)
		-- upvalues: deviceOrientationMode (copy)
		return p2.DeviceOrientation == deviceOrientationMode.Portrait
	end)
	local var2, var3 = signalsModule.createSignal(if fFlagAXSlotsDesktopRedesign then if var1(false) then categoriesModule.Avatars else categoriesModule.All elseif var1(false) then categoriesModule.Avatars else categoriesModule.Body)
	local var4, var5 = signalsModule.createSignal(1)
	local var6 = createSelectorSignal(p1, function(p2)
		return p2.AvatarExperience.AvatarEditor.Character.EquippedAssets or {}
	end)
	
	return {
		getSlotCategory = var2,
		setSlotCategory = var3,
		getSlotIndex = var4,
		setSlotIndex = var5,
		getSlots = signalsModule.createComputed(function(p2)
			-- upvalues: buildSlotsModule (copy), constantsModule (copy), var2 (ref), var6 (ref)
			return buildSlotsModule(constantsModule.SlotEditorCategories[var2(p2)].slots, var6(p2))
		end)
	}
end