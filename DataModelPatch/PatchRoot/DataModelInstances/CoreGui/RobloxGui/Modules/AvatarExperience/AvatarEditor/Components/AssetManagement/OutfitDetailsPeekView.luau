local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local ReactModule = require(CorePackages.Packages.React)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local IsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).isGamepadInput
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local GetOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfit)
local ConstantsModule = require(Modules.LuaApp.Constants)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local PeekView = require(CorePackages.Workspace.Packages.PeekView).PeekView
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local GamepadUtils = require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local ManageActionBarModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.ManageActionBar)
local OutfitDetailsContainerModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitDetailsContainer)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local UseAvatarExperienceFocusNavigationBindingsModule = require(Modules.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings)
local UseOverlayClosedCallbackModule = require(Modules.AvatarExperience.Common.Hooks.useOverlayClosedCallback)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local BoundInputsUpdaterModule = require(Modules.AvatarExperience.Common.Components.BoundInputsUpdater)
local SetItemDetailsExpandedModule = require(Modules.AvatarExperience.Common.Actions.SetItemDetailsExpanded)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UseTableWrappedCallbackRefFunction = AvatarExperienceCommonModule.Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local UseAXAnimateScrollFrameFunction = AvatarExperienceCommonModule.Components.AnimatedScrollingFrame.useAXAnimateScrollFrame
local AXMigrateOutfitDetailsPeekViewToFocusNavigation = game:DefineFastFlag("AXMigrateOutfitDetailsPeekViewToFocusNavigation", false)
local FFlagAXFixGamepadNavigationOnOutfitManagement = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixGamepadNavigationOnOutfitManagement
local AssetManagementConstantsModule = require(script.Parent.AssetManagementConstants)
local WithStyleFunction = UIBloxModule.Style.withStyle
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local IconsNavigationClose = UIBloxModule.App.ImageSet.Images["icons/navigation/close"]
local _UDim = UDim.new(1, 0)
local IsTenFootInterface = game:GetService("GuiService"):IsTenFootInterface()
local Focusable = RoactGamepadModule.Focusable
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function useFocusNavigationBindings(UseRefResult, Callback)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p1)
					-- upvalues: Callback (upval)
					p1.cancelled = true
					Callback()
				end)
			}
		}
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config, UseRefResult)))
end

local function _(p1, p2)
	-- upvalues: ReactModule (copy), RunService (copy), UserInputService (copy)
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), RunService (upval), p1 (copy), UserInputService (upval)
		local Connection = nil
		local Connection1 = nil
		
		if p2 then
			local Input = nil
			Connection = RunService.Heartbeat:Connect(function(DeltaTime)
				-- upvalues: Input (ref), p1 (upval)
				if Input and Input.KeyCode == Enum.KeyCode.Thumbstick2 then
					p1(Input, DeltaTime)
				end
			end)
			Connection1 = UserInputService.InputChanged:Connect(function(Input1, _)
				-- upvalues: Input (ref)
				if Input1.KeyCode == Enum.KeyCode.Thumbstick2 then
					if Input1.UserInputState == Enum.UserInputState.Change then
						Input = Input1
						
						return
					end
					if Input1.UserInputState == Enum.UserInputState.End then
						Input = nil
					end
				end
			end)
		end
		return function()
			-- upvalues: Connection (ref), Connection1 (ref)
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
		end
	end, { p1, p2 })
end

local OutfitDetailsPeekView = RoactModule.PureComponent:extend("OutfitDetailsPeekView")
OutfitDetailsPeekView.validateProps = TModule.strictInterface({
	outfitId = TModule.string,
	focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.optional(TModule.table),
	ZIndex = TModule.optional(TModule.integer),
	onPeekViewClosed = TModule.optional(TModule.callback),
	exitButtonPosition = TModule.optional(TModule.Vector2),
	deleteOutfit = TModule.optional(TModule.callback),
	renameOutfit = TModule.optional(TModule.callback),
	showFullWithNoPeekView = TModule.optional(TModule.boolean),
	renderBottomBar = TModule.optional(TModule.boolean),
	NextSelectionLeft = TModule.optional(TModule.table),
	outfitDetailsPeekViewRefs = TModule.optional(TModule.table),
	navigation = TModule.table,
	avatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute.Interface,
	overlayClosedCallback = TModule.callback,
	peekViewContainerFocusNavigationRef = if AXMigrateOutfitDetailsPeekViewToFocusNavigation then TModule.callback else nil,
	swipeScrollingFrameRef = if AXMigrateOutfitDetailsPeekViewToFocusNavigation then TModule.table else nil,
	isPortrait = TModule.boolean,
	topBarHeight = TModule.number,
	itemDetailsExpanded = TModule.boolean,
	statusBarHeight = TModule.number,
	outfitInfo = TModule.optional(TModule.table),
	setItemDetailsExpanded = TModule.callback,
	fetchOutfitDetails = TModule.callback,
	avatarEditorAnalytics = TModule.table
})
OutfitDetailsPeekView.defaultProps = { showFullWithNoPeekView = false, renderBottomBar = true }

function OutfitDetailsPeekView.init(p1)
	-- upvalues: RoactModule (copy), AXMigrateOutfitDetailsPeekViewToFocusNavigation (copy), UserInputService (copy), IsGamepadInputFunction (copy), PeekViewState (copy), NavigationUtilsModule (copy), IsVRAppBuildFunction (copy)
	p1.actionBarRef = RoactModule.createRef()
	p1.exitButtonRef = RoactModule.createRef()
	
	if not AXMigrateOutfitDetailsPeekViewToFocusNavigation then
		p1.swipeScrollingFrameRef = RoactModule.createRef()
	end
	p1.itemsGridRef = RoactModule.createRef()
	p1:setState({
		isGamepad = IsGamepadInputFunction((UserInputService:GetLastInputType()))
	})
	
	function p1.viewStateChanged(Closed, _)
		-- upvalues: PeekViewState (upval), p1 (copy), NavigationUtilsModule (upval)
		if Closed == PeekViewState.Closed then
			if p1.props.onPeekViewClosed then
				p1.props.onPeekViewClosed()
			end
			NavigationUtilsModule.closeFiltersAndItemDetails(p1.props.navigation)
		end
		if Closed == PeekViewState.Full or Closed == PeekViewState.Extended then
			p1.props.setItemDetailsExpanded(true)
			
			return
		else
			p1.props.setItemDetailsExpanded(false)
		end
	end
	
	function p1.lastInputTypeChangedCallback()
		-- upvalues: UserInputService (upval), IsGamepadInputFunction (upval), p1 (copy)
		local IsGamepadInput = IsGamepadInputFunction((UserInputService:GetLastInputType()))
		
		if IsGamepadInput ~= p1.state.isGamepad then
			p1:setState({ isGamepad = IsGamepadInput })
		end
	end
	
	function p1.onExitButtonPressed()
		-- upvalues: p1 (copy), NavigationUtilsModule (upval)
		if p1.props.onPeekViewClosed then
			p1.props.onPeekViewClosed()
		end
		NavigationUtilsModule.closeFiltersAndItemDetails(p1.props.navigation)
	end
	
	p1.absolutePositionBinding, p1.updateAbsolutePositionBinding = RoactModule.createBinding(Vector2.new(0, 0))
	
	function p1.containerPositionChanged(Frame)
		-- upvalues: p1 (copy)
		p1.updateAbsolutePositionBinding(Frame.AbsolutePosition)
	end
	
	function p1.getExitButtonUDim2Pos(): UDim2
		-- upvalues: p1 (copy)
		return if p1.props.isPortrait then UDim2.fromScale(15, p1.props.statusBarHeight) else UDim2.new(0, 15, 0, -44 - (p1.props.topBarHeight - 44) / 2)
	end
	
	function p1.getRef()
		-- upvalues: p1 (copy)
		local Key = p1.props.navigation.state.key
		local OutfitDetailsPeekViewRefs = p1:getOutfitDetailsPeekViewRefs()
		
		return if OutfitDetailsPeekViewRefs and Key then OutfitDetailsPeekViewRefs[Key] else nil
	end
	
	function p1.shouldRenderFullScreen()
		-- upvalues: p1 (copy), IsVRAppBuildFunction (upval)
		return p1.props.showFullWithNoPeekView or IsVRAppBuildFunction()
	end
end

function OutfitDetailsPeekView.getOutfitDetailsPeekViewRefs(p1)
	-- upvalues: RoactGamepadModule (copy)
	if p1.props.outfitDetailsPeekViewRefs then
		return p1.props.outfitDetailsPeekViewRefs
	end
	if not p1.outfitDetailsPeekViewRefs then
		p1.outfitDetailsPeekViewRefs = RoactGamepadModule.createRefCache()
	end
	return p1.outfitDetailsPeekViewRefs
end

function OutfitDetailsPeekView.renderActionBar(p1, BottomPadding)
	-- upvalues: RoactModule (copy), ManageActionBarModule (copy)
	return RoactModule.createElement(ManageActionBarModule, {
		gradientFade = true,
		multiSelect = false,
		selectedOutfits = { p1.props.outfitId },
		ZIndex = 2,
		bottomPadding = BottomPadding,
		deleteOutfit = p1.props.deleteOutfit,
		renameOutfit = p1.props.renameOutfit,
		NextSelectionUp = p1.props.isPortrait and p1.exitButtonRef or nil,
		[RoactModule.Ref] = p1.actionBarRef
	})
end

function OutfitDetailsPeekView.renderWithProviders(p1, p2)
	-- upvalues: IsVRAppBuildFunction (copy), ConstantsModule1 (copy), AssetManagementConstantsModule (copy), IsTenFootInterface (copy), ConstantsModule (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), FFlagAXFixGamepadNavigationOnOutfitManagement (copy), AXMigrateOutfitDetailsPeekViewToFocusNavigation (copy), RoactGamepadModule (copy), NavigationUtilsModule (copy), GamepadUtils (copy), _UDim (copy), GamepadFocusHandlerForPageModule (copy), BoundInputsUpdaterModule (copy), ExternalEventConnection (copy), UserInputService (copy), IconButton (copy), IconsNavigationClose (copy), IconSize (copy), PeekView (copy), OutfitDetailsContainerModule (copy)
	local Theme = p2.Theme
	local _UDim2 = UDim2.fromOffset(0, p1.props.topBarHeight)
	local _UDim2_1 = UDim2.new(1, 0, 1, -p1.props.topBarHeight)
	local Inverted: boolean = not p1.props.isPortrait and not IsVRAppBuildFunction()
	
	if Inverted then
		_UDim2 = UDim2.new(ConstantsModule1.LandscapeNavWidth, 0, 0, p1.props.topBarHeight)
		_UDim2_1 = UDim2.new(ConstantsModule1.LandscapeSceneWidth, 0, 1, -p1.props.topBarHeight)
	end
	local ActionBarHeight = AssetManagementConstantsModule.ActionBarHeight
	
	if not Inverted then
		ActionBarHeight += 24
	end
	local GAMEPADBOTTOMBARSIZE = nil
	
	if p1.state.isGamepad and IsTenFootInterface then
		GAMEPADBOTTOMBARSIZE = ConstantsModule.GAMEPAD_BOTTOM_BAR_SIZE
		ActionBarHeight += ConstantsModule.GAMEPAD_BOTTOM_BAR_SIZE
	end
	local ExitButtonPosition = p1.props.exitButtonPosition
	local MapResult = if ExitButtonPosition then p1.absolutePositionBinding:map(function(Vector): UDim2
		-- upvalues: ExitButtonPosition (copy)
		return UDim2.fromOffset(ExitButtonPosition.X - Vector.X, ExitButtonPosition.Y - Vector.Y)
	end) else nil
	local ExitButtonUDim2Pos = if ExitButtonPosition then nil else p1.getExitButtonUDim2Pos()
	
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		ZIndex = p1.props.ZIndex,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = _UDim2_1,
		Position = _UDim2,
		SelectionGroup = if FFlagAXFixGamepadNavigationOnOutfitManagement then true else nil,
		NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.NextSelectionLeft,
		[RoactModule.Ref] = p1.getRef(),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.focusController,
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil elseif p1.props.renderBottomBar then p1.actionBarRef else nil,
		restorePreviousChildFocus = not FFlagAXMigrateAXToGlobalAutofocus or nil,
		inputBindings = if FFlagAXMigrateAXToGlobalAutofocus or AXMigrateOutfitDetailsPeekViewToFocusNavigation then nil else {
			Close = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
				-- upvalues: NavigationUtilsModule (upval), p1 (copy)
				NavigationUtilsModule.closeFiltersAndItemDetails(p1.props.navigation)
				
				if p1.props.onPeekViewClosed then
					p1.props.onPeekViewClosed()
				end
			end),
			ScrollPeekView = if p1.swipeScrollingFrameRef and p1.swipeScrollingFrameRef.current ~= nil then RoactGamepadModule.Input.onStep(Enum.KeyCode.Thumbstick2, function(p3, p4)
				-- upvalues: p1 (copy), GamepadUtils (upval), _UDim (upval)
				local Current = p1.swipeScrollingFrameRef.current
				local NewY = Current.CanvasPosition.Y + p4 * -GamepadUtils.normalizeStickByDeadzone(p3.Position).Y * 1000
				
				if NewY <= Current.AbsoluteCanvasSize.Y * _UDim.Scale + _UDim.Offset then
					Current.CanvasPosition = Vector2.new(0, NewY)
				end
			end) else nil
		},
		[RoactModule.Change.AbsolutePosition] = p1.containerPositionChanged
	}, {
		GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(GamepadFocusHandlerForPageModule, { focusController = p1.props.focusController }),
		BoundInputsUpdater = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(BoundInputsUpdaterModule),
		LastInputTypeChangedConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = p1.lastInputTypeChangedCallback
		}),
		Background = if p1.props.itemDetailsExpanded then RoactModule.createElement("TextButton", {
			ZIndex = 1,
			Text = "",
			AutoButtonColor = false,
			BackgroundTransparency = p1.props.isPortrait and Theme.Overlay.Transparency or 1,
			BackgroundColor3 = Theme.Overlay.Color,
			Size = UDim2.new(1, 0, 1, p1.props.topBarHeight),
			Position = UDim2.fromOffset(0, -p1.props.topBarHeight)
		}) else nil,
		ExitButton = p1.props.itemDetailsExpanded and (p1.props.isPortrait or p1.shouldRenderFullScreen()) and RoactModule.createElement(IconButton, {
			position = if ExitButtonPosition then MapResult else ExitButtonUDim2Pos,
			size = UDim2.fromOffset(44, 44),
			icon = IconsNavigationClose,
			iconSize = IconSize.Medium,
			iconColor3 = Theme.SystemPrimaryDefault.Color,
			iconTransparency = Theme.SystemPrimaryDefault.Transparency,
			onActivated = p1.onExitButtonPressed,
			buttonRef = p1.exitButtonRef,
			NextSelectionDown = if p1.props.renderBottomBar then p1.actionBarRef else p1.itemsGridRef
		}),
		PeekViewContainer = if p1.shouldRenderFullScreen() then nil else RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ClipsDescendants = true,
			ZIndex = 3,
			[RoactModule.Ref] = if AXMigrateOutfitDetailsPeekViewToFocusNavigation then p1.props.peekViewContainerFocusNavigationRef else nil
		}, {
			PeekView = RoactModule.createElement(PeekView, {
				mountAnimation = true,
				mountAsFullView = true,
				canDragFullViewToBrief = true,
				showDraggerInClosedState = false,
				returnToFullView = true,
				thumbstickScrollEnabled = true,
				peekHeaderClose = true,
				isScrollingEnabled = true,
				briefViewContentHeight = UDim.new(0, ActionBarHeight),
				viewStateChanged = p1.viewStateChanged,
				bottomDockedContainerHeight = ActionBarHeight,
				bottomDockedContainerContent = if p1.props.renderBottomBar then p1:renderActionBar(GAMEPADBOTTOMBARSIZE) else nil,
				backgroundColor3 = Theme.BackgroundDefault.Color,
				backgroundTransparency = Theme.BackgroundUIDefault.Transparency,
				shouldCaptureFocus = not FFlagAXMigrateAXToGlobalAutofocus and nil,
				scrollingFrameRef = if FFlagAXFixGamepadNavigationOnOutfitManagement then p1.props.swipeScrollingFrameRef else nil
			}, {
				OutfitDetailsContainer = RoactModule.createElement(OutfitDetailsContainerModule, {
					outfitId = p1.props.outfitId,
					itemsGridRef = p1.itemsGridRef,
					NextSelectionUp = if FFlagAXFixGamepadNavigationOnOutfitManagement then nil else p1.exitButtonRef,
					bottomPadding = if FFlagAXFixGamepadNavigationOnOutfitManagement then AssetManagementConstantsModule.ActionBarHeight + (GAMEPADBOTTOMBARSIZE or 0) else nil
				})
			})
		}),
		ScrollingContent = if p1.shouldRenderFullScreen() then RoactModule.createElement("ScrollingFrame", {
			ScrollingDirection = Enum.ScrollingDirection.Y,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0, 0),
			ScrollBarThickness = 0,
			CanvasSize = UDim2.fromScale(1, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ElasticBehavior = Enum.ElasticBehavior.Never,
			ZIndex = 3,
			[RoactModule.Ref] = if AXMigrateOutfitDetailsPeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef else p1.swipeScrollingFrameRef
		}, {
			OutfitDetailsContainer = RoactModule.createElement(OutfitDetailsContainerModule, {
				outfitId = p1.props.outfitId,
				itemsGridRef = p1.itemsGridRef,
				NextSelectionUp = p1.exitButtonRef
			})
		}) else nil
	})
end

function OutfitDetailsPeekView.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2)
	end)
end

local _ = function(p1): boolean
	return not p1 or (not p1.assets or #p1.assets == 0)
end

function OutfitDetailsPeekView.didMount(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy)
	local Ref = p1.getRef()
	
	if not FFlagAXMigrateAXToGlobalAutofocus and p1.state.isGamepad and p1.props.isPortrait then
		p1.props.focusController.moveFocusTo(Ref)
	end
	if Ref:getValue() then
		p1.containerPositionChanged(Ref:getValue())
	end
	p1.props.setItemDetailsExpanded(true)
	local OutfitInfo = p1.props.outfitInfo
	
	if not OutfitInfo or (not OutfitInfo.assets or #OutfitInfo.assets == 0) then
		p1.props.fetchOutfitDetails(p1.props.outfitId)
	end
end

function OutfitDetailsPeekView.didUpdate(p1, p2, p3)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy)
	if not FFlagAXMigrateAXToGlobalAutofocus then
		local Ref = p1.getRef()
		
		if p1.state.isGamepad and not p3.isGamepad and p1.props.isPortrait then
			p1.props.focusController.moveFocusTo(Ref)
		end
		if p1.props.isPortrait and p2.isPortrait and p1.state.isGamepad then
			p1.props.focusController.moveFocusTo(Ref)
		end
	end
	if p1.props.outfitId ~= p2.outfitId then
		local OutfitInfo = p1.props.outfitInfo
		
		if not OutfitInfo or (not OutfitInfo.assets or #OutfitInfo.assets == 0) then
			p1.props.fetchOutfitDetails(p1.props.outfitId)
		end
	end
end

function OutfitDetailsPeekView.willUnmount(p1)
	-- upvalues: AvatarScreen (copy)
	if p1.props.avatarRoute.current.name ~= AvatarScreen.OutfitDetails or p1.props.avatarRoute.current.key == p1.props.navigation.state.key then
		p1.props.setItemDetailsExpanded(false)
	end
end

local v1 = RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: DeviceOrientationMode (copy), UtilsModule (copy)
	return {
		outfitInfo = p1.AvatarExperience.AvatarEditor.OutfitInfos[p2.outfitId],
		isPortrait = p1.DeviceOrientation == DeviceOrientationMode.Portrait,
		topBarHeight = UtilsModule.getTopBarHeightAvatarScene(p1),
		itemDetailsExpanded = p1.AvatarExperience.Common.ItemDetailsExpanded,
		statusBarHeight = p1.TopBar.statusBarHeight
	}
end, function(Callback)
	-- upvalues: SetItemDetailsExpandedModule (copy), GetOutfitModule (copy)
	return {
		setItemDetailsExpanded = function(p1)
			-- upvalues: Callback (copy), SetItemDetailsExpandedModule (upval)
			Callback(SetItemDetailsExpandedModule(p1))
		end,
		fetchOutfitDetails = function(p1)
			-- upvalues: Callback (copy), GetOutfitModule (upval)
			Callback(GetOutfitModule(p1))
		end
	}
end)(OutfitDetailsPeekView)

if not AXMigrateOutfitDetailsPeekViewToFocusNavigation then
	v1 = WithMappedNavigationParamsModule(v1)
end
local v2 = RoactServices.connect({ avatarEditorAnalytics = AnalyticsModule })(v1)

local function OutfitDetailsPageContainer(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), RoactGamepadModule (copy), UseOverlayClosedCallbackModule (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy), CryoModule (copy), RoactModule (copy), v2 (ref)
	local Current = if FFlagAXMigrateAXToGlobalAutofocus or not p1.focusController then if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useRef(RoactGamepadModule.createFocusController()).current else p1.focusController
	local UseOverlayClosedCallbackModuleResult = UseOverlayClosedCallbackModule(if FFlagAXMigrateAXToGlobalAutofocus then nil else Current)
	
	return RoactModule.createElement("Frame", {
		[RoactModule.Ref] = UseAvatarExperienceFocusNavigationBindingsModule({
			overlayClosedCallback = UseOverlayClosedCallbackModuleResult
		}),
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1)
	}, {
		OutfitDetailsPeekView = ReactModule.createElement(v2, (CryoModule.Dictionary.join(p1, {
			focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else Current,
			overlayClosedCallback = UseOverlayClosedCallbackModuleResult
		})))
	})
end

local function OutfitDetailsPageContainerNew(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), RoactGamepadModule (copy), UseOverlayClosedCallbackModule (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy), FFlagAXFixGamepadNavigationOnOutfitManagement (copy), UseAXAnimateScrollFrameFunction (copy), NavigationUtilsModule (copy), GamepadUtils (copy), _UDim (copy), IsVRAppBuildFunction (copy), RunService (copy), UserInputService (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), CryoModule (copy), RoactModule (copy), v2 (ref)
	local Current = if FFlagAXMigrateAXToGlobalAutofocus or not p1.focusController then if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useRef(RoactGamepadModule.createFocusController()).current else p1.focusController
	local UseOverlayClosedCallbackModuleResult = UseOverlayClosedCallbackModule(if FFlagAXMigrateAXToGlobalAutofocus then nil else Current)
	local UseAvatarExperienceFocusNavigationBindingsModuleResult = UseAvatarExperienceFocusNavigationBindingsModule({
		overlayClosedCallback = UseOverlayClosedCallbackModuleResult
	})
	local UseRefResult = ReactModule.useRef(nil)
	
	if FFlagAXFixGamepadNavigationOnOutfitManagement then
		UseAXAnimateScrollFrameFunction(UseRefResult)
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeFiltersAndItemDetails(p1.navigation)
		
		if p1.onPeekViewClosed then
			p1.onPeekViewClosed()
		end
	end, { p1.navigation, p1.onPeekViewClosed })
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseRefResult (copy), GamepadUtils (upval), _UDim (upval)
		local _Vector2 = Vector2.new(p2.Position.X, p2.Position.Y)
		
		if UseRefResult.current then
			local NewY = UseRefResult.current.CanvasPosition.Y + p3 * -GamepadUtils.normalizeStickByDeadzone(_Vector2).Y * 1000
			
			if NewY <= UseRefResult.current.AbsoluteCanvasSize.Y * _UDim.Scale + _UDim.Offset then
				UseRefResult.current.CanvasPosition = Vector2.new(0, NewY)
			end
		end
	end, {})
	local ShowFullWithNoPeekView = p1.showFullWithNoPeekView or IsVRAppBuildFunction()
	ReactModule.useEffect(function()
		-- upvalues: ShowFullWithNoPeekView (copy), RunService (upval), UseResult1 (copy), UserInputService (upval)
		local Connection = nil
		local Connection1 = nil
		
		if ShowFullWithNoPeekView then
			local Input = nil
			Connection = RunService.Heartbeat:Connect(function(DeltaTime)
				-- upvalues: Input (ref), UseResult1 (upval)
				if Input and Input.KeyCode == Enum.KeyCode.Thumbstick2 then
					UseResult1(Input, DeltaTime)
				end
			end)
			Connection1 = UserInputService.InputChanged:Connect(function(Input1, _)
				-- upvalues: Input (ref)
				if Input1.KeyCode == Enum.KeyCode.Thumbstick2 then
					if Input1.UserInputState == Enum.UserInputState.Change then
						Input = Input1
						
						return
					end
					if Input1.UserInputState == Enum.UserInputState.End then
						Input = nil
					end
				end
			end)
		end
		return function()
			-- upvalues: Connection (ref), Connection1 (ref)
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
		end
	end, { UseResult1, ShowFullWithNoPeekView })
	
	return RoactModule.createElement("Frame", {
		[RoactModule.Ref] = UseAvatarExperienceFocusNavigationBindingsModuleResult,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1)
	}, {
		OutfitDetailsPeekView = ReactModule.createElement(v2, (CryoModule.Dictionary.join(p1, {
			focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else Current,
			overlayClosedCallback = UseOverlayClosedCallbackModuleResult,
			peekViewContainerFocusNavigationRef = useFocusNavigationBindings(nil, UseResult),
			swipeScrollingFrameRef = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(UseRefResult, UseResult)))
		})))
	})
end

return if AXMigrateOutfitDetailsPeekViewToFocusNavigation then WithMappedNavigationParamsModule(OutfitDetailsPageContainerNew) else OutfitDetailsPageContainer