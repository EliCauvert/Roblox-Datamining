local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local WithStackVisibilityWrapperModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local BoundInputsUpdaterModule = require(Modules.AvatarExperience.Common.Components.BoundInputsUpdater)
local NavOverlayPageContainerModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.NavOverlayPageContainer)
local OutfitSelectionGridModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitSelectionGrid)
local UpdateSavedOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.UpdateSavedOutfit)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local ActionBar = UIBloxModule.App.Button.ActionBar
local WithStyleFunction = UIBloxModule.Style.withStyle
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Focusable = RoactGamepadModule.Focusable
local IconsNavigationClose = UIBloxModule.App.ImageSet.Images["icons/navigation/close"]
local config = {
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.UpdateOutfit
}

local function useFocusNavigationBindings(p1, Callback)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), Callback (copy), InputHandlersModule (upval)
		return {
			[FocusNavigationEventNameEnum.UpdateOutfit] = if Callback then {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Callback (upval)
					Callback()
				end)
			} else nil
		}
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

local UpdateOutfitPage = RoactModule.PureComponent:extend("UpdateOutfitPage")
UpdateOutfitPage.validateProps = TModule.strictInterface({
	focusNavigationRef = TModule.table,
	selectedOutfit = TModule.optional(TModule.string),
	setSelectedOutfit = TModule.callback,
	focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.optional(TModule.table),
	networking = if FFlagAXModeratedItemsFlow then TModule.callback else nil,
	navigation = TModule.table,
	avatarRoute = TModule.table,
	avatarEditorAnalytics = TModule.table,
	updateSavedOutfit = TModule.callback
})

function UpdateOutfitPage.init(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), RoactModule (copy), FFlagAXModeratedItemsFlow (copy), WithStyleFunction (copy), IconButton (copy), IconsNavigationClose (copy), IconSize (copy)
	p1.focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.focusController or RoactGamepadModule.createFocusController()
	p1.exitButtonRef = RoactModule.createRef()
	p1.gridViewRef = RoactModule.createRef()
	p1.actionBarRef = RoactModule.createRef()
	
	function p1.navigateBack()
		-- upvalues: p1 (copy)
		p1.props.navigation.goBack()
	end
	
	function p1.selectedOutfitUpdated(Entry)
		-- upvalues: p1 (copy)
		p1.props.setSelectedOutfit(Entry[1] or nil)
	end
	
	function p1.updateOutfit()
		-- upvalues: p1 (copy), FFlagAXModeratedItemsFlow (upval)
		local SelectedOutfit = p1.props.selectedOutfit
		
		if not SelectedOutfit then return end
		if FFlagAXModeratedItemsFlow then
			p1.props.updateSavedOutfit(p1.props.avatarEditorAnalytics, SelectedOutfit, p1.props.networking)
		else
			p1.props.updateSavedOutfit(p1.props.avatarEditorAnalytics, SelectedOutfit)
		end
		p1.navigateBack()
	end
	
	function p1.renderExitButton()
		-- upvalues: WithStyleFunction (upval), RoactModule (upval), IconButton (upval), IconsNavigationClose (upval), IconSize (upval), p1 (copy)
		return WithStyleFunction(function(p2)
			-- upvalues: RoactModule (upval), IconButton (upval), IconsNavigationClose (upval), IconSize (upval), p1 (upval)
			local Theme = p2.Theme
			
			return RoactModule.createElement(IconButton, {
				size = UDim2.new(0, 44, 1, 0),
				icon = IconsNavigationClose,
				iconSize = IconSize.Medium,
				iconColor3 = Theme.SystemPrimaryDefault.Color,
				iconTransparency = Theme.SystemPrimaryDefault.Transparency,
				onActivated = p1.navigateBack,
				buttonRef = p1.exitButtonRef,
				NextSelectionDown = p1.gridViewRef
			})
		end)
	end
end

function UpdateOutfitPage.renderWithProviders(p1, p2, p3)
	-- upvalues: RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), BoundInputsUpdaterModule (copy), NavOverlayPageContainerModule (copy), OutfitSelectionGridModule (copy), AvatarScreen (copy), ActionBar (copy)
	local Theme = p3.Theme
	local SelectedOutfit = p1.props.selectedOutfit
	
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.focusController,
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.gridViewRef,
		[RoactModule.Ref] = p1.props.focusNavigationRef
	}, {
		BoundInputsUpdater = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(BoundInputsUpdaterModule),
		NavOverlayPageContainer = RoactModule.createElement(NavOverlayPageContainerModule, {
			headerBarProps = {
				title = p2.selectToUpdate,
				renderLeft = p1.renderExitButton
			},
			focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.focusController,
			onDismiss = p1.navigateBack
		}, {
			OutfitSelectionGrid = RoactModule.createElement(OutfitSelectionGridModule, {
				selectedOutfits = { SelectedOutfit },
				selectionUpdated = p1.selectedOutfitUpdated,
				goBack = p1.navigateBack,
				pageOwner = AvatarScreen.UpdateOutfitPage,
				NextSelectionUp = p1.exitButtonRef,
				NextSelectionDown = p1.actionBarRef,
				[RoactModule.Ref] = p1.gridViewRef
			}),
			ActionBarBackgroundGapFiller = if SelectedOutfit == nil then nil else RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				BackgroundColor3 = Theme.BackgroundDefault.Color,
				BackgroundTransparency = Theme.BackgroundDefault.Transparency,
				Position = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 1),
				Size = UDim2.new(1, 0, 0, 48)
			}) or nil,
			ActionBarContainer = if SelectedOutfit == nil then nil else RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 3,
				Size = UDim2.fromScale(1, 1)
			}, {
				ActionBar = RoactModule.createElement(ActionBar, {
					button = {
						props = { text = p2.update, onActivated = p1.updateOutfit }
					},
					NextSelectionUp = p1.gridViewRef,
					[RoactModule.Ref] = p1.actionBarRef
				})
			}) or nil
		})
	})
end

function UpdateOutfitPage.render(p1)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy)
	return WithLocalizationFunction({
		selectToUpdate = "Feature.Avatar.Heading.SelectToUpdate",
		update = "Feature.Avatar.Action.Update"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

local WithStackVisibilityWrapperModuleResult = WithStackVisibilityWrapperModule((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: FFlagAXModeratedItemsFlow (copy), UpdateSavedOutfitModule (copy)
	return {
		updateSavedOutfit = function(p1, p2, p3)
			-- upvalues: FFlagAXModeratedItemsFlow (upval), Callback (copy), UpdateSavedOutfitModule (upval)
			if FFlagAXModeratedItemsFlow then
				Callback(UpdateSavedOutfitModule(p1, p2, nil, nil, p3))
				
				return
			else
				Callback(UpdateSavedOutfitModule(p1, p2))
			end
		end
	}
end)((RoactServices.connect({
	avatarEditorAnalytics = AnalyticsModule,
	networking = if FFlagAXModeratedItemsFlow then RoactNetworkingModule else nil
})(UpdateOutfitPage)))))

return function(p1)
	-- upvalues: UseRoactServiceModule (copy), AnalyticsModule (copy), FFlagAXModeratedItemsFlow (copy), RoactNetworkingModule (copy), UseDispatchFunction (copy), ReactModule (copy), UpdateSavedOutfitModule (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), WithStackVisibilityWrapperModuleResult (ref), CryoModule (copy)
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseRoactServiceModuleResult1 = if FFlagAXModeratedItemsFlow then UseRoactServiceModule(RoactNetworkingModule) else nil
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), FFlagAXModeratedItemsFlow (upval), UseDispatchResult (copy), UpdateSavedOutfitModule (upval), UseRoactServiceModuleResult (copy), UseRoactServiceModuleResult1 (copy), p1 (copy)
		if not UseStateResult then return end
		if FFlagAXModeratedItemsFlow then
			UseDispatchResult(UpdateSavedOutfitModule(UseRoactServiceModuleResult, UseStateResult, nil, nil, UseRoactServiceModuleResult1))
		else
			UseDispatchResult(UpdateSavedOutfitModule(UseRoactServiceModuleResult, UseStateResult))
		end
		p1.navigation.goBack()
	end, {
		UseStateResult,
		p1.navigation,
		UseRoactServiceModuleResult,
		UseRoactServiceModuleResult1
	})
	
	return ReactModule.createElement(WithStackVisibilityWrapperModuleResult, CryoModule.Dictionary.join(p1, {
		focusNavigationRef = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(nil, if UseStateResult then UseResult else nil))),
		selectedOutfit = UseStateResult,
		setSelectedOutfit = UseStateResult2
	}))
end