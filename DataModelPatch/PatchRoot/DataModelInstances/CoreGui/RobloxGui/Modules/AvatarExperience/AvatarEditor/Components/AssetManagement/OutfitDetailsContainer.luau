local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FitFrameModule = require(CorePackages.Packages.FitFrame)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local CompactInlineBannerModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.CompactInlineBanner)
local CompactInlineBannerPlacementModule = require(Modules.AvatarExperience.Common.Enum.CompactInlineBannerPlacement)
local CompactInlineBannerVariantModule = require(Modules.AvatarExperience.Common.Enum.CompactInlineBannerVariant)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local LoadableGridViewModule = require(Modules.AvatarExperience.Common.Components.LoadableGridView)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ItemInfoListModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoList)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local NavigateDownFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local InventoryItemAvailability = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability
local WithStyleFunction = UIBloxModule.Style.withStyle
local GetPageMarginFunction = UIBloxModule.App.Container.getPageMargin
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local ItemTile = UIBloxModule.Tile.ItemTile
local CatalogItemCard = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard
local FoundationModule = require(CorePackages.Packages.Foundation)
local Skeleton = FoundationModule.Skeleton
local FitFrameVertical = FitFrameModule.FitFrameVertical
local FitTextLabel = FitFrameModule.FitTextLabel
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXModeratedItemsFlow = AvatarExperienceFlagsModule.FFlagAXModeratedItemsFlow
local FFlagAXModeratedItemIconUpdates = AvatarExperienceFlagsModule.FFlagAXModeratedItemIconUpdates
local FFlagAXFixGamepadNavigationOnOutfitManagement = AvatarExperienceFlagsModule.FFlagAXFixGamepadNavigationOnOutfitManagement
local config = {
	toastMessage = "CommonUI.Messages.Label.ActionNotAvailableOnCurrentDevice",
	isLocalized = false,
	toastType = require(CorePackages.Workspace.Packages.ToastRodux).Enums.ToastType.InformationMessage
}
local CustomMetricsGetter = UIBloxModule.App.Grid.GridMetrics.makeCustomMetricsGetter({ minimumItemsPerRow = 3, minimumItemWidth = 110 })
local OutfitDetailsContainer = RoactModule.PureComponent:extend("OutfitDetailsContainer")
OutfitDetailsContainer.validateProps = TModule.strictInterface({
	outfitId = TModule.string,
	itemType = TModule.optional(TModule.string),
	itemsGridRef = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	showCustomOutfitNames = TModule.boolean,
	isWebViewSupported = TModule.boolean,
	outfitInfo = TModule.optional(TModule.table),
	outfitName = TModule.optional(TModule.string),
	itemsList = if FFlagAXModeratedItemsFlow then TModule.optional(TModule.array(TModule.tuple(TModule.union(TModule.string, TModule.table), TModule.optional(TModule.string)))) else TModule.optional(TModule.array(TModule.string)),
	screenSize = TModule.Vector2,
	assetInfos = TModule.table,
	navigateDown = TModule.callback,
	setCurrentToastMessage = TModule.callback,
	bottomPadding = if FFlagAXFixGamepadNavigationOnOutfitManagement then TModule.optional(TModule.number) else nil
})

function OutfitDetailsContainer.init(p1)
	-- upvalues: RoactModule (copy), GetPageMarginFunction (copy), AppPage (copy), config (copy)
	p1.attributionRef = RoactModule.createRef()
	p1.itemsGridRef = p1.props.itemsGridRef or RoactModule.createRef()
	p1:setState({ margin = GetPageMarginFunction(p1.props.screenSize.X) })
	
	function p1.containerSizeChanged(Frame)
		-- upvalues: GetPageMarginFunction (upval), p1 (copy)
		local PageMargin = GetPageMarginFunction(Frame.AbsoluteSize.X)
		
		if PageMargin ~= p1.state.margin then
			p1:setState({ margin = PageMargin })
		end
	end
	
	function p1.goToAppealsPortal()
		-- upvalues: p1 (copy), AppPage (upval), config (upval)
		if p1.props.isWebViewSupported then
			p1.props.navigateDown({
				detail = "https://www.roblox.com/report-appeals#/",
				name = AppPage.GenericWebPage,
				extraProps = { title = "" }
			})
			
			return
		else
			p1.props.setCurrentToastMessage(config)
		end
	end
end

function OutfitDetailsContainer.renderOutfitName(p1, p2)
	-- upvalues: RoactModule (copy), FitTextLabel (copy), Skeleton (copy)
	local Theme = p2.Theme
	local _Font = p2.Font
	
	return if p1.props.outfitName then RoactModule.createElement(FitTextLabel, {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		TextWrapped = true,
		width = UDim.new(1, 0),
		Text = p1.props.outfitName,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, 0, 0, _Font.Header1.RelativeSize * _Font.BaseSize),
		TextColor3 = Theme.TextEmphasis.Color,
		TextTransparency = Theme.TextEmphasis.Transparency,
		Font = _Font.Header1.Font,
		TextSize = _Font.Header1.RelativeSize * _Font.BaseSize
	}) else RoactModule.createElement(Skeleton, {
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, _Font.Header1.RelativeSize * _Font.BaseSize)
	})
end

function OutfitDetailsContainer.renderOutfitThumbnail(p1)
	-- upvalues: Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), UtilsModule (copy), ConstantsModule (copy), RoactModule (copy), LoadableImage (copy)
	local RbxthumbWithTypeSizeAndOptions = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.props.outfitId, Constants.RbxthumbTypes.Outfit, 420)
	local ImageTransparency: number? = nil
	
	if UtilsModule.isModerationPendingOrRejected(p1:getModerationStatus()) then
		RbxthumbWithTypeSizeAndOptions = ConstantsModule.BrokenAvatarThumbnail
		ImageTransparency = 0.25
	end
	return RoactModule.createElement("Frame", {
		LayoutOrder = 3,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -24, 0, 300)
	}, {
		AspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}),
		MaxSize = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(1e999, 300) }),
		LoadableImage = RoactModule.createElement(LoadableImage, {
			BackgroundTransparency = 1,
			useShimmerAnimationWhileLoading = true,
			ZIndex = 1,
			ImageTransparency = ImageTransparency,
			Image = RbxthumbWithTypeSizeAndOptions,
			Size = UDim2.fromScale(1, 1)
		})
	})
end

function OutfitDetailsContainer.renderItemWithAvailabilityStatus(p1, Entry)
	-- upvalues: Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), RoactModule (copy), CatalogItemCard (copy), FoundationModule (copy), InventoryItemAvailability (copy), FFlagAXModeratedItemIconUpdates (copy)
	local Entry1 = Entry[1]
	local Entry2 = Entry[2]
	local Name = nil
	local Image = nil
	
	if typeof(Entry1) ~= "table" then
		Image = GetRbxthumbWithTypeSizeAndOptionsFunction(Entry1, Constants.RbxthumbTypes.Asset, 150)
		local AssetInfo = p1.props.assetInfos[Entry1]
		Name = AssetInfo and AssetInfo.name
		
		if AssetInfo and AssetInfo.outfitModerationStatus then
			Image ..= `&filters=__{AssetInfo.outfitModerationStatus}__`
		end
	end
	return RoactModule.createElement(CatalogItemCard, {
		title = Name,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		presentationSlot = RoactModule.createElement(FoundationModule.Image, {
			tag = "size-full clip radius-medium",
			BackgroundTransparency = 1,
			Image = Image,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop
		}),
		itemStatus = if Entry2 == InventoryItemAvailability.Unavailable then {
			type = "placeholder",
			iconType = if FFlagAXModeratedItemIconUpdates then "Unavailable" else "Error"
		} elseif Entry2 == InventoryItemAvailability.Revoked then { type = "placeholder", iconType = "Error" } else nil
	})
end

function OutfitDetailsContainer.renderItem(p1, p2)
	-- upvalues: Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), RoactModule (copy), ItemTile (copy), ConstantsModule1 (copy)
	local Name = nil
	local Text = nil
	
	if typeof(p2) ~= "table" then
		Text = GetRbxthumbWithTypeSizeAndOptionsFunction(p2, Constants.RbxthumbTypes.Asset, 150)
		local AssetInfo = p1.props.assetInfos[p2]
		Name = AssetInfo and AssetInfo.name
		
		if AssetInfo and AssetInfo.outfitModerationStatus then
			Text ..= `&filters=__{AssetInfo.outfitModerationStatus}__`
		end
	end
	return RoactModule.createElement(ItemTile, {
		name = Name,
		titleTextLineCount = ConstantsModule1.ItemTileTitleMaxLines,
		thumbnail = Text
	})
end

function OutfitDetailsContainer.renderItemsGrid(p1, p2)
	-- upvalues: ConstantsModule1 (copy), UtilsModule (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FitFrameVertical (copy), Focusable (copy), LoadableGridViewModule (copy), CustomMetricsGetter (copy), FFlagAXModeratedItemsFlow (copy)
	local ItemsList = p1.props.itemsList
	local ShimmerCardsToDisplay = ConstantsModule1.ShimmerCardsToDisplay
	local _Font = p2.Font
	
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then FitFrameVertical else Focusable[FitFrameVertical], {
		width = UDim.new(1, 0),
		LayoutOrder = 4,
		BackgroundTransparency = 1,
		[RoactModule.Ref] = p1.itemsGridRef,
		NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.attributionRef,
		NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.NextSelectionUp
	}, {
		LoadableGridView = RoactModule.createElement(LoadableGridViewModule, {
			getItemMetrics = CustomMetricsGetter,
			items = ItemsList,
			totalNumItems = ItemsList and #ItemsList or ShimmerCardsToDisplay,
			renderItem = if FFlagAXModeratedItemsFlow then function(p3)
				-- upvalues: p1 (copy)
				return p1:renderItemWithAvailabilityStatus(p3)
			end else function(p3)
				-- upvalues: p1 (copy)
				return p1:renderItem(p3)
			end,
			getItemHeight = UtilsModule.GridItemHeightGetter(ConstantsModule1.ItemTileType.BundleItemTile, _Font.BaseSize * _Font.Header2.RelativeSize),
			windowHeight = p1.props.screenSize.Y
		})
	})
end

function OutfitDetailsContainer.getModerationStatus(p1)
	local OutfitInfo = p1.props.outfitInfo
	
	return if OutfitInfo then OutfitInfo.moderationStatus else nil
end

function OutfitDetailsContainer.renderWithProviders(p1, p2, p3)
	-- upvalues: FFlagAXFixGamepadNavigationOnOutfitManagement (copy), FitFrameModule (copy), UtilsModule (copy), RoactModule (copy), FitFrameVertical (copy), CompactInlineBannerModule (copy), CompactInlineBannerVariantModule (copy), CompactInlineBannerPlacementModule (copy), ItemInfoListModule (copy)
	local OutfitInfo = p1.props.outfitInfo
	local CreatingUniverseId = OutfitInfo and OutfitInfo.creatingUniverseId or nil
	local Theme = p2.Theme
	local QuadResult = if FFlagAXFixGamepadNavigationOnOutfitManagement then FitFrameModule.Rect.quad(p1.state.margin, p1.state.margin, p1.props.bottomPadding or p1.state.margin, p1.state.margin) else FitFrameModule.Rect.square(p1.state.margin)
	local ModerationStatus = p1:getModerationStatus()
	local IsModerationStatusMatch = ModerationStatus == Enum.ModerationStatus.ReviewedRejected
	
	return RoactModule.createElement(FitFrameVertical, {
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Theme.BackgroundDefault.Transparency,
		BorderSizePixel = 0,
		width = UDim.new(1, 0),
		contentPadding = UDim.new(0, 24),
		margin = QuadResult,
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		[RoactModule.Change.AbsoluteSize] = p1.containerSizeChanged
	}, {
		ItemName = p1.props.showCustomOutfitNames and p1:renderOutfitName(p2),
		FullBleedFrame = UtilsModule.isModerationPendingOrRejected(ModerationStatus) and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, QuadResult.left + QuadResult.right, 0, 0),
			Position = UDim2.fromOffset(-QuadResult.left, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ModerationStatusBanner = if IsModerationStatusMatch then RoactModule.createElement(CompactInlineBannerModule, {
				contentText = p3.moderated,
				variant = CompactInlineBannerVariantModule.Alert,
				placement = CompactInlineBannerPlacementModule.Bleed,
				actionText = p3.details,
				onActivated = p1.goToAppealsPortal
			}) else RoactModule.createElement(CompactInlineBannerModule, {
				contentText = p3.pending,
				variant = CompactInlineBannerVariantModule.Default,
				placement = CompactInlineBannerPlacementModule.Bleed
			})
		}),
		ItemThumbnail = p1:renderOutfitThumbnail(p3),
		ItemsGrid = p1:renderItemsGrid(p2),
		ItemInfoList = if CreatingUniverseId then RoactModule.createElement(ItemInfoListModule, {
			LayoutOrder = 5,
			itemId = p1.props.outfitId,
			outfitInfo = p1.props.outfitInfo,
			itemType = p1.props.itemType,
			attributionRef = p1.attributionRef,
			NextSelectionUp = if FFlagAXFixGamepadNavigationOnOutfitManagement then nil else p1.itemsGridRef
		}) else nil
	})
end

function OutfitDetailsContainer.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), p1 (copy)
		return WithLocalizationFunction({
			details = "Feature.Avatar.Label.DetailsButton",
			moderated = "Feature.Catalog.Message.AvatarModerationModerated",
			pending = "Feature.Catalog.Message.AvatarModerationPending"
		})(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

local v1 = RoactAppPolicy.connect(function(p1, _)
	return {
		showCustomOutfitNames = p1.getCustomOutfitNames(),
		isWebViewSupported = p1.getWebViewSupport()
	}
end)(OutfitDetailsContainer)
local MemoizeResult = MemoizeFunction(function(List)
	-- upvalues: FFlagAXModeratedItemsFlow (copy)
	local List1 = {}
	
	for _, value in List do
		for i, value1 in value do
			table.insert(List1, if FFlagAXModeratedItemsFlow then { i, value1.availabilityStatus } else i)
		end
	end
	return List1
end)

return RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: MemoizeResult (copy)
	local OutfitInfos = p1.AvatarExperience.AvatarEditor.OutfitInfos
	local Name = nil
	local ItemsList = nil
	
	if OutfitInfos[p2.outfitId] then
		Name = OutfitInfos[p2.outfitId].name
		ItemsList = MemoizeResult(OutfitInfos[p2.outfitId].assets)
	end
	return {
		outfitInfo = OutfitInfos[p2.outfitId],
		outfitName = Name,
		itemsList = ItemsList,
		screenSize = p1.ScreenSize,
		assetInfos = p1.AvatarExperience.Common.AssetInfos
	}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), SetCurrentToastMessageModule (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(p1))
				
				return
			else
				Callback(NavigateDownFunction(p1))
			end
		end,
		setCurrentToastMessage = function(p1)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval)
			Callback(SetCurrentToastMessageModule(p1))
		end
	}
end)(v1)