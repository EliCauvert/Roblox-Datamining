local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local FFlagMigrateRoactUtilsToReactUtils = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils()
local RoactModule = require(CorePackages.Packages.Roact)
local ExternalEventConnectionModule = require(script.Parent.Parent.RoactUtilities.ExternalEventConnection)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)

local function playerInputReducer(PlayerInputs, p1)
	-- upvalues: CryoModule (copy)
	local PlayerInputs1 = PlayerInputs or { left = 0, right = 0, up = 0, pause = 0 }
	
	return if p1.type == "SetPlayerInput" then CryoModule.Dictionary.join(PlayerInputs1, { [p1.playerInput] = p1.value }) else PlayerInputs1
end

local function playerReducer(Player, p1)
	-- upvalues: CryoModule (copy)
	local Player1 = Player or {
		angle = 0,
		turnRate = 1.5707963267948966,
		throttleRate = 10,
		position = Vector2.new(0, 0),
		velocity = Vector2.new(0, 0)
	}
	
	if p1.type == "GameStep" then
		local Inputs = p1.inputs
		local Delta = p1.delta
		
		return CryoModule.Dictionary.join(Player1, {
			position = Player1.position + Player1.velocity * Delta,
			velocity = Player1.velocity + Inputs.up * Player1.throttleRate * Delta * Vector2.new(math.sin(Player1.angle), -math.cos(Player1.angle)),
			angle = Player1.angle + (Inputs.right - Inputs.left) * Player1.turnRate * Delta
		})
	else
		return if p1.type == "SetPlayerRotation" then CryoModule.Dictionary.join(Player1, { angle = p1.value }) else Player1
	end
end

local function _(p1, p2)
	local P4 = p1 or 0
	
	return if p2.type == "GameStep" then P4 + p2.delta else P4
end

local function asteroidsReducer(Asteroids, p1)
	local function initAsteroids()
		return {
			{
				size = 5,
				position = Vector2.new(-5, -5),
				velocity = Vector2.new(1, 0)
			},
			{
				size = 3,
				position = Vector2.new(-5, 5),
				velocity = Vector2.new(1, 0)
			},
			{
				size = 5,
				position = Vector2.new(5, 5),
				velocity = Vector2.new(0, -1)
			},
			{
				size = 3,
				position = Vector2.new(5, -5),
				velocity = Vector2.new(0, 1)
			}
		}
	end
	
	local Asteroids1 = Asteroids or initAsteroids()
	
	if p1.type ~= "GameStep" then
		return Asteroids1
	end
	local Delta = p1.delta
	local t = {}
	
	for i, value in pairs(Asteroids1) do
		local X = value.velocity.X
		local Y = value.velocity.Y
		t[i] = {
			position = Vector2.new(value.position.X + X * Delta, value.position.Y + Y * Delta),
			velocity = Vector2.new(X, Y),
			size = value.size
		}
	end
	return t
end

local _ = function(p2): boolean
	return p2.playerInput == "pause" and p2.value == 1
end

local _ = function(p2, p3)
	local P9 = p2 or false
	
	if p3.type == "SetPlayerInput" and (p3.playerInput == "pause" and p3.value == 1) then
		return not P9
	else
		return P9
	end
end

local function reducer(p2, p3)
	-- upvalues: playerInputReducer (copy), playerReducer (copy), asteroidsReducer (copy)
	local P11 = p2 or {}
	local Paused = P11.paused or false
	local NoPaused = if p3.type == "SetPlayerInput" and (p3.playerInput == "pause" and p3.value == 1) then not Paused else Paused
	local Time = P11.time or 0
	
	return {
		playerInputs = playerInputReducer(P11.playerInputs, p3),
		paused = NoPaused,
		player = playerReducer(P11.player, p3),
		time = if p3.type == "GameStep" then Time + p3.delta else Time,
		asteroids = asteroidsReducer(P11.asteroids, p3)
	}
end

local Camera = RoactModule.Component:extend("Camera")

function Camera.init(p2)
	-- upvalues: RoactModule (copy)
	p2.cameraRef = RoactModule.createRef()
end

function Camera.render(p2)
	-- upvalues: RoactModule (copy)
	local Focus = p2.props.focus
	
	return RoactModule.createElement("Camera", {
		CameraType = Enum.CameraType.Scriptable,
		CFrame = CFrame.new((Vector3.new(Focus.x, 20, Focus.y))) * CFrame.fromEulerAnglesXYZ(-1.5707963267948966, 0, 0),
		FieldOfView = 90,
		[RoactModule.Ref] = p2.cameraRef
	})
end

function Camera.didMount(p2)
	-- upvalues: Workspace (copy)
	Workspace.CurrentCamera = p2.cameraRef.current
end

local v1 = RoactRoduxModule.connect(function(p2, _)
	return { focus = p2.player.position }
end, nil)(Camera)
local Asteroid = RoactModule.Component:extend("Asteroid")

function Asteroid.render(p2)
	-- upvalues: RoactModule (copy)
	local Position = p2.props.position
	local X = p2.props.size
	
	return RoactModule.createElement("Part", {
		Anchored = true,
		Shape = Enum.PartType.Ball,
		Size = Vector3.new(X, X, X),
		Color = Color3.fromRGB(170, 170, 170),
		CFrame = CFrame.new((Vector3.new(Position.x, 0, Position.y))),
		TopSurface = Enum.SurfaceType.Smooth
	})
end

local Asteroids = RoactModule.Component:extend("Asteroids")

function Asteroids.render(p2)
	-- upvalues: RoactModule (copy), Asteroid (copy)
	local Elements = {}
	
	for i, prop in pairs(p2.props) do
		Elements[i] = RoactModule.createElement(Asteroid, { position = prop.position, size = prop.size })
	end
	return RoactModule.createElement("Folder", { Name = "Asteroids" }, Elements)
end

local v2 = RoactRoduxModule.connect(function(p3, _)
	return p3.asteroids
end, nil)(Asteroids)
local Ship = RoactModule.Component:extend("Ship")

function Ship.render(p3)
	-- upvalues: RoactModule (copy)
	local Position = p3.props.position
	
	return RoactModule.createElement("Part", {
		Anchored = true,
		Size = vector.create(2, 2, 6),
		Color = Color3.fromHSV(p3.props.time % 5 / 5, 1, 1),
		CFrame = CFrame.new((Vector3.new(Position.x, 0, Position.y))) * CFrame.fromEulerAnglesXYZ(0, -p3.props.angle, 0),
		FrontSurface = Enum.SurfaceType.Hinge
	})
end

local v3 = RoactRoduxModule.connect(function(p3, _)
	return {
		position = p3.player.position,
		angle = p3.player.angle,
		time = p3.time
	}
end, nil)(Ship)
local GameBackground = RoactModule.Component:extend("GameBackground")

function GameBackground:render()
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Part", {
		Anchored = true,
		Size = vector.create(512, 10, 512),
		CFrame = CFrame.new(vector.create(0, -5, 0)),
		Color = Color3.new(0, 0, 0)
	})
end

local PauseText = RoactModule.Component:extend("PauseText")

function PauseText:render()
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("TextLabel", {
		Text = "Paused",
		TextSize = 70,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Font = Enum.Font.Arcade,
		Position = UDim2.new(0.5, 0, 0.5, 0)
	})
end

local InputConnector = RoactModule.Component:extend("InputConnector")

function InputConnector.render(p3)
	-- upvalues: FFlagMigrateRoactUtilsToReactUtils (copy), RoactModule (copy), ExternalEventConnectionModule (copy), UserInputService (copy)
	local function inputBeganCallback(p4)
		-- upvalues: p3 (copy)
		if p3.props.onInputBegan then
			p3.props.onInputBegan(p4)
		end
	end
	
	local function inputChangedCallback(p4)
		-- upvalues: p3 (copy)
		if p3.props.onInputChanged then
			p3.props.onInputChanged(p4)
		end
	end
	
	local function inputEndedCallback(p4)
		-- upvalues: p3 (copy)
		if p3.props.onInputEnded then
			p3.props.onInputEnded(p4)
		end
	end
	
	return if FFlagMigrateRoactUtilsToReactUtils then RoactModule.createFragment({
		InputBeganConnection = RoactModule.createElement(ExternalEventConnectionModule, {
			event = UserInputService.InputBegan,
			callback = inputBeganCallback
		}),
		InputChangedConnection = RoactModule.createElement(ExternalEventConnectionModule, {
			event = UserInputService.InputChanged,
			callback = inputChangedCallback
		}),
		InputEndedConnection = RoactModule.createElement(ExternalEventConnectionModule, {
			event = UserInputService.InputEnded,
			callback = inputEndedCallback
		})
	}) else RoactModule.createElement(ExternalEventConnectionModule, {
		event = UserInputService.InputBegan,
		callback = inputBeganCallback
	}, {
		RoactModule.createElement(ExternalEventConnectionModule, {
			event = UserInputService.InputChanged,
			callback = inputChangedCallback
		}, {
			RoactModule.createElement(ExternalEventConnectionModule, {
				event = UserInputService.InputEnded,
				callback = inputEndedCallback
			})
		})
	})
end

local config = {
	[Enum.KeyCode.Left] = "left",
	[Enum.KeyCode.A] = "left",
	[Enum.KeyCode.Right] = "right",
	[Enum.KeyCode.D] = "right",
	[Enum.KeyCode.Up] = "up",
	[Enum.KeyCode.W] = "up",
	[Enum.KeyCode.P] = "pause"
}

local _ = function(Input)
	-- upvalues: config (copy)
	return if Input.UserInputType == Enum.UserInputType.Keyboard then config[Input.KeyCode] else nil
end

local v4 = RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: config (copy)
	return {
		onInputBegan = function(Input)
			-- upvalues: config (upval), Callback (copy)
			local Entry = if Input.UserInputType == Enum.UserInputType.Keyboard then config[Input.KeyCode] else nil
			
			if Entry then
				Callback({ type = "SetPlayerInput", value = 1, playerInput = Entry })
			end
		end,
		onInputEnded = function(Input)
			-- upvalues: config (upval), Callback (copy)
			local Entry = if Input.UserInputType == Enum.UserInputType.Keyboard then config[Input.KeyCode] else nil
			
			if Entry then
				Callback({ type = "SetPlayerInput", value = 0, playerInput = Entry })
			end
		end
	}
end)(InputConnector)
local RenderSteppedConnector = RoactModule.Component:extend("RenderSteppedConnector")

function RenderSteppedConnector.render(p3)
	-- upvalues: RoactModule (copy), ExternalEventConnectionModule (copy), RunService (copy)
	local PlayerInputs = p3.props.playerInputs
	
	return RoactModule.createElement(ExternalEventConnectionModule, {
		event = RunService.RenderStepped,
		callback = function(p4)
			-- upvalues: p3 (copy), PlayerInputs (copy)
			p3.props.onStepped(p4, PlayerInputs)
		end
	})
end

local Component = RoactRoduxModule.connect(function(p3, _)
	return { playerInputs = p3.playerInputs }
end, function(Callback)
	return {
		onStepped = function(Delta, Inputs)
			-- upvalues: Callback (copy)
			Callback({ type = "GameStep", delta = Delta, inputs = Inputs })
		end
	}
end)(RenderSteppedConnector)
local v5 = RoactRoduxModule.connect(function(p3, _)
	return { paused = p3.paused }
end, nil)(function(p3)
	-- upvalues: RoactModule (copy)
	local Component = p3.component
	
	return if p3.paused == p3.match then RoactModule.createElement(Component) else nil
end)
local App = RoactModule.Component:extend("App")

function App:render()
	-- upvalues: RoactModule (copy), v3 (copy), v1 (copy), GameBackground (copy), v2 (ref), v4 (copy), v5 (ref), Component (ref)
	return RoactModule.createElement("Folder", {}, {
		Player = RoactModule.createElement(v3),
		PlayerCamera = RoactModule.createElement(v1),
		GameBackground = RoactModule.createElement(GameBackground),
		Asteroids = RoactModule.createElement(v2),
		KeyboardInputConnector = RoactModule.createElement(v4),
		RenderSteppedConnector = RoactModule.createElement(v5, { match = false, component = Component })
	})
end

local Ui = RoactModule.Component:extend("Ui")

function Ui:render()
	-- upvalues: RoactModule (copy), v5 (ref), PauseText (copy)
	return RoactModule.createElement("ScreenGui", nil, {
		PauseText = RoactModule.createElement(v5, { match = true, component = PauseText })
	})
end

return function()
	-- upvalues: RunService (copy), RoduxModule (copy), reducer (copy), RoactModule (copy), RoactRoduxModule (copy), App (copy), Ui (copy), Workspace (copy), CoreGui (copy)
	RunService.Stepped:Wait()
	local NewResult = RoduxModule.Store.new(reducer)
	local Element = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = NewResult }, { Ui = RoactModule.createElement(Ui) })
	RoactModule.mount(RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = NewResult }, { App = RoactModule.createElement(App) }), Workspace, "Roact-asteroids")
	RoactModule.mount(Element, CoreGui, "Roact-asteroids-ui")
end