local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(MomentsCommon.Media.MediaTypes)
local _ = require(MomentsCommon.Media.mediaNodeRegistry)
local GetCropSizeModule = require(MomentsCommon.Utils.getCropSize)
local GetFitSizeModule = require(MomentsCommon.Utils.getFitSize)
local GetFFlagMomentsVideoSurfaceMediaRectModule = require(MomentsCommon.Flags.GetFFlagMomentsVideoSurfaceMediaRect)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local FFlagLuaAppMomentsInternalVideoUsage = require(Parent.SharedFlags).FFlagLuaAppMomentsInternalVideoUsage
local Signal = CreateSignalFunction(Enum.ScaleType.Crop)

local function VideoSurface(p1)
	-- upvalues: UseSignalStateFunction (copy), ReactModule (copy), CreateComputedFunction (copy), Signal (copy), GetFitSizeModule (copy), GetCropSizeModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(p1.getItemSize)
	local GetResolutionFunction = p1.getResolution
	local UseSignalStateResult1 = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: CreateComputedFunction (upval), GetResolutionFunction (copy)
		return CreateComputedFunction(function(p2)
			-- upvalues: GetResolutionFunction (upval)
			return GetResolutionFunction(p2)
		end)
	end, { GetResolutionFunction })))
	local UseSignalStateResult2 = UseSignalStateFunction(p1.getScaleType or Signal)
	
	return ReactModule.createElement("VideoDisplay", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = if UseSignalStateResult1 == nil or UseSignalStateResult1.X <= 0 or UseSignalStateResult1.Y <= 0 then UDim2.fromScale(1, 1) elseif UseSignalStateResult2 == Enum.ScaleType.Fit then GetFitSizeModule(UseSignalStateResult, UseSignalStateResult1) else GetCropSizeModule(UseSignalStateResult, UseSignalStateResult1),
		ScaleType = Enum.ScaleType.Stretch,
		ZIndex = p1.zIndex,
		ref = p1.setSurface
	}, {
		Corner = if p1.cornerRadius == nil then nil else ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) })
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
		-- upvalues: CreateSignalFunction (copy), defaultObserveLoaded (copy), CreateComputedFunction (copy), FFlagLuaAppMomentsInternalVideoUsage (copy), GetFFlagMomentsVideoSurfaceMediaRectModule (copy), ReactModule (copy), VideoSurface (copy)
		local Id = p1.id
		local Content = p1.content
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
		local VideoPlayer = nil
		local Object = nil
		local Surface = nil
		local List = {}
		local ConnectResult = nil
		local RenderSteppedConnection = nil
		local v1 = false
		local Count = 0
		local Flag = false
		
		local _ = function()
			-- upvalues: Signal (copy), Signal8 (copy)
			local SignalResult = Signal(false)
			
			return if SignalResult == nil then Signal8(false) else SignalResult.endTime
		end
		
		local _ = function()
			-- upvalues: VideoPlayer (ref), Signal (copy), Signal8 (copy), v1 (ref)
			local VideoPlayer1 = VideoPlayer
			
			if VideoPlayer1 then
				local SignalResult = Signal(false)
				local SignalResult1: number = Signal8(false)
				local NoSignalResult: boolean = SignalResult == nil or SignalResult1 > 0 and SignalResult.startTime <= 0.05 and SignalResult1 - 0.05 <= SignalResult.endTime
				v1 = NoSignalResult
				VideoPlayer1.Looping = NoSignalResult
				
				return
			end
		end
		
		local _ = function()
			-- upvalues: VideoPlayer (ref), Surface (ref), Object (ref)
			local Parent = VideoPlayer
			local TargetInstance = Surface
			
			if Parent and TargetInstance and not Object then
				local Wire = Instance.new("Wire")
				Wire.SourceInstance = Parent
				Wire.TargetInstance = TargetInstance
				Wire.Parent = Parent
				Object = Wire
				
				return
			end
		end
		
		local _ = function()
			-- upvalues: Object (ref)
			if Object then
				Object:Destroy()
				Object = nil
			end
		end
		
		local function onStep()
			-- upvalues: VideoPlayer (ref), Signal (copy), v1 (ref), Signal8 (copy), Signal2_8 (copy)
			local VideoPlayer1 = VideoPlayer
			
			if not VideoPlayer1 then return end
			local SignalResult = Signal(false)
			local StartTime = if SignalResult == nil then 0 else SignalResult.startTime
			local TimePosition = VideoPlayer1.TimePosition
			
			if not v1 then
				local SignalResult1 = Signal(false)
				
				if (if SignalResult1 == nil then Signal8(false) else SignalResult1.endTime) - 0.05 <= TimePosition then
					TimePosition = StartTime
					VideoPlayer1.TimePosition = StartTime
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
		
		return {
			kind = "video",
			usesDecoder = true,
			id = Id,
			zIndex = ZIndex,
			audioStem = { defaultVolume = 1, stemId = Id },
			assets = function()
				-- upvalues: Content (copy)
				return { Content }
			end,
			download = function()
				-- upvalues: Count (ref), ContentProvider (copy), Content (copy), Flag (ref), Signal2_1 (copy)
				local Count1 = Count
				ContentProvider:PreloadAsync({ Content.Uri })
				
				if not Flag and Count1 == Count then
					Signal2_1(true)
					
					return
				end
			end,
			decode = function()
				-- upvalues: Flag (ref), VideoPlayer (ref), Signal2_5 (copy), FFlagLuaAppMomentsInternalVideoUsage (upval), Content (copy), Parent (copy), ObserveLoaded (copy), Signal2_4 (copy), ConnectResult (ref), Signal2_6 (copy), List (copy), Signal2_7 (copy), Signal (copy), Signal8 (copy), v1 (ref), Surface (ref), Object (ref), LoadVideo (copy), Signal2_2 (copy)
				if Flag or VideoPlayer then return end
				Signal2_5(nil)
				local VideoPlayer1 = Instance.new("VideoPlayer")
				VideoPlayer1.Name = "VideoPlayer"
				VideoPlayer1.Looping = false
				
				if FFlagLuaAppMomentsInternalVideoUsage then
					VideoPlayer1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
				end
				VideoPlayer1.VideoContent = Content
				VideoPlayer1.Parent = Parent
				VideoPlayer = VideoPlayer1
				local ObserveLoadedResult = ObserveLoaded(VideoPlayer1)
				Signal2_4(ObserveLoadedResult.getIsLoaded())
				ConnectResult = ObserveLoadedResult.connect(function(p3)
					-- upvalues: Signal2_4 (upval)
					Signal2_4(p3)
				end)
				
				local function readResolution()
					-- upvalues: VideoPlayer1 (copy), Signal2_6 (upval)
					local Resolution = VideoPlayer1.Resolution
					Signal2_6(if Resolution.X > 0 and Resolution.Y > 0 then Resolution else nil)
				end
				
				local Resolution = VideoPlayer1.Resolution
				Signal2_6(if Resolution.X > 0 and Resolution.Y > 0 then Resolution else nil)
				table.insert(List, VideoPlayer1:GetPropertyChangedSignal("Resolution"):Connect(readResolution))
				Signal2_7(VideoPlayer1.TimeLength)
				table.insert(List, VideoPlayer1:GetPropertyChangedSignal("TimeLength"):Connect(function()
					-- upvalues: Signal2_7 (upval), VideoPlayer1 (copy), VideoPlayer (upval), Signal (upval), Signal8 (upval), v1 (upval)
					Signal2_7(VideoPlayer1.TimeLength)
					local VideoPlayer2 = VideoPlayer
					
					if VideoPlayer2 then
						local SignalResult = Signal(false)
						local SignalResult1: number = Signal8(false)
						local NoSignalResult: boolean = SignalResult == nil or SignalResult1 > 0 and SignalResult.startTime <= 0.05 and SignalResult1 - 0.05 <= SignalResult.endTime
						v1 = NoSignalResult
						VideoPlayer2.Looping = NoSignalResult
						
						return
					end
				end))
				local VideoPlayer2 = VideoPlayer
				
				if VideoPlayer2 then
					local SignalResult = Signal(false)
					local SignalResult1: number = Signal8(false)
					local NoSignalResult: boolean = SignalResult == nil or SignalResult1 > 0 and SignalResult.startTime <= 0.05 and SignalResult1 - 0.05 <= SignalResult.endTime
					v1 = NoSignalResult
					VideoPlayer2.Looping = NoSignalResult
				end
				local Parent1 = VideoPlayer
				local TargetInstance = Surface
				
				if Parent1 and TargetInstance and not Object then
					local Wire = Instance.new("Wire")
					Wire.SourceInstance = Parent1
					Wire.TargetInstance = TargetInstance
					Wire.Parent = Parent1
					Object = Wire
				end
				task.spawn(function()
					-- upvalues: Flag (upval), VideoPlayer (upval), VideoPlayer1 (copy), LoadVideo (upval), Signal2_5 (upval), Signal2_4 (upval), ObserveLoadedResult (copy)
					if Flag or VideoPlayer ~= VideoPlayer1 then return end
					local Success, Result = pcall(LoadVideo, VideoPlayer1)
					
					if Flag or VideoPlayer ~= VideoPlayer1 then return end
					if not Success then
						Signal2_5(`video load errored: {tostring(Result)}`)
						
						return
					end
					if Result == Enum.AssetFetchStatus.Success then
						Signal2_4(ObserveLoadedResult.getIsLoaded())
						Signal2_5(nil)
						
						return
					else
						Signal2_5(`video load failed: {Result.Name}`)
					end
				end)
				Signal2_2(true)
			end,
			releaseDecoder = function()
				-- upvalues: VideoPlayer (ref), RenderSteppedConnection (ref), Signal2_3 (copy), Object (ref), ConnectResult (ref), List (copy), Signal2_2 (copy), Signal2_4 (copy), Signal2_5 (copy), Signal2_8 (copy)
				local Object1 = VideoPlayer
				
				if not Object1 then return end
				if RenderSteppedConnection then
					RenderSteppedConnection:Disconnect()
					RenderSteppedConnection = nil
				end
				Signal2_3(false)
				
				if Object then
					Object:Destroy()
					Object = nil
				end
				if ConnectResult then
					ConnectResult()
					ConnectResult = nil
				end
				for _, Connection in List do
					Connection:Disconnect()
				end
				table.clear(List)
				VideoPlayer = nil
				Object1:Destroy()
				Signal2_2(false)
				Signal2_4(false)
				Signal2_5(nil)
				Signal2_8(0)
			end,
			getResourceLevel = Computed,
			getAudioSource = function()
				-- upvalues: VideoPlayer (ref)
				local VideoPlayer1 = VideoPlayer
				assert(VideoPlayer1, "createVideoNode: getAudioSource() requires decode() first")
				
				return VideoPlayer1
			end,
			render = function(p3)
				-- upvalues: GetFFlagMomentsVideoSurfaceMediaRectModule (upval), ReactModule (upval), VideoSurface (upval), ZIndex (copy), CornerRadius (copy)
				return if GetFFlagMomentsVideoSurfaceMediaRectModule() then ReactModule.createElement(VideoSurface, {
					getItemSize = p3.getItemSize,
					getResolution = p3.getResolution,
					getScaleType = p3.getScaleType,
					setSurface = p3.setSurface,
					zIndex = ZIndex,
					cornerRadius = CornerRadius
				}) else ReactModule.createElement("VideoDisplay", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ScaleType = p3.scaleType or Enum.ScaleType.Crop,
					ZIndex = ZIndex,
					ref = function(p4)
						-- upvalues: p3 (copy)
						p3.setSurface(p4)
					end
				}, {
					Corner = if CornerRadius == nil then nil else ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, CornerRadius) })
				})
			end,
			play = function()
				-- upvalues: VideoPlayer (ref), Signal (copy), Signal2_8 (copy), Signal2_3 (copy), RenderSteppedConnection (ref), RunService (copy), onStep (copy)
				local VideoPlayer1 = VideoPlayer
				
				if not VideoPlayer1 then return end
				local SignalResult = Signal(false)
				VideoPlayer1.TimePosition = if SignalResult == nil then 0 else SignalResult.startTime
				Signal2_8(0)
				VideoPlayer1:Play()
				Signal2_3(true)
				
				if not RenderSteppedConnection then
					RenderSteppedConnection = RunService.RenderStepped:Connect(onStep)
					
					return
				end
			end,
			pause = function()
				-- upvalues: VideoPlayer (ref), Signal2_3 (copy), RenderSteppedConnection (ref)
				local VideoPlayer1 = VideoPlayer
				
				if not VideoPlayer1 then return end
				VideoPlayer1:Pause()
				Signal2_3(false)
				
				if RenderSteppedConnection then
					RenderSteppedConnection:Disconnect()
					RenderSteppedConnection = nil
				end
			end,
			seek = function(p3: number)
				-- upvalues: VideoPlayer (ref), Signal (copy), Signal8 (copy), Signal2_8 (copy)
				local VideoPlayer1 = VideoPlayer
				
				if VideoPlayer1 then
					local SignalResult = Signal(false)
					local StartTime = if SignalResult == nil then 0 else SignalResult.startTime
					local Value = StartTime + p3
					local SignalResult1 = Signal(false)
					local ClampedValue = math.clamp(Value, StartTime, if SignalResult1 == nil then Signal8(false) else SignalResult1.endTime)
					VideoPlayer1.TimePosition = ClampedValue
					Signal2_8(ClampedValue - StartTime)
					
					return
				end
			end,
			setRegion = function(p3)
				-- upvalues: Signal2 (copy), VideoPlayer (ref), Signal (copy), Signal8 (copy), v1 (ref), Signal2_8 (copy)
				Signal2(p3)
				local VideoPlayer1 = VideoPlayer
				
				if VideoPlayer1 then
					local SignalResult = Signal(false)
					local SignalResult1: number = Signal8(false)
					local NoSignalResult: boolean = SignalResult == nil or SignalResult1 > 0 and SignalResult.startTime <= 0.05 and SignalResult1 - 0.05 <= SignalResult.endTime
					v1 = NoSignalResult
					VideoPlayer1.Looping = NoSignalResult
				end
				local VideoPlayer2 = VideoPlayer
				
				if VideoPlayer2 ~= nil then
					local SignalResult = Signal(false)
					local StartTime = if SignalResult == nil then 0 else SignalResult.startTime
					local TimePosition: number = VideoPlayer2.TimePosition
					local SignalResult2 = Signal(false)
					local ClampedValue = math.clamp(TimePosition, StartTime, if SignalResult2 == nil then Signal8(false) else SignalResult2.endTime)
					VideoPlayer2.TimePosition = ClampedValue
					Signal2_8(ClampedValue - StartTime)
				end
			end,
			dispose = function()
				-- upvalues: Flag (ref), Count (ref), RenderSteppedConnection (ref), Object (ref), ConnectResult (ref), List (copy), VideoPlayer (ref), Surface (ref)
				if Flag then return end
				Flag = true
				Count += 1
				
				if RenderSteppedConnection then
					RenderSteppedConnection:Disconnect()
					RenderSteppedConnection = nil
				end
				if Object then
					Object:Destroy()
					Object = nil
				end
				if ConnectResult then
					ConnectResult()
					ConnectResult = nil
				end
				for _, Connection in List do
					Connection:Disconnect()
				end
				table.clear(List)
				
				if VideoPlayer then
					VideoPlayer:Destroy()
					VideoPlayer = nil
				end
				Surface = nil
			end,
			getIsLoaded = Signal5,
			getFailureReason = Signal6,
			getResolution = Signal7,
			getTimeLength = Signal8,
			getDuration = Computed1,
			getPosition = Signal9,
			setSurface = function(Value)
				-- upvalues: Surface (ref), Object (ref), VideoPlayer (ref)
				if Value == Surface then return end
				if Object then
					Object:Destroy()
					Object = nil
				end
				Surface = Value
				local Parent = VideoPlayer
				local TargetInstance = Surface
				
				if Parent and TargetInstance then
					if Object then return end
					local Wire = Instance.new("Wire")
					Wire.SourceInstance = Parent
					Wire.TargetInstance = TargetInstance
					Wire.Parent = Parent
					Object = Wire
				end
			end
		}
	end
}