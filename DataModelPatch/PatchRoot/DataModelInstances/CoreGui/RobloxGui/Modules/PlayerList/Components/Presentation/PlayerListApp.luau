local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local SignalsModule = require(CorePackages.Packages.Signals)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local OtterModule = require(CorePackages.Packages.Otter)
local CryoModule = require(CorePackages.Packages.Cryo)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local _ = require(CorePackages.Workspace.Packages.LeaderboardStore)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local StatsUtilsModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Stats.StatsUtils)
local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local UseLeaderboardStoreFunction = PlayerListModule.Hooks.useLeaderboardStore
local PlayerEntryContainerModule = require(Parent1.Components.Container.PlayerEntryContainer)
local PlayerListDisplayContainerModule = require(Parent1.Components.Container.PlayerListDisplayContainer)
local TenFootSideBarModule = require(Parent.Parent.PresentationCommon.TenFootSideBar)
local Connection = Parent1.Components.Connection
local EventConnectionsModule = require(Connection.EventConnections)
local ContextActionsBinderModule = require(Connection.ContextActionsBinder)
local TopStatConnectorModule = require(Connection.TopStatConnector)
local WithLayoutValuesFunction = require(Connection.LayoutValues).WithLayoutValues
local FFlagAddNewPlayerListFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListFocusNav
local config = { dampingRatio = 1, frequency = 7 }
local PlayerListApp = RoactModule.PureComponent:extend("PlayerListApp")

local function _(List): boolean
	for _, Player in ipairs(List) do
		if Player.Team == nil then
			return true
		end
	end
	return false
end

local function getTeamCount(Teams, Players): number
	local t = {}
	local Count = 0
	
	for _, team in pairs(Teams) do
		if not t[team.TeamColor.Number] then
			t[team.TeamColor.Number] = true
			Count += 1
		end
	end
	if Count > 0 then
		local Flag = false
		
		for _, player in ipairs(Players) do
			if player.Team == nil then
				Flag = true
				break
			end
		end
		if Flag then
			Count += 1
		end
	end
	return Count
end

function PlayerListApp.init(p1)
	-- upvalues: RoactModule (copy), OtterModule (copy), SignalsModule (copy), DisplayModule (copy)
	p1.state = { visible = true }
	p1.positionOffset, p1.updatePositionOffset = RoactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p1.positionMotor = OtterModule.createSingleMotor(0)
	p1.positionMotor:onStep(function(XScale)
		-- upvalues: p1 (copy)
		p1.updatePositionOffset(UDim2.new(XScale, 0, 0, 0))
	end)
	p1.positionMotor:onComplete(function(_)
		-- upvalues: p1 (copy)
		if not p1.props.displayOptions.isVisible then
			p1:setState({ visible = false })
		end
	end)
	p1.disposeUiScaleEffect = SignalsModule.createEffect(function(p2)
		-- upvalues: DisplayModule (upval), p1 (copy)
		p1:setState({
			UiScale = DisplayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
end

function PlayerListApp.render(p1)
	-- upvalues: RoactModule (copy), ContextActionsBinderModule (copy), FFlagAddNewPlayerListFocusNav (copy), EventConnectionsModule (copy), WithLayoutValuesFunction (copy), StatsUtilsModule (copy), Players (copy), getTeamCount (copy), PlayerEntryContainerModule (copy), PlayerListDisplayContainerModule (copy), TopStatConnectorModule (copy), TenFootSideBarModule (copy)
	return if p1.state.visible then WithLayoutValuesFunction(function(Frame)
		-- upvalues: p1 (copy), StatsUtilsModule (upval), Players (upval), getTeamCount (upval), RoactModule (upval), PlayerEntryContainerModule (upval), PlayerListDisplayContainerModule (upval), FFlagAddNewPlayerListFocusNav (upval), EventConnectionsModule (upval), ContextActionsBinderModule (upval), TopStatConnectorModule (upval), TenFootSideBarModule (upval)
		local ContainerPosition = Frame.ContainerPosition
		local ContainerSize = Frame.ContainerSize
		local AnchorPoint = Frame.AnchorPoint
		
		if not Frame.IsTenFoot and p1.props.displayOptions.performanceStatsVisible then
			ContainerPosition += UDim2.fromOffset(0, StatsUtilsModule.ButtonHeight)
		end
		local NewContainerPosition = ContainerPosition + UDim2.fromOffset(0, Frame.TopBarOffset * p1.state.UiScale)
		local Smallest = math.min(p1.props.gameStatsCount, if p1.props.displayOptions.isSmallTouchDevice then Frame.MaxLeaderstatsSmallScreen else Frame.MaxLeaderstats)
		
		if Smallest > 0 then
			ContainerSize += UDim2.new(0, (Frame.StatEntrySizeX + Frame.EntryPadding) * Smallest, 0, 0)
		end
		local EntrySizeX = nil
		if Frame.IsTenFoot then
			EntrySizeX = Frame.EntrySizeX
		else
			EntrySizeX = Frame.EntryBaseSizeX + math.min(4, Smallest) * Frame.EntrySizeIncreasePerStat
			local NewContainerSize = ContainerSize + UDim2.new(0, Frame.ExtraContainerPadding, 0, 0)
			local NewOffset = NewContainerSize.X.Offset + Frame.ContainerPadding * 2 + (Frame.PlayerDropDownSizeX + Frame.PlayerDropDownOffset)
			
			if p1.props.screenSizeX - NewOffset < EntrySizeX then
				EntrySizeX = p1.props.screenSizeX - NewOffset
			end
			ContainerSize = NewContainerSize + UDim2.new(0, EntrySizeX, 0, 0)
		end
		local NewMaxPlayers = if Players.MaxPlayers >= 6 and Players.MaxPlayers <= 12 then Players.MaxPlayers * 26 + getTeamCount(p1.props.teams, p1.props.players) * 20 else 1e999
		local t = {}
		
		if Frame.IsTenFoot then
			for _, player in ipairs(p1.props.players) do
				if player == Players.LocalPlayer then
					t.TitlePlayerEntry = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Position = UDim2.fromOffset(0, 0),
						Size = UDim2.new(1, Frame.EntryXOffset, 0, Frame.PlayerEntrySizeY)
					}, {
						PlayerEntry = RoactModule.createElement(PlayerEntryContainerModule, {
							titlePlayerEntry = true,
							entrySizeX = EntrySizeX,
							player = player,
							playerIconInfo = p1.props.playerIconInfo[player.UserId],
							playerRelationship = p1.props.playerRelationship[player.UserId]
						})
					})
					break
				end
			end
		end
		t.PlayerScrollList = RoactModule.createElement(PlayerListDisplayContainerModule, {
			screenSizeY = p1.props.screenSizeY,
			entrySize = EntrySizeX,
			isVisible = if FFlagAddNewPlayerListFocusNav then p1.state.visible else nil
		})
		t.EventConnections = RoactModule.createElement(EventConnectionsModule)
		t.ContextActionsBindings = RoactModule.createElement(ContextActionsBinderModule)
		t.TopStatConnector = RoactModule.createElement(TopStatConnectorModule)
		
		if p1.props.displayOptions.isTenFootInterface then
			t.TenFootSideBar = RoactModule.createElement(TenFootSideBarModule)
		end
		return RoactModule.createElement("Frame", {
			Position = NewContainerPosition,
			AnchorPoint = AnchorPoint,
			Size = ContainerSize,
			BackgroundTransparency = 1,
			Visible = p1.state.visible,
			ZIndex = if Frame.IsTenFoot then 2 else 1,
			AutoLocalize = false,
			[RoactModule.Ref] = p1.rootRef
		}, {
			OffsetFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = p1.positionOffset
			}, t),
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", {
				MinSize = Vector2.new(0, 0),
				MaxSize = Vector2.new(1e999, NewMaxPlayers)
			}) or nil
		})
	end) else RoactModule.createFragment({
		RoactModule.createElement(ContextActionsBinderModule),
		if FFlagAddNewPlayerListFocusNav then RoactModule.createElement(EventConnectionsModule) else nil
	})
end

function PlayerListApp.didMount(p2)
	p2:setState({ visible = p2.props.displayOptions.isVisible })
end

function PlayerListApp.didUpdate(p2, p3, _)
	-- upvalues: OtterModule (copy), config (copy)
	if p2.props.displayOptions.isVisible ~= p3.displayOptions.isVisible then
		if p2.props.displayOptions.isTenFootInterface then
			p2:setState({ visible = p2.props.displayOptions.isVisible })
			
			return
		end
		if p2.props.displayOptions.isVisible then
			p2:setState({ visible = true })
			p2.positionMotor:setGoal(OtterModule.instant(0.2))
			p2.positionMotor:step(0)
			p2.positionMotor:setGoal(OtterModule.spring(0, config))
			
			return
		else
			p2.positionMotor:setGoal(OtterModule.spring(1.1, config))
		end
	end
end

function PlayerListApp.willUnmount(p2)
	p2.positionMotor:destroy()
	p2.positionMotor = nil
	
	if p2.disposeUiScaleEffect then
		p2.disposeUiScaleEffect()
	end
end

return RoactRoduxModule.connect(function(p2)
	return {
		screenSizeX = p2.screenSize.X,
		screenSizeY = p2.screenSize.Y,
		displayOptions = p2.displayOptions,
		players = p2.players,
		playerStats = p2.playerStats,
		playerIconInfo = p2.playerIconInfo,
		playerRelationship = p2.playerRelationship,
		gameStats = p2.gameStats,
		teams = p2.teams
	}
end, nil)(function(p2)
	-- upvalues: UseLeaderboardStoreFunction (copy), SignalsModule (copy), SignalsReactModule (copy), RoactModule (copy), PlayerListApp (copy), CryoModule (copy)
	local UseLeaderboardStoreResult = UseLeaderboardStoreFunction()
	
	return RoactModule.createElement(PlayerListApp, CryoModule.Dictionary.join(p2, {
		gameStatsCount = SignalsReactModule.useSignalState((SignalsModule.createComputed(function(p3)
			-- upvalues: UseLeaderboardStoreResult (copy), p2 (copy)
			return if UseLeaderboardStoreResult then UseLeaderboardStoreResult.getGameStatsList().getCount(p3) else #p2.gameStats
		end)))
	}))
end)