local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(script.Parent.AvatarMomentView)
local DecodeInlineMomentSceneModule = require(script.Parent.decodeInlineMomentScene)
local FeedContextModule = require(Moments.Components.Feed.FeedContext)
local _ = require(Moments.Components.Feed.FeedTypes)
local _ = require(Moments.Components.Feed.Items.Moment.MomentContext)
local _CFrame = CFrame.new(0, 2000, 0)

local function _(p1)
	pcall(function()
		-- upvalues: p1 (copy)
		p1.root.Parent = nil
	end)
	pcall(p1.dispose)
end

local _ = function(Camera: Camera)
	return {
		instance = Camera,
		cframe = Camera.CFrame,
		focus = Camera.Focus,
		fieldOfView = Camera.FieldOfView,
		fieldOfViewMode = Camera.FieldOfViewMode,
		cameraType = Camera.CameraType
	}
end

local _ = function(p1)
	-- upvalues: Workspace (copy)
	if p1 ~= nil and p1.instance.Parent ~= nil and Workspace.CurrentCamera == p1.instance then
		p1.instance.CFrame = p1.cframe
		p1.instance.Focus = p1.focus
		p1.instance.FieldOfView = p1.fieldOfView
		p1.instance.FieldOfViewMode = p1.fieldOfViewMode
		p1.instance.CameraType = p1.cameraType
		
		return
	end
end

return function(p1)
	-- upvalues: FeedContextModule (copy), SignalsReactModule (copy), ReactModule (copy), MomentsCommonModule (copy), SignalsModule (copy), DecodeInlineMomentSceneModule (copy), Parent (copy), Workspace (copy), _CFrame (copy), RunService (copy)
	local UseFeedResult = FeedContextModule.useFeed()
	local GetCurrentIndex = UseFeedResult.getCurrentIndex
	assert(GetCurrentIndex ~= nil, "Avatar Moments require the flag-gated feed index")
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetCurrentIndex)
	local UseRefResult = ReactModule.useRef(0)
	local Moment = p1.item.moment
	local UseMomentMediaControllerResult = MomentsCommonModule.Media.useMomentMediaController(Moment.momentId)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMomentMediaControllerResult (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: UseMomentMediaControllerResult (upval)
			return UseMomentMediaControllerResult ~= nil and UseMomentMediaControllerResult.getState(p2).isPlaying
		end)
	end, { UseMomentMediaControllerResult })))
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy)
		local Current1 = UseRefResult1.current
		
		if Current1 == nil or UseRefResult2.current == Current then return end
		UseRefResult2.current = Current
		
		if Current then
			Current1.playhead.play()
			
			return
		else
			Current1.playhead.pause()
		end
	end, {})
	local IsUseSignalStateResultMatch: boolean = UseFeedResult.isPlaybackActive and UseSignalStateResult == p1.index
	local FeedItemId = Moment.recommendationMetadata.feedItemId
	ReactModule.useEffect(function()
		-- upvalues: IsUseSignalStateResultMatch (copy), UseMomentMediaControllerResult (copy), UseRefResult (copy), p1 (copy), DecodeInlineMomentSceneModule (upval), Parent (upval), MomentsCommonModule (upval), UseFeedResult (copy), Moment (copy), FeedItemId (copy), UseRefResult1 (copy), UseRefResult2 (copy), Workspace (upval), _CFrame (upval), RunService (upval), UseResult (copy)
		if not IsUseSignalStateResultMatch or UseMomentMediaControllerResult == nil then return end
		local SetExternalBaseReadinessFunction: (any) -> () = UseMomentMediaControllerResult.setExternalBaseReadiness
		assert(SetExternalBaseReadinessFunction ~= nil, "Avatar Moments require external-base readiness")
		SetExternalBaseReadinessFunction("Loading")
		UseRefResult.current += 1
		local Current = UseRefResult.current
		local v1 = nil
		local Config = nil
		local RenderSteppedConnection = nil
		local CurrentCamera = nil
		task.spawn(function()
			-- upvalues: p1 (upval), DecodeInlineMomentSceneModule (upval), Parent (upval), Current (copy), UseRefResult (upval), MomentsCommonModule (upval), UseFeedResult (upval), Moment (upval), FeedItemId (upval), SetExternalBaseReadinessFunction (copy), v1 (ref), UseRefResult1 (upval), UseRefResult2 (upval), Workspace (upval), CurrentCamera (ref), Config (ref), _CFrame (upval), RenderSteppedConnection (ref), RunService (upval), UseResult (upval), UseMomentMediaControllerResult (upval)
			local Stage = "validate-outfit"
			local Success, Result = pcall(function()
				-- upvalues: p1 (upval), Stage (ref), DecodeInlineMomentSceneModule (upval), Parent (upval)
				local Source = p1.item.outfit.source
				
				if Source.type ~= "outfit" then
					error("Inline Avatar Moment requires an outfit annotation")
				end
				Stage = "decode-inline-scene"
				local DecodeInlineMomentSceneModuleResult = DecodeInlineMomentSceneModule(p1.item.rbxmData, Source.id)
				Stage = "create-moment-scene"
				
				return require(Parent.MomentScenes).createMomentScene(DecodeInlineMomentSceneModuleResult)
			end)
			
			if Current == UseRefResult.current then
				if not Success or Result == nil then
					MomentsCommonModule.Analytics.fireAnalyticsEvent(MomentsCommonModule.Analytics.EventNames.AvatarMomentLoadFailed, {
						stage = Stage,
						recommendationSource = UseFeedResult.recommendationSource or "unknown",
						momentId = Moment.momentId,
						feedItemId = FeedItemId or "unknown"
					})
					SetExternalBaseReadinessFunction("Failed", `Avatar scene {Stage} failed: {tostring(Result)}`)
					
					return
				end
				v1 = Result
				UseRefResult1.current = Result
				UseRefResult2.current = false
				local CurrentCamera1 = Workspace.CurrentCamera
				
				if CurrentCamera1 == nil then
					local AvatarMomentCamera = Instance.new("Camera")
					AvatarMomentCamera.Name = "AvatarMomentCamera"
					AvatarMomentCamera.Parent = Workspace
					Workspace.CurrentCamera = AvatarMomentCamera
					CurrentCamera = AvatarMomentCamera
					CurrentCamera1 = AvatarMomentCamera
				end
				local Camera = CurrentCamera1
				Config = {
					instance = Camera,
					cframe = Camera.CFrame,
					focus = Camera.Focus,
					fieldOfView = Camera.FieldOfView,
					fieldOfViewMode = Camera.FieldOfViewMode,
					cameraType = Camera.CameraType
				}
				Result.root.Parent = Workspace
				Result.root:PivotTo(_CFrame)
				
				local function updateCamera()
					-- upvalues: Workspace (upval), Camera (copy), Result (copy), _CFrame (upval)
					if Workspace.CurrentCamera == Camera then
						Camera.CameraType = Enum.CameraType.Scriptable
						Camera.FieldOfViewMode = Result.camera.FieldOfViewMode
						Camera.FieldOfView = Result.camera.FieldOfView
						Camera.CFrame = _CFrame * Result.camera.CFrame
						Camera.Focus = _CFrame * Result.camera.Focus
						
						return
					end
				end
				
				if Workspace.CurrentCamera == Camera then
					Camera.CameraType = Enum.CameraType.Scriptable
					Camera.FieldOfViewMode = Result.camera.FieldOfViewMode
					Camera.FieldOfView = Result.camera.FieldOfView
					Camera.CFrame = _CFrame * Result.camera.CFrame
					Camera.Focus = _CFrame * Result.camera.Focus
				end
				RenderSteppedConnection = RunService.RenderStepped:Connect(updateCamera)
				SetExternalBaseReadinessFunction("Ready")
				UseResult(UseMomentMediaControllerResult.getState(false).isPlaying)
				
				return
			elseif Success and Result ~= nil then
				pcall(function()
					-- upvalues: Result (copy)
					Result.root.Parent = nil
				end)
				pcall(Result.dispose)
			end
		end)
		
		return function()
			-- upvalues: UseRefResult (upval), RenderSteppedConnection (ref), v1 (ref), SetExternalBaseReadinessFunction (copy), UseRefResult1 (upval), UseRefResult2 (upval), Config (ref), Workspace (upval), CurrentCamera (ref)
			UseRefResult.current += 1
			
			if RenderSteppedConnection ~= nil then
				RenderSteppedConnection:Disconnect()
				RenderSteppedConnection = nil
			end
			local Current = v1
			v1 = nil
			
			if Current ~= nil then
				SetExternalBaseReadinessFunction("Loading")
				
				if UseRefResult1.current == Current then
					UseRefResult1.current = nil
					UseRefResult2.current = false
				end
				local Config1 = Config
				
				if Config1 ~= nil and Config1.instance.Parent ~= nil and Workspace.CurrentCamera == Config1.instance then
					Config1.instance.CFrame = Config1.cframe
					Config1.instance.Focus = Config1.focus
					Config1.instance.FieldOfView = Config1.fieldOfView
					Config1.instance.FieldOfViewMode = Config1.fieldOfViewMode
					Config1.instance.CameraType = Config1.cameraType
				end
				pcall(function()
					-- upvalues: Current (copy)
					Current.root.Parent = nil
				end)
				pcall(Current.dispose)
			end
			if CurrentCamera ~= nil then
				if Workspace.CurrentCamera == CurrentCamera then
					Workspace.CurrentCamera = nil
				end
				CurrentCamera:Destroy()
				CurrentCamera = nil
			end
		end
	end, {
		IsUseSignalStateResultMatch, UseMomentMediaControllerResult, p1.item.rbxmData,
		p1.item.outfit.source, Moment.momentId, FeedItemId,
		UseFeedResult.recommendationSource, UseResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), UseSignalStateResult1 (copy)
		UseResult(UseSignalStateResult1)
	end, { UseSignalStateResult1, UseResult })
	local RecommendationMetadata = Moment.recommendationMetadata
	
	return {
		data = ReactModule.useMemo(function()
			-- upvalues: Moment (copy), RecommendationMetadata (copy), p1 (copy)
			return {
				kind = "avatar",
				creatorIsVerified = nil,
				commentCount = nil,
				momentId = Moment.momentId,
				creatorId = Moment.creatorId,
				description = Moment.metadata.description,
				isModerated = Moment.isModerated == true,
				feedItemId = RecommendationMetadata.feedItemId,
				feedSessionId = RecommendationMetadata.tracingId,
				outfit = p1.item.outfit
			}
		end, {
			Moment,
			p1.item.outfit,
			RecommendationMetadata.feedItemId,
			RecommendationMetadata.tracingId
		}),
		moment = Moment
	}
end