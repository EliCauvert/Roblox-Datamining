local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local getCropSizeModule = require(momentsCommon.Utils.getCropSize)
local getFitSizeModule = require(momentsCommon.Utils.getFitSize)
local getFFlagMomentsVideoSurfaceMediaRectModule = require(momentsCommon.Flags.GetFFlagMomentsVideoSurfaceMediaRect)
local fFlagMomentsVideoCropRoundedCornersModule = require(momentsCommon.Flags.FFlagMomentsVideoCropRoundedCorners)
local fFlagMomentsPreloadVideoPlayerInstanceModule = require(momentsCommon.Flags.FFlagMomentsPreloadVideoPlayerInstance)
local useSignalState = signalsReactModule.useSignalState
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local var1 = createSignal(Enum.ScaleType.Crop)

local function VideoSurface(p1)
	-- upvalues: useSignalState (ref), reactModule (ref), createComputed (ref), var1 (ref), fFlagMomentsVideoCropRoundedCornersModule (ref), getFitSizeModule (ref), getCropSizeModule (ref)
	local var2 = useSignalState(p1.getItemSize)
	local getResolution = p1.getResolution
	local var3 = useSignalState(reactModule.useMemo(function()
		-- upvalues: createComputed (copy), getResolution (ref)
		return createComputed(function(p2)
			-- upvalues: getResolution (copy)
			return getResolution(p2)
		end)
	end, { getResolution }))
	local var4 = useSignalState(p1.getScaleType or var1)
	local uDim2 = UDim2.fromScale(1, 1)
	local stretch = Enum.ScaleType.Stretch
	
	if fFlagMomentsVideoCropRoundedCornersModule and var4 ~= Enum.ScaleType.Fit then
		stretch = Enum.ScaleType.Crop
	elseif var3 ~= nil and var3.X > 0 and var3.Y > 0 then
		uDim2 = if var4 == Enum.ScaleType.Fit then getFitSizeModule(var2, var3) else getCropSizeModule(var2, var3)
	end
	return reactModule.createElement("VideoDisplay", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = uDim2,
		ScaleType = stretch,
		ZIndex = p1.zIndex,
		ref = p1.setSurface
	}, {
		Corner = if p1.cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) })
	})
end

local function defaultObserveLoaded(p1)
	return {
		getIsLoaded = function()
			-- upvalues: p1 (ref)
			return p1.IsLoaded
		end,
		connect = function(p2)
			-- upvalues: p1 (ref)
			local var2 = p1:GetPropertyChangedSignal("IsLoaded"):Connect(function()
				-- upvalues: p2 (ref), p1 (copy)
				p2(p1.IsLoaded)
			end)
			
			return function()
				-- upvalues: var2 (ref)
				var2:Disconnect()
			end
		end
	}
end

return {
	kind = "video",
	create = function(p1, p2)
		-- upvalues: createSignal (ref), defaultObserveLoaded (ref), createComputed (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (ref), getFFlagMomentsVideoSurfaceMediaRectModule (ref), reactModule (ref), VideoSurface (ref)
		local id = p1.id
		local content = p1.content
		local var2, var3 = createSignal(p1.region)
		local parent = p1.parent
		local zIndex = p1.zIndex or 0
		local cornerRadius = p1.cornerRadius
		local runService = p2.runService
		local contentProvider = p2.contentProvider
		local observeLoaded = p2.observeLoaded or defaultObserveLoaded
		local loadVideo = p2.loadVideo or function(p3)
			return p3:LoadAsync()
		end
		
		local function _()
			-- upvalues: var2 (ref)
			local var4 = var2(false)
			
			return if var4 == nil then 0 else var4.startTime
		end
		
		local var4, var5 = createSignal(false)
		local var6, var7 = createSignal(false)
		local var8, var9 = createSignal(false)
		local var10, var11 = createSignal(false)
		local var12, var13 = createSignal(nil)
		local var14, var15 = createSignal(nil)
		local var16, var17 = createSignal(0)
		local var18, var19 = createSignal(0)
		local var20 = createComputed(function(p3)
			-- upvalues: var8 (ref), var6 (ref), var4 (ref)
			return if var8(p3) then "Playing" elseif var6(p3) then "Decoded" elseif var4(p3) then "Downloaded" else "Idle"
		end)
		local var21 = createComputed(function(p3)
			-- upvalues: var2 (ref), var16 (ref)
			local var22 = var2(p3)
			
			return if var22 == nil then var16(p3) else var22.endTime - var22.startTime
		end)
		local var22 = nil
		local var23 = nil
		local var24 = nil
		local t = {}
		local var25 = nil
		local var26 = nil
		local var27 = nil
		local var28 = false
		local var29 = false
		local var30 = false
		local var31 = false
		local var32 = false
		local var33 = false
		local var34 = false
		local var35 = nil
		local var36 = false
		local var37 = 0
		local var38 = false
		
		local _ = function()
			-- upvalues: var2 (ref), var16 (ref)
			local var39 = var2(false)
			
			return if var39 == nil then var16(false) else var39.endTime
		end
		
		local _ = function()
			-- upvalues: var22 (write), var2 (ref), var16 (ref), var28 (write)
			if not var22 then return end
			local var39 = var2(false)
			local var40 = var16(false)
			local var41 = if var39 ~= nil then var40 > 0 and (var39.startTime <= 0.05 and var40 - 0.05 <= var39.endTime) else true
			var28 = var41
			var22.Looping = var41
		end
		
		local _ = function()
			-- upvalues: var22 (write), var24 (write), var29 (write), var23 (write)
			if var29 and var22 and (var24 and not var23) then
				local wire = Instance.new("Wire")
				wire.SourceInstance = var22
				wire.TargetInstance = var24
				wire.Parent = var22
				var23 = wire
				
				return
			end
		end
		
		local _ = function()
			-- upvalues: var23 (write)
			if var23 then
				var23:Destroy()
				var23 = nil
			end
		end
		
		local function onStep()
			-- upvalues: var22 (write), var2 (ref), var28 (write), var16 (ref), var19 (ref)
			if not var22 then return end
			local var39 = var2(false)
			local var40 = if var39 ~= nil then 0 else var39.startTime
			local timePosition = var22.TimePosition
			
			if not var28 then
				local var41 = var2(false)
				
				if (if var41 ~= nil then var16(false) else var41.endTime) - 0.05 <= timePosition then
					timePosition = var40
					var22.TimePosition = var40
				end
			end
			var19(timePosition - var40)
		end
		
		local _ = function()
			-- upvalues: var27 (write), runService (ref), onStep (ref)
			if var27 then
				return
			end
			var27 = runService.RenderStepped:Connect(onStep)
		end
		
		local _ = function()
			-- upvalues: var27 (write)
			if var27 then
				var27:Disconnect()
				var27 = nil
			end
		end
		
		local function startPlayerPlaybackIfReady()
			-- upvalues: var22 (write), var34 (write), var8 (ref), var29 (write), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var33 (write), var10 (ref), var9 (ref), var27 (write), runService (ref), onStep (ref)
			if not var34 or var8(false) or (not var29 or var22 == nil) or fFlagMomentsPreloadVideoPlayerInstanceModule and not var33 and not var10(false) then return end
			var22:Play()
			var9(true)
			
			if var27 then
				return
			end
			var27 = runService.RenderStepped:Connect(onStep)
		end
		
		local function assets()
			-- upvalues: content (ref)
			return { content }
		end
		
		local _ = function()
			-- upvalues: content (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var2 (ref), parent (ref), var22 (write)
			local videoPlayer_1 = Instance.new("VideoPlayer")
			videoPlayer_1.Name = "VideoPlayer"
			videoPlayer_1.Looping = false
			videoPlayer_1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
			videoPlayer_1.VideoContent = content
			
			if fFlagMomentsPreloadVideoPlayerInstanceModule then
				local var39 = var2(false)
				videoPlayer_1.TimePosition = if var39 ~= nil then 0 else var39.startTime
			end
			videoPlayer_1.Parent = parent
			var22 = videoPlayer_1
			
			return videoPlayer_1
		end
		
		local function startLoadIfReady()
			-- upvalues: var22 (write), var25 (write), var38 (write), var29 (write), var32 (write), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var30 (write), var31 (write), var36 (write), var35 (write), startLoadIfReady (ref), var33 (write), loadVideo (ref), var13 (ref), var11 (ref), startPlayerPlaybackIfReady (ref)
			if var38 or not var29 or (var32 or var22 == nil) or var25 == nil then return end
			if fFlagMomentsPreloadVideoPlayerInstanceModule and var30 and (not var31 and not var36) then
				if var35 == nil then
					var35 = var25
					task.delay(2, function()
						-- upvalues: var35 (copy), var25 (ref), var38 (copy), var29 (copy), var22 (copy), var22 (ref), var25 (copy), var36 (copy), startLoadIfReady (copy)
						if var35 ~= var25 then return end
						var35 = nil
						
						if var38 or not var29 or (var22 ~= var22 or var25 ~= var25) then
							return
						end
						var36 = true
						startLoadIfReady()
					end)
				end
				return
			else
				var35 = nil
				var32 = true
				var33 = false
				task.spawn(function()
					-- upvalues: var38 (copy), var22 (copy), var22 (ref), var29 (copy), loadVideo (copy), var13 (copy), var33 (copy), var11 (copy), var25 (ref), startPlayerPlaybackIfReady (copy)
					if var38 or var22 ~= var22 or not var29 then return end
					local ok, status = pcall(loadVideo, var22)
					
					if var38 or var22 ~= var22 or not var29 then return end
					if not ok then
						var13(`video load errored: {tostring(status)}`)
						
						return
					elseif status == Enum.AssetFetchStatus.Success then
						var33 = true
						var11(var25.getIsLoaded())
						var13(nil)
						startPlayerPlaybackIfReady()
						
						return
					end
					var13(`video load failed: {status.Name}`)
				end)
			end
		end
		
		return {
			kind = "video",
			usesDecoder = true,
			id = id,
			zIndex = zIndex,
			audioStem = { defaultVolume = 1, stemId = id },
			assets = assets,
			download = function()
				-- upvalues: var37 (write), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var22 (write), content (ref), var2 (ref), parent (ref), var30 (write), contentProvider (ref), var38 (write), var31 (write), var5 (ref), startLoadIfReady (ref)
				if fFlagMomentsPreloadVideoPlayerInstanceModule then
					local var39 = var22
					
					if not var39 then
						local videoPlayer_1 = Instance.new("VideoPlayer")
						videoPlayer_1.Name = "VideoPlayer"
						videoPlayer_1.Looping = false
						videoPlayer_1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
						videoPlayer_1.VideoContent = content
						
						if fFlagMomentsPreloadVideoPlayerInstanceModule then
							local var40 = var2(false)
							videoPlayer_1.TimePosition = if var40 ~= nil then 0 else var40.startTime
						end
						videoPlayer_1.Parent = parent
						var22 = videoPlayer_1
						var39 = videoPlayer_1
					end
					var30 = true
					pcall(function()
						-- upvalues: contentProvider (copy), var39 (ref)
						contentProvider:PreloadAsync({ var39 })
					end)
					
					if var38 or var37 ~= var37 or var22 ~= var39 then return end
					var31 = true
				else
					contentProvider:PreloadAsync({ content.Uri })
				end
				if var38 or var37 ~= var37 then
					return
				end
				var5(true)
				startLoadIfReady()
			end,
			decode = function()
				-- upvalues: var38 (write), var29 (write), var13 (ref), var22 (write), content (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var2 (ref), parent (ref), observeLoaded (ref), var25 (write), var11 (ref), var26 (write), startPlayerPlaybackIfReady (ref), var15 (ref), t (ref), var17 (ref), var16 (ref), var28 (write), var24 (write), var23 (write), startLoadIfReady (ref), var7 (ref)
				if var38 or var29 then return end
				var13(nil)
				local var39 = var22
				
				if not var39 then
					local videoPlayer_1 = Instance.new("VideoPlayer")
					videoPlayer_1.Name = "VideoPlayer"
					videoPlayer_1.Looping = false
					videoPlayer_1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
					videoPlayer_1.VideoContent = content
					
					if fFlagMomentsPreloadVideoPlayerInstanceModule then
						local var40 = var2(false)
						videoPlayer_1.TimePosition = if var40 ~= nil then 0 else var40.startTime
					end
					videoPlayer_1.Parent = parent
					var22 = videoPlayer_1
					var39 = videoPlayer_1
				end
				local var41 = observeLoaded(var39)
				var25 = var41
				var11(var41.getIsLoaded())
				var26 = var41.connect(function(p3)
					-- upvalues: var11 (copy), startPlayerPlaybackIfReady (copy)
					var11(p3)
					
					if p3 then
						startPlayerPlaybackIfReady()
					end
				end)
				
				local function readResolution()
					-- upvalues: var39 (ref), var15 (copy)
					local resolution = var39.Resolution
					var15(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				end
				
				local resolution = var39.Resolution
				var15(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				table.insert(t, var39:GetPropertyChangedSignal("Resolution"):Connect(readResolution))
				var17(var39.TimeLength)
				table.insert(t, var39:GetPropertyChangedSignal("TimeLength"):Connect(function()
					-- upvalues: var17 (copy), var39 (ref), var22 (copy), var2 (copy), var16 (copy), var28 (copy)
					var17(var39.TimeLength)
					
					if not var22 then return end
					local var42 = var2(false)
					local var43 = var16(false)
					local var44 = if var42 ~= nil then var43 > 0 and (var42.startTime <= 0.05 and var43 - 0.05 <= var42.endTime) else true
					var28 = var44
					var22.Looping = var44
				end))
				var29 = true
				resolution = var22
				
				if resolution then
					local var42 = var2(false)
					local var43 = var16(false)
					local var44 = if var42 ~= nil then var43 > 0 and (var42.startTime <= 0.05 and var43 - 0.05 <= var42.endTime) else true
					var28 = var44
					resolution.Looping = var44
				end
				resolution = var22
				
				if resolution and var24 and not var23 then
					local wire = Instance.new("Wire")
					wire.SourceInstance = resolution
					wire.TargetInstance = var24
					wire.Parent = resolution
					var23 = wire
				end
				startLoadIfReady()
				var7(true)
			end,
			releaseDecoder = function()
				-- upvalues: var22 (write), var29 (write), var35 (write), var34 (write), var27 (write), var9 (ref), var23 (write), var26 (write), var25 (write), t (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var30 (write), var31 (write), var32 (write), var33 (write), var7 (ref), var11 (ref), var13 (ref), var19 (ref)
				if not var22 or not var29 then return end
				var29 = false
				var35 = nil
				var34 = false
				
				if var27 then
					var27:Disconnect()
					var27 = nil
				end
				var9(false)
				
				if var23 then
					var23:Destroy()
					var23 = nil
				end
				if var26 then
					var26()
					var26 = nil
				end
				var25 = nil
				
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				
				if not fFlagMomentsPreloadVideoPlayerInstanceModule or (not var30 or (var31 or var32)) then
					var22 = nil
					var22:Destroy()
				end
				var32 = false
				var33 = false
				var7(false)
				var11(false)
				var13(nil)
				var19(0)
			end,
			getResourceLevel = var20,
			getAudioSource = function()
				-- upvalues: var22 (write), var29 (write)
				assert(var22 and var29, "createVideoNode: getAudioSource() requires decode() first")
				
				return var22
			end,
			render = function(p3)
				-- upvalues: getFFlagMomentsVideoSurfaceMediaRectModule (copy), reactModule (copy), VideoSurface (copy), zIndex (ref), cornerRadius (ref)
				return if getFFlagMomentsVideoSurfaceMediaRectModule() then reactModule.createElement(VideoSurface, {
					getItemSize = p3.getItemSize,
					getResolution = p3.getResolution,
					getScaleType = p3.getScaleType,
					setSurface = p3.setSurface,
					zIndex = zIndex,
					cornerRadius = cornerRadius
				}) else reactModule.createElement("VideoDisplay", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ScaleType = p3.scaleType or Enum.ScaleType.Crop,
					ZIndex = zIndex,
					ref = function(p4)
						-- upvalues: p3 (ref)
						p3.setSurface(p4)
					end
				}, {
					Corner = if cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) })
				})
			end,
			play = function()
				-- upvalues: var22 (write), var29 (write), var2 (ref), var19 (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var34 (write), startPlayerPlaybackIfReady (ref), var9 (ref), var27 (write), runService (ref), onStep (ref)
				if not var22 or not var29 then return end
				local var39 = var2(false)
				var22.TimePosition = if var39 ~= nil then 0 else var39.startTime
				var19(0)
				
				if fFlagMomentsPreloadVideoPlayerInstanceModule then
					var34 = true
					startPlayerPlaybackIfReady()
					
					return
				end
				var22:Play()
				var9(true)
				
				if var27 then
					return
				end
				var27 = runService.RenderStepped:Connect(onStep)
			end,
			pause = function()
				-- upvalues: var22 (write), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var34 (write), var29 (write), var8 (ref), var9 (ref), var27 (write)
				if fFlagMomentsPreloadVideoPlayerInstanceModule then
					var34 = false
				end
				if not var22 or not var29 then return end
				if not fFlagMomentsPreloadVideoPlayerInstanceModule then
					var22:Pause()
				elseif var8(false) then
					var22:Pause()
				end
				var9(false)
				
				if var27 then
					var27:Disconnect()
					var27 = nil
				end
			end,
			seek = function(p3)
				-- upvalues: var22 (write), var2 (ref), var16 (ref), var19 (ref)
				if var22 then
					local var39 = var2(false)
					local var40 = if var39 ~= nil then 0 else var39.startTime
					local var41 = var2(false)
					local clampedValue = math.clamp(var40 + p3, var40, if var41 ~= nil then var16(false) else var41.endTime)
					var22.TimePosition = clampedValue
					var19(clampedValue - var40)
					
					return
				end
			end,
			setRegion = function(value)
				-- upvalues: var3 (ref), var22 (write), var2 (ref), var16 (ref), var28 (write), var19 (ref)
				var3(value)
				
				if var22 then
					local var39 = var2(false)
					local var40 = var16(false)
					local var41 = if var39 ~= nil then var40 > 0 and (var39.startTime <= 0.05 and var40 - 0.05 <= var39.endTime) else true
					var28 = var41
					var22.Looping = var41
				end
				if var22 ~= nil then
					local var42 = var2(false)
					local var43 = if var42 ~= nil then 0 else var42.startTime
					local var44 = var2(false)
					local clampedValue = math.clamp(var22.TimePosition, var43, if var44 ~= nil then var16(false) else var44.endTime)
					var22.TimePosition = clampedValue
					var19(clampedValue - var43)
				end
			end,
			dispose = function()
				-- upvalues: var38 (write), var37 (write), var29 (write), var35 (write), var32 (write), var33 (write), var34 (write), var27 (write), var23 (write), var26 (write), var25 (write), t (ref), var22 (write), var24 (write)
				if var38 then return end
				var38 = true
				var37 += 1
				var29 = false
				var35 = nil
				var32 = false
				var33 = false
				var34 = false
				
				if var27 then
					var27:Disconnect()
					var27 = nil
				end
				if var23 then
					var23:Destroy()
					var23 = nil
				end
				if var26 then
					var26()
					var26 = nil
				end
				var25 = nil
				
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				
				if var22 then
					var22:Destroy()
					var22 = nil
				end
				var24 = nil
			end,
			getIsLoaded = var10,
			getFailureReason = var12,
			getResolution = var14,
			getTimeLength = var16,
			getDuration = var21,
			getPosition = var18,
			isPlaybackReady = function()
				-- upvalues: fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var10 (ref)
				return not fFlagMomentsPreloadVideoPlayerInstanceModule or var10(false)
			end,
			setSurface = function(value)
				-- upvalues: var24 (write), var23 (write), var22 (write), var29 (write)
				if value == var24 then return end
				if var23 then
					var23:Destroy()
					var23 = nil
				end
				var24 = value
				local var39 = var24
				
				if var29 and var22 and var39 then
					if var23 then return end
					local wire = Instance.new("Wire")
					wire.SourceInstance = var22
					wire.TargetInstance = var39
					wire.Parent = var22
					var23 = wire
				end
			end
		}
	end
}