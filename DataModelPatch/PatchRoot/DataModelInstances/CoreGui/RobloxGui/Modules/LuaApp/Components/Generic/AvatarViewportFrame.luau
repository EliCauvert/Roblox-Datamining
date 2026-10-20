local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local GetCameraSettingsToFitModelModule = require(Modules.LuaApp.getCameraSettingsToFitModel)
local ViewportFrameModule = require(Modules.LuaApp.Components.Generic.ViewportFrame)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppContentProvider = require(CorePackages.Workspace.Packages.RoactServiceTags).AppContentProvider
local Total: vector = vector.create(0, -300, 0)

local function _()
	-- upvalues: Total (ref)
	local Total1 = Total
	Total += vector.create(30, 0, 0)
	
	return Total1
end

local _ = function(Text): string
	return "http://www.roblox.com/asset/?id=" .. Text
end

local InterfaceResult = TModule.interface({
	modelRef = TModule.optional(TModule.strictInterface({ value = TModule.instanceIsA("Model") })),
	animationIds = TModule.optional(TModule.array(TModule.string)),
	pauseAnimations = TModule.optional(TModule.boolean),
	cameraCFrameOffset = TModule.optional(TModule.CFrame),
	topOffsetScale = TModule.optional(TModule.number),
	bottomOffsetScale = TModule.optional(TModule.number),
	cameraUpdatedCallback = TModule.optional(TModule.callback),
	Size = TModule.optional(TModule.UDim2),
	Position = TModule.optional(TModule.UDim2),
	contentProvider = TModule.any
})
local AvatarViewportFrame = RoactModule.PureComponent:extend("AvatarViewportFrame")
AvatarViewportFrame.defaultProps = {
	topOffsetScale = 0.01,
	bottomOffsetScale = 0.01,
	cameraCFrameOffset = CFrame.new()
}

function AvatarViewportFrame.init(p1)
	-- upvalues: Total (ref)
	p1.state = {
		cameraDistance = nil,
		cameraFocusPoint = nil,
		cameraLookVector = nil,
		cameraUpVector = nil
	}
	p1.isMounted = false
	p1.animationTracks = nil
	p1.animationSpeeds = nil
	p1.modelCFrameOrientation = CFrame.new()
	local ModelPosition = Total
	Total += vector.create(30, 0, 0)
	p1.modelPosition = ModelPosition
	p1.gameModelFolder = nil
	p1.gameModel = nil
	p1.partsToCopy = {}
	p1.renderSteppedConnection = nil
	
	function p1.collectPartsRecursive(GameModel, Part)
		-- upvalues: p1 (copy)
		if GameModel == nil or Part == nil then return end
		local Children = GameModel:GetChildren()
		local Children1 = Part:GetChildren()
		
		for i = 1, #Children do
			local Child = Children[i]
			local Child1 = Children1[i]
			
			if Child:IsA("BasePart") and Child1:IsA("BasePart") then
				table.insert(p1.partsToCopy, { srcPart = Child, targetPart = Child1 })
				Child.Transparency = 1
			end
			p1.collectPartsRecursive(Child, Child1)
		end
	end
end

function AvatarViewportFrame.updateCamera(p2)
	-- upvalues: GetCameraSettingsToFitModelModule (copy)
	local ModelRef = p2.props.modelRef
	local CameraCFrameOffset = p2.props.cameraCFrameOffset
	local TopOffsetScale = p2.props.topOffsetScale
	local BottomOffsetScale = p2.props.bottomOffsetScale
	
	if ModelRef ~= nil then
		local GameModel = p2.gameModel or ModelRef.value
		spawn(function()
			-- upvalues: p2 (copy), GameModel (copy), CameraCFrameOffset (copy), GetCameraSettingsToFitModelModule (upval), BottomOffsetScale (copy), TopOffsetScale (copy)
			p2.props.contentProvider:PreloadAsync(p2.animationTracks or {})
			p2.props.contentProvider:PreloadAsync({ GameModel })
			
			if GameModel ~= (p2.gameModel or p2.props.modelRef.value) then return end
			local _, BoundingSize = GameModel:GetBoundingBox()
			local ScaledCameraCFrameOffset = CFrame.fromMatrix(Vector3.new(), -p2.modelCFrameOrientation.rightVector, p2.modelCFrameOrientation.UpVector) * CameraCFrameOffset
			local LookVector = ScaledCameraCFrameOffset.lookVector
			local UpVector = ScaledCameraCFrameOffset.upVector
			local CameraSettingsToFitModelModule = GetCameraSettingsToFitModelModule({
				cameraFieldOfView = 70,
				model = GameModel,
				upVector = UpVector,
				lookVector = LookVector,
				bottomOffset = BottomOffsetScale * BoundingSize.Y,
				topOffset = TopOffsetScale * BoundingSize.Y
			})
			
			if p2.isMounted then
				p2:setState({
					cameraDistance = CameraSettingsToFitModelModule.distance,
					cameraFocusPoint = CameraSettingsToFitModelModule.focusPoint,
					cameraLookVector = LookVector,
					cameraUpVector = UpVector
				})
			end
			if p2.props.cameraUpdatedCallback then
				p2.props.cameraUpdatedCallback()
			end
		end)
	end
end

function AvatarViewportFrame.updateAnimation(p2)
	-- upvalues: RunService (copy)
	if p2.animationTracks ~= nil then
		p2:RemoveAllAnimations()
	end
	if p2.gameModel ~= nil then
		p2.gameModel:Destroy()
		p2.gameModel = nil
	end
	local ModelRef = p2.props.modelRef
	local AnimationIds = p2.props.animationIds
	
	if ModelRef == nil or AnimationIds == nil or #AnimationIds == 0 then return end
	p2.gameModel = ModelRef.value:Clone()
	
	if p2.gameModelFolder == nil then
		p2.gameModelFolder = Instance.new("Folder")
		p2.gameModelFolder.Name = "LuaApp-AvatarViewportFrameModel-" .. tostring(p2)
		p2.gameModelFolder.Parent = game.Workspace
	end
	p2.gameModel.Parent = p2.gameModelFolder
	p2.gameModel:SetPrimaryPartCFrame(CFrame.new(p2.modelPosition))
	ModelRef.value:SetPrimaryPartCFrame(CFrame.new(p2.modelPosition))
	p2.partsToCopy = {}
	p2.collectPartsRecursive(p2.gameModel, ModelRef.value)
	local GameModel = p2.gameModel
	p2.animationTracks = {}
	
	for _, animationId in ipairs(AnimationIds) do
		local Animation = Instance.new("Animation")
		Animation.AnimationId = "http://www.roblox.com/asset/?id=" .. animationId
		Animation.Parent = GameModel
		local AnimationTrack = GameModel.Humanoid:LoadAnimation(Animation)
		AnimationTrack:Play()
		table.insert(p2.animationTracks, AnimationTrack)
	end
	if p2.renderSteppedConnection == nil then
		p2.renderSteppedConnection = RunService.renderStepped:Connect(function()
			-- upvalues: p2 (copy)
			if p2.gameModel == nil or p2.props.modelRef == nil or p2.props.pauseAnimations == true then return end
			for _, value in ipairs(p2.partsToCopy) do
				value.targetPart.CFrame = value.srcPart.CFrame
			end
		end)
	end
end

function AvatarViewportFrame.PauseAnimations(p3)
	if p3.animationTracks ~= nil then
		p3.animationSpeeds = {}
		
		for i, animationTrack in ipairs(p3.animationTracks) do
			p3.animationSpeeds[i] = animationTrack.Speed
			animationTrack:AdjustSpeed(0)
		end
	end
end

function AvatarViewportFrame.UnPauseAnimations(p4)
	if p4.animationTracks ~= nil and p4.animationSpeeds ~= nil then
		for i, animationTrack in ipairs(p4.animationTracks) do
			animationTrack:AdjustSpeed(p4.animationSpeeds[i])
		end
		p4.animationSpeeds = nil
	end
end

function AvatarViewportFrame.RemoveAllAnimations(p5)
	if p5.animationTracks ~= nil then
		for _, animationTrack in ipairs(p5.animationTracks) do
			animationTrack:Stop()
		end
		p5.animationTracks = nil
		p5.animationSpeeds = nil
	end
end

function AvatarViewportFrame.updateModelPosition(p6)
	local ModelRef = p6.props.modelRef
	
	if ModelRef then
		ModelRef.value:SetPrimaryPartCFrame(p6.modelCFrameOrientation + p6.modelPosition)
	end
end

function AvatarViewportFrame.didMount(p6)
	p6.isMounted = true
	p6:updateModelPosition()
	p6:updateAnimation()
	p6:updateCamera()
end

function AvatarViewportFrame.didUpdate(p6, p7)
	if p7.modelRef ~= p6.props.modelRef or p7.animationIds ~= p6.props.animationIds then
		p6:updateModelPosition()
		p6:updateAnimation()
		p6:updateCamera()
	end
	if p7.pauseAnimations ~= p6.props.pauseAnimations then
		if p6.props.pauseAnimations == true then
			p6:PauseAnimations()
			
			return
		end
		p6:UnPauseAnimations()
	end
end

function AvatarViewportFrame.render(p6)
	-- upvalues: InterfaceResult (copy), CryoModule (copy), RoactModule (copy), ViewportFrameModule (copy)
	assert(InterfaceResult(p6.props))
	
	return RoactModule.createElement(ViewportFrameModule, {
		regularProps = CryoModule.Dictionary.join(p6.props, {
			modelRef = CryoModule.None,
			animationIds = CryoModule.None,
			pauseAnimations = CryoModule.None,
			cameraCFrameOffset = CryoModule.None,
			topOffsetScale = CryoModule.None,
			bottomOffsetScale = CryoModule.None,
			cameraUpdatedCallback = CryoModule.None,
			contentProvider = CryoModule.None
		}),
		modelRef = p6.props.modelRef,
		cameraDistance = p6.state.cameraDistance,
		cameraFocusPoint = p6.state.cameraFocusPoint,
		cameraLookVector = p6.state.cameraLookVector,
		cameraUpVector = p6.state.cameraUpVector
	})
end

function AvatarViewportFrame.willUnmount(p6)
	p6.isMounted = false
	
	if p6.gameModel ~= nil then
		p6.gameModel:Destroy()
		p6.gameModel = nil
	end
	if p6.gameModelFolder ~= nil then
		p6.gameModelFolder:Destroy()
		p6.gameModelFolder = nil
	end
	if p6.renderSteppedConnection ~= nil then
		p6.renderSteppedConnection:Disconnect()
		p6.renderSteppedConnection = nil
	end
end

return (RoactServices.connect({ contentProvider = AppContentProvider })(AvatarViewportFrame))