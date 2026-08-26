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
local var1 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
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
local fFlagPlayerListRemoveTopStatModule = require(parent_1.Flags.FFlagPlayerListRemoveTopStat)
local t = { dampingRatio = 1, frequency = 4 }

local function _(p1, p2, p3, p4, p5)
	return (p1 - p2) * (p5 - p4) / (p3 - p2) + p4
end

local playerListApp = roactModule.PureComponent:extend("PlayerListApp")

local function playerListSizeFromViewportSize(p1, p2, p3, p4, p5)
	-- upvalues: fFlagEnableMobilePlayerListOnConsole (ref), var1 (ref), constantsModule (ref)
	local minValue = math.min(p2.x, p2.y)
	local maxValue = math.max(p2.x, p2.y)
	local var2 = (minValue - 320) * 60 / 55 + 270
	local var3 = (maxValue - 480) * 46 / 190 + 434
	var2 = if fFlagEnableMobilePlayerListOnConsole and var2 > 500 then p4 else math.clamp(var2, math.min(270, minValue - 24), 500)
	var3 = if fFlagEnableMobilePlayerListOnConsole and var3 > 600 then p5 else math.clamp(var3, math.min(434, maxValue - 24), 600)
	local var4 = if p2.y < p2.x then var3 else var2
	local var5 = if p2.x < p2.y then var3 else var2
	
	if not fFlagEnableMobilePlayerListOnConsole then
		var4 *= p3
		var5 *= p3
	end
	if var1 and p2.y < p2.x then
		var5 -= constantsModule.TopBarHeight * p1.state.UiScale - 24
	end
	return UDim2.fromOffset(var4, var5)
end

local _ = function(p1)
	for i, v in ipairs(p1) do
		if v.Team == nil then
			return true
		end
	end
	return false
end

local function getTeamCount(p2, p3)
	local t = {}
	local var2 = 0
	
	for i, v in pairs(p2) do
		if not t[v.TeamColor.Number] then
			t[v.TeamColor.Number] = true
			var2 += 1
		end
	end
	if var2 > 0 then
		local var3
		for i_1, v_1 in ipairs(p3) do
			if v_1.Team == nil then
				var3 = true
				if var3 then
					var2 += 1
				end
			end
		end
		var3 = false
	end
	return var2
end

function playerListApp.init(p4)
	-- upvalues: signalsModule (ref), displayModule (ref), roactModule (ref), otterModule (ref)
	p4.state = { visible = false }
	p4.disposeUiScaleEffect = signalsModule.createEffect(function(p5)
		-- upvalues: displayModule (copy), p4 (ref)
		p4:setState({
			UiScale = displayModule.GetDisplayStore(p5).getUIScale(p5)
		})
	end)
	local var4, var5 = roactModule.createBinding(0.5)
	p4.bodyTransparency = var4
	p4.updateBodyTransparency = var5
	p4.bodyTransparencyMotor = otterModule.createSingleMotor(1)
	p4.bodyTransparencyMotor:onStep(function(p5)
		-- upvalues: p4 (ref)
		p4.updateBodyTransparency(p5)
		p4.props.setLayerCollectorEnabled(if p5 >= 0.99 then p4.props.displayOptions.isVisible else true)
	end)
	p4.bodyTransparencyMotor:onComplete(function()
		-- upvalues: p4 (ref)
		if not p4.props.displayOptions.isVisible then
			p4:setState({ visible = false })
		end
	end)
	local var6, var7 = roactModule.createBinding(0)
	p4.bgTransparency = var6
	p4.updateBgTransparency = var7
	p4.bgTransparencyMotor = otterModule.createSingleMotor(1)
	p4.bgTransparencyMotor:onStep(p4.updateBgTransparency)
	local var8, var9 = roactModule.createBinding(1)
	p4.frameScale = var8
	p4.updateFrameScale = var9
	p4.frameScaleMotor = otterModule.createSingleMotor(0)
	p4.frameScaleMotor:onStep(function(p5)
		-- upvalues: p4 (ref)
		p4.updateFrameScale(p5)
	end)
	p4.titleRef = roactModule.createRef()
	p4.closeRef = roactModule.createRef()
end

function playerListApp.renderBodyChildren(p4, _, p5)
	-- upvalues: roactModule (ref), appFonts (ref), robloxTranslatorModule (ref)
	local visible = p4.state.visible
	local isDropDownVisible = p4.props.isDropDownVisible
	local size1100 = p4.props.tokens.Size.Size_1100
	local size500 = p4.props.tokens.Size.Size_500
	
	return {
		UIScale = roactModule.createElement("UIScale", { Scale = p4.frameScale }),
		UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 6) }),
		TitleText = roactModule.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, size1100),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			Font = appFonts.default:getBold(),
			Visible = visible and not isDropDownVisible,
			TextSize = p4.props.tokens.FontSize.FontSize_500,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			Text = robloxTranslatorModule:FormatByKey("InGame.PlayerList.Leaderboard"),
			[roactModule.Ref] = p4.titleRef
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
			[roactModule.Ref] = p4.closeRef,
			[roactModule.Event.Activated] = function()
				-- upvalues: p4 (ref)
				p4.props.setPlayerListVisible(false)
			end
		}),
		ContentFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutoLocalize = false,
			Position = UDim2.new(0.5, 0, 1, 0),
			AnchorPoint = Vector2.new(0.5, 1),
			Size = UDim2.new(1, 0, 1, -size1100),
			Visible = visible and not isDropDownVisible
		}, p5)
	}
end

function playerListApp.render(p4)
	-- upvalues: roactModule (ref), contextActionsBinderModule (ref), withLayoutValues (ref), fFlagEnableMobilePlayerListOnConsole (ref), playersService (ref), getTeamCount (ref), constantsModule (ref), playerListDisplayContainerModule (ref), fFlagAddNewPlayerListFocusNav (ref), eventConnectionsModule (ref), fFlagPlayerListRemoveTopStatModule (ref), topStatConnectorModule (ref), fFlagPlayerListFixMobileScrollingModule (ref), playerDropDownModule (ref), var1 (ref), playerListSizeFromViewportSize (ref)
	return if p4.state.visible then withLayoutValues(function(p5)
		-- upvalues: fFlagEnableMobilePlayerListOnConsole (copy), p4 (ref), playersService (copy), getTeamCount (copy), constantsModule (copy), roactModule (copy), playerListDisplayContainerModule (copy), fFlagAddNewPlayerListFocusNav (copy), eventConnectionsModule (copy), contextActionsBinderModule (copy), fFlagPlayerListRemoveTopStatModule (copy), topStatConnectorModule (copy), fFlagPlayerListFixMobileScrollingModule (copy), playerDropDownModule (copy), var1 (copy), playerListSizeFromViewportSize (copy)
		if fFlagEnableMobilePlayerListOnConsole then
			p5 = p4.props.layoutValues
		end
		local entrySizeX
		local _ = nil
		
		if p5.IsTenFoot then
			entrySizeX = p5.EntrySizeX
		else
			entrySizeX = p5.EntryBaseSizeX + 4 * p5.EntrySizeIncreasePerStat
			local var4 = p5.ContainerPadding * 2 + (p5.PlayerDropDownSizeXMobile + p5.PlayerDropDownOffset)
			
			if p4.props.screenSizeX - var4 < entrySizeX then
				entrySizeX = p4.props.screenSizeX - var4
			end
		end
		local var5 = if playersService.MaxPlayers >= 6 and playersService.MaxPlayers <= 12 then playersService.MaxPlayers * 26 + getTeamCount(p4.props.teams, p4.props.players) * 20 else 1e999
		local var6 = constantsModule.TopBarHeight * p4.state.UiScale
		local t = {}
		
		if p4.state.visible then
			t.PlayerScrollList = roactModule.createElement(playerListDisplayContainerModule, {
				screenSizeY = p4.props.screenSizeY,
				entrySize = entrySizeX,
				isVisible = if fFlagAddNewPlayerListFocusNav then p4.props.displayOptions.isVisible else nil
			})
		end
		t.EventConnections = roactModule.createElement(eventConnectionsModule)
		t.ContextActionsBindings = roactModule.createElement(contextActionsBinderModule)
		
		if not fFlagPlayerListRemoveTopStatModule then
			t.TopStatConnector = roactModule.createElement(topStatConnectorModule)
		end
		return roactModule.createElement("ImageButton", {
			Active = p4.props.displayOptions.isVisible,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = Color3.fromRGB(17, 18, 20),
			BackgroundTransparency = p4.bgTransparency,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			AutoLocalize = false,
			AutoButtonColor = false,
			Selectable = not fFlagPlayerListFixMobileScrollingModule,
			Image = "",
			[roactModule.Event.Activated] = function()
				-- upvalues: p4 (copy)
				p4.props.setPlayerListVisible(false)
			end
		}, {
			PlayerDropDown = roactModule.createElement(playerDropDownModule, {
				contentsVisible = true,
				selectedPlayer = p4.props.dropDownPlayer
			}),
			BodyPadding = if var1 and p4.props.screenSizeY < p4.props.screenSizeX then roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var6) }) else nil,
			BodyBackground = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = playerListSizeFromViewportSize(p4, Vector2.new(p4.props.screenSizeX, p4.props.screenSizeY), p4.state.UiScale, p5.PlayerListSizeMin, p5.PlayerListSizeMax),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundColor3 = Color3.fromRGB(17, 18, 20),
				BackgroundTransparency = p4.bodyTransparency,
				BorderColor3 = Color3.fromRGB(0, 0, 0)
			}, p4:renderBodyChildren(var5, t))
		})
	end) else roactModule.createElement(contextActionsBinderModule)
end

function playerListApp.didMount(p4)
	p4.props.setLayerCollectorEnabled(false)
	p4:setState({ visible = p4.props.displayOptions.isVisible })
end

function playerListApp.willUnmount(p4)
	p4.props.setLayerCollectorEnabled(true)
	
	if p4.disposeUiScaleEffect then
		p4.disposeUiScaleEffect()
	end
end

function playerListApp.didUpdate(p4, p5, _)
	-- upvalues: fFlagPlayerListIgnoreDevGamepadBindings (ref), guiService (ref), constants (ref), userInputService (ref), otterModule (ref), t (ref)
	local isVisible = p4.props.displayOptions.isVisible
	local isDropDownVisible = p4.props.isDropDownVisible
	
	if fFlagPlayerListIgnoreDevGamepadBindings and isVisible ~= p5.displayOptions.isVisible then
		guiService:SetMenuIsOpen(isVisible, constants.PLAYER_LIST_MENU)
	end
	if isVisible then
		p4:setState({ visible = true })
	end
	if isVisible ~= p5.displayOptions.isVisible and isVisible then
		p4.props.setIsUsingGamepad(userInputService:GetLastInputType().Name:find("Gamepad") ~= nil)
	end
	p4.bgTransparencyMotor:setGoal(otterModule.spring(if isDropDownVisible or isVisible then 0.7 else 1, t))
	local isVisible_1 = isDropDownVisible and isVisible
	local var4 = 1.25
	
	if isVisible_1 then
		var4 = 0.95
	elseif isVisible then
		var4 = 1
	end
	p4.frameScaleMotor:setGoal(otterModule.spring(var4, t))
	local var5 = 1
	
	if isVisible_1 then
		var5 = 0.8 * p4.props.preferredTransparency
	elseif isVisible then
		var5 = 0.2 * p4.props.preferredTransparency
	end
	p4.bodyTransparencyMotor:setGoal(otterModule.spring(var5, t))
end

return roactRoduxModule.connect(function(p4)
	return {
		isDropDownVisible = p4.playerDropDown.isVisible,
		screenSizeX = p4.screenSize.X,
		screenSizeY = p4.screenSize.Y,
		preferredTransparency = p4.settings.preferredTransparency,
		displayOptions = p4.displayOptions,
		players = p4.players,
		playerStats = p4.playerStats,
		playerIconInfo = p4.playerIconInfo,
		playerRelationship = p4.playerRelationship,
		gameStats = p4.gameStats,
		teams = p4.teams
	}
end, function(p4)
	-- upvalues: setPlayerListVisibilityModule (ref), setIsUsingGamepadModule (ref)
	return {
		setPlayerListVisible = function(value)
			-- upvalues: p4 (ref), setPlayerListVisibilityModule (copy)
			return p4(setPlayerListVisibilityModule(value))
		end,
		setIsUsingGamepad = function(value)
			-- upvalues: p4 (ref), setIsUsingGamepadModule (copy)
			return p4(setIsUsingGamepadModule(value))
		end
	}
end)(function(p4)
	-- upvalues: fFlagEnableMobilePlayerListOnConsole (ref), useLayoutValues (ref), useTokens (ref), roactModule (ref), playerListApp (ref), cryoModule (ref)
	return roactModule.createElement(playerListApp, cryoModule.Dictionary.join(p4, {
		layoutValues = if fFlagEnableMobilePlayerListOnConsole then if fFlagEnableMobilePlayerListOnConsole then useLayoutValues() else nil else nil,
		tokens = useTokens()
	}))
end)