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

function emoteThumbnailView.updateCameraAndCharacterPose(p0) --[[ line: 32 ]]
	-- upvalues: emoteUtility (ref), runService (ref)
	if p0.character == nil then return end
	local props = p0.props
	local character = p0.character
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
	task.spawn(function() --[[ line: 64 ]]
		-- upvalues: runService (copy), character (ref), emoteUtility (copy), thumbnailParameters (ref), p0 (ref)
		runService.PreAnimation:Wait()
		runService.PostSimulation:Wait()
		local folder = Instance.new("Folder")
		folder.Parent = character
		folder:Destroy()
		local modelCFrame = character:GetModelCFrame()
		p0.updateCameraCFrameBinding(emoteUtility.ThumbnailZoomExtents(character, 20, thumbnailParameters.thumbnailHorizontalOffset, thumbnailParameters.thumbnailVerticalOffset, thumbnailParameters.thumbnailZoom))
		p0.updateCameraFocusBinding(modelCFrame)
	end)
end

function emoteThumbnailView.addCharacterToViewportIfNeeded(p1) --[[ line: 90 ]]
	if p1.character ~= nil and p1.character.Parent ~= nil then return end
	if p1.worldModelRef:getValue() and p1.character ~= nil then
		p1.character.Parent = p1.worldModelRef:getValue()
		p1:updateCameraAndCharacterPose()
	end
end

function emoteThumbnailView.init(p2) --[[ line: 101 ]]
	-- upvalues: roactModule (ref), playersService (ref)
	p2.cameraRef = roactModule.createRef()
	p2.worldModelRef = roactModule.createRef()
	local var9, var10 = roactModule.createBinding(CFrame.new())
	p2.cameraCFrameBinding = var9
	p2.updateCameraCFrameBinding = var10
	local var11, var12 = roactModule.createBinding(CFrame.new())
	p2.cameraFocusBinding = var11
	p2.updateCameraFocusBinding = var12
	task.spawn(function() --[[ line: 108 ]]
		-- upvalues: playersService (copy), p2 (ref)
		local ok, status = pcall(function() --[[ line: 110 ]]
			-- upvalues: playersService (copy)
			return playersService:GetHumanoidDescriptionFromOutfitIdAsync(1342485078)
		end)
		
		if not ok then
			status = Instance.new("HumanoidDescription")
		end
		p2.character = playersService:CreateHumanoidModelFromDescriptionAsync(status, Enum.HumanoidRigType.R15)
		p2:addCharacterToViewportIfNeeded()
	end)
end

function emoteThumbnailView.render(p3) --[[ line: 123 ]]
	-- upvalues: roactModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		Position = p3.props.position or UDim2.fromScale(0, 0),
		AnchorPoint = p3.props.anchorPoint or Vector2.new(0, 0),
		Size = p3.props.size or UDim2.fromScale(1, 1),
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
			CurrentCamera = p3.cameraRef
		}, {
			Camera = roactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				FieldOfView = 20,
				CFrame = p3.cameraCFrameBinding,
				Focus = p3.cameraFocusBinding,
				[roactModule.Ref] = p3.cameraRef
			}),
			WorldModel = roactModule.createElement("WorldModel", { [roactModule.Ref] = p3.worldModelRef })
		})
	})
end

function emoteThumbnailView.didMount(p4) --[[ line: 172 ]]
	p4:addCharacterToViewportIfNeeded()
end

function emoteThumbnailView.didUpdate(p5, _) --[[ line: 176 ]]
	p5:updateCameraAndCharacterPose()
end

return emoteThumbnailView