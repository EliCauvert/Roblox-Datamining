local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local ScrollingAppCarousel = require(CorePackages.Workspace.Packages.AppBlox).ScrollingAppCarousel
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local UiMode = RobloxAppEnumsModule.UiMode
local DeviceType = RobloxAppEnumsModule.DeviceType
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local IconWithTooltip = require(CorePackages.Workspace.Packages.AppBlox).IconWithTooltip
local MaybeForceDarkThemeFunction = require(CorePackages.Workspace.Packages.CollectionViews).maybeForceDarkTheme
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local GetFFlagLuaAppGameCarouselUseAutoSizingModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppGameCarouselUseAutoSizing)
local FFlagLuaAppPropagateFriendsCarouselHeader = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppPropagateFriendsCarouselHeader
local FFlagLuaAppDisableChevronSeeAll = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDisableChevronSeeAll
local IconsActionsCycleRight = UIBloxModule.App.ImageSet.Images["icons/actions/cycleRight"]
local CarouselWidget = RoactModule.PureComponent:extend("CarouselWidget")

function CarouselWidget.getDerivedStateFromProps(p1, p2)
	-- upvalues: RetrievalStatus (copy)
	if p1.fetchingStatus == nil then return end
	local FromRawValueResult = RetrievalStatus.fromRawValue(p1.fetchingStatus)
	local WasLoaded = p2.wasLoaded
	
	if FromRawValueResult == RetrievalStatus.Done then
		WasLoaded = true
	elseif FromRawValueResult == RetrievalStatus.Failed or FromRawValueResult == RetrievalStatus.NotStarted then
		WasLoaded = false
	elseif FromRawValueResult == RetrievalStatus.Fetching and WasLoaded then
		FromRawValueResult = RetrievalStatus.Done
	end
	return { wasLoaded = WasLoaded, dataStatus = FromRawValueResult }
end

function CarouselWidget.init(p1)
	-- upvalues: RetrievalStatus (copy)
	p1.state = {
		wasLoaded = false,
		dataStatus = RetrievalStatus.NotStarted
	}
end

function CarouselWidget.didMount(p1)
	-- upvalues: RetrievalStatus (copy)
	p1:setState({
		wasLoaded = false,
		dataStatus = RetrievalStatus.fromRawValue(p1.props.fetchingStatus)
	})
end

function CarouselWidget.render(p1)
	-- upvalues: FFlagLuaAppPropagateFriendsCarouselHeader (copy), RoactModule (copy), ScrollingAppCarousel (copy), FFlagLuaAppDisableChevronSeeAll (copy), ImageSetLabel (copy), IconsActionsCycleRight (copy), CursorKind (copy), DeviceType (copy), IconWithTooltip (copy), TooltipOrientation (copy), MaybeForceDarkThemeFunction (copy), LoadingStateContainer (copy), View (copy), IconButton (copy), IconSize (copy), GetFFlagLuaAppGameCarouselUseAutoSizingModule (copy), FitChildrenModule (copy), WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy)
	local LayoutOrder = p1.props.layoutOrder
	local OnSeeAll = p1.props.onSeeAll
	local Title = p1.props.title
	local Items = p1.props.items
	local FetchingStatus = p1.props.fetchingStatus
	local OnRetry = p1.props.onRetry
	local CarouselHeight = p1.props.carouselHeight
	local CanvasWidth = p1.props.canvasWidth
	local OnChangeCanvasPosition = p1.props.onChangeCanvasPosition
	local OnRefCallback = p1.props.onRefCallback
	local Index = p1.props.index
	local ItemCount = p1.props.itemCount
	local ItemWidth = p1.props.itemWidth
	local ItemPadding = p1.props.itemPadding
	local CarouselMargin = p1.props.carouselMargin
	local ShowSeeAll = p1.props.showSeeAll
	local DesignTokens = p1.props.designTokens
	local ShowTooltip = p1.props.showTooltip
	local OnActivateTooltip = p1.props.onActivateTooltip
	local TooltipHoverText = p1.props.tooltipHoverText
	local DeviceType1 = p1.props.deviceType
	local ScreenSize = p1.props.screenSize
	local NoFFlagLuaAppPropagateFriendsCarouselHeader: boolean = not FFlagLuaAppPropagateFriendsCarouselHeader or Title ~= nil and Title ~= ""
	local DarkThemeTextColor = if p1.props.forceDarkThemeForHeader then DesignTokens.darkThemeTextColor else nil
	
	local function v51(p2, Callback)
		-- upvalues: RoactModule (upval), ScrollingAppCarousel (upval), Items (copy), Index (copy), ItemCount (copy), ItemWidth (copy), ItemPadding (copy), CarouselMargin (copy), CarouselHeight (copy), CanvasWidth (copy), OnChangeCanvasPosition (copy), OnRefCallback (copy), DesignTokens (copy), Title (copy), DarkThemeTextColor (ref), FFlagLuaAppDisableChevronSeeAll (upval), p1 (copy), ShowSeeAll (copy), ImageSetLabel (upval), IconsActionsCycleRight (upval), ShowTooltip (copy), ScreenSize (copy), CursorKind (upval), OnSeeAll (copy), DeviceType1 (copy), DeviceType (upval), IconWithTooltip (upval), TooltipOrientation (upval), OnActivateTooltip (copy), TooltipHoverText (copy), NoFFlagLuaAppPropagateFriendsCarouselHeader (copy), MaybeForceDarkThemeFunction (upval), FetchingStatus (copy), LoadingStateContainer (upval), OnRetry (copy), View (upval), IconButton (upval), IconSize (upval), GetFFlagLuaAppGameCarouselUseAutoSizingModule (upval), LayoutOrder (copy), FitChildrenModule (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local Element = RoactModule.createElement(ScrollingAppCarousel, {
			items = Items,
			index = Index,
			itemCount = ItemCount,
			itemWidth = ItemWidth,
			itemPadding = ItemPadding,
			carouselMargin = CarouselMargin,
			carouselHeight = CarouselHeight,
			canvasWidth = CanvasWidth,
			onChangeCanvasPosition = OnChangeCanvasPosition,
			onRefCallback = OnRefCallback
		})
		local NoFFlagLuaAppDisableChevronSeeAll = not FFlagLuaAppDisableChevronSeeAll
		local config = {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = if NoFFlagLuaAppDisableChevronSeeAll then p1.props.textIconPadding else UDim.new(0, 4)
			}),
			Title = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0, 0, 0, 0),
				Font = DesignTokens.headerFont,
				Text = Title,
				TextSize = DesignTokens.headerTextSize,
				TextColor3 = DarkThemeTextColor or Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextTruncate = Enum.TextTruncate.SplitWord
			}),
			SeeAllArrow = ShowSeeAll and RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = NoFFlagLuaAppDisableChevronSeeAll and p1.props.seeAllImageSize or UDim2.new(0, 20, 0, 20),
				Image = IconsActionsCycleRight,
				ImageColor3 = DarkThemeTextColor or Theme.TextEmphasis.Color,
				ImageTransparency = Theme.TextEmphasis.Transparency
			}) or nil,
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", {
				MaxSize = if ShowTooltip then Vector2.new(ScreenSize.X - 2 * (CarouselMargin or 0) - 48, 1e999) else Vector2.new(ScreenSize.X - 2 * (CarouselMargin or 0), 1e999)
			})
		}
		local IsNotSubtitleMatch: boolean = p1.props.subtitle and p1.props.subtitle ~= ""
		local SubtitleTextSize = DesignTokens.subtitleTextSize
		local Subtitle = nil
		
		if IsNotSubtitleMatch then
			if type(p1.props.subtitle) == "string" then
				Subtitle = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					TextWrapped = true,
					Text = p1.props.subtitle,
					Size = UDim2.new(1, 0, 0, SubtitleTextSize),
					Font = _Font.Body.Font,
					TextColor3 = DarkThemeTextColor or Theme.TextDefault.Color,
					TextSize = SubtitleTextSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y
				})
			elseif type(p1.props.subtitle) == "table" then
				Subtitle = p1.props.subtitle
			end
		end
		local Config = if IsNotSubtitleMatch then {
			Layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			TitleWrapper = RoactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(),
				AutomaticSize = Enum.AutomaticSize.XY
			}, config),
			Subtitle = Subtitle,
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(ScreenSize.X - 2 * (CarouselMargin or 0), 1e999)
			})
		} else config
		local ImageButton = if ShowSeeAll then RoactModule.createElement("ImageButton", {
			AutomaticSize = Enum.AutomaticSize.XY,
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			SelectionImageObject = Callback(CursorKind.InputButton),
			[RoactModule.Event.Activated] = OnSeeAll
		}, Config) else RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, Config)
		local Frame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, ScreenSize.X - 48, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = if DeviceType1 == DeviceType.Desktop then RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}) else nil,
			HeaderText = ImageButton,
			CarouselTooltip = RoactModule.createElement(IconWithTooltip, {
				layoutOrder = 2,
				triggerPointName = "CarouselTooltip",
				tooltipOrientation = TooltipOrientation.Bottom,
				onActivateTooltip = OnActivateTooltip,
				anchorPoint = Vector2.new(1, 0),
				position = if DeviceType1 == DeviceType.Desktop then nil else UDim2.new(1, 0, 0, 0),
				hoverText = TooltipHoverText
			})
		})
		local config1 = {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12)
			}),
			Header = NoFFlagLuaAppPropagateFriendsCarouselHeader and MaybeForceDarkThemeFunction(if ShowTooltip then Frame else ImageButton, p1.props.forceDarkThemeForHeader),
			CarouselFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, CarouselHeight)
			}, {
				CarouselContent = FetchingStatus and RoactModule.createElement(LoadingStateContainer, {
					dataStatus = p1.state.dataStatus,
					onRetry = OnRetry,
					renderOnLoading = function()
						return nil
					end,
					renderOnLoaded = function()
						-- upvalues: Element (copy)
						return Element
					end
				}) or Element
			})
		}
		local Element1 = if p1.props.onActivateInfoIcon then RoactModule.createElement(View, {
			tag = "col align-x-right align-y-top",
			Size = UDim2.new(1, -DesignTokens.iconSizeSmall, 0, -12)
		}, {
			RoactModule.createElement(View, { Size = UDim2.new(0, 0, 0, 14) }),
			RoactModule.createElement(IconButton, {
				icon = "icons/actions/info_small",
				size = IconSize.Small,
				onActivated = p1.props.onActivateInfoIcon
			})
		}) else nil
		
		return if GetFFlagLuaAppGameCarouselUseAutoSizingModule() then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			LayoutOrder = LayoutOrder
		}, config1, Element1) else RoactModule.createElement(FitChildrenModule.FitFrame, {
			BackgroundTransparency = 1,
			fitAxis = FitChildrenModule.FitAxis.Height,
			Size = UDim2.new(1, 0, 0, 0),
			LayoutOrder = LayoutOrder
		}, config1, Element1)
	end
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithSelectionCursorProviderFunction (upval), v51 (copy)
		return WithSelectionCursorProviderFunction(function(p3)
			-- upvalues: v51 (upval), p2 (copy)
			return v51(p2, p3)
		end)
	end)
end

return function(p1)
	-- upvalues: UseUiModeInfoFunction (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), UiMode (copy), UseSelectorFunction (copy), CryoModule (copy), RoactModule (copy), CarouselWidget (copy)
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local UseStyleResult = UseStyleFunction()
	
	return RoactModule.createElement(CarouselWidget, (CryoModule.Dictionary.join(p1, {
		designTokens = UseDesignTokensFunction(function(p2)
			-- upvalues: UseUiModeInfoResult (copy), UiMode (upval), UseStyleResult (copy)
			return if UseUiModeInfoResult.uiMode == UiMode.TenFoot then {
				headerFont = p2.Typography.HeadingSmall.Font,
				headerTextSize = p2.Typography.HeadingSmall.FontSize,
				subtitleTextSize = p2.Typography.TitleLarge.FontSize,
				darkThemeTextColor = p2.Color.Extended.White.White_100.Color3,
				iconSizeSmall = p2.Size.Size_800
			} else {
				headerFont = UseStyleResult.Font.Header1.Font,
				headerTextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header1.RelativeSize,
				subtitleTextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionLarge.RelativeSize,
				darkThemeTextColor = p2.Color.Extended.White.White_100.Color3,
				iconSizeSmall = p2.Size.Size_800
			}
		end),
		showSeeAll = p1.showSeeAll and UseUiModeInfoResult.uiMode ~= UiMode.TenFoot,
		screenSize = UseSelectorFunction(function(p2)
			return p2.ScreenSize
		end)
	})))
end