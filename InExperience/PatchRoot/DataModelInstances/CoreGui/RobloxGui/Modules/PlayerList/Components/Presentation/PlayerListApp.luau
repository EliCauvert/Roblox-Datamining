local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local signalsModule = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local otterModule = require(corePackagesService.Packages.Otter)
local cryoModule = require(corePackagesService.Packages.Cryo)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local _ = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local statsUtilsModule = require(robloxGui.Modules.Stats.StatsUtils)
local parent = script.Parent
local presentationCommon = parent.Parent.PresentationCommon
local parent_1 = parent.Parent.Parent
local useLeaderboardStore = playerListModule.Hooks.useLeaderboardStore
local playerEntryContainerModule = require(parent_1.Components.Container.PlayerEntryContainer)
local playerListDisplayContainerModule = require(parent_1.Components.Container.PlayerListDisplayContainer)
local tenFootSideBarModule = require(presentationCommon.TenFootSideBar)
local connection = parent_1.Components.Connection
local eventConnectionsModule = require(connection.EventConnections)
local contextActionsBinderModule = require(connection.ContextActionsBinder)
local topStatConnectorModule = require(connection.TopStatConnector)
local withLayoutValues = require(connection.LayoutValues).WithLayoutValues
local fFlagAddNewPlayerListFocusNav = playerListModule.Flags.FFlagAddNewPlayerListFocusNav
local fFlagPlayerListRemoveTopStatModule = require(parent_1.Flags.FFlagPlayerListRemoveTopStat)
local t = { dampingRatio = 1, frequency = 7 }
local playerListApp = roactModule.PureComponent:extend("PlayerListApp")

local function _(p0) --[[ line: 54 | named "shouldShowNeutralTeam" ]]
	for i, v in ipairs(p0) do
		if v.Team == nil then
			return true
		end
	end
	return false
end

local function getTeamCount(p1, p2) --[[ line: 63 ]]
	local t = {}
	local var23 = 0
	
	for i, v in pairs(p1) do
		if not t[v.TeamColor.Number] then
			t[v.TeamColor.Number] = true
			var23 += 1
		end
	end
	if var23 > 0 then
		local var24
		for i_1, v_1 in ipairs(p2) do
			if v_1.Team == nil then
				var24 = true
				if var24 then
					var23 += 1
				end
			end
		end
		var24 = false
	end
	return var23
end

function playerListApp.init(p3) --[[ line: 78 ]]
	-- upvalues: roactModule (ref), otterModule (ref), signalsModule (ref), displayModule (ref)
	p3.state = { visible = true }
	local var25, var26 = roactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p3.positionOffset = var25
	p3.updatePositionOffset = var26
	p3.positionMotor = otterModule.createSingleMotor(0)
	p3.positionMotor:onStep(function(p4) --[[ line: 86 ]]
		-- upvalues: p3 (ref)
		p3.updatePositionOffset(UDim2.new(p4, 0, 0, 0))
	end)
	p3.positionMotor:onComplete(function(_) --[[ line: 89 ]]
		-- upvalues: p3 (ref)
		if not p3.props.displayOptions.isVisible then
			p3:setState({ visible = false })
		end
	end)
	p3.disposeUiScaleEffect = signalsModule.createEffect(function(p5) --[[ line: 96 ]]
		-- upvalues: displayModule (copy), p3 (ref)
		p3:setState({
			UiScale = displayModule.GetDisplayStore(p5).getUIScale(p5)
		})
	end)
end

function playerListApp.render(p6) --[[ line: 104 ]]
	-- upvalues: roactModule (ref), contextActionsBinderModule (ref), fFlagAddNewPlayerListFocusNav (ref), eventConnectionsModule (ref), withLayoutValues (ref), statsUtilsModule (ref), playersService (ref), getTeamCount (ref), playerEntryContainerModule (ref), playerListDisplayContainerModule (ref), fFlagPlayerListRemoveTopStatModule (ref), topStatConnectorModule (ref), tenFootSideBarModule (ref)
	return if p6.state.visible then withLayoutValues(function(p7) --[[ line: 112 ]]
		-- upvalues: p6 (ref), statsUtilsModule (copy), playersService (copy), getTeamCount (copy), roactModule (copy), playerEntryContainerModule (copy), playerListDisplayContainerModule (copy), fFlagAddNewPlayerListFocusNav (copy), eventConnectionsModule (copy), contextActionsBinderModule (copy), fFlagPlayerListRemoveTopStatModule (copy), topStatConnectorModule (copy), tenFootSideBarModule (copy)
		local containerPosition = p7.ContainerPosition
		local containerSize = p7.ContainerSize
		local anchorPoint = p7.AnchorPoint
		
		if not p7.IsTenFoot and p6.props.displayOptions.performanceStatsVisible then
			containerPosition += UDim2.fromOffset(0, statsUtilsModule.ButtonHeight)
		end
		containerPosition += UDim2.fromOffset(0, p7.TopBarOffset * p6.state.UiScale)
		local minValue = math.min(p6.props.gameStatsCount, if p6.props.displayOptions.isSmallTouchDevice then p7.MaxLeaderstatsSmallScreen else p7.MaxLeaderstats)
		
		if minValue > 0 then
			containerSize += UDim2.new(0, (p7.StatEntrySizeX + p7.EntryPadding) * minValue, 0, 0)
		end
		local entrySizeX
		local _ = nil
		
		if p7.IsTenFoot then
			entrySizeX = p7.EntrySizeX
		else
			entrySizeX = p7.EntryBaseSizeX + math.min(4, minValue) * p7.EntrySizeIncreasePerStat
			containerSize += UDim2.new(0, p7.ExtraContainerPadding, 0, 0)
			local var28 = containerSize.X.Offset + p7.ContainerPadding * 2 + (p7.PlayerDropDownSizeX + p7.PlayerDropDownOffset)
			
			if p6.props.screenSizeX - var28 < entrySizeX then
				entrySizeX = p6.props.screenSizeX - var28
			end
			containerSize += UDim2.new(0, entrySizeX, 0, 0)
		end
		local var29 = if playersService.MaxPlayers >= 6 and playersService.MaxPlayers <= 12 then playersService.MaxPlayers * 26 + getTeamCount(p6.props.teams, p6.props.players) * 20 else 1e999
		local t = {}
		
		if p7.IsTenFoot then
			for i, v in ipairs(p6.props.players) do
				if v == playersService.LocalPlayer then
					t.TitlePlayerEntry = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Position = UDim2.fromOffset(0, 0),
						Size = UDim2.new(1, p7.EntryXOffset, 0, p7.PlayerEntrySizeY)
					}, {
						PlayerEntry = roactModule.createElement(playerEntryContainerModule, {
							titlePlayerEntry = true,
							entrySizeX = entrySizeX,
							player = v,
							playerIconInfo = p6.props.playerIconInfo[v.UserId],
							playerRelationship = p6.props.playerRelationship[v.UserId]
						})
					})
					break
				end
			end
		end
		t.PlayerScrollList = roactModule.createElement(playerListDisplayContainerModule, {
			screenSizeY = p6.props.screenSizeY,
			entrySize = entrySizeX,
			isVisible = if fFlagAddNewPlayerListFocusNav then p6.state.visible else nil
		})
		t.EventConnections = roactModule.createElement(eventConnectionsModule)
		t.ContextActionsBindings = roactModule.createElement(contextActionsBinderModule)
		
		if not fFlagPlayerListRemoveTopStatModule then
			t.TopStatConnector = roactModule.createElement(topStatConnectorModule)
		end
		if p6.props.displayOptions.isTenFootInterface then
			t.TenFootSideBar = roactModule.createElement(tenFootSideBarModule)
		end
		return roactModule.createElement("Frame", {
			Position = containerPosition,
			AnchorPoint = anchorPoint,
			Size = containerSize,
			BackgroundTransparency = 1,
			Visible = p6.state.visible,
			ZIndex = if p7.IsTenFoot then 2 else 1,
			AutoLocalize = false,
			[roactModule.Ref] = p6.rootRef
		}, {
			OffsetFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = p6.positionOffset
			}, t),
			UISizeConstraint = roactModule.createElement("UISizeConstraint", {
				MinSize = Vector2.new(0, 0),
				MaxSize = Vector2.new(1e999, var29)
			}) or nil
		})
	end) else roactModule.createFragment({
		roactModule.createElement(contextActionsBinderModule),
		if fFlagAddNewPlayerListFocusNav then roactModule.createElement(eventConnectionsModule) else nil
	})
end

function playerListApp.didMount(p8) --[[ line: 224 ]]
	p8:setState({ visible = p8.props.displayOptions.isVisible })
end

function playerListApp.didUpdate(p9, p10, _) --[[ line: 230 ]]
	-- upvalues: otterModule (ref), t (ref)
	if p9.props.displayOptions.isVisible ~= p10.displayOptions.isVisible then
		if p9.props.displayOptions.isTenFootInterface then
			p9:setState({ visible = p9.props.displayOptions.isVisible })
			
			return
		elseif p9.props.displayOptions.isVisible then
			p9:setState({ visible = true })
			p9.positionMotor:setGoal(otterModule.instant(0.2))
			p9.positionMotor:step(0)
			p9.positionMotor:setGoal(otterModule.spring(0, t))
			
			return
		end
		p9.positionMotor:setGoal(otterModule.spring(1.1, t))
	end
end

function playerListApp.willUnmount(p11) --[[ line: 251 ]]
	p11.positionMotor:destroy()
	p11.positionMotor = nil
	
	if p11.disposeUiScaleEffect then
		p11.disposeUiScaleEffect()
	end
end

return roactRoduxModule.connect(function(p14) --[[ line: 260 | named "mapStateToProps" ]]
	return {
		screenSizeX = p14.screenSize.X,
		screenSizeY = p14.screenSize.Y,
		displayOptions = p14.displayOptions,
		players = p14.players,
		playerStats = p14.playerStats,
		playerIconInfo = p14.playerIconInfo,
		playerRelationship = p14.playerRelationship,
		gameStats = p14.gameStats,
		teams = p14.teams
	}
end, nil)(function(p12) --[[ line: 276 | named "PlayerListAppWithLeaderboardStore" ]]
	-- upvalues: useLeaderboardStore (ref), signalsModule (ref), signalsReactModule (ref), roactModule (ref), playerListApp (ref), cryoModule (ref)
	local var31 = useLeaderboardStore()
	
	return roactModule.createElement(playerListApp, cryoModule.Dictionary.join(p12, {
		gameStatsCount = signalsReactModule.useSignalState(signalsModule.createComputed(function(p13) --[[ line: 279 ]]
			-- upvalues: var31 (ref), p12 (ref)
			return if var31 then var31.getGameStatsList().getCount(p13) else #p12.gameStats
		end))
	}))
end)