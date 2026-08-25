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

return function(p0)
	-- upvalues: createSelectorSignal (ref), deviceOrientationMode (ref), fFlagAXSlotsDesktopRedesign (ref), categoriesModule (ref), signalsModule (ref), buildSlotsModule (ref), constantsModule (ref)
	local var5 = createSelectorSignal(p0, function(p1)
		-- upvalues: deviceOrientationMode (copy)
		return p1.DeviceOrientation == deviceOrientationMode.Portrait
	end)
	local var6, var7 = signalsModule.createSignal(if fFlagAXSlotsDesktopRedesign then if var5(false) then categoriesModule.Avatars else categoriesModule.All elseif var5(false) then categoriesModule.Avatars else categoriesModule.Body)
	local var8, var9 = signalsModule.createSignal(1)
	local var10 = createSelectorSignal(p0, function(p2)
		return p2.AvatarExperience.AvatarEditor.Character.EquippedAssets or {}
	end)
	
	return {
		getSlotCategory = var6,
		setSlotCategory = var7,
		getSlotIndex = var8,
		setSlotIndex = var9,
		getSlots = signalsModule.createComputed(function(p3)
			-- upvalues: buildSlotsModule (copy), constantsModule (copy), var6 (ref), var10 (ref)
			return buildSlotsModule(constantsModule.SlotEditorCategories[var6(p3)].slots, var10(p3))
		end)
	}
end