local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local WithStyleFunction = UIBloxModule.Style.withStyle
local ConstantsModule = require(Modules.LuaApp.Constants)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local PeekView = require(CorePackages.Workspace.Packages.PeekView).PeekView
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local GetFFlagAXItemDetailsScrollingEnabledCallbackModule = require(Modules.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback)
local AxItemdetails = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.itemdetails")
local IconsNavigationClose = UIBloxModule.App.ImageSet.Images["icons/navigation/close"]
local ItemDetailsPeekView = RoactModule.PureComponent:extend("ItemDetailsPeekView")

function ItemDetailsPeekView.init(p1)
	-- upvalues: RoactModule (copy), AvatarScreen (copy), AxItemdetails (copy), PeekViewState (copy)
	p1.closeButtonPosition, p1.updateCloseButtonPosition = RoactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p1.closeButtonVisible, p1.updateCloseButtonVisible = RoactModule.createBinding(false)
	p1.topBarNavVisible, p1.updateTopBarNavVisible = RoactModule.createBinding(p1.props.navigation.state.routeName == AvatarScreen.TryOnItem)
	p1.briefViewPercentBinding, p1.updateBriefViewPercentBinding = RoactModule.createBinding(if p1.props.mountAsFullView then 1 else 0)
	p1.desktopScrollingEnabledBinding = p1.briefViewPercentBinding:map(function(p2): boolean
		return p2 == 1
	end)
	
	function p1.peekViewStateChanged(Closed, p2)
		-- upvalues: AxItemdetails (upval), p1 (copy), PeekViewState (upval), AvatarScreen (upval)
		AxItemdetails:debug("peekViewStateChanged: {} -> {}", p2, Closed)
		p1:setState({})
		local Analytics = p1.props.analytics
		local RouteName = p1.props.navigation.state.routeName
		local ItemId = p1.props.itemId
		local ItemType = p1.props.itemType
		
		if Closed == PeekViewState.Closed or Closed == PeekViewState.Hidden then
			if RouteName == AvatarScreen.TryOnItem then
				p1.props.closeFocusedScreen(p1.props.navigation)
			else
				p1.props.closeAllPeekViews(p1.props.navigation)
			end
			Analytics.closeItemDetailPage(ItemId, ItemType)
		elseif Closed == PeekViewState.Full then
			Analytics.expandItemDetailPage(ItemId, ItemType)
		end
		p1.props.setPeekViewState(Closed)
	end
	
	function p1.briefToFullTransitionPercent(p2: number)
		-- upvalues: p1 (copy), AvatarScreen (upval)
		if p1.props.navigation.state.routeName ~= AvatarScreen.TryOnItem then
			if p2 > 0.8 then
				p1.updateTopBarNavVisible(true)
			else
				p1.updateTopBarNavVisible(false)
			end
			if p2 > 0.95 then
				p1.updateCloseButtonVisible(false)
			else
				p1.updateCloseButtonVisible(true)
			end
		end
		p1.updateBriefViewPercentBinding(p2)
	end
	
	function p1.peekHeaderPositionYChange(NewBriefViewHeight: number)
		-- upvalues: p1 (copy)
		p1.updateCloseButtonPosition(UDim2.new(0, 15, 1, -(math.floor(NewBriefViewHeight + 0.5) + 18 + 4)))
	end
end

function ItemDetailsPeekView.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWith(p2)
	end)
end

function ItemDetailsPeekView.renderWith(p1, p2)
	-- upvalues: ConstantsModule (copy), PeekViewState (copy), RoactModule (copy), ImageSetButton (copy), IconsNavigationClose (copy), PeekView (copy), GetFFlagAXItemDetailsScrollingEnabledCallbackModule (copy)
	local Theme = p2.Theme
	local IsLastInputGroupMatch = p1.props.lastInputGroup == ConstantsModule.InputType.MouseAndKeyboard
	local IsTryOnPage = p1.props.isTryOnPage
	local BriefViewHeight = p1.props.briefViewHeight
	local FromProfile = p1.props.fromProfile
	local PeekViewFullViewEnabled = p1.props.peekViewFullViewEnabled
	local PeekViewState1 = p1.props.peekViewState
	local _UDim2 = UDim2.fromOffset(0, p1.props.topBarHeight - (if FromProfile then 6 else 0))
	local RenderTopBarFunction = p1.props.renderTopBar
	local IsPeekViewStateMatch = PeekViewState1 == PeekViewState.Full or (PeekViewState1 == PeekViewState.Extended or (IsLastInputGroupMatch or IsTryOnPage))
	local DesktopScrollingEnabledBinding = p1.desktopScrollingEnabledBinding
	local MapResult = p1.briefViewPercentBinding:map(function(p3): number
		-- upvalues: Theme (copy)
		return 1 - (1 - Theme.Overlay.Transparency) * p3
	end)
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.props.viewSize,
		Position = p1.props.viewPosition
	}, {
		Overlay = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 1,
			BackgroundTransparency = if IsTryOnPage then 1 else MapResult,
			BackgroundColor3 = Theme.Overlay.Color,
			Size = UDim2.fromScale(1, 1)
		}),
		TopBar = if IsPeekViewStateMatch then RenderTopBarFunction() else nil,
		CloseButton = IsLastInputGroupMatch and (not IsTryOnPage and RoactModule.createElement(ImageSetButton, {
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundTransparency = 1,
			Position = p1.closeButtonPosition,
			Size = UDim2.new(0, 36, 0, 36),
			Image = IconsNavigationClose,
			ImageColor3 = Theme.SystemPrimaryDefault.Color,
			Visible = p1.closeButtonVisible,
			[RoactModule.Event.Activated] = p1.props.closeBriefView
		})),
		PeekViewContainer = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			ZIndex = 2,
			Position = _UDim2,
			Size = UDim2.new(1, 0, 1, -_UDim2.Y.Offset)
		}, {
			PeekView = RoactModule.createElement(PeekView, {
				showDraggerInClosedState = false,
				returnToFullView = true,
				thumbstickScrollEnabled = true,
				shouldCaptureFocus = false,
				briefViewContentHeight = UDim.new(0, BriefViewHeight),
				viewStateChanged = p1.peekViewStateChanged,
				mountAnimation = p1.props.mountAnimation,
				mountAsFullView = p1.props.mountAsFullView,
				canDragFullViewToBrief = not FromProfile,
				bottomDockedContainerHeight = BriefViewHeight,
				bottomDockedContainerContent = { ActionBarContainer = p1.props.renderBottomBar() },
				showDropShadow = p1.props.showDropShadow,
				elasticBehavior = if PeekViewFullViewEnabled then nil else Enum.ElasticBehavior.Never,
				backgroundColor3 = Theme.BackgroundDefault.Color,
				backgroundTransparency = Theme.BackgroundUIDefault.Transparency,
				briefToFullTransitionPercent = p1.briefToFullTransitionPercent,
				peekHeaderClose = FromProfile or false,
				peekHeaderPositionYChange = p1.peekHeaderPositionYChange,
				isScrollingEnabled = if GetFFlagAXItemDetailsScrollingEnabledCallbackModule() then p1.props.scrollingEnabled and (not IsLastInputGroupMatch or DesktopScrollingEnabledBinding) else not IsLastInputGroupMatch or DesktopScrollingEnabledBinding,
				contentFrameRef = p1.props.contentFrameRef,
				peekViewState = PeekViewState1,
				customBackground = Theme.BackgroundDefault.Color
			}, { ItemDetails = p1.props.renderContent() })
		})
	})
end

local function _(p1): boolean
	-- upvalues: PeekViewState (copy)
	local PeekViewState1 = p1.peekViewState
	
	return PeekViewState1 == PeekViewState.Full or PeekViewState1 == PeekViewState.Extended
end

function ItemDetailsPeekView.didUpdate(p1, p2, _)
	-- upvalues: PeekViewState (copy), AvatarScreen (copy)
	local Current = p1.props.avatarRoute.current
	local Name = Current.name
	local _ = Current.key
	local _ = p1.props.navigation.state.key
	
	if p1.props.peekViewShowing then
		local PeekViewState1 = p1.props.peekViewState
		local IsPeekViewStateMatch: boolean = PeekViewState1 == PeekViewState.Full or PeekViewState1 == PeekViewState.Extended
		
		if p1.props.itemDetailsExpanded ~= IsPeekViewStateMatch then
			p1.props.setItemDetailsExpanded(IsPeekViewStateMatch)
			
			return
		end
	elseif p2.peekViewShowing and Name ~= AvatarScreen.ItemDetails and p1.props.itemDetailsExpanded then
		p1.props.setItemDetailsExpanded(false)
	end
end

function ItemDetailsPeekView.didMount(p1)
	-- upvalues: PeekViewState (copy)
	if not p1.props.mountAnimation then
		p1.peekHeaderPositionYChange(p1.props.briefViewHeight + 25)
	end
	if p1.props.peekViewShowing then
		local PeekViewState1 = p1.props.peekViewState
		local IsPeekViewStateMatch: boolean = PeekViewState1 == PeekViewState.Full or PeekViewState1 == PeekViewState.Extended
		
		if p1.props.itemDetailsExpanded ~= IsPeekViewStateMatch then
			p1.props.setItemDetailsExpanded(IsPeekViewStateMatch)
		end
	end
end

function ItemDetailsPeekView.willUnmount(p1)
	if p1.props.peekViewShowing and p1.props.itemDetailsExpanded then
		p1.props.setItemDetailsExpanded(false)
	end
end

return ItemDetailsPeekView