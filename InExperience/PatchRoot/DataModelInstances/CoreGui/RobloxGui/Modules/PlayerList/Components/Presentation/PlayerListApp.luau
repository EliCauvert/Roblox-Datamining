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

local function _(p1)
	for i, v in ipairs(p1) do
		if v.Team == nil then
			return true
		end
	end
	return false
end

local function getTeamCount(p2, p3)
	local t = {}
	local var1 = 0
	
	for i, v in pairs(p2) do
		if not t[v.TeamColor.Number] then
			t[v.TeamColor.Number] = true
			var1 += 1
		end
	end
	if var1 > 0 then
		local var2
		for i_1, v_1 in ipairs(p3) do
			if v_1.Team == nil then
				var2 = true
				if var2 then
					var1 += 1
				end
			end
		end
		var2 = false
	end
	return var1
end

function playerListApp.init(p4)
	-- upvalues: roactModule (ref), otterModule (ref), signalsModule (ref), displayModule (ref)
	p4.state = { visible = true }
	local var3, var4 = roactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p4.positionOffset = var3
	p4.updatePositionOffset = var4
	p4.positionMotor = otterModule.createSingleMotor(0)
	p4.positionMotor:onStep(function(p5)
		-- upvalues: p4 (ref)
		p4.updatePositionOffset(UDim2.new(p5, 0, 0, 0))
	end)
	p4.positionMotor:onComplete(function(_)
		-- upvalues: p4 (ref)
		if not p4.props.displayOptions.isVisible then
			p4:setState({ visible = false })
		end
	end)
	p4.disposeUiScaleEffect = signalsModule.createEffect(function(p5)
		-- upvalues: displayModule (copy), p4 (ref)
		p4:setState({
			UiScale = displayModule.GetDisplayStore(p5).getUIScale(p5)
		})
	end)
end

function playerListApp.render(p4)
	-- upvalues: roactModule (ref), contextActionsBinderModule (ref), fFlagAddNewPlayerListFocusNav (ref), eventConnectionsModule (ref), withLayoutValues (ref), statsUtilsModule (ref), playersService (ref), getTeamCount (ref), playerEntryContainerModule (ref), playerListDisplayContainerModule (ref), fFlagPlayerListRemoveTopStatModule (ref), topStatConnectorModule (ref), tenFootSideBarModule (ref)
	return if p4.state.visible then withLayoutValues(function(p5)
		-- upvalues: p4 (ref), statsUtilsModule (copy), playersService (copy), getTeamCount (copy), roactModule (copy), playerEntryContainerModule (copy), playerListDisplayContainerModule (copy), fFlagAddNewPlayerListFocusNav (copy), eventConnectionsModule (copy), contextActionsBinderModule (copy), fFlagPlayerListRemoveTopStatModule (copy), topStatConnectorModule (copy), tenFootSideBarModule (copy)
		local containerPosition = p5.ContainerPosition
		local containerSize = p5.ContainerSize
		local anchorPoint = p5.AnchorPoint
		
		if not p5.IsTenFoot and p4.props.displayOptions.performanceStatsVisible then
			containerPosition += UDim2.fromOffset(0, statsUtilsModule.ButtonHeight)
		end
		containerPosition += UDim2.fromOffset(0, p5.TopBarOffset * p4.state.UiScale)
		local minValue = math.min(p4.props.gameStatsCount, if p4.props.displayOptions.isSmallTouchDevice then p5.MaxLeaderstatsSmallScreen else p5.MaxLeaderstats)
		
		if minValue > 0 then
			containerSize += UDim2.new(0, (p5.StatEntrySizeX + p5.EntryPadding) * minValue, 0, 0)
		end
		local entrySizeX
		local _ = nil
		
		if p5.IsTenFoot then
			entrySizeX = p5.EntrySizeX
		else
			entrySizeX = p5.EntryBaseSizeX + math.min(4, minValue) * p5.EntrySizeIncreasePerStat
			containerSize += UDim2.new(0, p5.ExtraContainerPadding, 0, 0)
			local var3 = containerSize.X.Offset + p5.ContainerPadding * 2 + (p5.PlayerDropDownSizeX + p5.PlayerDropDownOffset)
			
			if p4.props.screenSizeX - var3 < entrySizeX then
				entrySizeX = p4.props.screenSizeX - var3
			end
			containerSize += UDim2.new(0, entrySizeX, 0, 0)
		end
		local var4 = if playersService.MaxPlayers >= 6 and playersService.MaxPlayers <= 12 then playersService.MaxPlayers * 26 + getTeamCount(p4.props.teams, p4.props.players) * 20 else 1e999
		local t = {}
		
		if p5.IsTenFoot then
			for i, v in ipairs(p4.props.players) do
				if v == playersService.LocalPlayer then
					t.TitlePlayerEntry = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Position = UDim2.fromOffset(0, 0),
						Size = UDim2.new(1, p5.EntryXOffset, 0, p5.PlayerEntrySizeY)
					}, {
						PlayerEntry = roactModule.createElement(playerEntryContainerModule, {
							titlePlayerEntry = true,
							entrySizeX = entrySizeX,
							player = v,
							playerIconInfo = p4.props.playerIconInfo[v.UserId],
							playerRelationship = p4.props.playerRelationship[v.UserId]
						})
					})
					break
				end
			end
		end
		t.PlayerScrollList = roactModule.createElement(playerListDisplayContainerModule, {
			screenSizeY = p4.props.screenSizeY,
			entrySize = entrySizeX,
			isVisible = if fFlagAddNewPlayerListFocusNav then p4.state.visible else nil
		})
		t.EventConnections = roactModule.createElement(eventConnectionsModule)
		t.ContextActionsBindings = roactModule.createElement(contextActionsBinderModule)
		
		if not fFlagPlayerListRemoveTopStatModule then
			t.TopStatConnector = roactModule.createElement(topStatConnectorModule)
		end
		if p4.props.displayOptions.isTenFootInterface then
			t.TenFootSideBar = roactModule.createElement(tenFootSideBarModule)
		end
		return roactModule.createElement("Frame", {
			Position = containerPosition,
			AnchorPoint = anchorPoint,
			Size = containerSize,
			BackgroundTransparency = 1,
			Visible = p4.state.visible,
			ZIndex = if p5.IsTenFoot then 2 else 1,
			AutoLocalize = false,
			[roactModule.Ref] = p4.rootRef
		}, {
			OffsetFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = p4.positionOffset
			}, t),
			UISizeConstraint = roactModule.createElement("UISizeConstraint", {
				MinSize = Vector2.new(0, 0),
				MaxSize = Vector2.new(1e999, var4)
			}) or nil
		})
	end) else roactModule.createFragment({
		roactModule.createElement(contextActionsBinderModule),
		if fFlagAddNewPlayerListFocusNav then roactModule.createElement(eventConnectionsModule) else nil
	})
end

function playerListApp.didMount(p5)
	p5:setState({ visible = p5.props.displayOptions.isVisible })
end

function playerListApp.didUpdate(p5, p6, _)
	-- upvalues: otterModule (ref), t (ref)
	if p5.props.displayOptions.isVisible ~= p6.displayOptions.isVisible then
		if p5.props.displayOptions.isTenFootInterface then
			p5:setState({ visible = p5.props.displayOptions.isVisible })
			
			return
		elseif p5.props.displayOptions.isVisible then
			p5:setState({ visible = true })
			p5.positionMotor:setGoal(otterModule.instant(0.2))
			p5.positionMotor:step(0)
			p5.positionMotor:setGoal(otterModule.spring(0, t))
			
			return
		end
		p5.positionMotor:setGoal(otterModule.spring(1.1, t))
	end
end

function playerListApp.willUnmount(p5)
	p5.positionMotor:destroy()
	p5.positionMotor = nil
	
	if p5.disposeUiScaleEffect then
		p5.disposeUiScaleEffect()
	end
end

return roactRoduxModule.connect(function(p5)
	return {
		screenSizeX = p5.screenSize.X,
		screenSizeY = p5.screenSize.Y,
		displayOptions = p5.displayOptions,
		players = p5.players,
		playerStats = p5.playerStats,
		playerIconInfo = p5.playerIconInfo,
		playerRelationship = p5.playerRelationship,
		gameStats = p5.gameStats,
		teams = p5.teams
	}
end, nil)(function(p5)
	-- upvalues: useLeaderboardStore (ref), signalsModule (ref), signalsReactModule (ref), roactModule (ref), playerListApp (ref), cryoModule (ref)
	local var3 = useLeaderboardStore()
	
	return roactModule.createElement(playerListApp, cryoModule.Dictionary.join(p5, {
		gameStatsCount = signalsReactModule.useSignalState(signalsModule.createComputed(function(p6)
			-- upvalues: var3 (ref), p5 (ref)
			return if var3 then var3.getGameStatsList().getCount(p6) else #p5.gameStats
		end))
	}))
end)