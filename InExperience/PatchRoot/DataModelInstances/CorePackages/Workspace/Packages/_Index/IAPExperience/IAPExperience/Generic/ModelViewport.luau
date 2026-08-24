local runService = game:GetService("RunService")
local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local characterUtility = require(parent.Thumbnailing).CharacterUtility
local cameraUtility = require(parent.Thumbnailing).CameraUtility
local cFrameUtility = require(parent.Thumbnailing).CFrameUtility
local emoteUtility = require(parent.Thumbnailing).EmoteUtility
local purchasePromptPreviewMakeupHead2 = game:DefineFastFlag("PurchasePromptPreviewMakeupHead2", false)

return function(p0) --[[ line: 27 | named "ModelViewport" ]]
	-- upvalues: reactModule (ref), emoteUtility (ref), runService (ref), cFrameUtility (ref), characterUtility (ref), cameraUtility (ref), purchasePromptPreviewMakeupHead2 (ref)
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useBinding(nil)
	local var6 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 32 ]]
		-- upvalues: var6 (ref)
		var6.current = true
		
		return function() --[[ line: 34 ]]
			-- upvalues: var6 (copy)
			var6.current = false
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: p0 (ref), var3 (ref), emoteUtility (copy), runService (copy), var6 (ref), cFrameUtility (copy), characterUtility (copy), cameraUtility (copy), var5 (ref), purchasePromptPreviewMakeupHead2 (copy)
		task.spawn(function() --[[ line: 41 ]]
			-- upvalues: p0 (copy), var3 (copy), emoteUtility (copy), runService (copy), var6 (copy), cFrameUtility (copy), characterUtility (copy), cameraUtility (copy), var5 (copy), purchasePromptPreviewMakeupHead2 (copy)
			local var7 = p0.model:Clone()
			local camera = Instance.new("Camera")
			camera.CameraType = Enum.CameraType.Scriptable
			camera.Parent = var3.current
			camera.HeadLocked = true
			camera.VRTiltAndRollEnabled = true
			var7.Parent = var3.current
			
			if var7:IsA("Model") and var7.PrimaryPart then
				var7:MoveTo(Vector3.new(0, 0, 0))
				emoteUtility.SetPlayerCharacterPoseWithMoodFallback(var7)
				runService.PostSimulation:Wait()
				
				if var6.current then
					local _ = nil
					local var9 = cFrameUtility.CalculateTargetCFrame(var7.Head.CFrame)
					local var10 = var9 - var9.Position + var7.PrimaryPart.CFrame.Position
					local var11, var12 = characterUtility.CalculateModelExtents(var7, var10)
					cameraUtility.SetupCamera(camera, {
						optFieldOfView = 30,
						extentScale = 1,
						targetCFrame = var10,
						minExtent = var11,
						maxExtent = var12,
						optCameraXRot = cameraUtility.XRotForFullBody,
						optCameraDistanceScale = cameraUtility.DistanceScaleForFullBody,
						extentScale = cameraUtility.DefaultBodyMarginScale
					})
					var5(camera)
					
					return
				end
				return
			elseif not var6.current then return end
			local var13 = var7
			
			if not var7:IsA("Model") then
				var13 = Instance.new("Model")
				var7.Parent = var13
				var13.Parent = var3.current
			end
			if not purchasePromptPreviewMakeupHead2 then
				cameraUtility.SetupAccessoryCamera(var13, camera)
				var5(camera)
				
				return
			end
			local head = var13:FindFirstChild("Head")
			
			if head and head:IsA("MeshPart") and not var13:FindFirstChild("HumanoidRootPart") then
				local cFrame = head.CFrame
				local var15, var16 = characterUtility.CalculateBodyPartsExtents(cFrame, { head })
				cameraUtility.SetupCamera(camera, {
					optFieldOfView = 30,
					extentScale = 1.2,
					optCameraXRot = 5,
					optCameraYRot = 20,
					targetCFrame = cFrame,
					minExtent = var15,
					maxExtent = var16
				})
				var5(camera)
				
				return
			end
			cameraUtility.SetupAccessoryCamera(var13, camera)
			var5(camera)
		end)
	end, {})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p0.Size,
		Position = p0.Position,
		LayoutOrder = p0.LayoutOrder
	}, {
		ViewportFrame = reactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 1,
			LightDirection = Vector3.new(9.5, -12, 7.5),
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LightColor = Color3.fromRGB(240, 240, 240),
			Ambient = Color3.fromRGB(160, 160, 160),
			CurrentCamera = var4
		}, {
			WorldModel = reactModule.createElement("WorldModel", { ref = var3 })
		})
	})
end