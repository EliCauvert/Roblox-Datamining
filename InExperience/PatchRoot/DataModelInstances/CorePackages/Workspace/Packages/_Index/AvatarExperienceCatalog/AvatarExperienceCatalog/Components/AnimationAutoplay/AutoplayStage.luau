local TweenService = game:GetService("TweenService")
local AnimationAutoplayTuningModule = require(script.Parent.AnimationAutoplayTuning)
local _ = require(script.Parent.Types)
local _Color3 = Color3.fromRGB(218, 203, 173)
local _Color3_1 = Color3.fromRGB(170, 170, 170)
local v1 = nil
local v2 = nil
local v3 = nil

local function _()
	-- upvalues: v3 (ref)
	if v3 then
		v3:Cancel()
		v3 = nil
	end
end

local function createStage()
	-- upvalues: _Color3_1 (copy), _Color3 (copy), AnimationAutoplayTuningModule (copy), v1 (ref), v2 (ref)
	local AnimationAutoplayStage = Instance.new("Frame")
	AnimationAutoplayStage.Name = "AnimationAutoplayStage"
	AnimationAutoplayStage.Size = UDim2.fromScale(1, 1)
	AnimationAutoplayStage.BackgroundTransparency = 1
	AnimationAutoplayStage.Visible = false
	local Viewport = Instance.new("ViewportFrame")
	Viewport.Name = "Viewport"
	Viewport.Size = UDim2.fromScale(1, 1)
	Viewport.BackgroundTransparency = 1
	Viewport.Ambient = _Color3_1
	Viewport.LightColor = _Color3
	Viewport.LightDirection = vector.create(-1, -1, 2)
	Viewport.ZIndex = 2
	Viewport.Parent = AnimationAutoplayStage
	local Corner = Instance.new("UICorner")
	Corner.Parent = Viewport
	local WorldModel = Instance.new("WorldModel")
	WorldModel.Parent = Viewport
	local Camera = Instance.new("Camera")
	Camera.CameraType = Enum.CameraType.Scriptable
	Camera.FieldOfView = AnimationAutoplayTuningModule.cameraFieldOfView
	Camera.Parent = Viewport
	Viewport.CurrentCamera = Camera
	AnimationAutoplayStage.Destroying:Connect(function()
		-- upvalues: v1 (upval), AnimationAutoplayStage (copy), v2 (upval)
		if v1 and v1.frame == AnimationAutoplayStage then
			v1 = nil
			v2 = nil
		end
	end)
	
	return {
		frame = AnimationAutoplayStage,
		viewport = Viewport,
		worldModel = WorldModel,
		camera = Camera,
		corner = Corner
	}
end

local _ = function()
	-- upvalues: v1 (ref), createStage (copy)
	if v1 == nil then
		v1 = createStage()
	end
	return v1
end

local _ = function(Stage)
	-- upvalues: v3 (ref)
	if v3 then
		v3:Cancel()
		v3 = nil
	end
	Stage.worldModel:ClearAllChildren()
	Stage.frame.Visible = false
	Stage.viewport.ImageTransparency = 0
end

return {
	acquire = function(Parent, Offset)
		-- upvalues: v1 (ref), createStage (copy), v3 (ref), v2 (ref), TweenService (copy)
		if v1 == nil then
			v1 = createStage()
		end
		local Stage = v1
		
		if not pcall(function()
			-- upvalues: Stage (ref), Parent (copy)
			Stage.frame.Parent = Parent
		end) then
			v1 = nil
			
			if v1 == nil then
				v1 = createStage()
			end
			Stage = v1
			Stage.frame.Parent = Parent
		end
		local Stage1 = Stage
		
		if v3 then
			v3:Cancel()
			v3 = nil
		end
		Stage1.worldModel:ClearAllChildren()
		Stage1.frame.Visible = false
		Stage1.viewport.ImageTransparency = 0
		Stage.corner.CornerRadius = UDim.new(0, Offset)
		local t = {}
		v2 = t
		
		return {
			worldModel = Stage.worldModel,
			camera = Stage.camera,
			getAspectRatio = function()
				-- upvalues: Stage (ref)
				local AbsoluteSize = Stage.viewport.AbsoluteSize
				
				return if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then AbsoluteSize.X / AbsoluteSize.Y else 1
			end,
			warmUp = function()
				-- upvalues: v2 (upval), t (copy), Stage (ref)
				if v2 == t then
					Stage.viewport.ImageTransparency = 0.99
					Stage.frame.Visible = true
				end
			end,
			show = function()
				-- upvalues: v2 (upval), t (copy), v3 (upval), Stage (ref)
				if v2 == t then
					if v3 then
						v3:Cancel()
						v3 = nil
					end
					Stage.viewport.ImageTransparency = 0
					Stage.frame.Visible = true
				end
			end,
			fadeIn = function(Info, Callback)
				-- upvalues: v2 (upval), t (copy), v3 (upval), Stage (ref), TweenService (upval)
				if v2 ~= t then return end
				if v3 then
					v3:Cancel()
					v3 = nil
				end
				Stage.frame.Visible = true
				local Tween = TweenService:Create(Stage.viewport, Info, { ImageTransparency = 0 })
				v3 = Tween
				Tween.Completed:Connect(function(PlaybackState)
					-- upvalues: v2 (upval), t (upval), Callback (copy)
					if PlaybackState == Enum.PlaybackState.Completed and v2 == t then
						Callback()
					end
				end)
				Tween:Play()
			end,
			isCurrent = function(): boolean
				-- upvalues: v2 (upval), t (copy)
				return v2 == t
			end,
			release = function()
				-- upvalues: v2 (upval), t (copy), Stage (ref), v3 (upval)
				if v2 ~= t then return end
				v2 = nil
				local Stage1 = Stage
				
				if v3 then
					v3:Cancel()
					v3 = nil
				end
				Stage1.worldModel:ClearAllChildren()
				Stage1.frame.Visible = false
				Stage1.viewport.ImageTransparency = 0
				pcall(function()
					-- upvalues: Stage (upval)
					Stage.frame.Parent = nil
				end)
			end
		}
	end,
	getFrame = function()
		-- upvalues: v1 (ref), createStage (copy)
		if v1 == nil then
			v1 = createStage()
		end
		return v1.frame
	end
}