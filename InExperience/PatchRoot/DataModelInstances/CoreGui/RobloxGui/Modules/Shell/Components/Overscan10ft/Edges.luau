local corePackagesService = game:GetService("CorePackages")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local var1 = settings():FindFirstChild("Game Options")
local userInputService = game:GetService("UserInputService")
local var2 = nil
pcall(function()
	-- upvalues: var2 (write)
	var2 = game:GetService("PlatformService")
end)
local modules = game:GetService("CoreGui").RobloxGui.Modules
local reactModule = require(corePackagesService.Packages.React)
local utilityModule = require(modules.Shell.Utility)
local contextActionEventModule = require(modules.Shell.Components.ContextActionEvent)
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local renderStepModule = require(modules.Shell.Components.RenderStep)
local migrateOverscanToGameBasicSettingsEngineFeature = game:GetEngineFeature("MigrateOverscanToGameBasicSettings")
local vector2 = Vector2.new(0.85, 0.85)
local vector2_1 = Vector2.new(0.9, 0.9)
local vector2_2 = Vector2.new(1920, 1080)
local vector2_3 = Vector2.new(0, 0)

local function EdgeImage(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/ScreenAdjustmentArrow.png",
		Size = UDim2.new(0, 95, 0, 95),
		Position = p1.Position,
		AnchorPoint = p1.AnchorPoint,
		Rotation = p1.Rotation
	})
end

local edges = reactModule.Component:extend("Edges")

function edges.init(p1)
	-- upvalues: utilityModule (ref), vector2 (ref), vector2_2 (ref), vector2_3 (ref), migrateOverscanToGameBasicSettingsEngineFeature (ref), userGameSettingsService (ref), var1 (ref), vector2_1 (ref), userInputService (ref)
	local function _(p2)
		-- upvalues: utilityModule (copy), vector2 (copy)
		return utilityModule.ClampVector2(vector2, Vector2.new(1, 1), p2)
	end
	
	local _ = function(p2)
		-- upvalues: vector2_2 (copy), utilityModule (copy), vector2_3 (copy)
		local var3 = p2 * vector2_2
		
		return utilityModule.ClampVector2(vector2_3, vector2_2, Vector2.new(utilityModule.Round(var3.X / 2), utilityModule.Round(var3.Y / 2)) * 2)
	end
	
	function p1.onAdjustThumbstick(_, _, p2)
		-- upvalues: p1 (ref), utilityModule (copy)
		p1._stickPosition = utilityModule.GamepadLinearToCurve(Vector2.new(p2.Position.X, -p2.Position.Y), 0.2)
	end
	
	function p1.onAccept()
		-- upvalues: migrateOverscanToGameBasicSettingsEngineFeature (copy), userGameSettingsService (copy), p1 (ref), var1 (copy)
		local _, _ = pcall(function()
			-- upvalues: migrateOverscanToGameBasicSettingsEngineFeature (copy), userGameSettingsService (copy), p1 (copy), var1 (copy)
			if migrateOverscanToGameBasicSettingsEngineFeature then
				userGameSettingsService.Overscan = Vector2.new(math.min(1, p1._edgePercent.X), math.min(1, p1._edgePercent.Y))
				
				return
			end
			var1.OverscanPX = math.min(1, p1._edgePercent.X)
			var1.OverscanPY = math.min(1, p1._edgePercent.Y)
		end)
		
		if p1.props.onSetEdges then
			p1.props.onSetEdges()
		end
	end
	
	function p1.onRenderStep()
		-- upvalues: p1 (ref), vector2_3 (copy), utilityModule (copy), vector2 (copy), vector2_2 (copy)
		local currentTime = tick()
		
		if p1._lastUpdate then
			if p1._stickPosition == vector2_3 then
				p1._acceleration = 1
			else
				local var3 = currentTime - p1._lastUpdate
				p1._edgePercent = utilityModule.ClampVector2(vector2, Vector2.new(1, 1), p1._stickPosition * p1._acceleration * var3 * 0.05 + p1._edgePercent)
				p1._acceleration = math.min(p1._acceleration + var3 * 1, 3)
				local var4 = p1
				local t = {}
				local var5 = p1._edgePercent * vector2_2
				t.currentSize = utilityModule.ClampVector2(vector2_3, vector2_2, Vector2.new(utilityModule.Round(var5.X / 2), utilityModule.Round(var5.Y / 2)) * 2)
				var4:setState(t)
			end
		end
		p1._lastUpdate = currentTime
	end
	
	function p1.onSuspended()
		-- upvalues: migrateOverscanToGameBasicSettingsEngineFeature (copy), userGameSettingsService (copy), p1 (ref), var1 (copy)
		pcall(function()
			-- upvalues: migrateOverscanToGameBasicSettingsEngineFeature (copy), userGameSettingsService (copy), p1 (copy), var1 (copy)
			if migrateOverscanToGameBasicSettingsEngineFeature then
				userGameSettingsService.Overscan = Vector2.new(p1._lastSavedOverscan.X, p1._lastSavedOverscan.Y)
				
				return
			end
			var1.OverscanPX = p1._lastSavedOverscan.X
			var1.OverscanPY = p1._lastSavedOverscan.Y
		end)
	end
	
	local var3 = utilityModule.ClampVector2(vector2, Vector2.new(1, 1), vector2_1)
	local var4 = var3 * vector2_2
	local var5 = utilityModule.ClampVector2(vector2_3, vector2_2, Vector2.new(utilityModule.Round(var4.X / 2), utilityModule.Round(var4.Y / 2)) * 2)
	
	if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
		pcall(function()
			-- upvalues: migrateOverscanToGameBasicSettingsEngineFeature (copy), userGameSettingsService (copy), var3 (write), utilityModule (copy), vector2 (copy), var5 (write), vector2_2 (copy), vector2_3 (copy), p1 (ref), var1 (copy)
			if migrateOverscanToGameBasicSettingsEngineFeature then
				if userGameSettingsService.Overscan.x > 0 and userGameSettingsService.Overscan.y > 0 then
					var3 = Vector2.new(userGameSettingsService.Overscan.x, userGameSettingsService.Overscan.y)
					var3 = utilityModule.ClampVector2(vector2, Vector2.new(1, 1), var3)
					local var6 = var3 * vector2_2
					var5 = utilityModule.ClampVector2(vector2_3, vector2_2, Vector2.new(utilityModule.Round(var6.X / 2), utilityModule.Round(var6.Y / 2)) * 2)
					p1._lastSavedOverscan = Vector2.new(userGameSettingsService.Overscan.x, userGameSettingsService.Overscan.y)
					userGameSettingsService.Overscan = Vector2.new(1, 1)
					
					return
				end
			elseif var1.OverscanPX > 0 and var1.OverscanPY > 0 then
				var3 = Vector2.new(var1.OverscanPX, var1.OverscanPY)
				var3 = utilityModule.ClampVector2(vector2, Vector2.new(1, 1), var3)
				local var7 = var3 * vector2_2
				var5 = utilityModule.ClampVector2(vector2_3, vector2_2, Vector2.new(utilityModule.Round(var7.X / 2), utilityModule.Round(var7.Y / 2)) * 2)
				p1._lastSavedOverscan = Vector2.new(var1.OverscanPX, var1.OverscanPY)
				var1.OverscanPX = 1
				var1.OverscanPY = 1
			end
		end)
	end
	p1._stickPosition = vector2_3
	p1._edgePercent = var3
	p1._lastUpdate = nil
	p1._acceleration = 1
	p1._seenAPressed = false
	p1.state = { currentSize = var5 }
end

function edges.render(p1)
	-- upvalues: reactModule (ref), EdgeImage (ref), renderStepModule (ref), contextActionEventModule (ref), var2 (write), externalEventConnection (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p1.state.currentSize.X, 0, p1.state.currentSize.Y),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		SelectionImage = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/ScreenRangeOverlay.png",
			Size = UDim2.new(1, 2, 1, 2),
			Position = UDim2.new(0, -1, 0, -1),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(21, 21, 41, 41)
		}),
		TopLeft = reactModule.createElement(EdgeImage, {
			Rotation = 0,
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0)
		}),
		TopRight = reactModule.createElement(EdgeImage, {
			Rotation = 90,
			Position = UDim2.new(1, 0, 0, 0),
			AnchorPoint = Vector2.new(1, 0)
		}),
		BottomRight = reactModule.createElement(EdgeImage, {
			Rotation = 180,
			Position = UDim2.new(1, 0, 1, 0),
			AnchorPoint = Vector2.new(1, 1)
		}),
		BottomLeft = reactModule.createElement(EdgeImage, {
			Rotation = 270,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1)
		}),
		Render = reactModule.createElement(renderStepModule, {
			name = "UpdateAdjustmentScreen",
			priority = Enum.RenderPriority.Input.Value,
			callback = p1.onRenderStep
		}),
		AdjustConnectorThumbstick = reactModule.createElement(contextActionEventModule, {
			name = "ThumbstickAdjustmentScreen",
			callback = p1.onAdjustThumbstick,
			binds = { Enum.KeyCode.Thumbstick2 }
		}),
		SuspendedCn = var2 and reactModule.createElement(externalEventConnection, { event = var2.Suspended, callback = p1.onSuspended })
	})
end

return edges