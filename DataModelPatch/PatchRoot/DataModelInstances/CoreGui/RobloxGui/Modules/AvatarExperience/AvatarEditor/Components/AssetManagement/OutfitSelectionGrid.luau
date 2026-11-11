local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local Focusable = RoactGamepadModule.Focusable
local FitFrameVertical = require(CorePackages.Packages.FitFrame).FitFrameVertical
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ItemTile = UIBloxModule.Tile.ItemTile
local WithStyleFunction = UIBloxModule.Style.withStyle
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local LoadableGridViewModule = require(Modules.AvatarExperience.Common.Components.LoadableGridView)
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local GetEditableOutfitsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetEditableOutfits)
local OutfitSelectionGridItemModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitSelectionGridItem)
local AXRefreshScrollingFrameWithLoadMoreModule = require(Modules.AvatarExperience.Common.Components.AXRefreshScrollingFrameWithLoadMore)
local RequestStatusEnumModule = require(Modules.AvatarExperience.Common.Enum.RequestStatusEnum)
local LoadingBarWithThemeModule = require(Modules.LuaApp.Components.LoadingBarWithTheme)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRequestModule = require(Modules.AvatarExperience.Common.Hooks.useRequest)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local FFlagAXUpdateSlotBasedEditorToastAndPrompts = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSlotBasedEditorToastAndPrompts
local FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXFixGamepadNavigationOnOutfitManagement = AvatarExperienceFlagsModule.FFlagAXFixGamepadNavigationOnOutfitManagement
local FFlagAXManageOutfitsCatalogItemCard = AvatarExperienceFlagsModule.FFlagAXManageOutfitsCatalogItemCard
local FFlagAXModeratedItemIconUpdates = AvatarExperienceFlagsModule.FFlagAXModeratedItemIconUpdates
local InventoryItemAvailability = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability
local IconsNavigationPushBack = UIBloxModule.App.ImageSet.Images["icons/navigation/pushBack"]
local CustomMetricsGetter = UIBloxModule.App.Grid.GridMetrics.makeCustomMetricsGetter(ConstantsModule.ItemsGridMetrics)
local ForwardRefResult = ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseLocalizationFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), Button (copy), StandardButtonSize (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({ loadMore = "Feature.Catalog.Action.LoadMore" })
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else RoactGamepadModule.Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1200 else UseDesignTokensResult.Global.Size_600),
		ref = Ref,
		NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionUp,
		NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionDown,
		LayoutOrder = Frame.LayoutOrder
	}, {
		LoadMoreButton = ReactModule.createElement(Button, {
			onActivated = Frame.onActivated,
			text = UseLocalizationResult.loadMore,
			standardSize = StandardButtonSize.Regular,
			buttonType = ButtonType.Secondary,
			size = UDim2.fromScale(1, 1),
			anchorPoint = Vector2.new(0.5, 0.5),
			position = UDim2.fromScale(0.5, 0.5)
		})
	})
end)

local function getOutfitItemStatus(OutfitInfo)
	-- upvalues: FFlagAXManageOutfitsCatalogItemCard (copy), InventoryItemAvailability (copy), FFlagAXModeratedItemIconUpdates (copy)
	if FFlagAXManageOutfitsCatalogItemCard and OutfitInfo then
		local AvailabilityStatus = OutfitInfo.availabilityStatus
		
		return if AvailabilityStatus == InventoryItemAvailability.Unavailable then {
			type = "placeholder",
			iconType = if FFlagAXModeratedItemIconUpdates then "Unavailable" else "Error"
		} elseif AvailabilityStatus == InventoryItemAvailability.PartiallyAvailableWithUnavailableSubitems then { type = "icon", iconType = "Unavailable" } else nil
	else
		return nil
	end
end

local OutfitSelectionGrid = ReactModule.PureComponent:extend("OutfitSelectionGrid")
OutfitSelectionGrid.validateProps = TModule.strictInterface({
	onToggleOutfitCard = TModule.optional(TModule.callback),
	selectedOutfits = TModule.array(TModule.string),
	selectionUpdated = TModule.callback,
	canScrollUpdated = TModule.optional(TModule.callback),
	multiSelect = TModule.optional(TModule.boolean),
	goBack = TModule.callback,
	pageOwner = TModule.string,
	loadMoreItems = TModule.callback,
	isFetchingMore = TModule.boolean,
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	forwardRef = TModule.table,
	showCustomOutfitNames = TModule.boolean,
	enableContinuousLoad = TModule.boolean,
	outfitInfos = TModule.table,
	editableOwnedOutfitIds = TModule.array(TModule.string),
	screenSize = TModule.Vector2,
	hasMoreItems = TModule.boolean,
	focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.table,
	focusGuiObject = if FFlagAXMigrateAXToGlobalAutofocus then TModule.optional(TModule.callback) else nil
})
OutfitSelectionGrid.defaultProps = { multiSelect = false }

function OutfitSelectionGrid.getItemIconType(p1, ItemId)
	-- upvalues: UtilsModule (copy)
	local OutfitInfos = p1.props.outfitInfos
	local OutfitInfo = OutfitInfos and OutfitInfos[ItemId]
	
	return if OutfitInfo then UtilsModule.getItemIconTypeFromOutfit(OutfitInfo) else nil
end

function OutfitSelectionGrid.init(p1)
	-- upvalues: ReactModule (copy), ConstantsModule (copy), WasLastInputGamepadFunction (copy), ConstantsModule1 (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	p1.loadableGridViewRef = ReactModule.createRef()
	p1.emptyStateRef = ReactModule.createRef()
	p1.loadMoreRef = ReactModule.createRef()
	local Y = 0
	local Y1 = 0
	
	local function _()
		-- upvalues: p1 (copy), ConstantsModule (upval), Y1 (ref), Y (ref)
		if p1.props.canScrollUpdated then
			p1.props.canScrollUpdated(Y < Y1 + (ConstantsModule.ItemsGridTopPadding + ConstantsModule.ItemsGridBottomPadding))
		end
	end
	
	function p1.absoluteSizeChanged(Frame)
		-- upvalues: Y (ref), p1 (copy), ConstantsModule (upval), Y1 (ref)
		Y = Frame.AbsoluteSize.Y
		
		if p1.props.canScrollUpdated then
			p1.props.canScrollUpdated(Y < Y1 + (ConstantsModule.ItemsGridTopPadding + ConstantsModule.ItemsGridBottomPadding))
		end
	end
	
	function p1.contentSizeChanged(p2)
		-- upvalues: Y1 (ref), p1 (copy), ConstantsModule (upval), Y (ref)
		Y1 = p2.AbsoluteContentSize.Y
		
		if p1.props.canScrollUpdated then
			p1.props.canScrollUpdated(Y < Y1 + (ConstantsModule.ItemsGridTopPadding + ConstantsModule.ItemsGridBottomPadding))
		end
	end
	
	function p1.onLoadMoreButtonActivated()
		-- upvalues: WasLastInputGamepadFunction (upval), p1 (copy), ConstantsModule1 (upval), FFlagAXMigrateAXToGlobalAutofocus (upval)
		local v1: boolean = p1.props.hasMoreItems and #p1.props.editableOwnedOutfitIds == 0
		local EditableOwnedOutfitIds = if v1 then nil else p1.props.editableOwnedOutfitIds or nil
		local ShimmerCardsToDisplay = ConstantsModule1.ShimmerCardsToDisplay
		local v2 = (EditableOwnedOutfitIds and #EditableOwnedOutfitIds or ShimmerCardsToDisplay) > 0
		
		if WasLastInputGamepadFunction() then
			p1:setState({ restorePreviousChildFocus = true })
			
			if v2 then
				if FFlagAXMigrateAXToGlobalAutofocus then
					if p1.props.focusGuiObject and p1.loadableGridViewRef.current then
						p1.props.focusGuiObject(p1.loadableGridViewRef.current)
					end
				else
					p1.props.focusController.moveFocusTo(p1.loadableGridViewRef)
				end
			end
		end
		p1.props.loadMoreItems()
	end
end

function OutfitSelectionGrid.renderItem(p1, ItemId)
	-- upvalues: CryoModule (copy), Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), ConstantsModule1 (copy), FFlagAXManageOutfitsCatalogItemCard (copy), ReactModule (copy), OutfitSelectionGridItemModule (copy), getOutfitItemStatus (copy), FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ItemTile (copy), Focusable (copy), RoactGamepadModule (copy)
	if typeof(ItemId) == "table" then
		ItemId = nil
	end
	local HasFindResult = CryoModule.List.find(p1.props.selectedOutfits, ItemId) ~= nil
	
	local function toggleSelectOutfit()
		-- upvalues: p1 (copy), HasFindResult (copy), CryoModule (upval), ItemId (ref)
		if p1.props.multiSelect then
			p1.props.selectionUpdated(if HasFindResult then CryoModule.List.removeValue(p1.props.selectedOutfits, ItemId) else CryoModule.List.join(p1.props.selectedOutfits, { ItemId }))
			
			return
		end
		if HasFindResult then
			p1.props.selectionUpdated({})
			
			if p1.props.onToggleOutfitCard then
				p1.props.onToggleOutfitCard(false)
				
				return
			end
		else
			p1.props.selectionUpdated({ ItemId })
			
			if p1.props.onToggleOutfitCard then
				p1.props.onToggleOutfitCard(true, ItemId)
			end
		end
	end
	
	local Name = nil
	local Thumbnail = nil
	
	if ItemId then
		local OutfitInfo = p1.props.outfitInfos[tostring(ItemId)]
		Name = OutfitInfo and OutfitInfo.name or nil
		Thumbnail = GetRbxthumbWithTypeSizeAndOptionsFunction(ItemId, Constants.RbxthumbTypes.Outfit, 150)
		
		if OutfitInfo then
			Thumbnail ..= "&filters=" .. OutfitInfo.updateCounter
		end
	end
	local ItemTileTitleMaxLines = if not p1.props.showCustomOutfitNames then 0 else ConstantsModule1.ItemTileTitleMaxLines
	
	return if FFlagAXManageOutfitsCatalogItemCard then ReactModule.createElement(OutfitSelectionGridItemModule, {
		useCatalogItemCard = true,
		isSelected = HasFindResult,
		multiSelect = p1.props.multiSelect,
		toggleSelectOutfit = toggleSelectOutfit,
		name = if p1.props.showCustomOutfitNames then Name else nil,
		thumbnail = Thumbnail,
		itemId = ItemId,
		selectionUpdated = p1.props.selectionUpdated,
		selectedOutfits = p1.props.selectedOutfits,
		onToggleOutfitCard = p1.props.onToggleOutfitCard,
		itemStatus = getOutfitItemStatus(ItemId and p1.props.outfitInfos[tostring(ItemId)] or nil)
	}) elseif FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then ReactModule.createElement(OutfitSelectionGridItemModule, {
		isSelected = HasFindResult,
		multiSelect = p1.props.multiSelect,
		itemIconType = p1:getItemIconType(ItemId),
		toggleSelectOutfit = toggleSelectOutfit,
		name = Name,
		titleTextLineCount = ItemTileTitleMaxLines,
		thumbnail = Thumbnail,
		itemId = ItemId,
		selectionUpdated = p1.props.selectionUpdated,
		selectedOutfits = p1.props.selectedOutfits,
		onToggleOutfitCard = p1.props.onToggleOutfitCard
	}) else ReactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then ItemTile else Focusable[ItemTile], {
		isSelected = HasFindResult,
		multiSelect = p1.props.multiSelect,
		itemIconType = p1:getItemIconType(ItemId),
		onActivated = toggleSelectOutfit,
		name = Name,
		titleTextLineCount = ItemTileTitleMaxLines,
		thumbnail = Thumbnail,
		Selectable = if FFlagAXMigrateAXToGlobalAutofocus then true else nil,
		inputBindings = if FFlagAXMigrateAXToGlobalAutofocus then nil else {
			ToggleSelect = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, toggleSelectOutfit, {
				key = if HasFindResult then "Feature.Avatar.Action.Unselect" else "Feature.Avatar.Action.Select"
			})
		}
	})
end

function OutfitSelectionGrid.renderWithProviders(p1, p2, p3)
	-- upvalues: ConstantsModule1 (copy), UtilsModule (copy), ReactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), AXRefreshScrollingFrameWithLoadMoreModule (copy), FFlagAXFixGamepadNavigationOnOutfitManagement (copy), FitFrameVertical (copy), ConstantsModule (copy), LoadableGridViewModule (copy), CustomMetricsGetter (copy), ForwardRefResult (copy), FFlagRenameDeprecatedUIBloxTokens (copy), LoadingBarWithThemeModule (copy), EmptyState (copy), FFlagAXUpdateSlotBasedEditorToastAndPrompts (copy), IconsNavigationPushBack (copy)
	local v1: boolean = p1.props.hasMoreItems and #p1.props.editableOwnedOutfitIds == 0
	local EditableOwnedOutfitIds = if v1 then nil else p1.props.editableOwnedOutfitIds or nil
	local ShimmerCardsToDisplay = ConstantsModule1.ShimmerCardsToDisplay
	local CountEditableOwnedOutfitIds = EditableOwnedOutfitIds and #EditableOwnedOutfitIds or ShimmerCardsToDisplay
	local IsCountEditableOwnedOutfitIdsAbove = CountEditableOwnedOutfitIds > 0
	local _Font = p2.Font
	local ScaledBaseSize = _Font.BaseSize * _Font.Header2.RelativeSize
	local GridItemHeightGetterResult = if p1.props.showCustomOutfitNames then UtilsModule.GridItemHeightGetter(ConstantsModule1.ItemTileType.BundleItemTile, ScaledBaseSize) else UtilsModule.GridItemHeightGetter(ConstantsModule1.ItemTileType.BundleItemTileNoText)
	local LoadableGridViewRef = if IsCountEditableOwnedOutfitIdsAbove then p1.loadableGridViewRef else p1.emptyStateRef
	local ItemType = p3.noItemsLabel:gsub("({itemType})", p3.itemType)
	local EnableContinuousLoad = p1.props.enableContinuousLoad
	local IsFetchingMore = p1.props.isFetchingMore or v1
	local HasMoreItems = not IsFetchingMore and p1.props.hasMoreItems
	local LoadMoreItems = if HasMoreItems and EnableContinuousLoad then p1.props.loadMoreItems else nil
	local NoEnableContinuousLoad: boolean = HasMoreItems and not EnableContinuousLoad
	
	return ReactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		[ReactModule.Change.AbsoluteSize] = p1.absoluteSizeChanged,
		NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.NextSelectionLeft,
		NextSelectionRight = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.NextSelectionRight,
		NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.NextSelectionDown,
		NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.NextSelectionUp,
		ref = p1.props.forwardRef,
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else LoadableGridViewRef,
		restorePreviousChildFocus = not FFlagAXMigrateAXToGlobalAutofocus or nil
	}, {
		RefreshScrollingFrameWithLoadMore = IsCountEditableOwnedOutfitIdsAbove and ReactModule.createElement(AXRefreshScrollingFrameWithLoadMoreModule, {
			BackgroundTransparency = 1,
			createEndOfScrollElement = false,
			Position = UDim2.fromOffset(0, 0),
			Size = UDim2.fromScale(1, 1),
			parentAppPage = p1.props.pageOwner,
			onThresholdReached = LoadMoreItems,
			Selectable = not FFlagAXFixGamepadNavigationOnOutfitManagement and nil
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				[ReactModule.Change.AbsoluteContentSize] = p1.contentSizeChanged
			}),
			ListWrapper = ReactModule.createElement(FitFrameVertical, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				margin = {
					top = ConstantsModule.ItemsGridTopPadding,
					bottom = ConstantsModule.ItemsGridBottomPadding,
					left = ConstantsModule.ItemsGridSidePadding / 2,
					right = ConstantsModule.ItemsGridSidePadding / 2
				}
			}, {
				LoadableGridView = ReactModule.createElement(LoadableGridViewModule, {
					getItemMetrics = CustomMetricsGetter,
					items = EditableOwnedOutfitIds,
					totalNumItems = CountEditableOwnedOutfitIds,
					renderItem = function(p4)
						-- upvalues: p1 (copy)
						return p1:renderItem(p4)
					end,
					getItemHeight = GridItemHeightGetterResult,
					windowHeight = p1.props.screenSize.Y,
					ref = p1.loadableGridViewRef,
					NextSelectionDown = if ForwardRefResult then p1.loadMoreRef else nil
				})
			}),
			LoadMoreButton = if NoEnableContinuousLoad and ForwardRefResult then ReactModule.createElement(ForwardRefResult, {
				LayoutOrder = 2,
				onActivated = p1.onLoadMoreButtonActivated,
				ref = p1.loadMoreRef,
				NextSelectionUp = p1.loadableGridViewRef
			}) else nil,
			LoadingBar = if IsFetchingMore then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_1400 else p2.Tokens.Global.Size_700)
			}, {
				LoadingBar = ReactModule.createElement(LoadingBarWithThemeModule)
			}) else nil
		}),
		EmptyState = not IsCountEditableOwnedOutfitIdsAbove and ReactModule.createElement(EmptyState, {
			buttonIcon = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then "" else IconsNavigationPushBack,
			icon = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then "" else nil,
			buttonText = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then p3.backLabel else nil,
			iconSize = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then UDim2.fromScale(0, 0) else nil,
			onActivated = p1.props.goBack,
			text = ItemType,
			ref = p1.emptyStateRef
		})
	})
end

function OutfitSelectionGrid.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy), FFlagAXUpdateSlotBasedEditorToastAndPrompts (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), FFlagAXUpdateSlotBasedEditorToastAndPrompts (upval), p1 (copy)
		return WithLocalizationFunction({
			noItemsLabel = "Feature.Avatar.Label.NoItems",
			itemType = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then "Feature.Avatar.Label.Avatars" else "Feature.Catalog.Label.Characters",
			backLabel = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then "Feature.Avatar.Label.Back" else nil
		})(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function OutfitSelectionGrid.didMount(p1)
	if p1.props.hasMoreItems then
		p1.props.loadMoreItems()
	end
end

function OutfitSelectionGrid.didUpdate(p1, p2, _)
	-- upvalues: CryoModule (copy)
	if p1.props.multiSelect ~= p2.multiSelect and not p1.props.multiSelect then
		p1.props.selectionUpdated({})
	end
	local IsNotSelectedOutfitsMatch = p1.props.selectedOutfits ~= p2.selectedOutfits
	
	if p1.props.editableOwnedOutfitIds ~= p2.editableOwnedOutfitIds or IsNotSelectedOutfitsMatch then
		local t = {}
		local Flag = false
		
		for _, selectedOutfit in p1.props.selectedOutfits do
			if CryoModule.List.find(p1.props.editableOwnedOutfitIds, selectedOutfit) then
				t[#t + 1] = selectedOutfit
			else
				Flag = true
			end
		end
		if Flag then
			p1.props.selectionUpdated(t)
		end
	end
end

local v1 = RoactRoduxModule.connect(function(p3, _)
	-- upvalues: ConstantsModule (copy)
	return {
		editableOwnedOutfitIds = p3.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[ConstantsModule.EditableCharacterKey] or {},
		outfitInfos = p3.AvatarExperience.AvatarEditor.OutfitInfos,
		screenSize = p3.ScreenSize,
		hasMoreItems = not p3.AvatarExperience.AvatarEditor.PageFinished[ConstantsModule.EditableCharacterKey]
	}
end)((RoactAppPolicy.connect(function(p3, _)
	return {
		showCustomOutfitNames = p3.getCustomOutfitNames(),
		enableContinuousLoad = p3.getEnableContinuousLoad()
	}
end)(OutfitSelectionGrid)))

return ReactModule.forwardRef(function(p3, ForwardRef)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), GetEditableOutfitsModule (copy), UseRequestModule (copy), RequestStatusEnumModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), UseFocusGuiObjectFunction (copy), v1 (ref), CryoModule (copy), RoactGamepadModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRequestModuleResult, UseRequestModuleResult2 = UseRequestModule((ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), GetEditableOutfitsModule (upval)
		return UseDispatchResult(GetEditableOutfitsModule())
	end, {})))
	local IsStatusMatch = UseRequestModuleResult.status == RequestStatusEnumModule.Pending
	
	return if FFlagAXMigrateAXToGlobalAutofocus then ReactModule.createElement(v1, CryoModule.Dictionary.join(p3, {
		forwardRef = ForwardRef,
		loadMoreItems = UseRequestModuleResult2,
		isFetchingMore = IsStatusMatch,
		focusGuiObject = UseFocusGuiObjectFunction()
	})) else RoactGamepadModule.withFocusController(function(FocusController)
		-- upvalues: ReactModule (upval), v1 (upval), CryoModule (upval), p3 (copy), ForwardRef (copy), UseRequestModuleResult2 (copy), IsStatusMatch (copy)
		return ReactModule.createElement(v1, CryoModule.Dictionary.join(p3, {
			forwardRef = ForwardRef,
			loadMoreItems = UseRequestModuleResult2,
			isFetchingMore = IsStatusMatch,
			focusController = FocusController
		}))
	end)
end)