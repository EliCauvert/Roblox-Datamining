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
local MomentsHostContextModule = require(Moments.MomentsHostContext)
local ObserveGuiOnScreenModule = require(script.Parent.observeGuiOnScreen)
local FFlagProfileRenderAvatarMoments = require(Parent.SharedFlags).FFlagProfileRenderAvatarMoments
local FFlagMomentsRecommendationContentTypeModule = require(Moments.Flags.FFlagMomentsRecommendationContentType)
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
	-- upvalues: FeedContextModule (copy), SignalsReactModule (copy), ReactModule (copy), MomentsCommonModule (copy), SignalsModule (copy), FFlagProfileRenderAvatarMoments (copy), MomentsHostContextModule (copy), Workspace (copy), _CFrame (copy), RunService (copy), DecodeInlineMomentSceneModule (copy), Parent (copy), ObserveGuiOnScreenModule (copy), FFlagMomentsRecommendationContentTypeModule (copy)
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
	local UseRefResult3 = if FFlagProfileRenderAvatarMoments then ReactModule.useRef(nil) else nil
	local UseMomentsHostResult = if FFlagProfileRenderAvatarMoments then MomentsHostContextModule.useMomentsHost() else nil
	local NoUseMomentsHostResult: boolean = UseMomentsHostResult == nil or UseMomentsHostResult.isTopShell ~= false
	local IsUseSignalStateResultMatch1: boolean = if FFlagProfileRenderAvatarMoments then NoUseMomentsHostResult and UseSignalStateResult == p1.index else IsUseSignalStateResultMatch
	ReactModule.useEffect(function()
		-- upvalues: IsUseSignalStateResultMatch1 (copy), UseMomentMediaControllerResult (copy), UseRefResult (copy), Workspace (upval), _CFrame (upval), RunService (upval), p1 (copy), DecodeInlineMomentSceneModule (upval), Parent (upval), MomentsCommonModule (upval), UseFeedResult (copy), Moment (copy), FeedItemId (copy), UseRefResult3 (copy), FFlagProfileRenderAvatarMoments (upval), UseRefResult1 (copy), UseRefResult2 (copy), ObserveGuiOnScreenModule (upval), UseResult (copy)
		if not IsUseSignalStateResultMatch1 or UseMomentMediaControllerResult == nil then return end
		local SetExternalBaseReadinessFunction: (any) -> () = UseMomentMediaControllerResult.setExternalBaseReadiness
		assert(SetExternalBaseReadinessFunction ~= nil, "Avatar Moments require external-base readiness")
		SetExternalBaseReadinessFunction("Loading")
		UseRefResult.current += 1
		local Current = UseRefResult.current
		local v1 = nil
		local Callback = nil
		local Config = nil
		local RenderSteppedConnection = nil
		local CurrentCamera = nil
		
		local function showScene()
			-- upvalues: v1 (ref), RenderSteppedConnection (ref), Workspace (upval), CurrentCamera (ref), Config (ref), _CFrame (upval), RunService (upval)
			local v2 = v1
			
			if v2 == nil or RenderSteppedConnection ~= nil then return end
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
			v2.root.Parent = Workspace
			v2.root:PivotTo(_CFrame)
			
			local function updateCamera()
				-- upvalues: Workspace (upval), Camera (copy), v2 (copy), _CFrame (upval)
				if Workspace.CurrentCamera == Camera then
					Camera.CameraType = Enum.CameraType.Scriptable
					Camera.FieldOfViewMode = v2.camera.FieldOfViewMode
					Camera.FieldOfView = v2.camera.FieldOfView
					Camera.CFrame = _CFrame * v2.camera.CFrame
					Camera.Focus = _CFrame * v2.camera.Focus
					
					return
				end
			end
			
			if Workspace.CurrentCamera == Camera then
				Camera.CameraType = Enum.CameraType.Scriptable
				Camera.FieldOfViewMode = v2.camera.FieldOfViewMode
				Camera.FieldOfView = v2.camera.FieldOfView
				Camera.CFrame = _CFrame * v2.camera.CFrame
				Camera.Focus = _CFrame * v2.camera.Focus
			end
			RenderSteppedConnection = RunService.RenderStepped:Connect(updateCamera)
		end
		
		local function _()
			-- upvalues: v1 (ref), RenderSteppedConnection (ref), Config (ref), Workspace (upval), CurrentCamera (ref)
			local v2 = v1
			
			if v2 == nil or RenderSteppedConnection == nil then return end
			RenderSteppedConnection:Disconnect()
			RenderSteppedConnection = nil
			v2.root.Parent = nil
			local Config1 = Config
			
			if Config1 ~= nil and Config1.instance.Parent ~= nil and Workspace.CurrentCamera == Config1.instance then
				Config1.instance.CFrame = Config1.cframe
				Config1.instance.Focus = Config1.focus
				Config1.instance.FieldOfView = Config1.fieldOfView
				Config1.instance.FieldOfViewMode = Config1.fieldOfViewMode
				Config1.instance.CameraType = Config1.cameraType
			end
			Config = nil
			
			if CurrentCamera ~= nil then
				if Workspace.CurrentCamera == CurrentCamera then
					Workspace.CurrentCamera = nil
				end
				CurrentCamera:Destroy()
				CurrentCamera = nil
			end
		end
		
		task.spawn(function()
			-- upvalues: p1 (upval), DecodeInlineMomentSceneModule (upval), Parent (upval), Current (copy), UseRefResult (upval), MomentsCommonModule (upval), UseFeedResult (upval), Moment (upval), FeedItemId (upval), SetExternalBaseReadinessFunction (copy), UseRefResult3 (upval), FFlagProfileRenderAvatarMoments (upval), v1 (ref), UseRefResult1 (upval), UseRefResult2 (upval), Callback (ref), ObserveGuiOnScreenModule (upval), showScene (copy), RenderSteppedConnection (ref), Config (ref), Workspace (upval), CurrentCamera (ref), UseResult (upval), UseMomentMediaControllerResult (upval)
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
				
				return require(Parent.MomentScenes).createMomentScene({
					type = DecodeInlineMomentSceneModuleResult.type,
					args = DecodeInlineMomentSceneModuleResult.args
				})
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
				local Current1 = if UseRefResult3 == nil then nil else UseRefResult3.current
				
				if FFlagProfileRenderAvatarMoments and Current1 == nil then
					MomentsCommonModule.Analytics.fireAnalyticsEvent(MomentsCommonModule.Analytics.EventNames.AvatarMomentLoadFailed, {
						stage = "attach-page",
						recommendationSource = UseFeedResult.recommendationSource or "unknown",
						momentId = Moment.momentId,
						feedItemId = FeedItemId or "unknown"
					})
					SetExternalBaseReadinessFunction("Failed", "Avatar scene attach-page failed: page ref was not attached")
					pcall(function()
						-- upvalues: Result (copy)
						Result.root.Parent = nil
					end)
					pcall(Result.dispose)
					
					return
				end
				v1 = Result
				UseRefResult1.current = Result
				UseRefResult2.current = false
				
				if FFlagProfileRenderAvatarMoments then
					Callback = ObserveGuiOnScreenModule(Current1, function(p2)
						-- upvalues: showScene (upval), v1 (upval), RenderSteppedConnection (upval), Config (upval), Workspace (upval), CurrentCamera (upval)
						if p2 then
							showScene()
							
							return
						end
						local v2 = v1
						
						if v2 ~= nil then
							if RenderSteppedConnection == nil then return end
							RenderSteppedConnection:Disconnect()
							RenderSteppedConnection = nil
							v2.root.Parent = nil
							local Config1 = Config
							
							if Config1 ~= nil and Config1.instance.Parent ~= nil and Workspace.CurrentCamera == Config1.instance then
								Config1.instance.CFrame = Config1.cframe
								Config1.instance.Focus = Config1.focus
								Config1.instance.FieldOfView = Config1.fieldOfView
								Config1.instance.FieldOfViewMode = Config1.fieldOfViewMode
								Config1.instance.CameraType = Config1.cameraType
							end
							Config = nil
							
							if CurrentCamera ~= nil then
								if Workspace.CurrentCamera == CurrentCamera then
									Workspace.CurrentCamera = nil
								end
								CurrentCamera:Destroy()
								CurrentCamera = nil
							end
						end
					end)
				else
					showScene()
				end
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
			-- upvalues: UseRefResult (upval), Callback (ref), v1 (ref), RenderSteppedConnection (ref), Config (ref), Workspace (upval), CurrentCamera (ref), SetExternalBaseReadinessFunction (copy), UseRefResult1 (upval), UseRefResult2 (upval)
			UseRefResult.current += 1
			
			if Callback ~= nil then
				Callback()
				Callback = nil
			end
			local v2 = v1
			
			if v2 ~= nil and RenderSteppedConnection ~= nil then
				RenderSteppedConnection:Disconnect()
				RenderSteppedConnection = nil
				v2.root.Parent = nil
				local Config1 = Config
				
				if Config1 ~= nil and Config1.instance.Parent ~= nil and Workspace.CurrentCamera == Config1.instance then
					Config1.instance.CFrame = Config1.cframe
					Config1.instance.Focus = Config1.focus
					Config1.instance.FieldOfView = Config1.fieldOfView
					Config1.instance.FieldOfViewMode = Config1.fieldOfViewMode
					Config1.instance.CameraType = Config1.cameraType
				end
				Config = nil
				
				if CurrentCamera ~= nil then
					if Workspace.CurrentCamera == CurrentCamera then
						Workspace.CurrentCamera = nil
					end
					CurrentCamera:Destroy()
					CurrentCamera = nil
				end
			end
			local Current = v1
			v1 = nil
			
			if Current ~= nil then
				SetExternalBaseReadinessFunction("Loading")
				
				if UseRefResult1.current == Current then
					UseRefResult1.current = nil
					UseRefResult2.current = false
				end
				pcall(function()
					-- upvalues: Current (copy)
					Current.root.Parent = nil
				end)
				pcall(Current.dispose)
			end
		end
	end, {
		IsUseSignalStateResultMatch1, UseMomentMediaControllerResult, p1.item.rbxmData,
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
			-- upvalues: Moment (copy), RecommendationMetadata (copy), FFlagMomentsRecommendationContentTypeModule (upval), p1 (copy)
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
				contentType = if FFlagMomentsRecommendationContentTypeModule then "Avatar" else nil,
				outfit = p1.item.outfit
			}
		end, {
			Moment,
			p1.item.outfit,
			RecommendationMetadata.feedItemId,
			RecommendationMetadata.tracingId
		}),
		moment = Moment,
		pageRef = UseRefResult3
	}
end