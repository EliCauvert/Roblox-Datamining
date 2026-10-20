local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(MomentsCommon.Media.MediaTypes)
local _ = require(MomentsCommon.Media.mediaNodeRegistry)
local GetFitSizeModule = require(MomentsCommon.Utils.getFitSize)
local FFlagMomentsPreloadVideoPlayerInstanceModule = require(MomentsCommon.Flags.FFlagMomentsPreloadVideoPlayerInstance)
local FFlagMomentsVideoPermissionContextFixModule = require(MomentsCommon.Flags.FFlagMomentsVideoPermissionContextFix)
local FFlagMomentsVideoLoadAsyncLoadingFixModule = require(MomentsCommon.Flags.FFlagMomentsVideoLoadAsyncLoadingFix)
local FFlagMomentsOptimisticProfilePending = require(Parent.SharedFlags).FFlagMomentsOptimisticProfilePending
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local Signal = CreateSignalFunction(Enum.ScaleType.Crop)

local function VideoSurface(p1)
	-- upvalues: UseSignalStateFunction (copy), ReactModule (copy), CreateComputedFunction (copy), Signal (copy), GetFitSizeModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(p1.getItemSize)
	local GetResolutionFunction = p1.getResolution
	local UseSignalStateResult1 = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: CreateComputedFunction (upval), GetResolutionFunction (copy)
		return CreateComputedFunction(function(p2)
			-- upvalues: GetResolutionFunction (upval)
			return GetResolutionFunction(p2)
		end)
	end, { GetResolutionFunction })))
	local _UDim2 = UDim2.fromScale(1, 1)
	local Stretch = Enum.ScaleType.Stretch
	
	if UseSignalStateFunction(p1.getScaleType or Signal) == Enum.ScaleType.Fit then
		if UseSignalStateResult1 ~= nil and UseSignalStateResult1.X > 0 and UseSignalStateResult1.Y > 0 then
			_UDim2 = GetFitSizeModule(UseSignalStateResult, UseSignalStateResult1)
		end
	else
		Stretch = Enum.ScaleType.Crop
	end
	return ReactModule.createElement("VideoDisplay", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = _UDim2,
		ScaleType = Stretch,
		ZIndex = p1.zIndex,
		ref = p1.setSurface
	}, {
		Corner = if p1.cornerRadius == nil then if p1.surfaceCornerRadius == nil then nil else ReactModule.createElement("UICorner", { CornerRadius = p1.surfaceCornerRadius }) else ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) })
	})
end

local function defaultObserveLoaded(Object)
	return {
		getIsLoaded = function()
			-- upvalues: Object (copy)
			return Object.IsLoaded
		end,
		connect = function(Callback)
			-- upvalues: Object (copy)
			local Connection = Object:GetPropertyChangedSignal("IsLoaded"):Connect(function()
				-- upvalues: Callback (copy), Object (upval)
				Callback(Object.IsLoaded)
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end
	}
end

return {
	kind = "video",
	create = function(p1, p2)
		-- upvalues: FFlagMomentsVideoPermissionContextFixModule (copy), CreateSignalFunction (copy), defaultObserveLoaded (copy), CreateComputedFunction (copy), FFlagMomentsPreloadVideoPlayerInstanceModule (copy), FFlagMomentsVideoLoadAsyncLoadingFixModule (copy), FFlagMomentsOptimisticProfilePending (copy), ReactModule (copy), VideoSurface (copy)
		local Id = p1.id
		local Content = p1.content
		local PreloadContent = FFlagMomentsVideoPermissionContextFixModule and p1.preloadContent or Content
		local Signal, Signal2 = CreateSignalFunction(p1.region)
		local Parent = p1.parent
		local ZIndex = p1.zIndex or 0
		local CornerRadius = p1.cornerRadius
		local RunService = p2.runService
		local ContentProvider = p2.contentProvider
		local ObserveLoaded = p2.observeLoaded or defaultObserveLoaded
		local LoadVideo = p2.loadVideo or function(p3)
			return p3:LoadAsync()
		end
		
		local function _()
			-- upvalues: Signal (copy)
			local SignalResult = Signal(false)
			
			return if SignalResult == nil then 0 else SignalResult.startTime
		end
		
		local Signal1, Signal2_1 = CreateSignalFunction(false)
		local Signal3, Signal2_2 = CreateSignalFunction(false)
		local Signal4, Signal2_3 = CreateSignalFunction(false)
		local Signal5, Signal2_4 = CreateSignalFunction(false)
		local Signal6, Signal2_5 = CreateSignalFunction(nil)
		local Signal7, Signal2_6 = CreateSignalFunction(nil)
		local Signal8, Signal2_7 = CreateSignalFunction(0)
		local Signal9, Signal2_8 = CreateSignalFunction(0)
		local Computed = CreateComputedFunction(function(p3): string
			-- upvalues: Signal4 (copy), Signal3 (copy), Signal1 (copy)
			return if Signal4(p3) then "Playing" elseif Signal3(p3) then "Decoded" elseif Signal1(p3) then "Downloaded" else "Idle"
		end)
		local Computed1 = CreateComputedFunction(function(p3)
			-- upvalues: Signal (copy), Signal8 (copy)
			local SignalResult = Signal(p3)
			
			return if SignalResult == nil then Signal8(p3) else SignalResult.endTime - SignalResult.startTime
		end)
		local Object = nil
		local Object1 = nil
		local Surface = nil
		local List = {}
		local v1 = nil
		local ConnectResult = nil
		local RenderSteppedConnection = nil
		local v2 = false
		local Flag = false
		local Flag1 = false
		local Flag2 = false
		local Flag3 = false
		local Flag4 = false
		local Flag5 = false
		local v3 = nil
		local Flag6 = false
		local Flag7 = false
		local Count = 0
		local Flag8 = false
		
		local _ = function()
			-- upvalues: Signal (copy), Signal8 (copy)
			local SignalResult = Signal(false)
			
			return if SignalResult == nil then Signal8(false) else SignalResult.endTime
		end
		
		local _ = function()
			-- upvalues: Object (ref), Signal (copy), Signal8 (copy), v2 (ref)
			local Object1 = Object
			
			if Object1 then
				local SignalResult = Signal(false)
				local SignalResult1: number = Signal8(false)
				local NoSignalResult: boolean = SignalResult == nil or SignalResult1 > 0 and SignalResult.startTime <= 0.05 and SignalResult1 - 0.05 <= SignalResult.endTime
				v2 = NoSignalResult
				Object1.Looping = NoSignalResult
				
				return
			end
		end
		
		local _ = function()
			-- upvalues: Object (ref), Surface (ref), Flag (ref), Object1 (ref)
			local Parent = Object
			local TargetInstance = Surface
			
			if Flag and Parent and TargetInstance and not Object1 then
				local Wire = Instance.new("Wire")
				Wire.SourceInstance = Parent
				Wire.TargetInstance = TargetInstance
				Wire.Parent = Parent
				Object1 = Wire
				
				return
			end
		end
		
		local _ = function()
			-- upvalues: Object1 (ref)
			if Object1 then
				Object1:Destroy()
				Object1 = nil
			end
		end
		
		local function onStep()
			-- upvalues: Object (ref), Signal (copy), v2 (ref), Signal8 (copy), Signal2_8 (copy)
			local Object1 = Object
			
			if not Object1 then return end
			local SignalResult = Signal(false)
			local StartTime = if SignalResult == nil then 0 else SignalResult.startTime
			local TimePosition = Object1.TimePosition
			
			if not v2 then
				local SignalResult1 = Signal(false)
				
				if (if SignalResult1 == nil then Signal8(false) else SignalResult1.endTime) - 0.05 <= TimePosition then
					TimePosition = StartTime
					Object1.TimePosition = StartTime
				end
			end
			Signal2_8(TimePosition - StartTime)
		end
		
		local _ = function()
			-- upvalues: RenderSteppedConnection (ref), RunService (copy), onStep (copy)
			if not RenderSteppedConnection then
				RenderSteppedConnection = RunService.RenderStepped:Connect(onStep)
				
				return
			end
		end
		
		local _ = function()
			-- upvalues: RenderSteppedConnection (ref)
			if RenderSteppedConnection then
				RenderSteppedConnection:Disconnect()
				RenderSteppedConnection = nil
			end
		end
		
		local function startPlayerPlaybackIfReady()
			-- upvalues: Object (ref), Flag5 (ref), Signal4 (copy), Flag (ref), FFlagMomentsPreloadVideoPlayerInstanceModule (upval), Flag4 (ref), Signal5 (copy), Signal2_3 (copy), RenderSteppedConnection (ref), RunService (copy), onStep (copy)
			local Object1 = Object
			
			if not Flag5 or Signal4(false) or not Flag or Object1 == nil or FFlagMomentsPreloadVideoPlayerInstanceModule and not Flag4 and not Signal5(false) then return end
			Object1:Play()
			Signal2_3(true)
			
			if not RenderSteppedConnection then
				RenderSteppedConnection = RunService.RenderStepped:Connect(onStep)
				
				return
			end
		end
		
		local _ = function()
			-- upvalues: Content (copy), FFlagMomentsPreloadVideoPlayerInstanceModule (upval), Signal (copy), Parent (copy), Object (ref)
			local VideoPlayer = Instance.new("VideoPlayer")
			VideoPlayer.Name = "VideoPlayer"
			VideoPlayer.Looping = false
			VideoPlayer.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
			VideoPlayer.VideoContent = Content
			
			if FFlagMomentsPreloadVideoPlayerInstanceModule then
				local SignalResult = Signal(false)
				VideoPlayer.TimePosition = if SignalResult == nil then 0 else SignalResult.startTime
			end
			VideoPlayer.Parent = Parent
			Object = VideoPlayer
			
			return VideoPlayer
		end
		
		local function runLoad(p3, p4, p5)
			-- upvalues: Flag8 (ref), Object (ref), Flag (ref), LoadVideo (copy), Signal2_5 (copy), Flag4 (ref), Signal2_4 (copy), startPlayerPlaybackIfReady (copy), FFlagMomentsVideoLoadAsyncLoadingFixModule (upval), Flag1 (ref), Flag2 (ref), Flag7 (ref), runLoad (copy)
			if Flag8 or Object ~= p3 or not Flag then return end
			local Success, Result = pcall(LoadVideo, p3)
			
			if Flag8 or Object ~= p3 or not Flag then return end
			if not Success then
				Signal2_5(`video load errored: {tostring(Result)}`)
				
				return
			end
			if Result == Enum.AssetFetchStatus.Success then
				Flag4 = true
				Signal2_4(p4.getIsLoaded())
				Signal2_5(nil)
				startPlayerPlaybackIfReady()
				
				return
			end
			if not FFlagMomentsVideoLoadAsyncLoadingFixModule or Result ~= Enum.AssetFetchStatus.Loading or p5 then
				Signal2_5(`video load failed: {Result.Name}`)
				
				return
			end
			Signal2_4(p4.getIsLoaded())
			
			if Flag1 and not Flag2 then
				Flag7 = true
				
				return
			else
				runLoad(p3, p4, true)
			end
		end
		
		local function startLoadIfReady()
			-- upvalues: Object (ref), v1 (ref), Flag8 (ref), Flag (ref), Flag3 (ref), FFlagMomentsPreloadVideoPlayerInstanceModule (upval), Flag1 (ref), Flag2 (ref), Flag6 (ref), v3 (ref), startLoadIfReady (copy), Flag4 (ref), runLoad (copy)
			local Object1 = Object
			local v4 = v1
			
			if Flag8 or not Flag or Flag3 or Object1 == nil or v4 == nil then return end
			if not FFlagMomentsPreloadVideoPlayerInstanceModule or not Flag1 or Flag2 or Flag6 then
				v3 = nil
				Flag3 = true
				Flag4 = false
				task.spawn(runLoad, Object1, v4, false)
				
				return
			elseif v3 == nil then
				v3 = v4
				task.delay(2, function()
					-- upvalues: v3 (upval), v4 (copy), Flag8 (upval), Flag (upval), Object (upval), Object1 (copy), v1 (upval), Flag6 (upval), startLoadIfReady (upval)
					if v3 ~= v4 then return end
					v3 = nil
					
					if not Flag8 and Flag and Object == Object1 and v1 == v4 then
						Flag6 = true
						startLoadIfReady()
						
						return
					end
				end)
			end
		end
		
		return {
			kind = "video",
			usesDecoder = true,
			id = Id,
			zIndex = ZIndex,
			audioStem = { defaultVolume = 1, stemId = Id },
			assets = function()
				-- upvalues: PreloadContent (ref)
				return { PreloadContent }
			end,
			download = function()
				-- upvalues: Count (ref), FFlagMomentsPreloadVideoPlayerInstanceModule (upval), Object (ref), Content (copy), Signal (copy), Parent (copy), Flag1 (ref), ContentProvider (copy), Flag8 (ref), Flag2 (ref), FFlagMomentsVideoLoadAsyncLoadingFixModule (upval), Flag7 (ref), v1 (ref), Flag (ref), runLoad (copy), FFlagMomentsOptimisticProfilePending (upval), PreloadContent (ref), Signal2_1 (copy), startLoadIfReady (copy)
				local Count1 = Count
				
				if FFlagMomentsPreloadVideoPlayerInstanceModule then
					local VideoPlayer = Object
					
					if not VideoPlayer then
						local VideoPlayer1 = Instance.new("VideoPlayer")
						VideoPlayer1.Name = "VideoPlayer"
						VideoPlayer1.Looping = false
						VideoPlayer1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
						VideoPlayer1.VideoContent = Content
						
						if FFlagMomentsPreloadVideoPlayerInstanceModule then
							local SignalResult = Signal(false)
							VideoPlayer1.TimePosition = if SignalResult == nil then 0 else SignalResult.startTime
						end
						VideoPlayer1.Parent = Parent
						Object = VideoPlayer1
						VideoPlayer = VideoPlayer1
					end
					Flag1 = true
					pcall(function()
						-- upvalues: ContentProvider (upval), VideoPlayer (copy)
						ContentProvider:PreloadAsync({ VideoPlayer })
					end)
					
					if Flag8 or Count1 ~= Count or Object ~= VideoPlayer then return end
					Flag2 = true
					
					if FFlagMomentsVideoLoadAsyncLoadingFixModule and Flag7 then
						Flag7 = false
						local v4 = v1
						
						if Flag and v4 ~= nil and not v4.getIsLoaded() then
							task.spawn(runLoad, VideoPlayer, v4, true)
						end
					end
				elseif not FFlagMomentsOptimisticProfilePending or PreloadContent.Uri ~= nil then
					ContentProvider:PreloadAsync({ PreloadContent.Uri })
				end
				if not Flag8 and Count1 == Count then
					Signal2_1(true)
					startLoadIfReady()
					
					return
				end
			end,
			decode = function()
				-- upvalues: Flag8 (ref), Flag (ref), Signal2_5 (copy), Object (ref), Content (copy), FFlagMomentsPreloadVideoPlayerInstanceModule (upval), Signal (copy), Parent (copy), ObserveLoaded (copy), v1 (ref), Signal2_4 (copy), ConnectResult (ref), startPlayerPlaybackIfReady (copy), Signal2_6 (copy), List (copy), Signal2_7 (copy), Signal8 (copy), v2 (ref), Surface (ref), Object1 (ref), startLoadIfReady (copy), Signal2_2 (copy)
				if Flag8 or Flag then return end
				Signal2_5(nil)
				local VideoPlayer = Object
				
				if not VideoPlayer then
					local VideoPlayer1 = Instance.new("VideoPlayer")
					VideoPlayer1.Name = "VideoPlayer"
					VideoPlayer1.Looping = false
					VideoPlayer1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
					VideoPlayer1.VideoContent = Content
					
					if FFlagMomentsPreloadVideoPlayerInstanceModule then
						local SignalResult = Signal(false)
						VideoPlayer1.TimePosition = if SignalResult == nil then 0 else SignalResult.startTime
					end
					VideoPlayer1.Parent = Parent
					Object = VideoPlayer1
					VideoPlayer = VideoPlayer1
				end
				local ObserveLoadedResult = ObserveLoaded(VideoPlayer)
				v1 = ObserveLoadedResult
				Signal2_4(ObserveLoadedResult.getIsLoaded())
				ConnectResult = ObserveLoadedResult.connect(function(p3)
					-- upvalues: Signal2_4 (upval), startPlayerPlaybackIfReady (upval)
					Signal2_4(p3)
					
					if p3 then
						startPlayerPlaybackIfReady()
					end
				end)
				
				local function readResolution()
					-- upvalues: VideoPlayer (copy), Signal2_6 (upval)
					local Resolution = VideoPlayer.Resolution
					Signal2_6(if Resolution.X > 0 and Resolution.Y > 0 then Resolution else nil)
				end
				
				local Resolution = VideoPlayer.Resolution
				Signal2_6(if Resolution.X > 0 and Resolution.Y > 0 then Resolution else nil)
				table.insert(List, VideoPlayer:GetPropertyChangedSignal("Resolution"):Connect(readResolution))
				Signal2_7(VideoPlayer.TimeLength)
				table.insert(List, VideoPlayer:GetPropertyChangedSignal("TimeLength"):Connect(function()
					-- upvalues: Signal2_7 (upval), VideoPlayer (copy), Object (upval), Signal (upval), Signal8 (upval), v2 (upval)
					Signal2_7(VideoPlayer.TimeLength)
					local Object1 = Object
					
					if Object1 then
						local SignalResult = Signal(false)
						local SignalResult1: number = Signal8(false)
						local NoSignalResult: boolean = SignalResult == nil or SignalResult1 > 0 and SignalResult.startTime <= 0.05 and SignalResult1 - 0.05 <= SignalResult.endTime
						v2 = NoSignalResult
						Object1.Looping = NoSignalResult
						
						return
					end
				end))
				Flag = true
				local Object2 = Object
				
				if Object2 then
					local SignalResult = Signal(false)
					local SignalResult1: number = Signal8(false)
					local NoSignalResult: boolean = SignalResult == nil or SignalResult1 > 0 and SignalResult.startTime <= 0.05 and SignalResult1 - 0.05 <= SignalResult.endTime
					v2 = NoSignalResult
					Object2.Looping = NoSignalResult
				end
				local Parent1 = Object
				local TargetInstance = Surface
				
				if Flag and Parent1 and TargetInstance and not Object1 then
					local Wire = Instance.new("Wire")
					Wire.SourceInstance = Parent1
					Wire.TargetInstance = TargetInstance
					Wire.Parent = Parent1
					Object1 = Wire
				end
				startLoadIfReady()
				Signal2_2(true)
			end,
			releaseDecoder = function()
				-- upvalues: Object (ref), Flag (ref), v3 (ref), Flag7 (ref), Flag5 (ref), RenderSteppedConnection (ref), Signal2_3 (copy), Object1 (ref), ConnectResult (ref), v1 (ref), List (copy), FFlagMomentsPreloadVideoPlayerInstanceModule (upval), Flag1 (ref), Flag2 (ref), Flag3 (ref), Flag4 (ref), Signal2_2 (copy), Signal2_4 (copy), Signal2_5 (copy), Signal2_8 (copy)
				local Object2 = Object
				
				if not Object2 or not Flag then return end
				Flag = false
				v3 = nil
				Flag7 = false
				Flag5 = false
				
				if RenderSteppedConnection then
					RenderSteppedConnection:Disconnect()
					RenderSteppedConnection = nil
				end
				Signal2_3(false)
				
				if Object1 then
					Object1:Destroy()
					Object1 = nil
				end
				if ConnectResult then
					ConnectResult()
					ConnectResult = nil
				end
				v1 = nil
				
				for _, Connection in List do
					Connection:Disconnect()
				end
				table.clear(List)
				
				if not FFlagMomentsPreloadVideoPlayerInstanceModule or (not Flag1 or (Flag2 or Flag3)) then
					Object = nil
					Object2:Destroy()
				end
				Flag3 = false
				Flag4 = false
				Signal2_2(false)
				Signal2_4(false)
				Signal2_5(nil)
				Signal2_8(0)
			end,
			getResourceLevel = Computed,
			getAudioSource = function()
				-- upvalues: Object (ref), Flag (ref)
				local Object1 = Object
				assert(Object1 and Flag, "createVideoNode: getAudioSource() requires decode() first")
				
				return Object1
			end,
			render = function(p3)
				-- upvalues: ReactModule (upval), VideoSurface (upval), ZIndex (copy), CornerRadius (copy)
				return ReactModule.createElement(VideoSurface, {
					getItemSize = p3.getItemSize,
					getResolution = p3.getResolution,
					getScaleType = p3.getScaleType,
					setSurface = p3.setSurface,
					zIndex = ZIndex,
					cornerRadius = CornerRadius,
					surfaceCornerRadius = p3.cornerRadius
				})
			end,
			play = function()
				-- upvalues: Object (ref), Flag (ref), Signal (copy), Signal2_8 (copy), FFlagMomentsPreloadVideoPlayerInstanceModule (upval), Flag5 (ref), startPlayerPlaybackIfReady (copy), Signal2_3 (copy), RenderSteppedConnection (ref), RunService (copy), onStep (copy)
				local Object1 = Object
				
				if not Object1 or not Flag then return end
				local SignalResult = Signal(false)
				Object1.TimePosition = if SignalResult == nil then 0 else SignalResult.startTime
				Signal2_8(0)
				
				if FFlagMomentsPreloadVideoPlayerInstanceModule then
					Flag5 = true
					startPlayerPlaybackIfReady()
					
					return
				end
				Object1:Play()
				Signal2_3(true)
				
				if not RenderSteppedConnection then
					RenderSteppedConnection = RunService.RenderStepped:Connect(onStep)
					
					return
				end
			end,
			pause = function()
				-- upvalues: Object (ref), FFlagMomentsPreloadVideoPlayerInstanceModule (upval), Flag5 (ref), Flag (ref), Signal4 (copy), Signal2_3 (copy), RenderSteppedConnection (ref)
				local Object1 = Object
				
				if FFlagMomentsPreloadVideoPlayerInstanceModule then
					Flag5 = false
				end
				if not Object1 or not Flag then return end
				if FFlagMomentsPreloadVideoPlayerInstanceModule then
					if Signal4(false) then
						Object1:Pause()
					end
				else
					Object1:Pause()
				end
				Signal2_3(false)
				
				if RenderSteppedConnection then
					RenderSteppedConnection:Disconnect()
					RenderSteppedConnection = nil
				end
			end,
			seek = function(p3: number)
				-- upvalues: Object (ref), Signal (copy), Signal8 (copy), Signal2_8 (copy)
				local Object1 = Object
				
				if Object1 then
					local SignalResult = Signal(false)
					local StartTime = if SignalResult == nil then 0 else SignalResult.startTime
					local Value = StartTime + p3
					local SignalResult1 = Signal(false)
					local ClampedValue = math.clamp(Value, StartTime, if SignalResult1 == nil then Signal8(false) else SignalResult1.endTime)
					Object1.TimePosition = ClampedValue
					Signal2_8(ClampedValue - StartTime)
					
					return
				end
			end,
			setRegion = function(p3)
				-- upvalues: Signal2 (copy), Object (ref), Signal (copy), Signal8 (copy), v2 (ref), Signal2_8 (copy)
				Signal2(p3)
				local Object1 = Object
				
				if Object1 then
					local SignalResult = Signal(false)
					local SignalResult1: number = Signal8(false)
					local NoSignalResult: boolean = SignalResult == nil or SignalResult1 > 0 and SignalResult.startTime <= 0.05 and SignalResult1 - 0.05 <= SignalResult.endTime
					v2 = NoSignalResult
					Object1.Looping = NoSignalResult
				end
				local Object2 = Object
				
				if Object2 ~= nil then
					local SignalResult = Signal(false)
					local StartTime = if SignalResult == nil then 0 else SignalResult.startTime
					local TimePosition: number = Object2.TimePosition
					local SignalResult2 = Signal(false)
					local ClampedValue = math.clamp(TimePosition, StartTime, if SignalResult2 == nil then Signal8(false) else SignalResult2.endTime)
					Object2.TimePosition = ClampedValue
					Signal2_8(ClampedValue - StartTime)
				end
			end,
			dispose = function()
				-- upvalues: Flag8 (ref), Count (ref), Flag (ref), v3 (ref), Flag7 (ref), Flag3 (ref), Flag4 (ref), Flag5 (ref), RenderSteppedConnection (ref), Object1 (ref), ConnectResult (ref), v1 (ref), List (copy), Object (ref), Surface (ref)
				if Flag8 then return end
				Flag8 = true
				Count += 1
				Flag = false
				v3 = nil
				Flag7 = false
				Flag3 = false
				Flag4 = false
				Flag5 = false
				
				if RenderSteppedConnection then
					RenderSteppedConnection:Disconnect()
					RenderSteppedConnection = nil
				end
				if Object1 then
					Object1:Destroy()
					Object1 = nil
				end
				if ConnectResult then
					ConnectResult()
					ConnectResult = nil
				end
				v1 = nil
				
				for _, Connection in List do
					Connection:Disconnect()
				end
				table.clear(List)
				
				if Object then
					Object:Destroy()
					Object = nil
				end
				Surface = nil
			end,
			getIsLoaded = Signal5,
			getFailureReason = Signal6,
			getResolution = Signal7,
			getTimeLength = Signal8,
			getDuration = Computed1,
			getPosition = Signal9,
			isPlaybackReady = function()
				-- upvalues: FFlagMomentsPreloadVideoPlayerInstanceModule (upval), Signal5 (copy)
				return not FFlagMomentsPreloadVideoPlayerInstanceModule or Signal5(false)
			end,
			setSurface = function(Value)
				-- upvalues: Surface (ref), Object1 (ref), Object (ref), Flag (ref)
				if Value == Surface then return end
				if Object1 then
					Object1:Destroy()
					Object1 = nil
				end
				Surface = Value
				local Parent = Object
				local TargetInstance = Surface
				
				if Flag and Parent and TargetInstance then
					if Object1 then return end
					local Wire = Instance.new("Wire")
					Wire.SourceInstance = Parent
					Wire.TargetInstance = TargetInstance
					Wire.Parent = Parent
					Object1 = Wire
				end
			end
		}
	end
}