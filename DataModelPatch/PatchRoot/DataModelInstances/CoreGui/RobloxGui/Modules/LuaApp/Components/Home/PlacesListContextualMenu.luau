local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsCommonGameEvents = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ConstantsModule = require(Modules.LuaApp.Constants)
local JoinableFriendsListModule = require(Modules.LuaApp.Components.Home.JoinableFriendsList)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local UserActiveGameModule = require(Modules.LuaApp.Components.Home.UserActiveGame)
local FeatureContextModule = require(Modules.LuaApp.Enum.FeatureContext)
local ApiFetchGamesDataByPlaceIdsFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).GamesByPlaceId.ApiFetchGamesDataByPlaceIds
local FormBasedContextualMenuModule = require(Modules.LuaApp.Components.FormBasedContextualMenu)
local DEFAULTWIDECONTEXTUALMENUWIDTH = ConstantsModule.DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH
local DEFAULTCONTEXTUALMENUCANCELHEIGHT = ConstantsModule.DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT
local PlacesListContextualMenu = RoactModule.PureComponent:extend("PlacesListContextualMenu")

function PlacesListContextualMenu.init(p1)
	-- upvalues: RoactModule (copy)
	p1.props.analytics.reportOpenModalFromGameTileForPlacesList(p1.props.game.placeId)
	p1.state = { headerHeight = 0 }
	p1.headerRef = RoactModule.createRef()
	
	function p1.updateHeaderHeight()
		-- upvalues: p1 (copy)
		p1:setState({
			headerHeight = p1.headerRef.current and p1.headerRef.current.AbsoluteSize.Y or 0
		})
	end
end

function PlacesListContextualMenu.didMount(p1)
	p1.props.requestGameData(p1.props.networking, p1.props.game.placeId)
	p1.headerSizeChanged = p1.headerRef.current and p1.headerRef.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: p1 (copy)
		p1.updateHeaderHeight()
	end)
	p1.updateHeaderHeight()
end

function PlacesListContextualMenu.render(p1)
	-- upvalues: FormFactor (copy), DEFAULTWIDECONTEXTUALMENUWIDTH (copy), ConstantsModule (copy), DEFAULTCONTEXTUALMENUCANCELHEIGHT (copy), RoactModule (copy), FormBasedContextualMenuModule (copy), UserActiveGameModule (copy), FeatureContextModule (copy), JoinableFriendsListModule (copy)
	local Game1 = p1.props.game
	local ScreenSize = p1.props.screenSize
	local HeaderHeight = p1.state.headerHeight
	local IsFormFactorMatch = p1.props.formFactor == FormFactor.WIDE
	local DEFAULTWIDECONTEXTUALMENUWIDTH1 = IsFormFactorMatch and DEFAULTWIDECONTEXTUALMENUWIDTH or ScreenSize.X
	local NewTopBarHeight = p1.props.topBarHeight + 50
	local NewBOTTOMBARSIZE = ConstantsModule.BOTTOM_BAR_SIZE + 10
	
	return RoactModule.createElement(FormBasedContextualMenuModule, {
		anchorSpaceSize = p1.props.anchorSpaceSize,
		anchorSpacePosition = p1.props.anchorSpacePosition,
		itemWidth = DEFAULTWIDECONTEXTUALMENUWIDTH1
	}, {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		}),
		Header = RoactModule.createElement(UserActiveGameModule, {
			layoutOrder = 1,
			width = DEFAULTWIDECONTEXTUALMENUWIDTH1,
			universeId = Game1.universeId,
			dismissContextualMenu = p1.props.closeCallback,
			featureContext = FeatureContextModule.PlacesList,
			[RoactModule.Ref] = p1.headerRef
		}),
		Divider = RoactModule.createElement("Frame", {
			LayoutOrder = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = ConstantsModule.Color.GRAY4
		}),
		JoinableFriendsList = RoactModule.createElement(JoinableFriendsListModule, {
			LayoutOrder = 3,
			maxHeight = IsFormFactorMatch and ScreenSize.Y - NewTopBarHeight - NewBOTTOMBARSIZE - HeaderHeight or ScreenSize.Y * 0.5 - DEFAULTCONTEXTUALMENUCANCELHEIGHT,
			width = DEFAULTWIDECONTEXTUALMENUWIDTH1,
			universeId = Game1.universeId
		})
	})
end

function PlacesListContextualMenu.willUnmount(p1)
	if p1.headerSizeChanged then
		p1.headerSizeChanged:Disconnect()
	end
end

return (RoactServices.connect({
	analytics = RoactAnalyticsCommonGameEvents,
	networking = RoactNetworkingModule
})((RoactRoduxModule.connect(function(p1, _)
	return {
		topBarHeight = p1.TopBar.topBarHeight,
		formFactor = p1.FormFactor,
		screenSize = p1.ScreenSize
	}
end, function(Callback)
	-- upvalues: ApiFetchGamesDataByPlaceIdsFunction (copy), CloseCentralOverlayModule (copy)
	return {
		requestGameData = function(p1, p2)
			-- upvalues: Callback (copy), ApiFetchGamesDataByPlaceIdsFunction (upval)
			return Callback(ApiFetchGamesDataByPlaceIdsFunction(p1, { p2 }))
		end,
		closeCallback = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end
	}
end)(PlacesListContextualMenu))))