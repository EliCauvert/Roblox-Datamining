local CorePackages = game:GetService("CorePackages")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local GameOptions = settings():FindFirstChild("Game Options")
local UserInputService = game:GetService("UserInputService")
local PlatformService = nil
pcall(function()
	-- upvalues: PlatformService (ref)
	PlatformService = game:GetService("PlatformService")
end)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UtilityModule = require(Modules.Shell.Utility)
local ContextActionEventModule = require(Modules.Shell.Components.ContextActionEvent)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local RenderStepModule = require(Modules.Shell.Components.RenderStep)
local MigrateOverscanToGameBasicSettingsEngineFeature = game:GetEngineFeature("MigrateOverscanToGameBasicSettings")
local _Vector2 = Vector2.new(0.85, 0.85)
local _Vector2_1 = Vector2.new(0.9, 0.9)
local _Vector2_2 = Vector2.new(1920, 1080)
local _Vector2_3 = Vector2.new(0, 0)

local function EdgeImage(Frame)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/ScreenAdjustmentArrow.png",
		Size = UDim2.new(0, 95, 0, 95),
		Position = Frame.Position,
		AnchorPoint = Frame.AnchorPoint,
		Rotation = Frame.Rotation
	})
end

local Edges = ReactModule.Component:extend("Edges")

function Edges.init(p1)
	-- upvalues: UtilityModule (copy), _Vector2 (copy), _Vector2_2 (copy), _Vector2_3 (copy), MigrateOverscanToGameBasicSettingsEngineFeature (copy), UserGameSettings (copy), GameOptions (copy), _Vector2_1 (copy), UserInputService (copy)
	local function _(p2)
		-- upvalues: UtilityModule (upval), _Vector2 (upval)
		return UtilityModule.ClampVector2(_Vector2, Vector2.new(1, 1), p2)
	end
	
	local _ = function(p2)
		-- upvalues: _Vector2_2 (upval), UtilityModule (upval), _Vector2_3 (upval)
		local ScaledVector = p2 * _Vector2_2
		
		return UtilityModule.ClampVector2(_Vector2_3, _Vector2_2, Vector2.new(UtilityModule.Round(ScaledVector.X / 2), UtilityModule.Round(ScaledVector.Y / 2)) * 2)
	end
	
	function p1:onAdjustThumbstick(_, p2)
		-- upvalues: p1 (copy), UtilityModule (upval)
		p1._stickPosition = UtilityModule.GamepadLinearToCurve(Vector2.new(p2.Position.X, -p2.Position.Y), 0.2)
	end
	
	function p1.onAccept()
		-- upvalues: MigrateOverscanToGameBasicSettingsEngineFeature (upval), UserGameSettings (upval), p1 (copy), GameOptions (upval)
		local _, _ = pcall(function()
			-- upvalues: MigrateOverscanToGameBasicSettingsEngineFeature (upval), UserGameSettings (upval), p1 (upval), GameOptions (upval)
			if MigrateOverscanToGameBasicSettingsEngineFeature then
				UserGameSettings.Overscan = Vector2.new(math.min(1, p1._edgePercent.X), (math.min(1, p1._edgePercent.Y)))
				
				return
			else
				GameOptions.OverscanPX = math.min(1, p1._edgePercent.X)
				GameOptions.OverscanPY = math.min(1, p1._edgePercent.Y)
			end
		end)
		
		if p1.props.onSetEdges then
			p1.props.onSetEdges()
		end
	end
	
	function p1.onRenderStep()
		-- upvalues: p1 (copy), _Vector2_3 (upval), UtilityModule (upval), _Vector2 (upval), _Vector2_2 (upval)
		local CurrentTime = tick()
		
		if p1._lastUpdate then
			if p1._stickPosition == _Vector2_3 then
				p1._acceleration = 1
			else
				local CurrentTimeDelta = CurrentTime - p1._lastUpdate
				p1._edgePercent = UtilityModule.ClampVector2(_Vector2, Vector2.new(1, 1), p1._stickPosition * p1._acceleration * CurrentTimeDelta * 0.05 + p1._edgePercent)
				p1._acceleration = math.min(p1._acceleration + CurrentTimeDelta * 1, 3)
				local ScaledEdgePercent = p1._edgePercent * _Vector2_2
				p1:setState({
					currentSize = UtilityModule.ClampVector2(_Vector2_3, _Vector2_2, Vector2.new(UtilityModule.Round(ScaledEdgePercent.X / 2), UtilityModule.Round(ScaledEdgePercent.Y / 2)) * 2)
				})
			end
		end
		p1._lastUpdate = CurrentTime
	end
	
	function p1.onSuspended()
		-- upvalues: MigrateOverscanToGameBasicSettingsEngineFeature (upval), UserGameSettings (upval), p1 (copy), GameOptions (upval)
		pcall(function()
			-- upvalues: MigrateOverscanToGameBasicSettingsEngineFeature (upval), UserGameSettings (upval), p1 (upval), GameOptions (upval)
			if MigrateOverscanToGameBasicSettingsEngineFeature then
				UserGameSettings.Overscan = Vector2.new(p1._lastSavedOverscan.X, p1._lastSavedOverscan.Y)
				
				return
			else
				GameOptions.OverscanPX = p1._lastSavedOverscan.X
				GameOptions.OverscanPY = p1._lastSavedOverscan.Y
			end
		end)
	end
	
	local ClampVector2Result = UtilityModule.ClampVector2(_Vector2, Vector2.new(1, 1), _Vector2_1)
	local ScaledClampVector2Result = ClampVector2Result * _Vector2_2
	local ClampVector2Result1 = UtilityModule.ClampVector2(_Vector2_3, _Vector2_2, Vector2.new(UtilityModule.Round(ScaledClampVector2Result.X / 2), UtilityModule.Round(ScaledClampVector2Result.Y / 2)) * 2)
	
	if UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
		pcall(function()
			-- upvalues: MigrateOverscanToGameBasicSettingsEngineFeature (upval), UserGameSettings (upval), ClampVector2Result (ref), UtilityModule (upval), _Vector2 (upval), ClampVector2Result1 (ref), _Vector2_2 (upval), _Vector2_3 (upval), p1 (copy), GameOptions (upval)
			if MigrateOverscanToGameBasicSettingsEngineFeature then
				if UserGameSettings.Overscan.x > 0 and UserGameSettings.Overscan.y > 0 then
					ClampVector2Result = Vector2.new(UserGameSettings.Overscan.x, UserGameSettings.Overscan.y)
					ClampVector2Result = UtilityModule.ClampVector2(_Vector2, Vector2.new(1, 1), ClampVector2Result)
					local ScaledClampVector2Result: Vector2 = ClampVector2Result * _Vector2_2
					ClampVector2Result1 = UtilityModule.ClampVector2(_Vector2_3, _Vector2_2, Vector2.new(UtilityModule.Round(ScaledClampVector2Result.X / 2), UtilityModule.Round(ScaledClampVector2Result.Y / 2)) * 2)
					p1._lastSavedOverscan = Vector2.new(UserGameSettings.Overscan.x, UserGameSettings.Overscan.y)
					UserGameSettings.Overscan = Vector2.new(1, 1)
					
					return
				end
			elseif GameOptions.OverscanPX > 0 and GameOptions.OverscanPY > 0 then
				ClampVector2Result = Vector2.new(GameOptions.OverscanPX, GameOptions.OverscanPY)
				ClampVector2Result = UtilityModule.ClampVector2(_Vector2, Vector2.new(1, 1), ClampVector2Result)
				local ScaledClampVector2Result: Vector2 = ClampVector2Result * _Vector2_2
				ClampVector2Result1 = UtilityModule.ClampVector2(_Vector2_3, _Vector2_2, Vector2.new(UtilityModule.Round(ScaledClampVector2Result.X / 2), UtilityModule.Round(ScaledClampVector2Result.Y / 2)) * 2)
				p1._lastSavedOverscan = Vector2.new(GameOptions.OverscanPX, GameOptions.OverscanPY)
				GameOptions.OverscanPX = 1
				GameOptions.OverscanPY = 1
			end
		end)
	end
	p1._stickPosition = _Vector2_3
	p1._edgePercent = ClampVector2Result
	p1._lastUpdate = nil
	p1._acceleration = 1
	p1._seenAPressed = false
	p1.state = { currentSize = ClampVector2Result1 }
end

function Edges.render(p1)
	-- upvalues: ReactModule (copy), EdgeImage (copy), RenderStepModule (copy), ContextActionEventModule (copy), PlatformService (ref), ExternalEventConnection (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p1.state.currentSize.X, 0, p1.state.currentSize.Y),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		SelectionImage = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/ScreenRangeOverlay.png",
			Size = UDim2.new(1, 2, 1, 2),
			Position = UDim2.new(0, -1, 0, -1),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(21, 21, 41, 41)
		}),
		TopLeft = ReactModule.createElement(EdgeImage, {
			Rotation = 0,
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0)
		}),
		TopRight = ReactModule.createElement(EdgeImage, {
			Rotation = 90,
			Position = UDim2.new(1, 0, 0, 0),
			AnchorPoint = Vector2.new(1, 0)
		}),
		BottomRight = ReactModule.createElement(EdgeImage, {
			Rotation = 180,
			Position = UDim2.new(1, 0, 1, 0),
			AnchorPoint = Vector2.new(1, 1)
		}),
		BottomLeft = ReactModule.createElement(EdgeImage, {
			Rotation = 270,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1)
		}),
		Render = ReactModule.createElement(RenderStepModule, {
			name = "UpdateAdjustmentScreen",
			priority = Enum.RenderPriority.Input.Value,
			callback = p1.onRenderStep
		}),
		AdjustConnectorThumbstick = ReactModule.createElement(ContextActionEventModule, {
			name = "ThumbstickAdjustmentScreen",
			callback = p1.onAdjustThumbstick,
			binds = { Enum.KeyCode.Thumbstick2 }
		}),
		SuspendedCn = PlatformService and ReactModule.createElement(ExternalEventConnection, {
			event = PlatformService.Suspended,
			callback = p1.onSuspended
		})
	})
end

return Edges