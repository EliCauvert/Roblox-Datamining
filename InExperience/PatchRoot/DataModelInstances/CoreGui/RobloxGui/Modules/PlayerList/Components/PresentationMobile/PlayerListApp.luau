local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local otterModule = require(corePackagesService.Packages.Otter)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local useLayoutValues = playerListModule.Common.useLayoutValues
local constants = playerListModule.Common.Constants
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local constantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.TopBar.Constants)
local var13 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local useTokens = require(corePackagesService.Packages.Foundation).Hooks.useTokens
local parent = script.Parent
local parent_1 = parent.Parent.Parent
local setPlayerListVisibilityModule = require(parent_1.Actions.SetPlayerListVisibility)
local setIsUsingGamepadModule = require(parent_1.Actions.SetIsUsingGamepad)
local playerListDisplayContainerModule = require(parent_1.Components.Container.PlayerListDisplayContainer)
local playerDropDownModule = require(parent.PlayerDropDown)
local connection = parent_1.Components.Connection
local eventConnectionsModule = require(connection.EventConnections)
local contextActionsBinderModule = require(connection.ContextActionsBinder)
local topStatConnectorModule = require(connection.TopStatConnector)
local withLayoutValues = require(connection.LayoutValues).WithLayoutValues
local fFlagPlayerListFixMobileScrollingModule = require(parent_1.Flags.FFlagPlayerListFixMobileScrolling)
local fFlagAddNewPlayerListFocusNav = playerListModule.Flags.FFlagAddNewPlayerListFocusNav
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local fFlagPlayerListIgnoreDevGamepadBindings = playerListModule.Flags.FFlagPlayerListIgnoreDevGamepadBindings
local t = { dampingRatio = 1, frequency = 4 }

local function _(p0, p1, p2, p3, p4) --[[ line: 62 | named "map" ]]
	return (p0 - p1) * (p4 - p3) / (p2 - p1) + p3
end

local playerListApp = roactModule.PureComponent:extend("PlayerListApp")

local function playerListSizeFromViewportSize(p5, p6, p7, p8, p9) --[[ line: 68 ]]
	-- upvalues: fFlagEnableMobilePlayerListOnConsole (ref), var13 (ref), constantsModule (ref)
	local minValue = math.min(p6.x, p6.y)
	local maxValue = math.max(p6.x, p6.y)
	local var28 = (minValue - 320) * 60 / 55 + 270
	local var29 = (maxValue - 480) * 46 / 190 + 434
	var28 = if fFlagEnableMobilePlayerListOnConsole and var28 > 500 then p8 else math.clamp(var28, math.min(270, minValue - 24), 500)
	var29 = if fFlagEnableMobilePlayerListOnConsole and var29 > 600 then p9 else math.clamp(var29, math.min(434, maxValue - 24), 600)
	local var30 = if p6.y < p6.x then var29 else var28
	local var31 = if p6.x < p6.y then var29 else var28
	
	if not fFlagEnableMobilePlayerListOnConsole then
		var30 *= p7
		var31 *= p7
	end
	if var13 and p6.y < p6.x then
		var31 -= constantsModule.TopBarHeight * p5.state.UiScale - 24
	end
	return UDim2.fromOffset(var30, var31)
end

local _ = function(p10) --[[ line: 114 | named "shouldShowNeutralTeam" ]]
	for i, v in ipairs(p10) do
		if v.Team == nil then
			return true
		end
	end
	return false
end

local function getTeamCount(p11, p12) --[[ line: 123 ]]
	local t = {}
	local var33 = 0
	
	for i, v in pairs(p11) do
		if not t[v.TeamColor.Number] then
			t[v.TeamColor.Number] = true
			var33 += 1
		end
	end
	if var33 > 0 then
		local var34
		for i_1, v_1 in ipairs(p12) do
			if v_1.Team == nil then
				var34 = true
				if var34 then
					var33 += 1
				end
			end
		end
		var34 = false
	end
	return var33
end

function playerListApp.init(p13) --[[ line: 138 ]]
	-- upvalues: signalsModule (ref), displayModule (ref), roactModule (ref), otterModule (ref)
	p13.state = { visible = false }
	p13.disposeUiScaleEffect = signalsModule.createEffect(function(p14) --[[ line: 143 ]]
		-- upvalues: displayModule (copy), p13 (ref)
		p13:setState({
			UiScale = displayModule.GetDisplayStore(p14).getUIScale(p14)
		})
	end)
	local var35, var36 = roactModule.createBinding(0.5)
	p13.bodyTransparency = var35
	p13.updateBodyTransparency = var36
	p13.bodyTransparencyMotor = otterModule.createSingleMotor(1)
	p13.bodyTransparencyMotor:onStep(function(p15) --[[ line: 152 ]]
		-- upvalues: p13 (ref)
		p13.updateBodyTransparency(p15)
		p13.props.setLayerCollectorEnabled(if p15 >= 0.99 then p13.props.displayOptions.isVisible else true)
	end)
	p13.bodyTransparencyMotor:onComplete(function() --[[ line: 156 ]]
		-- upvalues: p13 (ref)
		if not p13.props.displayOptions.isVisible then
			p13:setState({ visible = false })
		end
	end)
	local var37, var38 = roactModule.createBinding(0)
	p13.bgTransparency = var37
	p13.updateBgTransparency = var38
	p13.bgTransparencyMotor = otterModule.createSingleMotor(1)
	p13.bgTransparencyMotor:onStep(p13.updateBgTransparency)
	local var39, var40 = roactModule.createBinding(1)
	p13.frameScale = var39
	p13.updateFrameScale = var40
	p13.frameScaleMotor = otterModule.createSingleMotor(0)
	p13.frameScaleMotor:onStep(function(p16) --[[ line: 170 ]]
		-- upvalues: p13 (ref)
		p13.updateFrameScale(p16)
	end)
	p13.titleRef = roactModule.createRef()
	p13.closeRef = roactModule.createRef()
end

function playerListApp.renderBodyChildren(p17, _, p18) --[[ line: 178 ]]
	-- upvalues: roactModule (ref), appFonts (ref), robloxTranslatorModule (ref)
	local visible = p17.state.visible
	local isDropDownVisible = p17.props.isDropDownVisible
	local size1100 = p17.props.tokens.Size.Size_1100
	local size500 = p17.props.tokens.Size.Size_500
	
	return {
		UIScale = roactModule.createElement("UIScale", { Scale = p17.frameScale }),
		UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 6) }),
		TitleText = roactModule.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, size1100),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			Font = appFonts.default:getBold(),
			Visible = visible and not isDropDownVisible,
			TextSize = p17.props.tokens.FontSize.FontSize_500,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			Text = robloxTranslatorModule:FormatByKey("InGame.PlayerList.Leaderboard"),
			[roactModule.Ref] = p17.titleRef
		}),
		CloseButton = roactModule.createElement("ImageButton", {
			Image = "rbxasset://textures/ui/InspectMenu/x.png",
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.fromOffset(size500, size500),
			Position = UDim2.fromOffset(size500 / 2, size500),
			BackgroundTransparency = 1,
			Visible = visible and not isDropDownVisible,
			ZIndex = 0,
			[roactModule.Ref] = p17.closeRef,
			[roactModule.Event.Activated] = function() --[[ line: 219 ]]
				-- upvalues: p17 (ref)
				p17.props.setPlayerListVisible(false)
			end
		}),
		ContentFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutoLocalize = false,
			Position = UDim2.new(0.5, 0, 1, 0),
			AnchorPoint = Vector2.new(0.5, 1),
			Size = UDim2.new(1, 0, 1, -size1100),
			Visible = visible and not isDropDownVisible
		}, p18)
	}
end

function playerListApp.render(p19) --[[ line: 235 ]]
	-- upvalues: roactModule (ref), contextActionsBinderModule (ref), withLayoutValues (ref), fFlagEnableMobilePlayerListOnConsole (ref), playersService (ref), getTeamCount (ref), constantsModule (ref), playerListDisplayContainerModule (ref), fFlagAddNewPlayerListFocusNav (ref), eventConnectionsModule (ref), topStatConnectorModule (ref), fFlagPlayerListFixMobileScrollingModule (ref), playerDropDownModule (ref), var13 (ref), playerListSizeFromViewportSize (ref)
	return if p19.state.visible then withLayoutValues(function(p20) --[[ line: 239 ]]
		-- upvalues: fFlagEnableMobilePlayerListOnConsole (copy), p19 (ref), playersService (copy), getTeamCount (copy), constantsModule (copy), roactModule (copy), playerListDisplayContainerModule (copy), fFlagAddNewPlayerListFocusNav (copy), eventConnectionsModule (copy), contextActionsBinderModule (copy), topStatConnectorModule (copy), fFlagPlayerListFixMobileScrollingModule (copy), playerDropDownModule (copy), var13 (copy), playerListSizeFromViewportSize (copy)
		if fFlagEnableMobilePlayerListOnConsole then
			p20 = p19.props.layoutValues
		end
		local entrySizeX
		local _ = nil
		
		if p20.IsTenFoot then
			entrySizeX = p20.EntrySizeX
		else
			entrySizeX = p20.EntryBaseSizeX + 4 * p20.EntrySizeIncreasePerStat
			local var41 = p20.ContainerPadding * 2 + (p20.PlayerDropDownSizeXMobile + p20.PlayerDropDownOffset)
			
			if p19.props.screenSizeX - var41 < entrySizeX then
				entrySizeX = p19.props.screenSizeX - var41
			end
		end
		local var42 = if playersService.MaxPlayers >= 6 and playersService.MaxPlayers <= 12 then playersService.MaxPlayers * 26 + getTeamCount(p19.props.teams, p19.props.players) * 20 else 1e999
		local var43 = constantsModule.TopBarHeight * p19.state.UiScale
		local t = {}
		
		if p19.state.visible then
			t.PlayerScrollList = roactModule.createElement(playerListDisplayContainerModule, {
				screenSizeY = p19.props.screenSizeY,
				entrySize = entrySizeX,
				isVisible = if fFlagAddNewPlayerListFocusNav then p19.props.displayOptions.isVisible else nil
			})
		end
		t.EventConnections = roactModule.createElement(eventConnectionsModule)
		t.ContextActionsBindings = roactModule.createElement(contextActionsBinderModule)
		t.TopStatConnector = roactModule.createElement(topStatConnectorModule)
		
		return roactModule.createElement("ImageButton", {
			Active = p19.props.displayOptions.isVisible,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = Color3.fromRGB(17, 18, 20),
			BackgroundTransparency = p19.bgTransparency,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			AutoLocalize = false,
			AutoButtonColor = false,
			Selectable = not fFlagPlayerListFixMobileScrollingModule,
			Image = "",
			[roactModule.Event.Activated] = function() --[[ line: 291 ]]
				-- upvalues: p19 (copy)
				p19.props.setPlayerListVisible(false)
			end
		}, {
			PlayerDropDown = roactModule.createElement(playerDropDownModule, {
				contentsVisible = true,
				selectedPlayer = p19.props.dropDownPlayer
			}),
			BodyPadding = if var13 and p19.props.screenSizeY < p19.props.screenSizeX then roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var43) }) else nil,
			BodyBackground = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = playerListSizeFromViewportSize(p19, Vector2.new(p19.props.screenSizeX, p19.props.screenSizeY), p19.state.UiScale, p20.PlayerListSizeMin, p20.PlayerListSizeMax),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundColor3 = Color3.fromRGB(17, 18, 20),
				BackgroundTransparency = p19.bodyTransparency,
				BorderColor3 = Color3.fromRGB(0, 0, 0)
			}, p19:renderBodyChildren(var42, t))
		})
	end) else roactModule.createElement(contextActionsBinderModule)
end

function playerListApp.didMount(p21) --[[ line: 325 ]]
	p21.props.setLayerCollectorEnabled(false)
	p21:setState({ visible = p21.props.displayOptions.isVisible })
end

function playerListApp.willUnmount(p22) --[[ line: 332 ]]
	p22.props.setLayerCollectorEnabled(true)
	
	if p22.disposeUiScaleEffect then
		p22.disposeUiScaleEffect()
	end
end

function playerListApp.didUpdate(p23, p24, _) --[[ line: 339 ]]
	-- upvalues: fFlagPlayerListIgnoreDevGamepadBindings (ref), guiService (ref), constants (ref), userInputService (ref), otterModule (ref), t (ref)
	local isVisible = p23.props.displayOptions.isVisible
	local isDropDownVisible = p23.props.isDropDownVisible
	
	if fFlagPlayerListIgnoreDevGamepadBindings and isVisible ~= p24.displayOptions.isVisible then
		guiService:SetMenuIsOpen(isVisible, constants.PLAYER_LIST_MENU)
	end
	if isVisible then
		p23:setState({ visible = true })
	end
	if isVisible ~= p24.displayOptions.isVisible and isVisible then
		p23.props.setIsUsingGamepad(userInputService:GetLastInputType().Name:find("Gamepad") ~= nil)
	end
	p23.bgTransparencyMotor:setGoal(otterModule.spring(if isDropDownVisible or isVisible then 0.7 else 1, t))
	local isVisible_1 = isDropDownVisible and isVisible
	local var46 = 1.25
	
	if isVisible_1 then
		var46 = 0.95
	elseif isVisible then
		var46 = 1
	end
	p23.frameScaleMotor:setGoal(otterModule.spring(var46, t))
	local var47 = 1
	
	if isVisible_1 then
		var47 = 0.8 * p23.props.preferredTransparency
	elseif isVisible then
		var47 = 0.2 * p23.props.preferredTransparency
	end
	p23.bodyTransparencyMotor:setGoal(otterModule.spring(var47, t))
end

return roactRoduxModule.connect(function(p26) --[[ line: 385 | named "mapStateToProps" ]]
	return {
		isDropDownVisible = p26.playerDropDown.isVisible,
		screenSizeX = p26.screenSize.X,
		screenSizeY = p26.screenSize.Y,
		preferredTransparency = p26.settings.preferredTransparency,
		displayOptions = p26.displayOptions,
		players = p26.players,
		playerStats = p26.playerStats,
		playerIconInfo = p26.playerIconInfo,
		playerRelationship = p26.playerRelationship,
		gameStats = p26.gameStats,
		teams = p26.teams
	}
end, function(p27) --[[ line: 405 | named "mapDispatchToProps" ]]
	-- upvalues: setPlayerListVisibilityModule (ref), setIsUsingGamepadModule (ref)
	return {
		setPlayerListVisible = function(value) --[[ line: 407 ]]
			-- upvalues: p27 (ref), setPlayerListVisibilityModule (copy)
			return p27(setPlayerListVisibilityModule(value))
		end,
		setIsUsingGamepad = function(value) --[[ line: 410 ]]
			-- upvalues: p27 (ref), setIsUsingGamepadModule (copy)
			return p27(setIsUsingGamepadModule(value))
		end
	}
end)(function(p25) --[[ line: 416 ]]
	-- upvalues: fFlagEnableMobilePlayerListOnConsole (ref), useLayoutValues (ref), useTokens (ref), roactModule (ref), playerListApp (ref), cryoModule (ref)
	return roactModule.createElement(playerListApp, cryoModule.Dictionary.join(p25, {
		layoutValues = if fFlagEnableMobilePlayerListOnConsole then if fFlagEnableMobilePlayerListOnConsole then useLayoutValues() else nil else nil,
		tokens = useTokens()
	}))
end)