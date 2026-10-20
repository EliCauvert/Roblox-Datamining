local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local EmoteUtility = require(CorePackages.Packages.Thumbnailing).EmoteUtility
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local EmoteThumbnailView = RoactModule.PureComponent:extend("EmoteThumbnailView")
EmoteThumbnailView.validateProps = TModule.strictInterface({
	animationClip = TModule.instanceIsA("AnimationClip"),
	thumbnailParameters = require(script.Parent.EmoteThumbnailParameters).validate,
	position = TModule.optional(TModule.UDim2),
	anchorPoint = TModule.optional(TModule.Vector2),
	size = TModule.optional(TModule.UDim2)
})

function EmoteThumbnailView.updateCameraAndCharacterPose(p1)
	-- upvalues: EmoteUtility (copy), RunService (copy)
	if p1.character == nil then return end
	local Props = p1.props
	local Character = p1.character
	local AnimationClip = Props.animationClip
	local ThumbnailParameters = Props.thumbnailParameters
	local ThumbnailTime = ThumbnailParameters.thumbnailTime
	local ThumbnailKeyframe = ThumbnailParameters.thumbnailKeyframe
	local ThumbnailCharacterRotation = ThumbnailParameters.thumbnailCharacterRotation
	local ThumbnailKeyframe1 = nil
	
	if AnimationClip:IsA("CurveAnimation") then
		ThumbnailKeyframe1 = EmoteUtility.GetThumbnailKeyframeFromCurve(ThumbnailTime, AnimationClip, ThumbnailCharacterRotation)
	elseif AnimationClip:IsA("KeyframeSequence") then
		ThumbnailKeyframe1 = EmoteUtility.GetThumbnailKeyframe(ThumbnailKeyframe, AnimationClip, ThumbnailCharacterRotation)
	else
		error("Unsupported Animation data:", AnimationClip.ClassName)
	end
	EmoteUtility.SetPlayerCharacterNeutralPose(Character)
	EmoteUtility.ApplyKeyframe(Character, ThumbnailKeyframe1)
	task.spawn(function()
		-- upvalues: RunService (upval), Character (copy), EmoteUtility (upval), ThumbnailParameters (copy), p1 (copy)
		RunService.PreAnimation:Wait()
		RunService.PostSimulation:Wait()
		local Folder = Instance.new("Folder")
		Folder.Parent = Character
		Folder:Destroy()
		local ModelCFrame = Character:GetModelCFrame()
		p1.updateCameraCFrameBinding((EmoteUtility.ThumbnailZoomExtents(Character, 20, ThumbnailParameters.thumbnailHorizontalOffset, ThumbnailParameters.thumbnailVerticalOffset, ThumbnailParameters.thumbnailZoom)))
		p1.updateCameraFocusBinding(ModelCFrame)
	end)
end

function EmoteThumbnailView.addCharacterToViewportIfNeeded(p1)
	if p1.character ~= nil and p1.character.Parent ~= nil then return end
	if p1.worldModelRef:getValue() and p1.character ~= nil then
		p1.character.Parent = p1.worldModelRef:getValue()
		p1:updateCameraAndCharacterPose()
	end
end

function EmoteThumbnailView.init(p1)
	-- upvalues: RoactModule (copy), Players (copy)
	p1.cameraRef = RoactModule.createRef()
	p1.worldModelRef = RoactModule.createRef()
	p1.cameraCFrameBinding, p1.updateCameraCFrameBinding = RoactModule.createBinding(CFrame.new())
	p1.cameraFocusBinding, p1.updateCameraFocusBinding = RoactModule.createBinding(CFrame.new())
	task.spawn(function()
		-- upvalues: Players (upval), p1 (copy)
		local Success, Result = pcall(function()
			-- upvalues: Players (upval)
			return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:GetHumanoidDescriptionFromOutfitIdAsync(1342485078) else Players:GetHumanoidDescriptionFromOutfitId(1342485078)
		end)
		
		if not Success then
			Result = Instance.new("HumanoidDescription")
		end
		if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
			p1.character = Players:CreateHumanoidModelFromDescriptionAsync(Result, Enum.HumanoidRigType.R15)
		else
			p1.character = Players:CreateHumanoidModelFromDescription(Result, Enum.HumanoidRigType.R15)
		end
		p1:addCharacterToViewportIfNeeded()
	end)
end

function EmoteThumbnailView.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		Position = p1.props.position or UDim2.fromScale(0, 0),
		AnchorPoint = p1.props.anchorPoint or Vector2.new(0, 0),
		Size = p1.props.size or UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	}, {
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		AspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}),
		ViewportFrame = RoactModule.createElement("ViewportFrame", {
			ImageTransparency = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageColor3 = Color3.new(0, 0, 0),
			CurrentCamera = p1.cameraRef
		}, {
			Camera = RoactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				FieldOfView = 20,
				CFrame = p1.cameraCFrameBinding,
				Focus = p1.cameraFocusBinding,
				[RoactModule.Ref] = p1.cameraRef
			}),
			WorldModel = RoactModule.createElement("WorldModel", { [RoactModule.Ref] = p1.worldModelRef })
		})
	})
end

function EmoteThumbnailView.didMount(p1)
	p1:addCharacterToViewportIfNeeded()
end

function EmoteThumbnailView.didUpdate(p1, _)
	p1:updateCameraAndCharacterPose()
end

return EmoteThumbnailView