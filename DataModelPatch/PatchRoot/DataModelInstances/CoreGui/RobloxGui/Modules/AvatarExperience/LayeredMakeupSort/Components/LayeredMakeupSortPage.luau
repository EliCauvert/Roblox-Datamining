local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local VerticalClothingListModule = require(Modules.AvatarExperience.LayeredClothingSort.Components.VerticalClothingList)
local ResetButtonModule = require(Modules.AvatarExperience.LayeredClothingSort.Components.ResetButton)
local SceneInteractionFrameModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneInteractionFrame)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local VRAvatarRotateHandlerModule = require(Modules.AvatarExperience.Common.Components.Scene.VRAvatarRotateHandler)
local ConstantsModule = require(Modules.AvatarExperience.AvatarRefinement.Constants)
local RefinementNavBarModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementNavBar)
local RefinementControlBarModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementControlBar)
local SceneGamepadHandlerModule = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateSceneGamepadHandlerInputBindings then require(Modules.AvatarExperience.Common.Components.Scene.SceneGamepadHandler) else require(Modules.AvatarExperience.Common.Components.Scene.SceneGamepadHandler_DEPRECATED)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local config = {
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.ButtonY] = FocusNavigationEventNameEnum.OpenLayeredMakeupSortResetPrompt
}

local function useFocusNavigationBindings(UseRefResult, Callback, OnOpenResetPrompt)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy), OnOpenResetPrompt (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p1)
					-- upvalues: Callback (upval)
					p1.cancelled = true
					Callback()
				end)
			},
			[FocusNavigationEventNameEnum.OpenLayeredMakeupSortResetPrompt] = if OnOpenResetPrompt then {
				handler = InputHandlersModule.onRelease(OnOpenResetPrompt)
			} else nil
		}
	end, { Callback, OnOpenResetPrompt }), (ReactFocusNavigationModule.useEventMap(config, UseRefResult)))
end

local IconsMenuAboutLarge = UIBloxModule.App.ImageSet.Images["icons/menu/about_large"]
local _UDim = UDim.new(0, 10)

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseTokensFunction (copy), ReactModule (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), SceneInteractionFrameModule (copy), RoactGamepadModule (copy), VerticalClothingListModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ResetButtonModule (copy), VRAvatarRotateHandlerModule (copy), ConstantsModule (copy), _UDim (copy), ImageSetLabel (copy), IconsMenuAboutLarge (copy), SceneGamepadHandlerModule (copy), TopBarModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), RefinementControlBarModule (copy), RefinementNavBarModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseTableWrappedCallbackRefResult = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(ReactModule.useRef(nil), p1.onGoBack, if #p1.equippedLayeredMakeupAssetIdsOrdered > 0 then p1.onOpenResetPrompt else nil)))
	local v1: boolean = not (#p1.equippedLayeredMakeupAssetIdsOrdered > 0) and #p1.equippedLayeredMakeupAssetIdsOrdered == 0
	local Frame = ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 1, -p1.topBarHeight),
		Position = UDim2.fromOffset(0, p1.topBarHeight)
	}, {
		SceneInteractionFrame = ReactModule.createElement(SceneInteractionFrameModule),
		VerticalClothingList = not v1 and ReactModule.createElement(RoactGamepadModule.Focusable[VerticalClothingListModule], {
			lastInputIsGamepad = p1.isGamepad,
			topBarRef = UseRefResult,
			focusControllerProp = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.createFocusController(),
			onDragChange = p1.onDragChange
		}),
		ResetButton = not v1 and ReactModule.createElement(ResetButtonModule, {
			lastInputIsGamepad = p1.isGamepad,
			isDragging = p1.isDragging
		}),
		VRAvatarRotateHandler = if p1.isSpatial then ReactModule.createElement(VRAvatarRotateHandlerModule) else nil,
		NoItemsMessage = v1 and ReactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, ConstantsModule.NoItem.BottomPadding),
			Size = if p1.isSpatial then UDim2.new(1, 0, 0, 50) else UDim2.new(1, 0, 0, 100),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
			BackgroundTransparency = if p1.isSpatial then 0 else 1
		}, {
			UICorner = if p1.isSpatial then ReactModule.createElement("UICorner", { CornerRadius = _UDim }) else nil,
			NoItemsTextLabel = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.XY,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(0, 0),
				Text = p1.localized.noItemText,
				Font = UseStyleResult.Font.CaptionHeader.Font,
				TextSize = UseTokensResult.Typography.BodyMedium.FontSize,
				TextColor3 = UseStyleResult.Theme.IconEmphasis.Color,
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				NoItemsIcon = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = IconsMenuAboutLarge,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(0, -2, 0.5, 0),
					Size = UDim2.fromOffset(ConstantsModule.NoItem.IconSize, ConstantsModule.NoItem.IconSize),
					ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color
				})
			})
		})
	})
	
	return if p1.isSpatial then Frame else ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = UseTableWrappedCallbackRefResult
	}, {
		SceneGamepadHandler = ReactModule.createElement(SceneGamepadHandlerModule, nil, {
			TopBar = ReactModule.createElement(TopBarModule.Container, {
				transparentBackground = true,
				ZIndex = 1,
				titleText = p1.localized.makeupSorting,
				hideSiteMessageBanner = p1.isPortrait,
				leftItem = p1.backButton,
				ref = UseRefResult
			}),
			RefinementControlBar = if GetFFlagAXEnableSlotBasedEditorModule() then ReactModule.createElement(RefinementControlBarModule, { hideUndoRedo = true }) else nil,
			RefinementNavBar = if GetFFlagAXEnableSlotBasedEditorModule() then nil else ReactModule.createElement(RefinementNavBarModule),
			LayeredMakeupSortPageFrame = Frame
		})
	})
end