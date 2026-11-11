local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local CenteredModalViewModule = require(Modules.AvatarExperience.Common.Components.CenteredModalView)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local LogOnOverlayClosedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed
local AvailableToSellListModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.SellPage.AvailableToSellList)
local CurrentlySellingListModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.SellPage.CurrentlySellingList)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local WithStackVisibilityWrapperModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local CloseFocusedScreenModule = require(Modules.AvatarExperience.Common.Thunks.CloseFocusedScreen)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local IsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).isGamepadInput
local FetchSellPageDataModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchSellPageData)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local FFlagAXRemoveSellPageAndChildrenGamepadBindings = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRemoveSellPageAndChildrenGamepadBindings
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local VerticalScrollViewWithMargin = UIBloxModule.App.Container.VerticalScrollViewWithMargin
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local FFlagUpdateNoInternetConnectionText = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagUpdateNoInternetConnectionText
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local SellPage = RoactModule.PureComponent:extend("SellPage")

function SellPage.init(p1)
	-- upvalues: UserInputService (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), RoactModule (copy), IsGamepadInputFunction (copy), LogOnOverlayClosedFunction (copy)
	p1.state = {
		isWearAfterPurchaseChecked = false,
		canvasSizeY = 0,
		lastInputType = UserInputService:GetLastInputType()
	}
	
	function p1.fetchSellPageData()
		-- upvalues: p1 (copy)
		return p1.props.fetchSellPageData(p1.props.networking, p1.props.itemId, p1.props.localUserId)
	end
	
	function p1.onContentSizeChanged(p2)
		-- upvalues: p1 (copy)
		p1:setState({ canvasSizeY = p2.AbsoluteContentSize.Y + 48 })
	end
	
	p1.focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.focusController or RoactGamepadModule.createFocusController()
	p1.currentlySellingListRef = RoactModule.createRef()
	p1.availableToSellListRef = RoactModule.createRef()
	p1.topBarRef = RoactModule.createRef()
	p1.emptyStateRef = RoactModule.createRef()
	
	function p1.onOverlayClosed()
		-- upvalues: IsGamepadInputFunction (upval), p1 (copy), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval)
		local IsGamepadInput = IsGamepadInputFunction(p1.state.lastInputType)
		LogOnOverlayClosedFunction("SellPage", IsGamepadInput)
		
		if not FFlagAXMigrateAXToGlobalAutofocus and IsGamepadInput then
			p1.focusController.captureFocus()
		end
	end
	
	function p1.goBack()
		-- upvalues: p1 (copy)
		p1.props.closeFocusedScreen(p1.props.navigation)
	end
end

function SellPage.didMount(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), IsGamepadInputFunction (copy)
	p1.fetchSellPageData()
	
	if not FFlagAXMigrateAXToGlobalAutofocus and IsGamepadInputFunction(p1.state.lastInputType) then
		p1.focusController.captureFocus()
	end
end

if not FFlagAXMigrateAXToGlobalAutofocus then
	function SellPage.didUpdate(p1, p2)
		-- upvalues: IsGamepadInputFunction (copy), RetrievalStatusModule (copy)
		local FetchingStatus = p1.props.fetchingStatus
		
		if IsGamepadInputFunction(p1.state.lastInputType) and p2.currentlySellingListData and p1.props.currentlySellingListData and p2.availableItemsToSell and p1.props.availableItemsToSell and FetchingStatus == RetrievalStatusModule.Done and #p2.currentlySellingListData ~= #p1.props.currentlySellingListData then
			if #p1.props.currentlySellingListData == 0 then
				p1.focusController.moveFocusTo(p1.availableToSellListRef)
				
				return
			end
			p1.focusController.moveFocusTo(p1.currentlySellingListRef)
		end
	end
end
function SellPage.renderOnLoaded(p1, _)
	-- upvalues: RoactModule (copy), TopBarModule (copy)
	return RoactModule.createElement(TopBarModule.PageContent, { ZIndex = 2 }, { ScrollingView = p1:renderScrollingView() })
end

function SellPage.renderScrollingView(p1)
	-- upvalues: RoactModule (copy), VerticalScrollViewWithMargin (copy), CurrentlySellingListModule (copy), AvailableToSellListModule (copy)
	local ItemId = p1.props.itemId
	
	return RoactModule.createElement(VerticalScrollViewWithMargin, {
		size = UDim2.fromScale(1, 1),
		canvasSizeY = UDim.new(0, p1.state.canvasSizeY)
	}, {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, 24),
			SortOrder = Enum.SortOrder.LayoutOrder,
			[RoactModule.Change.AbsoluteContentSize] = p1.onContentSizeChanged
		}),
		PagePadding = RoactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 24),
			PaddingBottom = UDim.new(0, 24)
		}),
		CurrentlySellingList = RoactModule.createElement(CurrentlySellingListModule, {
			itemId = ItemId,
			LayoutOrder = 2,
			[RoactModule.Ref] = p1.currentlySellingListRef,
			NextSelectionUp = p1.topBarRef,
			NextSelectionDown = if p1.props.availableItemsToSell == nil or #p1.props.availableItemsToSell <= 0 then nil else p1.availableToSellListRef,
			onOverlayClosed = p1.onOverlayClosed
		}),
		AvailableToSellList = RoactModule.createElement(AvailableToSellListModule, {
			itemId = ItemId,
			itemType = p1.props.itemType,
			LayoutOrder = 3,
			[RoactModule.Ref] = p1.availableToSellListRef,
			NextSelectionUp = if p1.props.currentlySellingListData == nil or #p1.props.currentlySellingListData <= 0 then p1.topBarRef else p1.currentlySellingListRef,
			onOverlayClosed = p1.onOverlayClosed
		})
	})
end

function SellPage.renderOnFailed(p1, p2)
	-- upvalues: RoactModule (copy), EmptyState (copy)
	return RoactModule.createElement(EmptyState, {
		onActivated = p1.fetchSellPageData,
		text = p2.failedMessage,
		[RoactModule.Ref] = p1.emptyStateRef,
		NextSelectionUp = p1.topBarRef
	})
end

function SellPage.render(p1)
	-- upvalues: RoactModule (copy), CenteredModalViewModule (copy)
	return RoactModule.createElement(CenteredModalViewModule, {}, { Content = p1:renderContents() })
end

function SellPage.renderContents(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy), FFlagUpdateNoInternetConnectionText (copy), RetrievalStatusModule (copy), RoactModule (copy), Focusable (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagAXRemoveSellPageAndChildrenGamepadBindings (copy), RoactGamepadModule (copy), TopBarModule (copy), GamepadFocusHandlerForPageModule (copy), LoadingStateContainer (copy), RetrievalStatus (copy), ExternalEventConnection (copy), UserInputService (copy)
	local GlobalGuiInset = p1.props.globalGuiInset
	local FetchingStatus = p1.props.fetchingStatus
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), FFlagUpdateNoInternetConnectionText (upval), FetchingStatus (copy), RetrievalStatusModule (upval), p1 (copy), RoactModule (upval), Focusable (upval), GlobalGuiInset (copy), FFlagAXMigrateAXToGlobalAutofocus (upval), FFlagAXRemoveSellPageAndChildrenGamepadBindings (upval), RoactGamepadModule (upval), TopBarModule (upval), GamepadFocusHandlerForPageModule (upval), LoadingStateContainer (upval), RetrievalStatus (upval), ExternalEventConnection (upval), UserInputService (upval)
		return WithLocalizationFunction({
			title = "Feature.Catalog.Heading.SellItem",
			failedMessage = if FFlagUpdateNoInternetConnectionText then "Feature.DisplayName.ErrorMessage.SomethingWentWrong" else "Feature.EmptyStatePage.Message.NoInternet"
		})(function(p3)
			-- upvalues: p2 (copy), FetchingStatus (upval), RetrievalStatusModule (upval), p1 (upval), RoactModule (upval), Focusable (upval), GlobalGuiInset (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), FFlagAXRemoveSellPageAndChildrenGamepadBindings (upval), RoactGamepadModule (upval), TopBarModule (upval), GamepadFocusHandlerForPageModule (upval), LoadingStateContainer (upval), RetrievalStatus (upval), ExternalEventConnection (upval), UserInputService (upval)
			local Theme = p2.Theme
			local AvailableToSellListRef = nil
			
			if FetchingStatus == RetrievalStatusModule.Done then
				if p1.props.currentlySellingListData == nil or #p1.props.currentlySellingListData <= 0 then
					if p1.props.availableItemsToSell == nil or #p1.props.availableItemsToSell <= 0 then
						if FetchingStatus == RetrievalStatusModule.Failed then
							AvailableToSellListRef = p1.emptyStateRef
						end
					else
						AvailableToSellListRef = p1.availableToSellListRef
					end
				else
					AvailableToSellListRef = p1.currentlySellingListRef
				end
			end
			return RoactModule.createElement(Focusable.Frame, {
				BorderSizePixel = 0,
				restorePreviousChildFocus = true,
				BackgroundColor3 = Theme.BackgroundDefault.Color,
				BackgroundTransparency = Theme.BackgroundDefault.Transparency,
				Position = UDim2.new(0, GlobalGuiInset.left, 0, GlobalGuiInset.top),
				Size = UDim2.fromScale(1, 1),
				defaultChild = AvailableToSellListRef,
				focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.focusController,
				inputBindings = if FFlagAXMigrateAXToGlobalAutofocus or FFlagAXRemoveSellPageAndChildrenGamepadBindings then nil else {
					NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p1.goBack)
				}
			}, {
				TopBar = RoactModule.createElement(TopBarModule.Container, {
					ZIndex = 2,
					titleText = p3.title,
					[RoactModule.Ref] = p1.topBarRef,
					NextSelectionDown = AvailableToSellListRef,
					leftItem = TopBarModule.BackButton
				}),
				GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(GamepadFocusHandlerForPageModule, { focusController = p1.focusController }),
				LoadingStateContainer = RoactModule.createElement(LoadingStateContainer, {
					dataStatus = RetrievalStatus.fromRawValue(FetchingStatus),
					renderOnLoaded = function()
						-- upvalues: p1 (upval), p2 (upval)
						return p1:renderOnLoaded(p2)
					end,
					renderOnFailed = function()
						-- upvalues: p1 (upval), p3 (copy)
						return p1:renderOnFailed(p3)
					end
				}),
				LastInputChangedListener = RoactModule.createElement(ExternalEventConnection, {
					event = UserInputService.LastInputTypeChanged,
					callback = function(LastInputType)
						-- upvalues: p1 (upval)
						p1:setState({ lastInputType = LastInputType })
					end
				})
			})
		end)
	end)
end

return (WithMappedNavigationParamsModule((WithStackVisibilityWrapperModule((RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: PerformFetch (copy), CatalogConstantsModule (copy)
	local ItemId = p2.itemId
	
	return {
		fetchingStatus = PerformFetch.GetStatus(p1, CatalogConstantsModule.GetSellPageDataKey .. tostring(ItemId)),
		globalGuiInset = p1.GlobalGuiInset,
		localUserId = p1.LocalUserId,
		currentlySellingListData = p1.AvatarExperience.Catalog.Sell.CurrentlySellingAssets[ItemId],
		availableItemsToSell = p1.AvatarExperience.Catalog.Sell.AvailableToSellAssets[ItemId]
	}
end, function(Callback)
	-- upvalues: FetchSellPageDataModule (copy), CloseFocusedScreenModule (copy)
	return {
		fetchSellPageData = function(p1, p2, p3)
			-- upvalues: Callback (copy), FetchSellPageDataModule (upval)
			Callback(FetchSellPageDataModule(p1, p2, p3))
		end,
		closeFocusedScreen = function(p1)
			-- upvalues: Callback (copy), CloseFocusedScreenModule (upval)
			Callback(CloseFocusedScreenModule(p1))
		end
	}
end)(SellPage))))))))