local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local emoteUtility = require(corePackagesService.Packages.Thumbnailing).EmoteUtility
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local emoteThumbnailView = roactModule.PureComponent:extend("EmoteThumbnailView")
emoteThumbnailView.validateProps = tModule.strictInterface({
	animationClip = tModule.instanceIsA("AnimationClip"),
	thumbnailParameters = require(script.Parent.EmoteThumbnailParameters).validate,
	position = tModule.optional(tModule.UDim2),
	anchorPoint = tModule.optional(tModule.Vector2),
	size = tModule.optional(tModule.UDim2)
})

function emoteThumbnailView.updateCameraAndCharacterPose(p1)
	-- upvalues: emoteUtility (ref), runService (ref)
	if p1.character == nil then return end
	local props = p1.props
	local character = p1.character
	local animationClip = props.animationClip
	local thumbnailParameters = props.thumbnailParameters
	local thumbnailTime = thumbnailParameters.thumbnailTime
	local thumbnailKeyframe = thumbnailParameters.thumbnailKeyframe
	local thumbnailCharacterRotation = thumbnailParameters.thumbnailCharacterRotation
	local thumbnailKeyframe_1 = nil
	
	if animationClip:IsA("CurveAnimation") then
		thumbnailKeyframe_1 = emoteUtility.GetThumbnailKeyframeFromCurve(thumbnailTime, animationClip, thumbnailCharacterRotation)
	elseif animationClip:IsA("KeyframeSequence") then
		thumbnailKeyframe_1 = emoteUtility.GetThumbnailKeyframe(thumbnailKeyframe, animationClip, thumbnailCharacterRotation)
	else
		error("Unsupported Animation data:", animationClip.ClassName)
	end
	emoteUtility.SetPlayerCharacterNeutralPose(character)
	emoteUtility.ApplyKeyframe(character, thumbnailKeyframe_1)
	task.spawn(function()
		-- upvalues: runService (copy), character (ref), emoteUtility (copy), thumbnailParameters (ref), p1 (ref)
		runService.PreAnimation:Wait()
		runService.PostSimulation:Wait()
		local folder = Instance.new("Folder")
		folder.Parent = character
		folder:Destroy()
		local modelCFrame = character:GetModelCFrame()
		p1.updateCameraCFrameBinding(emoteUtility.ThumbnailZoomExtents(character, 20, thumbnailParameters.thumbnailHorizontalOffset, thumbnailParameters.thumbnailVerticalOffset, thumbnailParameters.thumbnailZoom))
		p1.updateCameraFocusBinding(modelCFrame)
	end)
end

function emoteThumbnailView.addCharacterToViewportIfNeeded(p1)
	if p1.character ~= nil and p1.character.Parent ~= nil then return end
	if p1.worldModelRef:getValue() and p1.character ~= nil then
		p1.character.Parent = p1.worldModelRef:getValue()
		p1:updateCameraAndCharacterPose()
	end
end

function emoteThumbnailView.init(p1)
	-- upvalues: roactModule (ref), playersService (ref)
	p1.cameraRef = roactModule.createRef()
	p1.worldModelRef = roactModule.createRef()
	local var1, var2 = roactModule.createBinding(CFrame.new())
	p1.cameraCFrameBinding = var1
	p1.updateCameraCFrameBinding = var2
	local var3, var4 = roactModule.createBinding(CFrame.new())
	p1.cameraFocusBinding = var3
	p1.updateCameraFocusBinding = var4
	task.spawn(function()
		-- upvalues: playersService (copy), p1 (ref)
		local ok, status = pcall(function()
			-- upvalues: playersService (copy)
			return playersService:GetHumanoidDescriptionFromOutfitIdAsync(1342485078)
		end)
		
		if not ok then
			status = Instance.new("HumanoidDescription")
		end
		p1.character = playersService:CreateHumanoidModelFromDescriptionAsync(status, Enum.HumanoidRigType.R15)
		p1:addCharacterToViewportIfNeeded()
	end)
end

function emoteThumbnailView.render(p1)
	-- upvalues: roactModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		Position = p1.props.position or UDim2.fromScale(0, 0),
		AnchorPoint = p1.props.anchorPoint or Vector2.new(0, 0),
		Size = p1.props.size or UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	}, {
		UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		AspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}),
		ViewportFrame = roactModule.createElement("ViewportFrame", {
			ImageTransparency = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageColor3 = Color3.new(0, 0, 0),
			CurrentCamera = p1.cameraRef
		}, {
			Camera = roactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				FieldOfView = 20,
				CFrame = p1.cameraCFrameBinding,
				Focus = p1.cameraFocusBinding,
				[roactModule.Ref] = p1.cameraRef
			}),
			WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p1.worldModelRef })
		})
	})
end

function emoteThumbnailView.didMount(p1)
	p1:addCharacterToViewportIfNeeded()
end

function emoteThumbnailView.didUpdate(p1, _)
	p1:updateCameraAndCharacterPose()
end

return emoteThumbnailView