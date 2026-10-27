local _ = require(script.Parent.Parent.Types)
local AvatarFloorPositionModule = require(script.Parent._Utils.avatarFloorPosition)
local FrameCameraModule = require(script.Parent._Utils.frameCamera)
local CameraPathModule = require(script.Parent._Utils.cameraPath)
local AvatarBackgroundModule = require(script.Parent._Utils.avatarBackground)
local AvatarRigModule = require(script.Parent._Utils.avatarRig)
local CreatePlayheadModule = require(script.Parent._Utils.createPlayhead)
local AddKeyLightModule = require(script.addKeyLight)
local AddFallbackBackdropModule = require(script.addFallbackBackdrop)
local ResolveOutfitModule = require(script.resolveOutfit)
local EmotesModule = require(script.emotes)
local FlagsModule = require(script.Flags)

local function _(p1: number)
	-- upvalues: AvatarBackgroundModule (copy)
	return if typeof(p1) == "number" and p1 > 0 then p1 else AvatarBackgroundModule.DEFAULT_ASSET_ID
end

local function resolveEmoteId(p1, HumanoidRigType)
	-- upvalues: EmotesModule (copy)
	if EmotesModule.isName(p1.emote) then
		return EmotesModule.resolve(p1.emote, HumanoidRigType)
	end
	if p1.emote ~= nil then
		warn(`AvatarMoment: unknown emote {p1.emote}, falling through to emoteId or wave`)
	end
	if typeof(p1.emoteId) ~= "number" or p1.emoteId <= 0 then
		return EmotesModule.resolve("wave", HumanoidRigType)
	end
	if HumanoidRigType == Enum.HumanoidRigType.R6 then
		warn(`AvatarMoment: emoteId {p1.emoteId} plays as authored on an R6 rig, and an R15 clip will not move it. The emote arg resolves per rig.`)
	end
	return p1.emoteId
end

local _ = function(p1, p2: number)
	-- upvalues: AddKeyLightModule (copy), AvatarBackgroundModule (copy), AddFallbackBackdropModule (copy)
	AddKeyLightModule(p1)
	local AttachResult = AvatarBackgroundModule.attach(p1, if typeof(p2) == "number" and p2 > 0 then p2 else AvatarBackgroundModule.DEFAULT_ASSET_ID)
	
	if AttachResult == nil then
		AddFallbackBackdropModule(p1)
	end
	return AttachResult
end

local _ = function(p1: number)
	return if typeof(p1) == "number" and p1 > 0 then p1 else nil
end

local function resolveSnapshot(p1)
	-- upvalues: ResolveOutfitModule (copy)
	local OutfitId: number = p1.outfitId
	local OutfitId1 = if typeof(OutfitId) == "number" and OutfitId > 0 then OutfitId else nil
	local UserId: number = p1.userId
	local UserId1 = if typeof(UserId) == "number" and UserId > 0 then UserId else nil
	
	if OutfitId1 ~= nil and UserId1 ~= nil then
		error("AvatarMoment: supply outfitId or userId, not both")
	end
	if OutfitId1 ~= nil then
		return ResolveOutfitModule.resolve(OutfitId1)
	elseif UserId1 == nil then
		error("AvatarMoment: outfitId or userId (positive number) is required")
		
		return
	else
		return ResolveOutfitModule.resolveUser(UserId1)
	end
end

return function(p1)
	-- upvalues: FlagsModule (copy), resolveSnapshot (copy), ResolveOutfitModule (copy), AddKeyLightModule (copy), AvatarBackgroundModule (copy), AddFallbackBackdropModule (copy), AvatarRigModule (copy), AvatarFloorPositionModule (copy), CameraPathModule (copy), FrameCameraModule (copy), resolveEmoteId (copy), CreatePlayheadModule (copy)
	local P7 = p1 or {}
	local ResolveSnapshotResult = nil
	
	if FlagsModule.MomentScenesAvatarMomentUserId then
		ResolveSnapshotResult = resolveSnapshot(P7)
	else
		if typeof(P7.outfitId) ~= "number" or P7.outfitId <= 0 then
			error("AvatarMoment: outfitId (positive number) is required")
		end
		ResolveSnapshotResult = ResolveOutfitModule.resolve(P7.outfitId)
	end
	local Live3DScene = Instance.new("Model")
	Live3DScene.Name = "Live3DScene"
	local BackgroundAssetId: number = P7.backgroundAssetId
	AddKeyLightModule(Live3DScene)
	local AttachResult = AvatarBackgroundModule.attach(Live3DScene, if typeof(BackgroundAssetId) == "number" and BackgroundAssetId > 0 then BackgroundAssetId else AvatarBackgroundModule.DEFAULT_ASSET_ID)
	
	if AttachResult == nil then
		AddFallbackBackdropModule(Live3DScene)
	end
	Live3DScene.WorldPivot = CFrame.new()
	
	if AttachResult ~= nil then
		AvatarBackgroundModule.pinToParent(AttachResult, Live3DScene)
	end
	local Avatar = AvatarRigModule.createAvatar(ResolveSnapshotResult.humanoidDescription, ResolveSnapshotResult.rigType)
	Avatar.Name = "Avatar"
	local Humanoid = Avatar:FindFirstChildOfClass("Humanoid")
	
	if Humanoid ~= nil then
		Humanoid.NameOcclusion = Enum.NameOcclusion.OccludeAll
		Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		Humanoid.NameDisplayDistance = 0
	end
	AvatarFloorPositionModule.positionOnFloor(Avatar, 0, CFrame.new())
	Avatar.Parent = Live3DScene
	local SceneCamera = Instance.new("Camera")
	SceneCamera.Name = "SceneCamera"
	SceneCamera.CameraType = Enum.CameraType.Scriptable
	SceneCamera.FieldOfView = 56
	SceneCamera.Parent = Live3DScene
	local CameraPath = P7.cameraPath or "subtle"
	local ResolveResult = CameraPathModule.resolve(CameraPath)
	local _, X, v1 = (if CameraPathModule.framingFor(CameraPath) == "face" then FrameCameraModule.fitStandingFace else FrameCameraModule.fitStandingCharacters)({ Avatar }, SceneCamera.FieldOfView)
	SceneCamera.Focus = CFrame.new(X)
	local PlayEmoteResult = AvatarRigModule.playEmote(Avatar, (resolveEmoteId(P7, ResolveSnapshotResult.rigType)))
	local T = if PlayEmoteResult == nil then {} else { PlayEmoteResult }
	local PlayheadModule = CreatePlayheadModule({
		root = Live3DScene,
		tracks = T,
		animator = if Humanoid == nil then nil else Humanoid:FindFirstChildOfClass("Animator"),
		getDuration = function()
			-- upvalues: T (copy)
			local Length = 0
			
			for _, value in T do
				if Length < value.Length then
					Length = value.Length
				end
			end
			return if Length <= 0 then 0 else Length * 4
		end,
		syncVisuals = function(p2: number)
			-- upvalues: T (copy), SceneCamera (copy), CameraPathModule (upval), X (copy), v1 (copy), ResolveResult (copy)
			local Length = 0
			
			for _, value in T do
				if Length < value.Length then
					Length = value.Length
				end
			end
			local ScaledLength: number = if Length <= 0 then 0 else Length * 4
			SceneCamera.CFrame = CameraPathModule.eval(X, v1, ResolveResult, if ScaledLength > 0 then p2 % ScaledLength / ScaledLength else 0)
		end,
		play = function(Callback: () -> ())
			-- upvalues: Humanoid (copy)
			if Humanoid ~= nil then
				Humanoid.AutoRotate = false
			end
			Callback()
		end
	})
	local Length = 0
	
	for _, value in T do
		if Length < value.Length then
			Length = value.Length
		end
	end
	local CanUserToggle = (if Length <= 0 then 0 else Length * 4) > 0
	
	return {
		root = Live3DScene,
		camera = SceneCamera,
		playhead = PlayheadModule,
		capabilities = {
			canUserToggle = CanUserToggle,
			hasDuration = CanUserToggle
		},
		dispose = PlayheadModule.dispose
	}
end