local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local getCropSizeModule = require(momentsCommon.Utils.getCropSize)
local getFitSizeModule = require(momentsCommon.Utils.getFitSize)
local fFlagMomentsVideoCropRoundedCornersModule = require(momentsCommon.Flags.FFlagMomentsVideoCropRoundedCorners)
local fFlagMomentsPreloadVideoPlayerInstanceModule = require(momentsCommon.Flags.FFlagMomentsPreloadVideoPlayerInstance)
local fFlagMomentsVideoPermissionContextFixModule = require(momentsCommon.Flags.FFlagMomentsVideoPermissionContextFix)
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
		-- upvalues: fFlagMomentsVideoPermissionContextFixModule (ref), createSignal (ref), defaultObserveLoaded (ref), createComputed (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (ref), reactModule (ref), VideoSurface (ref)
		local id = p1.id
		local content = p1.content
		local var2 = if fFlagMomentsVideoPermissionContextFixModule then p1.preloadContent or content else content
		local var3, var4 = createSignal(p1.region)
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
			-- upvalues: var3 (ref)
			local var5 = var3(false)
			
			return if var5 == nil then 0 else var5.startTime
		end
		
		local var5, var6 = createSignal(false)
		local var7, var8 = createSignal(false)
		local var9, var10 = createSignal(false)
		local var11, var12 = createSignal(false)
		local var13, var14 = createSignal(nil)
		local var15, var16 = createSignal(nil)
		local var17, var18 = createSignal(0)
		local var19, var20 = createSignal(0)
		local var21 = createComputed(function(p3)
			-- upvalues: var9 (ref), var7 (ref), var5 (ref)
			return if var9(p3) then "Playing" elseif var7(p3) then "Decoded" elseif var5(p3) then "Downloaded" else "Idle"
		end)
		local var22 = createComputed(function(p3)
			-- upvalues: var3 (ref), var17 (ref)
			local var23 = var3(p3)
			
			return if var23 == nil then var17(p3) else var23.endTime - var23.startTime
		end)
		local var23 = nil
		local var24 = nil
		local var25 = nil
		local t = {}
		local var26 = nil
		local var27 = nil
		local var28 = nil
		local var29 = false
		local var30 = false
		local var31 = false
		local var32 = false
		local var33 = false
		local var34 = false
		local var35 = false
		local var36 = nil
		local var37 = false
		local var38 = 0
		local var39 = false
		
		local _ = function()
			-- upvalues: var3 (ref), var17 (ref)
			local var40 = var3(false)
			
			return if var40 == nil then var17(false) else var40.endTime
		end
		
		local _ = function()
			-- upvalues: var23 (write), var3 (ref), var17 (ref), var29 (write)
			if not var23 then return end
			local var40 = var3(false)
			local var41 = var17(false)
			local var42 = if var40 ~= nil then var41 > 0 and (var40.startTime <= 0.05 and var41 - 0.05 <= var40.endTime) else true
			var29 = var42
			var23.Looping = var42
		end
		
		local _ = function()
			-- upvalues: var23 (write), var25 (write), var30 (write), var24 (write)
			if var30 and var23 and (var25 and not var24) then
				local wire = Instance.new("Wire")
				wire.SourceInstance = var23
				wire.TargetInstance = var25
				wire.Parent = var23
				var24 = wire
				
				return
			end
		end
		
		local _ = function()
			-- upvalues: var24 (write)
			if var24 then
				var24:Destroy()
				var24 = nil
			end
		end
		
		local function onStep()
			-- upvalues: var23 (write), var3 (ref), var29 (write), var17 (ref), var20 (ref)
			if not var23 then return end
			local var40 = var3(false)
			local var41 = if var40 ~= nil then 0 else var40.startTime
			local timePosition = var23.TimePosition
			
			if not var29 then
				local var42 = var3(false)
				
				if (if var42 ~= nil then var17(false) else var42.endTime) - 0.05 <= timePosition then
					timePosition = var41
					var23.TimePosition = var41
				end
			end
			var20(timePosition - var41)
		end
		
		local _ = function()
			-- upvalues: var28 (write), runService (ref), onStep (ref)
			if var28 then
				return
			end
			var28 = runService.RenderStepped:Connect(onStep)
		end
		
		local _ = function()
			-- upvalues: var28 (write)
			if var28 then
				var28:Disconnect()
				var28 = nil
			end
		end
		
		local function startPlayerPlaybackIfReady()
			-- upvalues: var23 (write), var35 (write), var9 (ref), var30 (write), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var34 (write), var11 (ref), var10 (ref), var28 (write), runService (ref), onStep (ref)
			if not var35 or var9(false) or (not var30 or var23 == nil) or fFlagMomentsPreloadVideoPlayerInstanceModule and not var34 and not var11(false) then return end
			var23:Play()
			var10(true)
			
			if var28 then
				return
			end
			var28 = runService.RenderStepped:Connect(onStep)
		end
		
		local function assets()
			-- upvalues: var2 (write)
			return { var2 }
		end
		
		local _ = function()
			-- upvalues: content (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var3 (ref), parent (ref), var23 (write)
			local videoPlayer_1 = Instance.new("VideoPlayer")
			videoPlayer_1.Name = "VideoPlayer"
			videoPlayer_1.Looping = false
			videoPlayer_1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
			videoPlayer_1.VideoContent = content
			
			if fFlagMomentsPreloadVideoPlayerInstanceModule then
				local var40 = var3(false)
				videoPlayer_1.TimePosition = if var40 ~= nil then 0 else var40.startTime
			end
			videoPlayer_1.Parent = parent
			var23 = videoPlayer_1
			
			return videoPlayer_1
		end
		
		local function startLoadIfReady()
			-- upvalues: var23 (write), var26 (write), var39 (write), var30 (write), var33 (write), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var31 (write), var32 (write), var37 (write), var36 (write), startLoadIfReady (ref), var34 (write), loadVideo (ref), var14 (ref), var12 (ref), startPlayerPlaybackIfReady (ref)
			if var39 or not var30 or (var33 or var23 == nil) or var26 == nil then return end
			if fFlagMomentsPreloadVideoPlayerInstanceModule and var31 and (not var32 and not var37) then
				if var36 == nil then
					var36 = var26
					task.delay(2, function()
						-- upvalues: var36 (copy), var26 (ref), var39 (copy), var30 (copy), var23 (copy), var23 (ref), var26 (copy), var37 (copy), startLoadIfReady (copy)
						if var36 ~= var26 then return end
						var36 = nil
						
						if var39 or not var30 or (var23 ~= var23 or var26 ~= var26) then
							return
						end
						var37 = true
						startLoadIfReady()
					end)
				end
				return
			else
				var36 = nil
				var33 = true
				var34 = false
				task.spawn(function()
					-- upvalues: var39 (copy), var23 (copy), var23 (ref), var30 (copy), loadVideo (copy), var14 (copy), var34 (copy), var12 (copy), var26 (ref), startPlayerPlaybackIfReady (copy)
					if var39 or var23 ~= var23 or not var30 then return end
					local ok, status = pcall(loadVideo, var23)
					
					if var39 or var23 ~= var23 or not var30 then return end
					if not ok then
						var14(`video load errored: {tostring(status)}`)
						
						return
					elseif status == Enum.AssetFetchStatus.Success then
						var34 = true
						var12(var26.getIsLoaded())
						var14(nil)
						startPlayerPlaybackIfReady()
						
						return
					end
					var14(`video load failed: {status.Name}`)
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
				-- upvalues: var38 (write), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var23 (write), content (ref), var3 (ref), parent (ref), var31 (write), contentProvider (ref), var39 (write), var32 (write), var2 (write), var6 (ref), startLoadIfReady (ref)
				if fFlagMomentsPreloadVideoPlayerInstanceModule then
					local var40 = var23
					
					if not var40 then
						local videoPlayer_1 = Instance.new("VideoPlayer")
						videoPlayer_1.Name = "VideoPlayer"
						videoPlayer_1.Looping = false
						videoPlayer_1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
						videoPlayer_1.VideoContent = content
						
						if fFlagMomentsPreloadVideoPlayerInstanceModule then
							local var41 = var3(false)
							videoPlayer_1.TimePosition = if var41 ~= nil then 0 else var41.startTime
						end
						videoPlayer_1.Parent = parent
						var23 = videoPlayer_1
						var40 = videoPlayer_1
					end
					var31 = true
					pcall(function()
						-- upvalues: contentProvider (copy), var40 (ref)
						contentProvider:PreloadAsync({ var40 })
					end)
					
					if var39 or var38 ~= var38 or var23 ~= var40 then return end
					var32 = true
				else
					contentProvider:PreloadAsync({ var2.Uri })
				end
				if var39 or var38 ~= var38 then
					return
				end
				var6(true)
				startLoadIfReady()
			end,
			decode = function()
				-- upvalues: var39 (write), var30 (write), var14 (ref), var23 (write), content (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var3 (ref), parent (ref), observeLoaded (ref), var26 (write), var12 (ref), var27 (write), startPlayerPlaybackIfReady (ref), var16 (ref), t (ref), var18 (ref), var17 (ref), var29 (write), var25 (write), var24 (write), startLoadIfReady (ref), var8 (ref)
				if var39 or var30 then return end
				var14(nil)
				local var40 = var23
				
				if not var40 then
					local videoPlayer_1 = Instance.new("VideoPlayer")
					videoPlayer_1.Name = "VideoPlayer"
					videoPlayer_1.Looping = false
					videoPlayer_1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
					videoPlayer_1.VideoContent = content
					
					if fFlagMomentsPreloadVideoPlayerInstanceModule then
						local var41 = var3(false)
						videoPlayer_1.TimePosition = if var41 ~= nil then 0 else var41.startTime
					end
					videoPlayer_1.Parent = parent
					var23 = videoPlayer_1
					var40 = videoPlayer_1
				end
				local var42 = observeLoaded(var40)
				var26 = var42
				var12(var42.getIsLoaded())
				var27 = var42.connect(function(p3)
					-- upvalues: var12 (copy), startPlayerPlaybackIfReady (copy)
					var12(p3)
					
					if p3 then
						startPlayerPlaybackIfReady()
					end
				end)
				
				local function readResolution()
					-- upvalues: var40 (ref), var16 (copy)
					local resolution = var40.Resolution
					var16(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				end
				
				local resolution = var40.Resolution
				var16(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				table.insert(t, var40:GetPropertyChangedSignal("Resolution"):Connect(readResolution))
				var18(var40.TimeLength)
				table.insert(t, var40:GetPropertyChangedSignal("TimeLength"):Connect(function()
					-- upvalues: var18 (copy), var40 (ref), var23 (copy), var3 (copy), var17 (copy), var29 (copy)
					var18(var40.TimeLength)
					
					if not var23 then return end
					local var43 = var3(false)
					local var44 = var17(false)
					local var45 = if var43 ~= nil then var44 > 0 and (var43.startTime <= 0.05 and var44 - 0.05 <= var43.endTime) else true
					var29 = var45
					var23.Looping = var45
				end))
				var30 = true
				resolution = var23
				
				if resolution then
					local var43 = var3(false)
					local var44 = var17(false)
					local var45 = if var43 ~= nil then var44 > 0 and (var43.startTime <= 0.05 and var44 - 0.05 <= var43.endTime) else true
					var29 = var45
					resolution.Looping = var45
				end
				resolution = var23
				
				if resolution and var25 and not var24 then
					local wire = Instance.new("Wire")
					wire.SourceInstance = resolution
					wire.TargetInstance = var25
					wire.Parent = resolution
					var24 = wire
				end
				startLoadIfReady()
				var8(true)
			end,
			releaseDecoder = function()
				-- upvalues: var23 (write), var30 (write), var36 (write), var35 (write), var28 (write), var10 (ref), var24 (write), var27 (write), var26 (write), t (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var31 (write), var32 (write), var33 (write), var34 (write), var8 (ref), var12 (ref), var14 (ref), var20 (ref)
				if not var23 or not var30 then return end
				var30 = false
				var36 = nil
				var35 = false
				
				if var28 then
					var28:Disconnect()
					var28 = nil
				end
				var10(false)
				
				if var24 then
					var24:Destroy()
					var24 = nil
				end
				if var27 then
					var27()
					var27 = nil
				end
				var26 = nil
				
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				
				if not fFlagMomentsPreloadVideoPlayerInstanceModule or (not var31 or (var32 or var33)) then
					var23 = nil
					var23:Destroy()
				end
				var33 = false
				var34 = false
				var8(false)
				var12(false)
				var14(nil)
				var20(0)
			end,
			getResourceLevel = var21,
			getAudioSource = function()
				-- upvalues: var23 (write), var30 (write)
				assert(var23 and var30, "createVideoNode: getAudioSource() requires decode() first")
				
				return var23
			end,
			render = function(p3)
				-- upvalues: reactModule (copy), VideoSurface (copy), zIndex (ref), cornerRadius (ref)
				return reactModule.createElement(VideoSurface, {
					getItemSize = p3.getItemSize,
					getResolution = p3.getResolution,
					getScaleType = p3.getScaleType,
					setSurface = p3.setSurface,
					zIndex = zIndex,
					cornerRadius = cornerRadius
				})
			end,
			play = function()
				-- upvalues: var23 (write), var30 (write), var3 (ref), var20 (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var35 (write), startPlayerPlaybackIfReady (ref), var10 (ref), var28 (write), runService (ref), onStep (ref)
				if not var23 or not var30 then return end
				local var40 = var3(false)
				var23.TimePosition = if var40 ~= nil then 0 else var40.startTime
				var20(0)
				
				if fFlagMomentsPreloadVideoPlayerInstanceModule then
					var35 = true
					startPlayerPlaybackIfReady()
					
					return
				end
				var23:Play()
				var10(true)
				
				if var28 then
					return
				end
				var28 = runService.RenderStepped:Connect(onStep)
			end,
			pause = function()
				-- upvalues: var23 (write), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var35 (write), var30 (write), var9 (ref), var10 (ref), var28 (write)
				if fFlagMomentsPreloadVideoPlayerInstanceModule then
					var35 = false
				end
				if not var23 or not var30 then return end
				if not fFlagMomentsPreloadVideoPlayerInstanceModule then
					var23:Pause()
				elseif var9(false) then
					var23:Pause()
				end
				var10(false)
				
				if var28 then
					var28:Disconnect()
					var28 = nil
				end
			end,
			seek = function(p3)
				-- upvalues: var23 (write), var3 (ref), var17 (ref), var20 (ref)
				if var23 then
					local var40 = var3(false)
					local var41 = if var40 ~= nil then 0 else var40.startTime
					local var42 = var3(false)
					local clampedValue = math.clamp(var41 + p3, var41, if var42 ~= nil then var17(false) else var42.endTime)
					var23.TimePosition = clampedValue
					var20(clampedValue - var41)
					
					return
				end
			end,
			setRegion = function(value)
				-- upvalues: var4 (ref), var23 (write), var3 (ref), var17 (ref), var29 (write), var20 (ref)
				var4(value)
				
				if var23 then
					local var40 = var3(false)
					local var41 = var17(false)
					local var42 = if var40 ~= nil then var41 > 0 and (var40.startTime <= 0.05 and var41 - 0.05 <= var40.endTime) else true
					var29 = var42
					var23.Looping = var42
				end
				if var23 ~= nil then
					local var43 = var3(false)
					local var44 = if var43 ~= nil then 0 else var43.startTime
					local var45 = var3(false)
					local clampedValue = math.clamp(var23.TimePosition, var44, if var45 ~= nil then var17(false) else var45.endTime)
					var23.TimePosition = clampedValue
					var20(clampedValue - var44)
				end
			end,
			dispose = function()
				-- upvalues: var39 (write), var38 (write), var30 (write), var36 (write), var33 (write), var34 (write), var35 (write), var28 (write), var24 (write), var27 (write), var26 (write), t (ref), var23 (write), var25 (write)
				if var39 then return end
				var39 = true
				var38 += 1
				var30 = false
				var36 = nil
				var33 = false
				var34 = false
				var35 = false
				
				if var28 then
					var28:Disconnect()
					var28 = nil
				end
				if var24 then
					var24:Destroy()
					var24 = nil
				end
				if var27 then
					var27()
					var27 = nil
				end
				var26 = nil
				
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				
				if var23 then
					var23:Destroy()
					var23 = nil
				end
				var25 = nil
			end,
			getIsLoaded = var11,
			getFailureReason = var13,
			getResolution = var15,
			getTimeLength = var17,
			getDuration = var22,
			getPosition = var19,
			isPlaybackReady = function()
				-- upvalues: fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var11 (ref)
				return not fFlagMomentsPreloadVideoPlayerInstanceModule or var11(false)
			end,
			setSurface = function(value)
				-- upvalues: var25 (write), var24 (write), var23 (write), var30 (write)
				if value == var25 then return end
				if var24 then
					var24:Destroy()
					var24 = nil
				end
				var25 = value
				local var40 = var25
				
				if var30 and var23 and var40 then
					if var24 then return end
					local wire = Instance.new("Wire")
					wire.SourceInstance = var23
					wire.TargetInstance = var40
					wire.Parent = var23
					var24 = wire
				end
			end
		}
	end
}