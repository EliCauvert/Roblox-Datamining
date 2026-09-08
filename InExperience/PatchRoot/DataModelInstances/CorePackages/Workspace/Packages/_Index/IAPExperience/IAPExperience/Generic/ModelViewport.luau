local runService = game:GetService("RunService")
local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local characterUtility = require(parent.Thumbnailing).CharacterUtility
local cameraUtility = require(parent.Thumbnailing).CameraUtility
local cFrameUtility = require(parent.Thumbnailing).CFrameUtility
local emoteUtility = require(parent.Thumbnailing).EmoteUtility
local purchasePromptPreviewMakeupHead2 = game:DefineFastFlag("PurchasePromptPreviewMakeupHead2", false)

return function(p1)
	-- upvalues: reactModule (ref), emoteUtility (ref), runService (ref), cFrameUtility (ref), characterUtility (ref), cameraUtility (ref), purchasePromptPreviewMakeupHead2 (ref)
	local var1 = reactModule.useRef(nil)
	local var2, var3 = reactModule.useBinding(nil)
	local var4 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		var4.current = true
		
		return function()
			-- upvalues: var4 (copy)
			var4.current = false
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), emoteUtility (copy), runService (copy), var4 (ref), cFrameUtility (copy), characterUtility (copy), cameraUtility (copy), var3 (ref), purchasePromptPreviewMakeupHead2 (copy)
		task.spawn(function()
			-- upvalues: p1 (copy), var1 (copy), emoteUtility (copy), runService (copy), var4 (copy), cFrameUtility (copy), characterUtility (copy), cameraUtility (copy), var3 (copy), purchasePromptPreviewMakeupHead2 (copy)
			local var5 = p1.model:Clone()
			local camera = Instance.new("Camera")
			camera.CameraType = Enum.CameraType.Scriptable
			camera.Parent = var1.current
			camera.HeadLocked = true
			camera.VRTiltAndRollEnabled = true
			var5.Parent = var1.current
			
			if var5:IsA("Model") and var5.PrimaryPart then
				var5:MoveTo(Vector3.new(0, 0, 0))
				emoteUtility.SetPlayerCharacterPoseWithMoodFallback(var5)
				runService.PostSimulation:Wait()
				
				if var4.current then
					local _ = nil
					local var6 = cFrameUtility.CalculateTargetCFrame(var5.Head.CFrame)
					local var7 = var6 - var6.Position + var5.PrimaryPart.CFrame.Position
					local var8, var9 = characterUtility.CalculateModelExtents(var5, var7)
					cameraUtility.SetupCamera(camera, {
						optFieldOfView = 30,
						extentScale = 1,
						targetCFrame = var7,
						minExtent = var8,
						maxExtent = var9,
						optCameraXRot = cameraUtility.XRotForFullBody,
						optCameraDistanceScale = cameraUtility.DistanceScaleForFullBody,
						extentScale = cameraUtility.DefaultBodyMarginScale
					})
					var3(camera)
					
					return
				end
				return
			elseif not var4.current then return end
			local var10 = var5
			
			if not var5:IsA("Model") then
				var10 = Instance.new("Model")
				var5.Parent = var10
				var10.Parent = var1.current
			end
			if not purchasePromptPreviewMakeupHead2 then
				cameraUtility.SetupAccessoryCamera(var10, camera)
				var3(camera)
				
				return
			end
			local head = var10:FindFirstChild("Head")
			
			if head and head:IsA("MeshPart") and not var10:FindFirstChild("HumanoidRootPart") then
				local cFrame = head.CFrame
				local var11, var12 = characterUtility.CalculateBodyPartsExtents(cFrame, { head })
				cameraUtility.SetupCamera(camera, {
					optFieldOfView = 30,
					extentScale = 1.2,
					optCameraXRot = 5,
					optCameraYRot = 20,
					targetCFrame = cFrame,
					minExtent = var11,
					maxExtent = var12
				})
				var3(camera)
				
				return
			end
			cameraUtility.SetupAccessoryCamera(var10, camera)
			var3(camera)
		end)
	end, {})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.Size,
		Position = p1.Position,
		LayoutOrder = p1.LayoutOrder
	}, {
		ViewportFrame = reactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 1,
			LightDirection = Vector3.new(9.5, -12, 7.5),
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LightColor = Color3.fromRGB(240, 240, 240),
			Ambient = Color3.fromRGB(160, 160, 160),
			CurrentCamera = var2
		}, {
			WorldModel = reactModule.createElement("WorldModel", { ref = var1 })
		})
	})
end