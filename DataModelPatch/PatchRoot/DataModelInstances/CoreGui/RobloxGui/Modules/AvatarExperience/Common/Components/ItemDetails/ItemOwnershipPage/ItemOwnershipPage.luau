local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UsePropertyFunction = require(CorePackages.Workspace.Packages.GuiObjectUtils).useProperty
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UseMostRecentFocusBehaviorFunction = require(CorePackages.Packages.ReactFocusNavigation).useMostRecentFocusBehavior
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UseTableWrappedCallbackRefFunction = AvatarExperienceCommonModule.Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local UseRedirectFocusIntoGuiObjectFunction = AvatarExperienceCommonModule.Hooks.useRedirectFocusIntoGuiObject
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local VerticalScrollViewWithMargin = UIBloxModule.App.Container.VerticalScrollViewWithMargin
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local CenteredModalViewModule = require(Modules.AvatarExperience.Common.Components.CenteredModalView)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local OwnedItemListModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipPage.OwnedItemList)
local FetchSellPageDataModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchSellPageData)
local FetchCollectibleResellableInstancesModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local _ = require(Modules.AvatarExperience.Common.Models.CollectibleInstance)
local LogOnOverlayClosedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed
local TextModule = require(Modules.Common.Text)
local _ = require(Modules.AvatarExperience.Common.Types)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local UseFocusNavigableSurfaceRegistryConnectionFunction = FocusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local GetFFlagL2ControllerSupportModule = require(Modules.AvatarExperience.Flags.GetFFlagL2ControllerSupport)
local FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local AXMigrateItemOwnerShipPageToAutofocus = FFlagAXMigrateAXToGlobalAutofocus and game:DefineFastFlag("AXMigrateItemOwnerShipPageToAutofocus", false)
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local FFlagAppIaScrollAway = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAppIaScrollAway
local FFlagAXFixScrollAwayTopBarOverlapModule = require(Modules.AvatarExperience.Flags.FFlagAXFixScrollAwayTopBarOverlap)
local IconsActionsInfoSmall = UIBloxModule.App.ImageSet.Images["icons/actions/info_small"]

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), ItemDataModule (copy), CatalogUtilsModule (copy), ReactModule (copy), UseAppPolicyModule (copy), CatalogConstantsModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), UseDispatchFunction (copy), FetchCollectibleResellableInstancesModule (copy), FetchSellPageDataModule (copy), AvatarScreen (copy), WasLastInputGamepadFunction (copy), LogOnOverlayClosedFunction (copy), GetFFlagL2ControllerSupportModule (copy), UseNavigationFunction (copy), UseLocalizationModule (copy), TextModule (copy), UsePropertyFunction (copy), FFlagAXFixScrollAwayTopBarOverlapModule (copy), TopBarModule (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), AXMigrateItemOwnerShipPageToAutofocus (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseRedirectFocusIntoGuiObjectFunction (copy), UseMostRecentFocusBehaviorFunction (copy), UseTableWrappedCallbackRefFunction (copy), CenteredModalViewModule (copy), Focusable (copy), FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation (copy), NavigationUtilsModule (copy), GamepadFocusHandlerForPageModule (copy), VerticalScrollViewWithMargin (copy), OwnedItemListModule (copy), IconButton (copy), IconsActionsInfoSmall (copy), IconSize (copy)
	local Params = p1.navigation.state.params
	local UseStyleResult = UseStyleFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.LocalUserId
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.AvatarExperience.Catalog.UserAssets
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: Params (copy)
		return p2.AvatarExperience.Catalog.Sell.AvailableToSellAssets[Params.itemId]
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult3 = UseSelectorFunction(function(p2)
		-- upvalues: Params (copy)
		return p2.AvatarExperience.Catalog.Sell.CurrentlySellingAssets[Params.itemId]
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult4 = UseSelectorFunction(function(p2)
		-- upvalues: ItemDataModule (upval), Params (copy)
		return ItemDataModule(p2.AvatarExperience.Common, Params.itemId, Params.itemType)
	end, GetUseSelectorDeepEqualsFunction())
	local CollectibleItemId = Params.collectibleItemId
	local IsResellable = CatalogUtilsModule.IsResellable(UseSelectorResult4)
	local UseSelectorResult5 = UseSelectorFunction(function(p2)
		-- upvalues: IsResellable (copy), Params (copy)
		return if IsResellable then if Params.collectibleItemId then p2.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[Params.collectibleItemId] else {} else {}
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult6 = UseSelectorFunction(ReactModule.useCallback(function(p2)
		-- upvalues: CollectibleItemId (copy)
		return if CollectibleItemId then p2.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[CollectibleItemId] else nil
	end, { CollectibleItemId }), GetUseSelectorDeepEqualsFunction())
	
	if UseAppPolicyModule(function(p2)
		return p2.getDisableResellingCollectiblesForCompliance()
	end) and UseSelectorResult6 then
		UseSelectorResult6.resaleRestriction = CatalogConstantsModule.ResaleRestriction.Disabled
	end
	local UseSelectorResult7 = UseSelectorFunction(function(p2): boolean
		local User = p2.Users[p2.LocalUserId]
		local Membership = if User then User.membership else nil
		
		return Membership ~= nil and Membership ~= Enum.MembershipType.None
	end, GetUseSelectorDeepEqualsFunction())
	local UseRootFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useRootFocusController()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function()
		-- upvalues: Params (copy), UseDispatchResult (copy), FetchCollectibleResellableInstancesModule (upval), UseRoactServiceModuleResult (copy), UseSelectorResult (copy), FetchSellPageDataModule (upval)
		if Params.collectibleItemId then
			UseDispatchResult(FetchCollectibleResellableInstancesModule(UseRoactServiceModuleResult, Params.collectibleItemId, UseSelectorResult))
			
			return
		else
			UseDispatchResult(FetchSellPageDataModule(UseRoactServiceModuleResult, Params.itemId, UseSelectorResult))
		end
	end, {})
	local SellItemPeekView = AvatarScreen.SellItemPeekView
	local UseResult = ReactModule.useCallback(function(UserAssetId)
		-- upvalues: UseSelectorResult7 (copy), p1 (copy), AvatarScreen (upval), SellItemPeekView (copy), Params (copy), CollectibleItemId (copy)
		if UseSelectorResult7 then
			p1.navigation.navigate(SellItemPeekView, {
				itemId = Params.itemId,
				itemType = Params.itemType,
				collectibleItemId = CollectibleItemId,
				userAssetId = UserAssetId
			})
			
			return
		else
			p1.navigation.navigate(AvatarScreen.PremiumSellOnlyPrompt)
		end
	end, {
		Params.itemId,
		Params.itemType,
		Params.collectibleItemId,
		CollectibleItemId
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: WasLastInputGamepadFunction (upval), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), UseRootFocusControllerResult (copy)
		local WasLastInputGamepadResult = WasLastInputGamepadFunction()
		LogOnOverlayClosedFunction("ItemOwnershipPage", WasLastInputGamepadResult)
		
		if not FFlagAXMigrateAXToGlobalAutofocus and WasLastInputGamepadResult then
			UseRootFocusControllerResult.captureFocus()
		end
	end)
	local UseResult2 = ReactModule.useCallback(function(UserAssetId)
		-- upvalues: p1 (copy), AvatarScreen (upval), Params (copy), GetFFlagL2ControllerSupportModule (upval), UseResult1 (copy)
		p1.navigation.navigate(AvatarScreen.RemoveCurrentlySellingItemPrompt, {
			itemId = Params.itemId,
			collectibleItemId = Params.collectibleItemId,
			userAssetId = UserAssetId,
			onOverlayClosed = if GetFFlagL2ControllerSupportModule() then UseResult1 else nil
		})
	end, {
		p1.navigation,
		Params.itemId,
		Params.collectibleItemId,
		UseResult1
	})
	local UseResult3 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseResult2 (copy), UseResult (copy)
		if p3 then
			UseResult2(p2)
			
			return
		else
			UseResult(p2)
		end
	end)
	local Name = if UseSelectorResult4 then UseSelectorResult4.name else nil
	local UseResult4: (any, any, any) -> () = ReactModule.useCallback(function(List, Ids, IsOnSale)
		-- upvalues: UseSelectorResult1 (copy), Name (copy)
		if Ids == nil then return end
		for _, id in Ids do
			local UseSelectorResultEntry = UseSelectorResult1[id]
			
			if UseSelectorResultEntry then
				table.insert(List, {
					id = id,
					title = if UseSelectorResultEntry.serialNumber then "#" .. UseSelectorResultEntry.serialNumber else Name,
					salePrice = if IsOnSale then UseSelectorResultEntry.priceInRobux else nil,
					isOnHold = if IsOnSale then nil else UseSelectorResultEntry.isOnHold,
					isOnSale = IsOnSale,
					order = if UseSelectorResultEntry.serialNumber then UseSelectorResultEntry.serialNumber else id
				})
			end
		end
	end, { UseSelectorResult1 })
	local ResaleRestriction = if UseSelectorResult6 then UseSelectorResult6.resaleRestriction else CatalogConstantsModule.ResaleRestriction.None
	local Flag = false
	local List = {}
	
	if CollectibleItemId then
		if UseSelectorResult5 then
			for _, value in UseSelectorResult5 do
				if value.isHeld then
					Flag = true
				end
				table.insert(List, {
					id = value.collectibleInstanceId,
					title = if value.serialNumber then "#" .. value.serialNumber else UseSelectorResult6 and UseSelectorResult6.name or "N/A",
					salePrice = if value.saleState == "OnSale" then value.price else nil,
					isOnHold = value.isHeld,
					isOnSale = value.saleState == "OnSale",
					order = if value.serialNumber then value.serialNumber else 0
				})
			end
		end
	else
		UseResult4(List, UseSelectorResult3, true)
		UseResult4(List, UseSelectorResult2, false)
		
		for _, value1 in List do
			if value1.isOnHold then
				Flag = true
				break
			end
		end
	end
	table.sort(List, function(A, B): boolean
		return A.order < B.order
	end)
	
	if ResaleRestriction == CatalogConstantsModule.ResaleRestriction.Disabled then
		Flag = false
	end
	local UseNavigationResult = UseNavigationFunction()
	local UseLocalizationModuleResult = UseLocalizationModule({
		holdingMessageText = "Feature.Catalog.Label.ItemInAHold",
		holdingPromptTitleText = "Feature.Catalog.Heading.HoldingPolicy",
		holdingPromptButtonText = "Feature.Avatar.Action.GotIt",
		headerText = {
			"Feature.Catalog.Label.ItemOwnedCount",
			itemCount = #List
		},
		holdingPromptBodyText = if Params.collectibleItemId then {
			"Feature.Catalog.Message.HoldingPolicyL2",
			purchaseDays = 30,
			resaleDays = 7
		} else { "Feature.Catalog.Message.HoldingPolicyL1", days = 7 }
	})
	
	local function onHoldingPolicyButtonActivated(_, _)
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), UseLocalizationModuleResult (copy)
		UseNavigationResult.navigate(AvatarScreen.GenericPrompt, {
			titleText = UseLocalizationModuleResult.holdingPromptTitleText,
			bodyText = UseLocalizationModuleResult.holdingPromptBodyText,
			buttonText = UseLocalizationModuleResult.holdingPromptButtonText
		})
	end
	
	local TextBounds = TextModule.GetTextBounds(UseLocalizationModuleResult.holdingMessageText, UseStyleResult.Font.SubHeader1.Font, UseStyleResult.Font.BaseSize * UseStyleResult.Font.SubHeader1.RelativeSize, Vector2.new(10000, 10000))
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local AbsoluteSize = UsePropertyFunction(UseRefResult, "AbsoluteSize") or nil
	local AbsoluteSize1 = UsePropertyFunction(UseRefResult1, "AbsoluteSize") or nil
	local UseSelectorResult8 = if FFlagAXFixScrollAwayTopBarOverlapModule then UseSelectorFunction(TopBarModule.selectTopBarHeight) else nil
	local YOffset = 0
	
	if AbsoluteSize == nil or AbsoluteSize1 == nil then
		if AbsoluteSize ~= nil then
			YOffset = AbsoluteSize.Y - 24
		end
	else
		YOffset = AbsoluteSize.Y - AbsoluteSize1.Y - 24
	end
	if FFlagAXFixScrollAwayTopBarOverlapModule and FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then
		YOffset -= UseSelectorResult8
	end
	local v1 = nil
	local UseRefResult3 = nil
	
	if AXMigrateItemOwnerShipPageToAutofocus then
		UseRefResult3 = ReactModule.useRef(nil)
		UseFocusNavigableSurfaceRegistryConnectionFunction(UseRefResult3.current, FocusNavigableSurfaceIdentifierEnum.CentralOverlay)
		local UseRefResult4 = ReactModule.useRef(nil)
		UseRedirectFocusIntoGuiObjectFunction(UseRefResult4)
		v1 = UseTableWrappedCallbackRefFunction((UseMostRecentFocusBehaviorFunction(UseRefResult4)))
	end
	local TileRestrictionsMap = if UseSelectorResult4 then UseSelectorResult4.tileRestrictionsMap else nil
	
	return ReactModule.createElement(CenteredModalViewModule, {}, {
		Background = ReactModule.createElement(if GetFFlagL2ControllerSupportModule() then Focusable.Frame else "Frame", {
			BorderSizePixel = 0,
			Active = true,
			ref = if AXMigrateItemOwnerShipPageToAutofocus then UseRefResult3 else nil,
			SelectionGroup = if AXMigrateItemOwnerShipPageToAutofocus then true else nil,
			SelectionBehaviorLeft = if AXMigrateItemOwnerShipPageToAutofocus then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if AXMigrateItemOwnerShipPageToAutofocus then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorUp = if AXMigrateItemOwnerShipPageToAutofocus then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorDown = if AXMigrateItemOwnerShipPageToAutofocus then Enum.SelectionBehavior.Stop else nil,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
			BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
			Size = UDim2.fromScale(1, 1),
			focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil elseif GetFFlagL2ControllerSupportModule() then UseRootFocusControllerResult else nil,
			defaultChild = if GetFFlagL2ControllerSupportModule() then UseRefResult2 else nil,
			restorePreviousChildFocus = if GetFFlagL2ControllerSupportModule() then true else nil,
			inputBindings = if FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation or not GetFFlagL2ControllerSupportModule() then nil else {
				NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
					-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
					NavigationUtilsModule.closeFocusedScreen(UseNavigationResult)
				end)
			}
		}, {
			GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else GetFFlagL2ControllerSupportModule() and ReactModule.createElement(GamepadFocusHandlerForPageModule, {
				captureFocusOnMount = true,
				focusController = UseRootFocusControllerResult
			}),
			TopBar = ReactModule.createElement(TopBarModule.Container, {
				ZIndex = 2,
				titleText = UseLocalizationModuleResult.headerText,
				leftItem = TopBarModule.BackButton
			}),
			Contents = ReactModule.createElement(TopBarModule.PageContent, { ZIndex = 2 }, {
				PageContentFrame = ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ref = UseRefResult
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Bottom,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Padding = ReactModule.createElement("UIPadding", {
						PaddingTop = if FFlagAXFixScrollAwayTopBarOverlapModule and (FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled()) then UDim.new(0, UseSelectorResult8) else nil,
						PaddingBottom = UDim.new(0, 24)
					}),
					ScrollView = ReactModule.createElement(VerticalScrollViewWithMargin, {
						useAutomaticCanvasSize = true,
						canvasSizeY = UDim.new(1, 0),
						size = UDim2.new(1, 0, 0, YOffset),
						Selectable = not AXMigrateItemOwnerShipPageToAutofocus and nil,
						ref = if AXMigrateItemOwnerShipPageToAutofocus then v1 else nil
					}, {
						ListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							Padding = UDim.new(0, 24),
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Padding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 24) }),
						ItemsList = #List > 0 and ReactModule.createElement(OwnedItemListModule, {
							itemsOnSale = true,
							layoutOrder = 1,
							itemId = Params.itemId,
							itemType = Params.itemType,
							restrictionTypes = TileRestrictionsMap,
							onItemActivated = UseResult3,
							resaleRestriction = ResaleRestriction,
							items = List,
							ref = if GetFFlagL2ControllerSupportModule() then UseRefResult2 else nil
						})
					}),
					HoldingPolicyInfoContainer = Flag and ReactModule.createElement("Frame", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.fromScale(1, 0),
						ref = UseRefResult1
					}, {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 0)
						}),
						Padding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 24) }),
						HoldingPromptTextButton = ReactModule.createElement("TextButton", {
							LayoutOrder = 1,
							Text = UseLocalizationModuleResult.holdingMessageText,
							Font = UseStyleResult.Font.SubHeader1.Font,
							Size = UDim2.new(0, TextBounds.X, 0, TextBounds.Y),
							TextXAlignment = Enum.TextXAlignment.Center,
							TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.SubHeader1.RelativeSize,
							TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
							TextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
							BackgroundTransparency = 1,
							Selectable = not AXMigrateItemOwnerShipPageToAutofocus and nil,
							[ReactModule.Event.Activated] = onHoldingPolicyButtonActivated
						}),
						HoldingPromptIconButton = ReactModule.createElement(IconButton, {
							layoutOrder = 2,
							backgroundTransparency = 1,
							icon = IconsActionsInfoSmall,
							iconSize = IconSize.Small,
							iconColor3 = UseStyleResult.Theme.IconEmphasis.Color,
							iconTransparency = UseStyleResult.Theme.IconEmphasis.Transparency,
							onActivated = onHoldingPolicyButtonActivated
						})
					})
				})
			})
		})
	})
end