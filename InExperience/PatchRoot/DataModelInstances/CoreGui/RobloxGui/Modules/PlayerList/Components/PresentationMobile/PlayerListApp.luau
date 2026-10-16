local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local OtterModule = require(CorePackages.Packages.Otter)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local UseLayoutValuesFunction = PlayerListModule.Common.useLayoutValues
local Constants = PlayerListModule.Common.Constants
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.TopBar.Constants)
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local SetPlayerListVisibilityModule = require(Parent1.Actions.SetPlayerListVisibility)
local SetIsUsingGamepadModule = require(Parent1.Actions.SetIsUsingGamepad)
local PlayerListDisplayContainerModule = require(Parent1.Components.Container.PlayerListDisplayContainer)
local PlayerDropDownModule = require(Parent.PlayerDropDown)
local Connection = Parent1.Components.Connection
local EventConnectionsModule = require(Connection.EventConnections)
local ContextActionsBinderModule = require(Connection.ContextActionsBinder)
local TopStatConnectorModule = require(Connection.TopStatConnector)
local WithLayoutValuesFunction = require(Connection.LayoutValues).WithLayoutValues
local FFlagPlayerListFixMobileScrollingModule = require(Parent1.Flags.FFlagPlayerListFixMobileScrolling)
local FFlagAddNewPlayerListFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListFocusNav
local FFlagEnableMobilePlayerListOnConsole = PlayerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local FFlagPlayerListIgnoreDevGamepadBindings = PlayerListModule.Flags.FFlagPlayerListIgnoreDevGamepadBindings
local FFlagPlayerListRemoveTopStatModule = require(Parent1.Flags.FFlagPlayerListRemoveTopStat)
local config = { dampingRatio = 1, frequency = 4 }

local function _(p1, p2, p3, p4, p5) --[[ Line: 63 | Named "map" ]]
	return (p1 - p2) * (p5 - p4) / (p3 - p2) + p4
end

local PlayerListApp = RoactModule.PureComponent:extend("PlayerListApp")

local function playerListSizeFromViewportSize(p1, Vector, UiScale, PlayerListSizeMin, PlayerListSizeMax): UDim2 --[[ Line: 69 ]]
	-- upvalues: FFlagEnableMobilePlayerListOnConsole (copy), EnabledResult (copy), ConstantsModule (copy)
	local Smallest = math.min(Vector.x, Vector.y)
	local Largest = math.max(Vector.x, Vector.y)
	local Value = (Smallest - 320) * 60 / 55 + 270
	local Value1 = (Largest - 480) * 46 / 190 + 434
	local PlayerListSizeMin1 = if FFlagEnableMobilePlayerListOnConsole and Value > 500 then PlayerListSizeMin else math.clamp(Value, math.min(270, Smallest - 24), 500)
	local PlayerListSizeMax1 = if FFlagEnableMobilePlayerListOnConsole and Value1 > 600 then PlayerListSizeMax else math.clamp(Value1, math.min(434, Largest - 24), 600)
	local XOffset = Vector.y < Vector.x and PlayerListSizeMax1 or PlayerListSizeMin1
	local YOffset = Vector.y > Vector.x and PlayerListSizeMax1 or PlayerListSizeMin1
	
	if not FFlagEnableMobilePlayerListOnConsole then
		XOffset *= UiScale
		YOffset *= UiScale
	end
	if EnabledResult and Vector.y < Vector.x then
		YOffset -= ConstantsModule.TopBarHeight * p1.state.UiScale - 24
	end
	return UDim2.fromOffset(XOffset, YOffset)
end

local _ = function(List): boolean --[[ Line: 115 | Named "shouldShowNeutralTeam" ]]
	for _, Player in ipairs(List) do
		if Player.Team == nil then
			return true
		end
	end
	return false
end

local function getTeamCount(Teams, Players): number --[[ Line: 124 ]]
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

function PlayerListApp.init(p1) --[[ Line: 139 ]]
	-- upvalues: SignalsModule (copy), DisplayModule (copy), RoactModule (copy), OtterModule (copy)
	p1.state = { visible = false }
	p1.disposeUiScaleEffect = SignalsModule.createEffect(function(p2) --[[ Line: 144 ]]
		-- upvalues: DisplayModule (upval), p1 (copy)
		p1:setState({
			UiScale = DisplayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
	p1.bodyTransparency, p1.updateBodyTransparency = RoactModule.createBinding(0.5)
	p1.bodyTransparencyMotor = OtterModule.createSingleMotor(1)
	p1.bodyTransparencyMotor:onStep(function(p2: number) --[[ Line: 153 ]]
		-- upvalues: p1 (copy)
		p1.updateBodyTransparency(p2)
		p1.props.setLayerCollectorEnabled(p2 < 0.99 or p1.props.displayOptions.isVisible)
	end)
	p1.bodyTransparencyMotor:onComplete(function() --[[ Line: 157 ]]
		-- upvalues: p1 (copy)
		if not p1.props.displayOptions.isVisible then
			p1:setState({ visible = false })
		end
	end)
	p1.bgTransparency, p1.updateBgTransparency = RoactModule.createBinding(0)
	p1.bgTransparencyMotor = OtterModule.createSingleMotor(1)
	p1.bgTransparencyMotor:onStep(p1.updateBgTransparency)
	p1.frameScale, p1.updateFrameScale = RoactModule.createBinding(1)
	p1.frameScaleMotor = OtterModule.createSingleMotor(0)
	p1.frameScaleMotor:onStep(function(p2) --[[ Line: 171 ]]
		-- upvalues: p1 (copy)
		p1.updateFrameScale(p2)
	end)
	p1.titleRef = RoactModule.createRef()
	p1.closeRef = RoactModule.createRef()
end

function PlayerListApp.renderBodyChildren(p1, _, p2) --[[ Line: 179 ]]
	-- upvalues: RoactModule (copy), AppFonts (copy), RobloxTranslatorModule (copy)
	local Visible = p1.state.visible
	local IsDropDownVisible = p1.props.isDropDownVisible
	local Size1100 = p1.props.tokens.Size.Size_1100
	local Size500: number = p1.props.tokens.Size.Size_500
	
	return {
		UIScale = RoactModule.createElement("UIScale", { Scale = p1.frameScale }),
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 6) }),
		TitleText = RoactModule.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, Size1100),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			Font = AppFonts.default:getBold(),
			Visible = Visible and not IsDropDownVisible,
			TextSize = p1.props.tokens.FontSize.FontSize_500,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			Text = RobloxTranslatorModule:FormatByKey("InGame.PlayerList.Leaderboard"),
			[RoactModule.Ref] = p1.titleRef
		}),
		CloseButton = RoactModule.createElement("ImageButton", {
			Image = "rbxasset://textures/ui/InspectMenu/x.png",
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.fromOffset(Size500, Size500),
			Position = UDim2.fromOffset(Size500 / 2, Size500),
			BackgroundTransparency = 1,
			Visible = Visible and not IsDropDownVisible,
			ZIndex = 0,
			[RoactModule.Ref] = p1.closeRef,
			[RoactModule.Event.Activated] = function() --[[ Line: 220 ]]
				-- upvalues: p1 (copy)
				p1.props.setPlayerListVisible(false)
			end
		}),
		ContentFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutoLocalize = false,
			Position = UDim2.new(0.5, 0, 1, 0),
			AnchorPoint = Vector2.new(0.5, 1),
			Size = UDim2.new(1, 0, 1, -Size1100),
			Visible = Visible and not IsDropDownVisible
		}, p2)
	}
end

function PlayerListApp.render(p1) --[[ Line: 236 ]]
	-- upvalues: RoactModule (copy), ContextActionsBinderModule (copy), WithLayoutValuesFunction (copy), FFlagEnableMobilePlayerListOnConsole (copy), Players (copy), getTeamCount (copy), ConstantsModule (copy), PlayerListDisplayContainerModule (copy), FFlagAddNewPlayerListFocusNav (copy), EventConnectionsModule (copy), FFlagPlayerListRemoveTopStatModule (copy), TopStatConnectorModule (copy), FFlagPlayerListFixMobileScrollingModule (copy), PlayerDropDownModule (copy), EnabledResult (copy), playerListSizeFromViewportSize (copy)
	return if p1.state.visible then WithLayoutValuesFunction(function(p2) --[[ Line: 240 ]]
		-- upvalues: FFlagEnableMobilePlayerListOnConsole (upval), p1 (copy), Players (upval), getTeamCount (upval), ConstantsModule (upval), RoactModule (upval), PlayerListDisplayContainerModule (upval), FFlagAddNewPlayerListFocusNav (upval), EventConnectionsModule (upval), ContextActionsBinderModule (upval), FFlagPlayerListRemoveTopStatModule (upval), TopStatConnectorModule (upval), FFlagPlayerListFixMobileScrollingModule (upval), PlayerDropDownModule (upval), EnabledResult (upval), playerListSizeFromViewportSize (upval)
		if FFlagEnableMobilePlayerListOnConsole then
			p2 = p1.props.layoutValues
		end
		local EntrySizeX = nil
		if p2.IsTenFoot then
			EntrySizeX = p2.EntrySizeX
		else
			EntrySizeX = p2.EntryBaseSizeX + 4 * p2.EntrySizeIncreasePerStat
			local NewContainerPadding = p2.ContainerPadding * 2 + (p2.PlayerDropDownSizeXMobile + p2.PlayerDropDownOffset)
			
			if p1.props.screenSizeX - NewContainerPadding < EntrySizeX then
				EntrySizeX = p1.props.screenSizeX - NewContainerPadding
			end
		end
		local NewMaxPlayers = if Players.MaxPlayers >= 6 and Players.MaxPlayers <= 12 then Players.MaxPlayers * 26 + getTeamCount(p1.props.teams, p1.props.players) * 20 else 1e999
		local ScaledTopBarHeight = ConstantsModule.TopBarHeight * p1.state.UiScale
		local t = {}
		
		if p1.state.visible then
			t.PlayerScrollList = RoactModule.createElement(PlayerListDisplayContainerModule, {
				screenSizeY = p1.props.screenSizeY,
				entrySize = EntrySizeX,
				isVisible = if FFlagAddNewPlayerListFocusNav then p1.props.displayOptions.isVisible else nil
			})
		end
		t.EventConnections = RoactModule.createElement(EventConnectionsModule)
		t.ContextActionsBindings = RoactModule.createElement(ContextActionsBinderModule)
		
		if not FFlagPlayerListRemoveTopStatModule then
			t.TopStatConnector = RoactModule.createElement(TopStatConnectorModule)
		end
		return RoactModule.createElement("ImageButton", {
			Active = p1.props.displayOptions.isVisible,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = Color3.fromRGB(17, 18, 20),
			BackgroundTransparency = p1.bgTransparency,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			AutoLocalize = false,
			AutoButtonColor = false,
			Selectable = not FFlagPlayerListFixMobileScrollingModule,
			Image = "",
			[RoactModule.Event.Activated] = function() --[[ Line: 294 ]]
				-- upvalues: p1 (upval)
				p1.props.setPlayerListVisible(false)
			end
		}, {
			PlayerDropDown = RoactModule.createElement(PlayerDropDownModule, {
				contentsVisible = true,
				selectedPlayer = p1.props.dropDownPlayer
			}),
			BodyPadding = if EnabledResult and p1.props.screenSizeY < p1.props.screenSizeX then RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, ScaledTopBarHeight) }) else nil,
			BodyBackground = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = playerListSizeFromViewportSize(p1, Vector2.new(p1.props.screenSizeX, p1.props.screenSizeY), p1.state.UiScale, p2.PlayerListSizeMin, p2.PlayerListSizeMax),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundColor3 = Color3.fromRGB(17, 18, 20),
				BackgroundTransparency = p1.bodyTransparency,
				BorderColor3 = Color3.fromRGB(0, 0, 0)
			}, p1:renderBodyChildren(NewMaxPlayers, t))
		})
	end) else RoactModule.createElement(ContextActionsBinderModule)
end

function PlayerListApp.didMount(p1) --[[ Line: 328 ]]
	p1.props.setLayerCollectorEnabled(false)
	p1:setState({ visible = p1.props.displayOptions.isVisible })
end

function PlayerListApp.willUnmount(p1) --[[ Line: 335 ]]
	p1.props.setLayerCollectorEnabled(true)
	
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
end

function PlayerListApp.didUpdate(p1, p2, _) --[[ Line: 342 ]]
	-- upvalues: FFlagPlayerListIgnoreDevGamepadBindings (copy), GuiService (copy), Constants (copy), UserInputService (copy), OtterModule (copy), config (copy)
	local IsVisible = p1.props.displayOptions.isVisible
	local IsDropDownVisible = p1.props.isDropDownVisible
	
	if FFlagPlayerListIgnoreDevGamepadBindings and IsVisible ~= p2.displayOptions.isVisible then
		GuiService:SetMenuIsOpen(IsVisible, Constants.PLAYER_LIST_MENU)
	end
	if IsVisible then
		p1:setState({ visible = true })
	end
	if IsVisible ~= p2.displayOptions.isVisible and IsVisible then
		p1.props.setIsUsingGamepad(UserInputService:GetLastInputType().Name:find("Gamepad") ~= nil)
	end
	p1.bgTransparencyMotor:setGoal(OtterModule.spring(if IsDropDownVisible or IsVisible then 0.7 else 1, config))
	local IsVisible1 = IsDropDownVisible and IsVisible
	p1.frameScaleMotor:setGoal(OtterModule.spring(if IsVisible1 then 0.95 elseif IsVisible then 1 else 1.25, config))
	p1.bodyTransparencyMotor:setGoal(OtterModule.spring(if IsVisible1 then 0.8 * p1.props.preferredTransparency elseif IsVisible then 0.2 * p1.props.preferredTransparency else 1, config))
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 388 | Named "mapStateToProps" ]]
	return {
		isDropDownVisible = p1.playerDropDown.isVisible,
		screenSizeX = p1.screenSize.X,
		screenSizeY = p1.screenSize.Y,
		preferredTransparency = p1.settings.preferredTransparency,
		displayOptions = p1.displayOptions,
		players = p1.players,
		playerStats = p1.playerStats,
		playerIconInfo = p1.playerIconInfo,
		playerRelationship = p1.playerRelationship,
		gameStats = p1.gameStats,
		teams = p1.teams
	}
end, function(Callback) --[[ Line: 408 | Named "mapDispatchToProps" ]]
	-- upvalues: SetPlayerListVisibilityModule (copy), SetIsUsingGamepadModule (copy)
	return {
		setPlayerListVisible = function(p1) --[[ Line: 410 ]]
			-- upvalues: Callback (copy), SetPlayerListVisibilityModule (upval)
			return Callback(SetPlayerListVisibilityModule(p1))
		end,
		setIsUsingGamepad = function(p1) --[[ Line: 413 ]]
			-- upvalues: Callback (copy), SetIsUsingGamepadModule (upval)
			return Callback(SetIsUsingGamepadModule(p1))
		end
	}
end)(function(p1) --[[ Line: 419 ]]
	-- upvalues: FFlagEnableMobilePlayerListOnConsole (copy), UseLayoutValuesFunction (copy), UseTokensFunction (copy), RoactModule (copy), PlayerListApp (copy), CryoModule (copy)
	local UseLayoutValuesResult = if FFlagEnableMobilePlayerListOnConsole then UseLayoutValuesFunction() else nil
	
	return RoactModule.createElement(PlayerListApp, CryoModule.Dictionary.join(p1, {
		layoutValues = if FFlagEnableMobilePlayerListOnConsole then UseLayoutValuesResult else nil,
		tokens = UseTokensFunction()
	}))
end)