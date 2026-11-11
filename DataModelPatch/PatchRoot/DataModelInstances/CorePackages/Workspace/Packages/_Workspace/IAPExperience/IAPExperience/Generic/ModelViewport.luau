local RunService = game:GetService("RunService")
local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local CharacterUtility = require(Parent.Thumbnailing).CharacterUtility
local CameraUtility = require(Parent.Thumbnailing).CameraUtility
local CFrameUtility = require(Parent.Thumbnailing).CFrameUtility
local EmoteUtility = require(Parent.Thumbnailing).EmoteUtility
local PurchasePromptPreviewMakeupHead = game:DefineFastFlag("PurchasePromptPreviewMakeupHead", false)

return function(Frame)
	-- upvalues: ReactModule (copy), EmoteUtility (copy), RunService (copy), CFrameUtility (copy), CharacterUtility (copy), CameraUtility (copy), PurchasePromptPreviewMakeupHead (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current = true
		
		return function()
			-- upvalues: UseRefResult1 (upval)
			UseRefResult1.current = false
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseRefResult (copy), EmoteUtility (upval), RunService (upval), UseRefResult1 (copy), CFrameUtility (upval), CharacterUtility (upval), CameraUtility (upval), UseBindingResult2 (copy), PurchasePromptPreviewMakeupHead (upval)
		task.spawn(function()
			-- upvalues: Frame (upval), UseRefResult (upval), EmoteUtility (upval), RunService (upval), UseRefResult1 (upval), CFrameUtility (upval), CharacterUtility (upval), CameraUtility (upval), UseBindingResult2 (upval), PurchasePromptPreviewMakeupHead (upval)
			local Model = Frame.model:Clone()
			local Camera = Instance.new("Camera")
			Camera.CameraType = Enum.CameraType.Scriptable
			Camera.Parent = UseRefResult.current
			Camera.HeadLocked = true
			Camera.VRTiltAndRollEnabled = true
			Model.Parent = UseRefResult.current
			
			if Model:IsA("Model") and Model.PrimaryPart then
				Model:MoveTo(vector.create(0, 0, 0))
				EmoteUtility.SetPlayerCharacterPoseWithMoodFallback(Model)
				RunService.PostSimulation:Wait()
				
				if UseRefResult1.current then
					local TargetCFrame = CFrameUtility.CalculateTargetCFrame(Model.Head.CFrame)
					local NewTargetCFrame = TargetCFrame - TargetCFrame.Position + Model.PrimaryPart.CFrame.Position
					local ModelExtents, ModelExtents2 = CharacterUtility.CalculateModelExtents(Model, NewTargetCFrame)
					local config = {
						optFieldOfView = 30,
						extentScale = 1,
						targetCFrame = NewTargetCFrame,
						minExtent = ModelExtents,
						maxExtent = ModelExtents2,
						optCameraXRot = CameraUtility.XRotForFullBody,
						optCameraDistanceScale = CameraUtility.DistanceScaleForFullBody
					}
					config.extentScale = CameraUtility.DefaultBodyMarginScale
					CameraUtility.SetupCamera(Camera, config)
					UseBindingResult2(Camera)
					
					return
				end
				return
			else
				if not UseRefResult1.current then return end
				local Model1 = Model
				
				if not Model:IsA("Model") then
					Model1 = Instance.new("Model")
					Model.Parent = Model1
					Model1.Parent = UseRefResult.current
				end
				if not PurchasePromptPreviewMakeupHead then
					CameraUtility.SetupAccessoryCamera(Model1, Camera)
					UseBindingResult2(Camera)
					
					return
				end
				local Head = Model1:FindFirstChild("Head")
				
				if Head and Head:IsA("MeshPart") then
					Head.CFrame = CFrame.new()
					local HeadCFrame = Head.CFrame
					local ModelExtents1, ModelExtents2_1 = CharacterUtility.CalculateModelExtents(Model1, HeadCFrame)
					CameraUtility.SetupCamera(Camera, {
						optFieldOfView = 30,
						extentScale = 1.2,
						optCameraXRot = 5,
						optCameraYRot = 20,
						targetCFrame = HeadCFrame,
						minExtent = ModelExtents1,
						maxExtent = ModelExtents2_1
					})
					UseBindingResult2(Camera)
					
					return
				else
					CameraUtility.SetupAccessoryCamera(Model1, Camera)
					UseBindingResult2(Camera)
				end
			end
		end)
	end, {})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Frame.Size,
		Position = Frame.Position,
		LayoutOrder = Frame.LayoutOrder
	}, {
		ViewportFrame = ReactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 1,
			LightDirection = vector.create(9.5, -12, 7.5),
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LightColor = Color3.fromRGB(240, 240, 240),
			Ambient = Color3.fromRGB(160, 160, 160),
			CurrentCamera = UseBindingResult
		}, {
			WorldModel = ReactModule.createElement("WorldModel", { ref = UseRefResult })
		})
	})
end