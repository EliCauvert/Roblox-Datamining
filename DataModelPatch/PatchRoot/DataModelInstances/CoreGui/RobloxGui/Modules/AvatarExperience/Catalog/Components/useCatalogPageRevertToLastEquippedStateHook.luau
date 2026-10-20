local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local TutilsModule = require(CorePackages.Packages.tutils)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local SelectEquippedAssets = AvatarExperienceCommonModule.State.Selectors.selectEquippedAssets
local SelectTryOnItems = AvatarExperienceCommonModule.State.Selectors.selectTryOnItems
local AvatarLastEquippedStateStore = AvatarExperienceCommonModule.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore
local EquipOutfitModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarEditor.Actions.EquipOutfit)

return function()
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), UseSelectorFunction (copy), SelectEquippedAssets (copy), TutilsModule (copy), SelectTryOnItems (copy), AvatarLastEquippedStateStore (copy), CryoModule (copy), EquipOutfitModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = ReactModule.useRef({})
	local UseSelectorResult = UseSelectorFunction(SelectEquippedAssets, TutilsModule.deepEqual)
	local UseSelectorResult1 = UseSelectorFunction(SelectTryOnItems)
	ReactModule.useEffect(function()
		-- upvalues: AvatarLastEquippedStateStore (upval), CryoModule (upval), UseSelectorResult1 (copy), UseRefResult (copy), UseDispatchResult (copy), EquipOutfitModule (upval)
		if AvatarLastEquippedStateStore.getChangedLayeredMakeupSorting() and #CryoModule.Dictionary.keys(UseSelectorResult1) == 0 and #CryoModule.Dictionary.keys(UseRefResult.current) > 0 and AvatarLastEquippedStateStore.getShouldRevertLastEquippedState() and AvatarLastEquippedStateStore.getAvatarLastEquippedState() then
			AvatarLastEquippedStateStore.setChangedLayeredMakeupSorting(false)
			UseDispatchResult(EquipOutfitModule(AvatarLastEquippedStateStore.getAvatarLastEquippedState(), true))
		end
		if not AvatarLastEquippedStateStore.getShouldRevertLastEquippedState() and #CryoModule.Dictionary.keys(UseSelectorResult1) == 0 and #CryoModule.Dictionary.keys(UseRefResult.current) > 0 then
			AvatarLastEquippedStateStore.setShouldRevertLastEquippedState(true)
			AvatarLastEquippedStateStore.setChangedLayeredMakeupSorting(false)
		end
	end, { UseSelectorResult, UseSelectorResult1, UseDispatchResult })
	ReactModule.useEffect(function()
		-- upvalues: AvatarLastEquippedStateStore (upval), CryoModule (upval), UseSelectorResult1 (copy), UseSelectorResult (copy)
		if not AvatarLastEquippedStateStore.getChangedLayeredMakeupSorting() and #CryoModule.Dictionary.keys(UseSelectorResult1) == 0 then
			AvatarLastEquippedStateStore.setAvatarLastEquippedState(UseSelectorResult)
		end
	end, { UseSelectorResult, UseSelectorResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseSelectorResult1 (copy)
		UseRefResult.current = UseSelectorResult1
	end, { UseSelectorResult1 })
end