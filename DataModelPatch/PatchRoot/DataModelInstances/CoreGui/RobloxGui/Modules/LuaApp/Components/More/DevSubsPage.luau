local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local ConstantsModule = require(Modules.LuaApp.Constants)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local DevSubStatusModule = require(Modules.LuaApp.Enum.DevSubStatus)
local DevSubsModule = require(Modules.LuaApp.Thunks.DevSubs)
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local DevSubGameListModule = require(Modules.LuaApp.Components.More.DevSubGameList)
local DevSubListModule = require(Modules.LuaApp.Components.More.DevSubList)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local GameIconReducer = require(CorePackages.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer

local function _(p1): boolean
	-- upvalues: DevSubStatusModule (copy)
	return p1.status == DevSubStatusModule.Active
end

local DevSubsPage = RoactModule.Component:extend("DevSubsPage")

function DevSubsPage.init(p1)
	-- upvalues: AppPageModule (copy)
	function p1.onGameActivated(p2)
		-- upvalues: p1 (copy), AppPageModule (upval)
		p1.props.navigateDown({ name = AppPageModule.DevSubs, detail = p2.id })
	end
	
	function p1.onDevSubActivated(DevSub, AnchorSpacePosition, AnchorSpaceSize)
		-- upvalues: p1 (copy)
		p1.props.dispatchDevSubMoreMenuOverlay({
			anchorSpacePosition = AnchorSpacePosition,
			anchorSpaceSize = AnchorSpaceSize,
			devSub = DevSub
		})
	end
end

function DevSubsPage.render(p1)
	-- upvalues: WithStyleFunction (copy), FormFactor (copy), RoactModule (copy), ConstantsModule (copy), DevSubListModule (copy), DevSubGameListModule (copy), TopBarModule (copy), FitChildrenModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), FormFactor (upval), RoactModule (upval), ConstantsModule (upval), DevSubListModule (upval), DevSubGameListModule (upval), TopBarModule (upval), FitChildrenModule (upval)
		local DevSubs = p1.props.devSubs
		local SelectedGame = p1.props.selectedGame
		local IsFormFactorMatch = p1.props.formFactor == FormFactor.WIDE
		local config = {
			Layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 0)
			}),
			UIPadding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, IsFormFactorMatch and ConstantsModule.MORE_PAGE_WIDE_PADDING_HORIZONTAL or 0),
				PaddingRight = UDim.new(0, IsFormFactorMatch and ConstantsModule.MORE_PAGE_WIDE_PADDING_HORIZONTAL or 0),
				PaddingTop = UDim.new(0, IsFormFactorMatch and ConstantsModule.MORE_PAGE_WIDE_PADDING_VERTICAL or ConstantsModule.MORE_PAGE_SECTION_PADDING),
				PaddingBottom = UDim.new(0, IsFormFactorMatch and ConstantsModule.MORE_PAGE_WIDE_PADDING_VERTICAL or ConstantsModule.MORE_PAGE_SECTION_PADDING)
			})
		}
		local DevSubsByGameId = p1:getDevSubsByGameId(DevSubs)
		local GamesById = p1:getGamesById(DevSubs)
		
		if SelectedGame then
			config.SubList = RoactModule.createElement(DevSubListModule, {
				game = GamesById[SelectedGame],
				devSubs = DevSubsByGameId[SelectedGame],
				onDevSubActivated = p1.onDevSubActivated
			})
		else
			config.GameList = RoactModule.createElement(DevSubGameListModule, {
				games = GamesById,
				subsByGameId = DevSubsByGameId,
				onGameActivated = p1.onGameActivated
			})
		end
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
			BackgroundTransparency = p2.Theme.BackgroundDefault.Transparency
		}, {
			TopBarMorePage = RoactModule.createElement(TopBarModule.Container, { leftItem = TopBarModule.BackButton }),
			PageContent = RoactModule.createElement(TopBarModule.PageContent, {}, {
				Scroller = RoactModule.createElement(FitChildrenModule.FitScrollingFrame, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ScrollBarThickness = 0,
					ClipsDescendants = false,
					Position = UDim2.fromScale(0, 0),
					Size = UDim2.fromScale(1, 1),
					CanvasSize = UDim2.new(1, 0, 0, 0),
					fitFields = { CanvasSize = FitChildrenModule.FitAxis.Height }
				}, config)
			})
		})
	end)
end

function DevSubsPage:getDevSubsByGameId(DevSubs)
	local t = {}
	
	for _, devSub in pairs(DevSubs) do
		local GameId = devSub.gameId
		
		if t[GameId] then
			table.insert(t[GameId], devSub)
		else
			t[GameId] = { devSub }
		end
	end
	return t
end

function DevSubsPage.getGameIcon(p1, GameId)
	local Text = tostring(GameId)
	local GameIcons = p1.props.gameIcons
	
	return if GameIcons and GameIcons[Text] then GameIcons[Text].url else ""
end

function DevSubsPage.getGamesById(p1, DevSubs)
	-- upvalues: DevSubStatusModule (copy)
	local t = {}
	
	for _, devSub in pairs(DevSubs) do
		local Entry = t[devSub.gameId]
		local IsStatusMatch = devSub.status == DevSubStatusModule.Active
		
		if not Entry then
			t[devSub.gameId] = {
				name = devSub.gameData.name,
				icon = p1:getGameIcon(devSub.gameId),
				id = devSub.gameId,
				activeSubs = if IsStatusMatch then 1 else 0
			}
		elseif IsStatusMatch then
			Entry.activeSubs += 1
		end
	end
	return t
end

function DevSubsPage.didMount(p2)
	-- upvalues: RetrievalStatusModule (copy)
	if p2.props.devSubsFetchingStatus == RetrievalStatusModule.NotStarted then
		p2.props.dispatchFetchDevSubs(p2.props.networking)
	end
end

return RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(function(p2, _)
	-- upvalues: DevSubsModule (copy), GameIconReducer (copy)
	return {
		formFactor = p2.FormFactor,
		devSubsFetchingStatus = DevSubsModule.GetFetchingStatus(p2),
		devSubs = p2.DevSubs,
		gameIcons = p2[GameIconReducer.key]
	}
end, function(Callback)
	-- upvalues: DevSubsModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return {
		dispatchFetchDevSubs = function(p2)
			-- upvalues: Callback (copy), DevSubsModule (upval)
			return Callback(DevSubsModule.Fetch(p2))
		end,
		navigateDown = function(...)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			if FFlagSignalsNavP3Dispatch then
				local v1, v2 = ...
				
				return NavigationCommands.down(NavigationCommands.fromLegacyPage(v1), v2)
			else
				return Callback(NavigateDownModule(...))
			end
		end,
		dispatchDevSubMoreMenuOverlay = function(p2)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			return Callback(SetCentralOverlayModule(OverlayTypeModule.DevSubMore, p2))
		end
	}
end)(DevSubsPage)))