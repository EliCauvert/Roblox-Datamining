local corePackagesService = game:GetService("CorePackages")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local var2 = settings():FindFirstChild("Game Options")
local userInputService = game:GetService("UserInputService")
local var4 = nil
pcall(function() --[[ line: 8 ]]
	-- upvalues: var4 (write)
	var4 = game:GetService("PlatformService")
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

local function EdgeImage(p0) --[[ line: 28 ]]
	-- upvalues: reactModule (ref)
	return reactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/ScreenAdjustmentArrow.png",
		Size = UDim2.new(0, 95, 0, 95),
		Position = p0.Position,
		AnchorPoint = p0.AnchorPoint,
		Rotation = p0.Rotation
	})
end

local edges = reactModule.Component:extend("Edges")

function edges.init(p1) --[[ line: 41 ]]
	-- upvalues: utilityModule (ref), vector2 (ref), vector2_2 (ref), vector2_3 (ref), migrateOverscanToGameBasicSettingsEngineFeature (ref), userGameSettingsService (ref), var2 (ref), vector2_1 (ref), userInputService (ref)
	local function _(p2) --[[ line: 42 | named "getCurrentEdgePercent" ]]
		-- upvalues: utilityModule (copy), vector2 (copy)
		return utilityModule.ClampVector2(vector2, Vector2.new(1, 1), p2)
	end
	
	local _ = function(p3) --[[ line: 46 | named "getCurrentEdgeSize" ]]
		-- upvalues: vector2_2 (copy), utilityModule (copy), vector2_3 (copy)
		local var19 = p3 * vector2_2
		
		return utilityModule.ClampVector2(vector2_3, vector2_2, Vector2.new(utilityModule.Round(var19.X / 2), utilityModule.Round(var19.Y / 2)) * 2)
	end
	
	function p1.onAdjustThumbstick(_, _, p4) --[[ line: 52 ]]
		-- upvalues: p1 (ref), utilityModule (copy)
		p1._stickPosition = utilityModule.GamepadLinearToCurve(Vector2.new(p4.Position.X, -p4.Position.Y), 0.2)
	end
	
	function p1.onAccept() --[[ line: 56 ]]
		-- upvalues: migrateOverscanToGameBasicSettingsEngineFeature (copy), userGameSettingsService (copy), p1 (ref), var2 (copy)
		local _, _ = pcall(function() --[[ line: 57 ]]
			-- upvalues: migrateOverscanToGameBasicSettingsEngineFeature (copy), userGameSettingsService (copy), p1 (copy), var2 (copy)
			if migrateOverscanToGameBasicSettingsEngineFeature then
				userGameSettingsService.Overscan = Vector2.new(math.min(1, p1._edgePercent.X), math.min(1, p1._edgePercent.Y))
				
				return
			end
			var2.OverscanPX = math.min(1, p1._edgePercent.X)
			var2.OverscanPY = math.min(1, p1._edgePercent.Y)
		end)
		
		if p1.props.onSetEdges then
			p1.props.onSetEdges()
		end
	end
	
	function p1.onRenderStep() --[[ line: 73 ]]
		-- upvalues: p1 (ref), vector2_3 (copy), utilityModule (copy), vector2 (copy), vector2_2 (copy)
		local currentTime = tick()
		
		if p1._lastUpdate then
			if p1._stickPosition == vector2_3 then
				p1._acceleration = 1
			else
				local var21 = currentTime - p1._lastUpdate
				p1._edgePercent = utilityModule.ClampVector2(vector2, Vector2.new(1, 1), p1._stickPosition * p1._acceleration * var21 * 0.05 + p1._edgePercent)
				p1._acceleration = math.min(p1._acceleration + var21 * 1, 3)
				local var22 = p1
				local t = {}
				local var24 = p1._edgePercent * vector2_2
				t.currentSize = utilityModule.ClampVector2(vector2_3, vector2_2, Vector2.new(utilityModule.Round(var24.X / 2), utilityModule.Round(var24.Y / 2)) * 2)
				var22:setState(t)
			end
		end
		p1._lastUpdate = currentTime
	end
	
	function p1.onSuspended() --[[ line: 92 ]]
		-- upvalues: migrateOverscanToGameBasicSettingsEngineFeature (copy), userGameSettingsService (copy), p1 (ref), var2 (copy)
		pcall(function() --[[ line: 93 ]]
			-- upvalues: migrateOverscanToGameBasicSettingsEngineFeature (copy), userGameSettingsService (copy), p1 (copy), var2 (copy)
			if migrateOverscanToGameBasicSettingsEngineFeature then
				userGameSettingsService.Overscan = Vector2.new(p1._lastSavedOverscan.X, p1._lastSavedOverscan.Y)
				
				return
			end
			var2.OverscanPX = p1._lastSavedOverscan.X
			var2.OverscanPY = p1._lastSavedOverscan.Y
		end)
	end
	
	local var16 = utilityModule.ClampVector2(vector2, Vector2.new(1, 1), vector2_1)
	local var17 = var16 * vector2_2
	local var18 = utilityModule.ClampVector2(vector2_3, vector2_2, Vector2.new(utilityModule.Round(var17.X / 2), utilityModule.Round(var17.Y / 2)) * 2)
	
	if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
		pcall(function() --[[ line: 106 ]]
			-- upvalues: migrateOverscanToGameBasicSettingsEngineFeature (copy), userGameSettingsService (copy), var16 (write), utilityModule (copy), vector2 (copy), var18 (write), vector2_2 (copy), vector2_3 (copy), p1 (ref), var2 (copy)
			if migrateOverscanToGameBasicSettingsEngineFeature then
				if userGameSettingsService.Overscan.x > 0 and userGameSettingsService.Overscan.y > 0 then
					var16 = Vector2.new(userGameSettingsService.Overscan.x, userGameSettingsService.Overscan.y)
					var16 = utilityModule.ClampVector2(vector2, Vector2.new(1, 1), var16)
					local var25 = var16 * vector2_2
					var18 = utilityModule.ClampVector2(vector2_3, vector2_2, Vector2.new(utilityModule.Round(var25.X / 2), utilityModule.Round(var25.Y / 2)) * 2)
					p1._lastSavedOverscan = Vector2.new(userGameSettingsService.Overscan.x, userGameSettingsService.Overscan.y)
					userGameSettingsService.Overscan = Vector2.new(1, 1)
					
					return
				end
			elseif var2.OverscanPX > 0 and var2.OverscanPY > 0 then
				var16 = Vector2.new(var2.OverscanPX, var2.OverscanPY)
				var16 = utilityModule.ClampVector2(vector2, Vector2.new(1, 1), var16)
				local var26 = var16 * vector2_2
				var18 = utilityModule.ClampVector2(vector2_3, vector2_2, Vector2.new(utilityModule.Round(var26.X / 2), utilityModule.Round(var26.Y / 2)) * 2)
				p1._lastSavedOverscan = Vector2.new(var2.OverscanPX, var2.OverscanPY)
				var2.OverscanPX = 1
				var2.OverscanPY = 1
			end
		end)
	end
	p1._stickPosition = vector2_3
	p1._edgePercent = var16
	p1._lastUpdate = nil
	p1._acceleration = 1
	p1._seenAPressed = false
	p1.state = { currentSize = var18 }
end

function edges.render(p5) --[[ line: 145 ]]
	-- upvalues: reactModule (ref), EdgeImage (ref), renderStepModule (ref), contextActionEventModule (ref), var4 (write), externalEventConnection (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p5.state.currentSize.X, 0, p5.state.currentSize.Y),
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
			callback = p5.onRenderStep
		}),
		AdjustConnectorThumbstick = reactModule.createElement(contextActionEventModule, {
			name = "ThumbstickAdjustmentScreen",
			callback = p5.onAdjustThumbstick,
			binds = { Enum.KeyCode.Thumbstick2 }
		}),
		SuspendedCn = var4 and reactModule.createElement(externalEventConnection, { event = var4.Suspended, callback = p5.onSuspended })
	})
end

return edges