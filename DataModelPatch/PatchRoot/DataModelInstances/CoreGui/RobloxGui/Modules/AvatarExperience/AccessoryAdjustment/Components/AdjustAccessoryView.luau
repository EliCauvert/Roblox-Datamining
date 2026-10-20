local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local InsertService = game:GetService("InsertService")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseAdjustmentDataCallbacksContextModule = require(Modules.AvatarExperience.Common.Context.AdjustmentData.useAdjustmentDataCallbacksContext)
local UseAppliedDescriptionValueContextModule = require(Modules.AvatarExperience.Common.Context.AppliedDescription.useAppliedDescriptionValueContext)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local SelectLowerAdjustmentLimitsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Selectors.selectLowerAdjustmentLimits)
local SelectUpperAdjustmentLimitsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Selectors.selectUpperAdjustmentLimits)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local GimbalUtilsModule = require(Modules.AvatarExperience.AccessoryAdjustment.GimbalUtils)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local ConstantsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Constants)
local AccessoryAdjustmentUtilsModule = require(Modules.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils)
local SceneInteractionFrameModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneInteractionFrame)
local SetAdjustmentTypeModule = require(Modules.AvatarExperience.AccessoryAdjustment.Actions.SetAdjustmentType)
local BoundInputsUpdaterModule = require(Modules.AvatarExperience.Common.Components.BoundInputsUpdater)
local ControlPanelModule = require(Modules.AvatarExperience.AccessoryAdjustment.Components.ControlPanel)
local AccessoryAdjustmentResetButtonModule = require(Modules.AvatarExperience.AccessoryAdjustment.Components.AccessoryAdjustmentResetButton)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local SetCurrentToastMessageFunction = require(CorePackages.Workspace.Packages.ToastRodux).Actions.SetCurrentToastMessage
local ToastType = require(CorePackages.Workspace.Packages.ToastRodux).Enums.ToastType
local AnalyticsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Services.Analytics)
local SendRefinementAnalyticsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Thunks.SendRefinementAnalytics)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local FFlagAvatarJointUpgradeInUA = SharedFlagsModule.FFlagAvatarJointUpgradeInUA
local SceneGamepadHandlerModule = if SharedFlagsModule.FFlagAXMigrateSceneGamepadHandlerInputBindings then require(Modules.AvatarExperience.Common.Components.Scene.SceneGamepadHandler) else require(Modules.AvatarExperience.Common.Components.Scene.SceneGamepadHandler_DEPRECATED)
local FlaggedMutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).flaggedMutedError
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AdjustmentTypeModule = require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FFlagAXMoveResetButtonToControlPanelModule = require(Modules.AvatarExperience.Flags.FFlagAXMoveResetButtonToControlPanel)
local AXEnableAccessoryAdjustmentDuringTryOnIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP
local FFlagAXMigrateAdjustAccessoryViewToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAdjustAccessoryViewToFocusNavigation
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local config = {
	toastMessage = "Feature.Avatar.Generic.Error",
	isLocalized = false,
	toastType = ToastType.InformationMessage
}
local config1 = {
	toastMessage = "Feature.Avatar.Label.AccessoryCannotBeAdjustedWarning",
	isLocalized = false,
	toastType = ToastType.InformationMessage
}
local config2 = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.ButtonY] = FocusNavigationEventNameEnum.AdjustAccessoryViewReset
}

local function useFocusNavigationBindings(p1, Callback, UseResult)
	-- upvalues: ReactFocusNavigationModule (copy), config2 (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy), UseResult (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: Callback (upval)
					p2.cancelled = true
					Callback()
				end)
			},
			[FocusNavigationEventNameEnum.AdjustAccessoryViewReset] = { handler = InputHandlersModule.onRelease(UseResult) }
		}
	end, { Callback, UseResult }), (ReactFocusNavigationModule.useEventMap(config2, p1)))
end

local function mapTokens(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return {
		smallIconSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Semantic.Icon.Size.Small,
		buttonSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_800 else p1.Global.Size_400,
		portraitPadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_200 else p1.Global.Size_100,
		landscapePadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_300 else p1.Global.Size_150,
		sidePadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_300 else p1.Global.Size_150,
		cornerRadius = if FFlagRenameDeprecatedUIBloxTokens then p1.Radius.Medium else p1.Semantic.Radius.Medium,
		panelMargin = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_900 else p1.Global.Size_450
	}
end

local function selectAdjustmentTypeSelected(p1)
	return p1.AvatarExperience.AccessoryAdjustment.AdjustmentTypeSelected
end

local function selectTopBarHeight(p1)
	return p1.TopBar.topBarHeight
end

local function selectSelectedAccessory(p1)
	return p1.AvatarExperience.AccessoryAdjustment.SelectedAccessory
end

local function selectEquippedAssets(p1)
	return p1.AvatarExperience.AvatarEditor.Character.EquippedAssets
end

local function selectTryOns(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)((require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAppRoute)(function(p1)
	-- upvalues: UseDesignTokensFunction (copy), mapTokens (copy), UseDispatchFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), UseAdjustmentDataCallbacksContextModule (copy), UseAppliedDescriptionValueContextModule (copy), UseSelectorFunction (copy), selectSelectedAccessory (copy), selectEquippedAssets (copy), selectTryOns (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), ReactModule (copy), SelectLowerAdjustmentLimitsModule (copy), SelectUpperAdjustmentLimitsModule (copy), UseLocalizationFunction (copy), AXEnableAccessoryAdjustmentDuringTryOnIXP (copy), AccessoryAdjustmentUtilsModule (copy), CryoModule (copy), UtilsModule (copy), FlaggedMutedErrorFunction (copy), selectAdjustmentTypeSelected (copy), selectTopBarHeight (copy), IxpUtilsModule (copy), UseNavigationFunction (copy), AvatarScreen (copy), SendRefinementAnalyticsModule (copy), ConstantsModule (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), InsertService (copy), SetAdjustmentTypeModule (copy), AdjustmentTypeModule (copy), SetCurrentToastMessageFunction (copy), config (copy), FFlagAvatarJointUpgradeInUA (copy), config1 (copy), GimbalUtilsModule (copy), GamepadFocusHandlerForPageModule (copy), TopBarModule (copy), FFlagAXMigrateAdjustAccessoryViewToFocusNavigation (copy), SceneInteractionFrameModule (copy), FFlagAXMoveResetButtonToControlPanelModule (copy), AccessoryAdjustmentResetButtonModule (copy), ControlPanelModule (copy), Focusable (copy), SceneGamepadHandlerModule (copy), BoundInputsUpdaterModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	local UseDispatchResult = UseDispatchFunction()
	local UseRootFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useRootFocusController()
	local UseAdjustmentDataCallbacksContextModuleResult = UseAdjustmentDataCallbacksContextModule()
	local UseAppliedDescriptionValueContextModuleResult = UseAppliedDescriptionValueContextModule()
	local Value = UseAppliedDescriptionValueContextModuleResult.appliedDescriptionBinding:getValue()
	local UseSelectorResult = UseSelectorFunction(selectSelectedAccessory)
	assert(UseSelectorResult, "Assert selectedAccessory exists")
	local UseSelectorResult1 = UseSelectorFunction(selectEquippedAssets)
	local UseSelectorResult2 = UseSelectorFunction(selectTryOns)
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseRefResult = ReactModule.useRef(false)
	local UseSelectorResult3 = UseSelectorFunction(SelectLowerAdjustmentLimitsModule)
	local UseSelectorResult4 = UseSelectorFunction(SelectUpperAdjustmentLimitsModule)
	local UseLocalizationResult = UseLocalizationFunction({
		apply = "CommonUI.Messages.Action.Apply",
		topBarTitle = if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then "Feature.Avatar.Heading.AccessoryAdjustmentTitle" else nil
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(AccessoryAdjustmentUtilsModule.getSliderValuesWithDefault(UseSelectorResult1, UseSelectorResult2, UseSelectorResult))
	local UseRefResult1 = ReactModule.useRef(AccessoryAdjustmentUtilsModule.getSliderValuesWithDefault(UseSelectorResult1, UseSelectorResult2, UseSelectorResult))
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseStateResult (copy)
		UseRefResult1.current = UseStateResult
	end, { UseStateResult })
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: CryoModule (upval), UseRefResult1 (copy), UseStateResult2 (copy)
		UseStateResult2((CryoModule.Dictionary.join(UseRefResult1.current, { [p3] = p2 })))
	end, { UseRefResult1 })
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: CryoModule (upval), UseRefResult1 (copy), AccessoryAdjustmentUtilsModule (upval), UseAdjustmentDataCallbacksContextModuleResult (copy)
		local SliderInfoToVector3sResult, SliderInfoToVector3sResult2, SliderInfoToVector3sResult3 = AccessoryAdjustmentUtilsModule.sliderInfoToVector3s((CryoModule.Dictionary.join(UseRefResult1.current, { [p3] = p2 })))
		UseAdjustmentDataCallbacksContextModuleResult.setAdjustments(SliderInfoToVector3sResult, SliderInfoToVector3sResult2, SliderInfoToVector3sResult3)
	end, { UseRefResult1 })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local SelectedAccessoryDescription = nil
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseAppliedDescriptionValueContextModuleResult (copy), UseSelectorResult (copy), SelectedAccessoryDescription (ref), UtilsModule (upval), UseStateResult2_2 (copy), FlaggedMutedErrorFunction (upval)
		local Value = UseAppliedDescriptionValueContextModuleResult.appliedDescriptionBinding:getValue()
		
		if Value and UseSelectorResult then
			SelectedAccessoryDescription = UtilsModule.getSelectedAccessoryDescription(Value, UseSelectorResult)
			
			if SelectedAccessoryDescription then
				local Success, Result = pcall(function()
					-- upvalues: SelectedAccessoryDescription (upval)
					return SelectedAccessoryDescription:GetAppliedInstance()
				end)
				
				if Success then
					UseStateResult2_2(Result)
					
					return
				end
				FlaggedMutedErrorFunction("AdjustAccessoryView", "AdjustAccessoryView accessoryDescription:GetAppliedInstance error: " .. tostring(Result))
			end
		end
	end, { Value, UseSelectorResult })
	local UseSelectorResult5 = UseSelectorFunction(selectAdjustmentTypeSelected)
	local UseSelectorResult6 = UseSelectorFunction(selectTopBarHeight)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(nil)
	local TestVariable = if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXEnableAccessoryAdjustmentDuringTryOnIXP.EnabledForUser) else nil
	local Params = if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then UseNavigationFunction().state.params else nil
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: AccessoryAdjustmentUtilsModule (upval), UseSelectorResult1 (copy), UseSelectorResult2 (copy), UseSelectorResult (copy), UseRefResult1 (copy), p1 (copy), AvatarScreen (upval), UseAdjustmentDataCallbacksContextModuleResult (copy), TestVariable (copy), Params (copy)
		local SliderValuesWithDefault = AccessoryAdjustmentUtilsModule.getSliderValuesWithDefault(UseSelectorResult1, UseSelectorResult2, UseSelectorResult)
		
		if AccessoryAdjustmentUtilsModule.checkSliderValuesChanged(UseRefResult1.current, SliderValuesWithDefault) then
			p1.navigation.navigate(AvatarScreen.AccessoryAdjustmentUnsavedPrompt, {
				exitCallback = function()
					-- upvalues: AccessoryAdjustmentUtilsModule (upval), SliderValuesWithDefault (copy), UseAdjustmentDataCallbacksContextModuleResult (upval), TestVariable (upval), Params (upval), p1 (upval)
					local SliderInfoToVector3sResult, SliderInfoToVector3sResult2, SliderInfoToVector3sResult3 = AccessoryAdjustmentUtilsModule.sliderInfoToVector3s(SliderValuesWithDefault)
					UseAdjustmentDataCallbacksContextModuleResult.setAdjustments(SliderInfoToVector3sResult, SliderInfoToVector3sResult2, SliderInfoToVector3sResult3)
					
					if TestVariable and Params and Params.fromRoute then
						p1.navigation.popToTop()
						p1.navigation.navigate(Params.fromRoute)
						
						return
					else
						p1.navigation.pop()
					end
				end
			})
			
			return
		end
		if TestVariable and Params and Params.fromRoute then
			p1.navigation.popToTop()
			p1.navigation.navigate(Params.fromRoute)
			
			return
		else
			p1.navigation.pop()
		end
	end, {
		UseSelectorResult1,
		UseSelectorResult2,
		UseSelectorResult,
		UseAdjustmentDataCallbacksContextModuleResult,
		p1.navigation
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), AvatarScreen (upval), UseDispatchResult (copy), SendRefinementAnalyticsModule (upval), UseRoactServiceModuleResult (copy), AccessoryAdjustmentUtilsModule (upval), ConstantsModule (upval), UseAdjustmentDataCallbacksContextModuleResult (copy), UseStateResult2 (copy)
		p1.navigation.navigate(AvatarScreen.AccessoryAdjustmentResetPrompt, {
			resetCallback = function()
				-- upvalues: UseDispatchResult (upval), SendRefinementAnalyticsModule (upval), UseRoactServiceModuleResult (upval), AccessoryAdjustmentUtilsModule (upval), ConstantsModule (upval), UseAdjustmentDataCallbacksContextModuleResult (upval), UseStateResult2 (upval)
				UseDispatchResult(SendRefinementAnalyticsModule(UseRoactServiceModuleResult.avatarRefineAccessoryResetConfirm))
				local SliderInfoToVector3sResult, SliderInfoToVector3sResult2, SliderInfoToVector3sResult3 = AccessoryAdjustmentUtilsModule.sliderInfoToVector3s(ConstantsModule.DefaultSliderValues)
				UseAdjustmentDataCallbacksContextModuleResult.setAdjustments(SliderInfoToVector3sResult, SliderInfoToVector3sResult2, SliderInfoToVector3sResult3)
				UseStateResult2(ConstantsModule.DefaultSliderValues)
			end
		})
	end, {
		p1.navigation,
		UseAdjustmentDataCallbacksContextModuleResult,
		UseStateResult2,
		UseRoactServiceModuleResult
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: RoactGamepadModule (upval), UseResult2 (copy), UseResult3 (copy)
		return {
			Back = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, UseResult2),
			OpenResetPrompt = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonY, UseResult3, { key = "CommonUI.Messages.Action.Reset" })
		}
	end, { UseResult2, UseResult3 })
	local UseTableWrappedCallbackRefResult = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(nil, UseResult2, UseResult3)))
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_3 (copy), InsertService (upval), UseDispatchResult (copy), SetAdjustmentTypeModule (upval), AdjustmentTypeModule (upval), UseStateResult4 (copy), UseRefResult (copy), AccessoryAdjustmentUtilsModule (upval), UseSelectorResult1 (copy), UseSelectorResult2 (copy), UseSelectorResult (copy), UseAdjustmentDataCallbacksContextModuleResult (copy)
		UseStateResult2_3(InsertService:LoadLocalAsset("rbxasset://models/AccessoryAdjustment/Ring.rbxm"))
		
		return function()
			-- upvalues: UseDispatchResult (upval), SetAdjustmentTypeModule (upval), AdjustmentTypeModule (upval), UseStateResult4 (upval), UseRefResult (upval), AccessoryAdjustmentUtilsModule (upval), UseSelectorResult1 (upval), UseSelectorResult2 (upval), UseSelectorResult (upval), UseAdjustmentDataCallbacksContextModuleResult (upval)
			UseDispatchResult(SetAdjustmentTypeModule(AdjustmentTypeModule.Position))
			
			if UseStateResult4 then
				UseStateResult4:Destroy()
			end
			if not UseRefResult.current then
				local SliderInfoToVector3sResult, SliderInfoToVector3sResult2, SliderInfoToVector3sResult3 = AccessoryAdjustmentUtilsModule.sliderInfoToVector3s((AccessoryAdjustmentUtilsModule.getSliderValuesWithDefault(UseSelectorResult1, UseSelectorResult2, UseSelectorResult)))
				UseAdjustmentDataCallbacksContextModuleResult.setAdjustments(SliderInfoToVector3sResult, SliderInfoToVector3sResult2, SliderInfoToVector3sResult3)
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult4 (copy), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), UseStateResult2_1 (copy), p1 (copy), UseStateResult3 (copy), config (upval), FFlagAvatarJointUpgradeInUA (upval), UtilsModule (upval), config1 (upval), GimbalUtilsModule (upval), UseSelectorResult5 (copy), AdjustmentTypeModule (upval), UseDesignTokensResult (copy), UseSelectorResult3 (copy), UseSelectorResult4 (copy)
		if not UseStateResult4 then return end
		local function _(p2)
			-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), UseStateResult2_1 (upval), p1 (upval)
			UseDispatchResult(SetCurrentToastMessageFunction(p2))
			UseStateResult2_1(false)
			p1.navigation.pop()
		end
		
		if not UseStateResult3 then
			UseDispatchResult(SetCurrentToastMessageFunction(config))
			UseStateResult2_1(false)
			p1.navigation.pop()
			
			return
		end
		local Handle = UseStateResult3:FindFirstChild("Handle")
		
		if not Handle then
			UseDispatchResult(SetCurrentToastMessageFunction(config))
			UseStateResult2_1(false)
			p1.navigation.pop()
			
			return
		end
		local BasePart = nil
		local BasePart1 = nil
		local C1 = nil
		local Weld = Handle:FindFirstChildOfClass("Weld")
		local RigidConstraint = if FFlagAvatarJointUpgradeInUA then Handle:FindFirstChildOfClass("RigidConstraint") else nil
		
		if FFlagAvatarJointUpgradeInUA then
			if RigidConstraint then
				BasePart = if RigidConstraint.Attachment0 then RigidConstraint.Attachment0:FindFirstAncestorWhichIsA("BasePart") else nil
				BasePart1 = if RigidConstraint.Attachment1 then RigidConstraint.Attachment1:FindFirstAncestorWhichIsA("BasePart") else nil
				C1 = if RigidConstraint.Attachment1 then UtilsModule.getRecursiveAttachmentCFrame(RigidConstraint.Attachment1) else nil
			elseif Weld then
				BasePart = Weld.Part0
				BasePart1 = Weld.Part1
				C1 = Weld.C1
			end
			if not BasePart or not BasePart1 or not C1 then
				UseDispatchResult(SetCurrentToastMessageFunction(config))
				UseStateResult2_1(false)
				p1.navigation.pop()
				
				return
			end
		elseif not Weld then
			UseDispatchResult(SetCurrentToastMessageFunction(config))
			UseStateResult2_1(false)
			p1.navigation.pop()
			
			return
		end
		if Handle:IsA("MeshPart") and Handle.HasSkinnedMesh then
			UseDispatchResult(SetCurrentToastMessageFunction(config1))
			UseStateResult2_1(false)
			p1.navigation.pop()
			
			return
		end
		UseStateResult2_1(true)
		local LargestAxisSize = GimbalUtilsModule.getLargestAxisSize(Handle.Size)
		local Folder = Instance.new("Folder")
		
		if UseSelectorResult5 == AdjustmentTypeModule.Position then
			GimbalUtilsModule.createPositionAxis(Folder, UseDesignTokensResult.smallIconSize, LargestAxisSize, UseSelectorResult3.position, UseSelectorResult4.position)
			GimbalUtilsModule.createBillboardRing(Handle, Folder, "rbxasset://textures/ui/AvatarExperience/SelectionRing.png", "Selection")
		elseif UseSelectorResult5 == AdjustmentTypeModule.Rotation then
			assert(UseStateResult4:IsA("MeshPart"), "Assert ringPart is a MeshPart")
			GimbalUtilsModule.createRotationAxis(Folder, LargestAxisSize, UseDesignTokensResult.smallIconSize, UseStateResult4)
		elseif UseSelectorResult5 == AdjustmentTypeModule.Scale then
			GimbalUtilsModule.createBillboardRing(Handle, Folder, "rbxasset://textures/ui/AvatarExperience/GlowRing.png", "Scale")
			GimbalUtilsModule.createSelectionDot(Folder, "rbxasset://textures/ui/AvatarExperience/CenterPoint.png", "SelectionDot")
		end
		Folder.Parent = workspace
		local Anchor = Instance.new("Part")
		Anchor.Transparency = 1
		Anchor.Name = "Anchor"
		Anchor.Parent = Folder
		local Weld1 = Instance.new("Weld")
		Weld1.Part0 = Anchor
		Weld1.Part1 = if FFlagAvatarJointUpgradeInUA then BasePart1 else Weld.Part1
		Weld1.C1 = CFrame.new(if FFlagAvatarJointUpgradeInUA then C1.Position else Weld.C1.Position)
		
		if UseSelectorResult5 == AdjustmentTypeModule.Position then
			GimbalUtilsModule.setPositionAdornee(Folder, Handle, Anchor)
		elseif UseSelectorResult5 == AdjustmentTypeModule.Rotation then
			local Part1 = Weld1.Part1
			local BasePart2 = if FFlagAvatarJointUpgradeInUA then BasePart else Weld.Part0
			assert(Part1, "Assert head not nil")
			assert(BasePart2, "Accessory not nil")
			Weld1.C1 = CFrame.new((Part1.CFrame:Inverse() * BasePart2.CFrame).Position)
			GimbalUtilsModule.setRotationAdornee(Folder, Anchor)
		elseif UseSelectorResult5 == AdjustmentTypeModule.Scale then
			GimbalUtilsModule.setScaleAdornee(Folder, Handle)
		end
		Weld1.Parent = Anchor
		local List = {}
		table.insert(List, GimbalUtilsModule.setUpSizeConnection(Handle, Folder))
		table.insert(List, GimbalUtilsModule.setUpCameraConnection(Handle, Folder))
		
		return function()
			-- upvalues: Folder (copy), List (copy)
			if Folder then
				Folder:Destroy()
			end
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		UseSelectorResult5, UseSelectorResult, UseStateResult3, UseStateResult4,
		UseSelectorResult3, UseSelectorResult4, p1.navigation, UseDispatchResult
	})
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRootFocusControllerResult,
		defaultChild = UseRefResult6,
		inputBindings = if FFlagAXMigrateAdjustAccessoryViewToFocusNavigation then nil else UseMemoResult
	}, {
		SceneGamepadHandler = ReactModule.createElement(SceneGamepadHandlerModule, nil, {
			GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(GamepadFocusHandlerForPageModule, {
				captureFocusOnMount = true,
				focusController = UseRootFocusControllerResult
			}),
			TopBar = ReactModule.createElement(TopBarModule.Container, {
				transparentBackground = true,
				ZIndex = 1,
				titleText = if TestVariable then UseLocalizationResult.topBarTitle else "",
				leftItem = TopBarModule.makeBackButton(UseResult2),
				ref = UseRefResult3,
				NextSelectionDown = UseRefResult6
			}),
			PageContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -UseSelectorResult6),
				Position = UDim2.fromOffset(0, UseSelectorResult6),
				ref = if FFlagAXMigrateAdjustAccessoryViewToFocusNavigation then UseTableWrappedCallbackRefResult else nil
			}, {
				SceneInteractionFrame = ReactModule.createElement(SceneInteractionFrameModule),
				ResetButton = if FFlagAXMoveResetButtonToControlPanelModule then nil else ReactModule.createElement(AccessoryAdjustmentResetButtonModule, {
					onResetButtonPressed = UseResult3,
					NextSelectionLeft = UseRefResult3
				}),
				ControlPanel = if UseStateResult1 then ReactModule.createElement(ControlPanelModule, {
					setSliderValuesCallback = UseResult,
					updateCharacterCallback = UseResult1,
					onResetButtonPressed = if FFlagAXMoveResetButtonToControlPanelModule then UseResult3 else nil,
					adjustmentTypeFrameRef = UseRefResult6,
					sliderFrameRef = UseRefResult2,
					topBarRef = UseRefResult3,
					resetRef = if FFlagAXMoveResetButtonToControlPanelModule then nil else UseRefResult5,
					applyButtonRef = UseRefResult4,
					sliderValues = UseStateResult,
					isApplyingAdjustment = UseRefResult
				}) else nil
			})
		}),
		BoundInputsUpdater = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(BoundInputsUpdaterModule)
	})
end))))