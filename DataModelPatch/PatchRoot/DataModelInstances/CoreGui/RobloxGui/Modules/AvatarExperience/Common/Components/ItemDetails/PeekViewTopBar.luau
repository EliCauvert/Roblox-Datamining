local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local Images = UIBloxModule.App.ImageSet.Images
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local CloseFocusedScreenModule = require(Modules.AvatarExperience.Common.Thunks.CloseFocusedScreen)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local ToggleTryOnThunkModule = require(Modules.AvatarExperience.Common.Thunks.ToggleTryOnThunk)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local FFlagAXTryOnScreenImprovements = SharedFlagsModule.FFlagAXTryOnScreenImprovements
local RobuxBalanceModule = require(Modules.AvatarExperience.Catalog.Components.RobuxBalance)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local Platform = game:GetService("UserInputService"):GetPlatform()
local IsPlatformMatch: boolean = Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX
local IconsNavigationClose = Images["icons/navigation/close"]
local IconsNavigationPushBack = Images["icons/navigation/pushBack"]
local IconsActionsTruncationExpand = Images["icons/actions/truncationExpand"]
local Y: number = if IsPlatformMatch then 0.5 else 0
local PeekViewTopBar = RoactModule.PureComponent:extend("PeekViewTopBar")
PeekViewTopBar.validateProps = TModule.strictInterface({
	forwardRef = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	itemId = TModule.optional(TModule.string),
	itemType = TModule.optional(TModule.string),
	itemData = TModule.optional((require(Modules.AvatarExperience.Common.Validators.ItemDataValidator))),
	dropDownTopBar = TModule.optional(TModule.boolean),
	peekViewState = TModule.optional(TModule.any),
	closePeekView = TModule.optional(TModule.callback),
	showRobuxBalance = TModule.optional(TModule.boolean),
	topBarHeight = TModule.number,
	statusBarHeight = TModule.number,
	isPortrait = TModule.optional(TModule.boolean),
	closeFocusedScreen = TModule.callback,
	toggleTryOn = TModule.optional(TModule.callback),
	navigation = TModule.table,
	networking = TModule.callback,
	catalogAnalytics = TModule.table,
	appAnalytics = TModule.table,
	avatarRoute = TModule.table
})

function PeekViewTopBar.init(p1)
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), CatalogUtilsModule (copy), NavigationUtilsModule (copy), RoactModule (copy)
	function p1.navigateBack()
		-- upvalues: p1 (copy)
		p1.props.closeFocusedScreen(p1.props.navigation)
	end
	
	function p1.closeFiltersAndItemDetails()
		-- upvalues: p1 (copy), FFlagAXMISEnableMultiShopping (upval), CatalogUtilsModule (upval), NavigationUtilsModule (upval)
		local Navigation = p1.props.navigation
		
		if not FFlagAXMISEnableMultiShopping then
			local ItemData = p1.props.itemData
			
			if ItemData ~= nil then
				local ItemType = p1.props.itemType
				p1.props.toggleTryOn(p1.props.networking, p1.props.catalogAnalytics, ItemType, CatalogUtilsModule.GetItemSubType(ItemType, ItemData), p1.props.itemId, true, p1.props.avatarRoute, Navigation)
			end
		end
		NavigationUtilsModule.closeFiltersAndItemDetails(Navigation)
	end
	
	p1.buttonRef = p1.props.forwardRef or RoactModule.createRef()
	p1.secondaryButtonRef = RoactModule.createRef()
end

function PeekViewTopBar.renderBothButtons(p1, ImageColor3, Callback)
	-- upvalues: RoactModule (copy), Focusable (copy), Y (copy), CursorKind (copy), ImageSetLabel (copy), IconsNavigationPushBack (copy), IconsNavigationClose (copy)
	return RoactModule.createFragment({
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 0)
		}),
		UIPadding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 0) }),
		BackButton = RoactModule.createElement(Focusable.TextButton, {
			LayoutOrder = 1,
			AnchorPoint = Vector2.new(0, Y),
			Size = UDim2.new(0, 36, 0, 36),
			BackgroundTransparency = 1,
			Text = "",
			[RoactModule.Event.Activated] = p1.navigateBack,
			[RoactModule.Ref] = p1.buttonRef,
			NextSelectionRight = p1.secondaryButtonRef,
			SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
		}, {
			BackButtonIcon = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0, 36, 0, 36),
				Image = IconsNavigationPushBack,
				ImageColor3 = ImageColor3
			})
		}),
		CloseButton = RoactModule.createElement(Focusable.TextButton, {
			LayoutOrder = 2,
			AnchorPoint = Vector2.new(0, Y),
			Size = UDim2.new(0, 36, 0, 36),
			BackgroundTransparency = 1,
			Text = "",
			[RoactModule.Event.Activated] = p1.closeFiltersAndItemDetails,
			[RoactModule.Ref] = p1.secondaryButtonRef,
			NextSelectionLeft = p1.buttonRef,
			SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
		}, {
			CloseButtonIcon = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0, 36, 0, 36),
				Image = IconsNavigationClose,
				ImageColor3 = ImageColor3
			})
		})
	})
end

function PeekViewTopBar.isFirstItemDetailVisible(p1)
	-- upvalues: AvatarScreen (copy), NavigationUtilsModule (copy)
	local PreviousPages = p1.props.avatarRoute.previousPages
	local Count = 0
	
	if #PreviousPages == 0 then
		return nil
	end
	for _, previousPage in pairs(PreviousPages) do
		if previousPage.name == AvatarScreen.ItemDetails then
			Count += 1
		end
	end
	return Count == 0 and NavigationUtilsModule.isFirstItemDetailsPage(p1.props.navigation)
end

function PeekViewTopBar.render(p2)
	-- upvalues: NavigationUtilsModule (copy), FFlagAXTryOnScreenImprovements (copy), WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy), PeekViewState (copy), FFlagRenameDeprecatedUIBloxTokens (copy), RoactModule (copy), Y (copy), RobuxBalanceModule (copy), Focusable (copy), CursorKind (copy), ImageSetLabel (copy), IconsNavigationClose (copy), IconsNavigationPushBack (copy), IconsActionsTruncationExpand (copy)
	local StatusBarHeight = p2.props.statusBarHeight
	local TopBarHeight = p2.props.topBarHeight
	local IsFirstItemDetailsPage = if p2.props.dropDownTopBar then true else NavigationUtilsModule.isFirstItemDetailsPage(p2.props.navigation)
	local FromProfileParam = if FFlagAXTryOnScreenImprovements then nil else p2.props.navigation.getParam("fromProfile")
	local FromHomeParam = if FFlagAXTryOnScreenImprovements then nil else p2.props.navigation.getParam("fromHome")
	local ShowFullWithNoPeekViewParam = p2.props.navigation.getParam("showFullWithNoPeekView")
	local NoIsFirstItemDetailsPage: boolean = ShowFullWithNoPeekViewParam and not IsFirstItemDetailsPage
	local IsFirstItemDetailVisible = p2:isFirstItemDetailVisible()
	
	return WithStyleFunction(function(p3)
		-- upvalues: WithSelectionCursorProviderFunction (upval), FFlagAXTryOnScreenImprovements (upval), FromProfileParam (copy), ShowFullWithNoPeekViewParam (copy), FromHomeParam (ref), p2 (copy), PeekViewState (upval), FFlagRenameDeprecatedUIBloxTokens (upval), NoIsFirstItemDetailsPage (copy), RoactModule (upval), Y (upval), StatusBarHeight (copy), RobuxBalanceModule (upval), Focusable (upval), IsFirstItemDetailVisible (copy), CursorKind (upval), IsFirstItemDetailsPage (ref), ImageSetLabel (upval), IconsNavigationClose (upval), IconsNavigationPushBack (upval), IconsActionsTruncationExpand (upval), TopBarHeight (copy)
		return WithSelectionCursorProviderFunction(function(Callback)
			-- upvalues: FFlagAXTryOnScreenImprovements (upval), FromProfileParam (upval), ShowFullWithNoPeekViewParam (upval), FromHomeParam (upval), p3 (copy), p2 (upval), PeekViewState (upval), FFlagRenameDeprecatedUIBloxTokens (upval), NoIsFirstItemDetailsPage (upval), RoactModule (upval), Y (upval), StatusBarHeight (upval), RobuxBalanceModule (upval), Focusable (upval), IsFirstItemDetailVisible (upval), CursorKind (upval), IsFirstItemDetailsPage (upval), ImageSetLabel (upval), IconsNavigationClose (upval), IconsNavigationPushBack (upval), IconsActionsTruncationExpand (upval), TopBarHeight (upval)
			local Color = if FFlagAXTryOnScreenImprovements or FromProfileParam or ShowFullWithNoPeekViewParam or FromHomeParam then p3.Theme.IconEmphasis.Color else Color3.new(1, 1, 1)
			local BackgroundTransparency = 1
			local Color1 = nil
			
			if ShowFullWithNoPeekViewParam and p2.props.isPortrait then
				BackgroundTransparency = 0
				Color1 = p3.Theme.BackgroundDefault.Color
			end
			local IsPeekViewStateMatch: boolean = p2.props.dropDownTopBar and p2.props.peekViewState == PeekViewState.Full
			local Size1200 = if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Size.Size_1200 else p3.Tokens.Global.Size_600
			local Size1200_1 = if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Size.Size_1200 else p3.Tokens.Global.Size_600
			
			return RoactModule.createElement(Focusable.Frame, {
				Active = true,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, TopBarHeight),
				BackgroundTransparency = BackgroundTransparency,
				BackgroundColor3 = Color1,
				NextSelectionLeft = p2.props.NextSelectionLeft,
				NextSelectionRight = p2.props.NextSelectionRight,
				NextSelectionUp = p2.props.NextSelectionUp,
				NextSelectionDown = p2.props.NextSelectionDown
			}, if NoIsFirstItemDetailsPage then p2:renderBothButtons(Color, Callback) else {
				RobuxBalance = if p2.props.showRobuxBalance then RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 0,
					AutomaticSize = Enum.AutomaticSize.XY,
					AnchorPoint = Vector2.new(1, Y),
					Position = UDim2.new(1, -(if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Size.Size_300 else p3.Tokens.Global.Space_150), Y, StatusBarHeight)
				}, {
					RobuxBalance = RoactModule.createElement(RobuxBalanceModule, { [RoactModule.Ref] = p2.robuxBalanceRef })
				}) else nil,
				TouchFriendlyNavigationButton = not IsPeekViewStateMatch and RoactModule.createElement(Focusable.TextButton, {
					AnchorPoint = Vector2.new(0, Y),
					Position = UDim2.new(0, 15, Y, StatusBarHeight),
					Size = UDim2.new(0, 36, 0, 36),
					BackgroundTransparency = 1,
					Text = "",
					[RoactModule.Event.Activated] = p2.navigateBack,
					[RoactModule.Ref] = p2.buttonRef,
					Visible = IsFirstItemDetailVisible,
					NextSelectionDown = p2.props.NextSelectionDown,
					SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
				}, {
					CloseButton = IsFirstItemDetailsPage and RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.new(0, 36, 0, 36),
						Image = IconsNavigationClose,
						ImageColor3 = Color
					}),
					BackButton = not IsFirstItemDetailsPage and RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.new(0, 36, 0, 36),
						Image = IconsNavigationPushBack,
						ImageColor3 = Color
					})
				}),
				TouchFriendlyDownButton = IsPeekViewStateMatch and RoactModule.createElement(Focusable.TextButton, {
					AnchorPoint = Vector2.new(0, Y),
					Position = UDim2.new(0, if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Size.Size_300 else p3.Tokens.Global.Space_150, Y, StatusBarHeight),
					Size = UDim2.new(0, 36, 0, 36),
					BackgroundTransparency = 1,
					Text = "",
					[RoactModule.Event.Activated] = p2.props.closePeekView,
					[RoactModule.Ref] = p2.buttonRef,
					Visible = IsFirstItemDetailVisible,
					NextSelectionDown = p2.props.NextSelectionDown,
					SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
				}, {
					DownButton = RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.new(0, Size1200, 0, Size1200_1),
						Image = IconsActionsTruncationExpand,
						ImageColor3 = Color
					})
				})
			})
		end)
	end)
end

local WithAvatarRouteModuleResult = WithAvatarRouteModule((RoactRoduxModule.connect(function(p2, _)
	-- upvalues: UtilsModule (copy), DeviceOrientationMode (copy)
	return {
		topBarHeight = UtilsModule.getTopBarHeightAvatarScene(p2),
		statusBarHeight = p2.TopBar.statusBarHeight,
		isPortrait = p2.DeviceOrientation == DeviceOrientationMode.Portrait
	}
end, function(Callback)
	-- upvalues: CloseFocusedScreenModule (copy), ToggleTryOnThunkModule (copy)
	return {
		closeFocusedScreen = function(p2)
			-- upvalues: Callback (copy), CloseFocusedScreenModule (upval)
			Callback(CloseFocusedScreenModule(p2))
		end,
		toggleTryOn = function(p2, p3, p4, p5, p6, p7, p8, p9)
			-- upvalues: Callback (copy), ToggleTryOnThunkModule (upval)
			Callback(ToggleTryOnThunkModule(p2, p3, p4, p5, p6, p7, p8, p9))
		end
	}
end)((RoactServices.connect({
	catalogAnalytics = AnalyticsModule,
	appAnalytics = RoactAnalyticsModule,
	networking = RoactNetworkingModule
})((WithNavigationFunction(PeekViewTopBar)))))))

return RoactModule.forwardRef(function(p2, ForwardRef)
	-- upvalues: RoactModule (copy), WithAvatarRouteModuleResult (ref), CryoModule (copy)
	return RoactModule.createElement(WithAvatarRouteModuleResult, CryoModule.Dictionary.join(p2, { forwardRef = ForwardRef }))
end)