local AvatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local Parent = AvatarExperienceSlotBasedEditor.Parent
local SignalsModule = require(Parent.Signals)
local DeviceOrientationMode = require(Parent.RobloxAppEnums).DeviceOrientationMode
local ConstantsModule = require(AvatarExperienceSlotBasedEditor.Constants)
local CategoriesModule = require(AvatarExperienceSlotBasedEditor.Enums.Categories)
local CreateSelectorSignalFunction = require(Parent.AXCommon).Utils.createSelectorSignal
local BuildSlotsModule = require(AvatarExperienceSlotBasedEditor.Utils.buildSlots)
local _ = require(AvatarExperienceSlotBasedEditor.Types)
local FFlagAXSlotsDesktopRedesign = require(Parent.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign

return function(p1)
	-- upvalues: CreateSelectorSignalFunction (copy), DeviceOrientationMode (copy), FFlagAXSlotsDesktopRedesign (copy), CategoriesModule (copy), SignalsModule (copy), BuildSlotsModule (copy), ConstantsModule (copy)
	local SelectorSignal = CreateSelectorSignalFunction(p1, function(p2): boolean
		-- upvalues: DeviceOrientationMode (upval)
		return p2.DeviceOrientation == DeviceOrientationMode.Portrait
	end)
	local Signal, Signal2 = SignalsModule.createSignal(if FFlagAXSlotsDesktopRedesign then if SelectorSignal(false) then CategoriesModule.Avatars else CategoriesModule.All elseif SelectorSignal(false) then CategoriesModule.Avatars else CategoriesModule.Body)
	local Signal1, Signal2_1 = SignalsModule.createSignal(1)
	local SelectorSignal1 = CreateSelectorSignalFunction(p1, function(p2)
		return p2.AvatarExperience.AvatarEditor.Character.EquippedAssets or {}
	end)
	
	return {
		getSlotCategory = Signal,
		setSlotCategory = Signal2,
		getSlotIndex = Signal1,
		setSlotIndex = Signal2_1,
		getSlots = SignalsModule.createComputed(function(p2)
			-- upvalues: BuildSlotsModule (upval), ConstantsModule (upval), Signal (copy), SelectorSignal1 (copy)
			return BuildSlotsModule(ConstantsModule.SlotEditorCategories[Signal(p2)].slots, SelectorSignal1(p2))
		end)
	}
end