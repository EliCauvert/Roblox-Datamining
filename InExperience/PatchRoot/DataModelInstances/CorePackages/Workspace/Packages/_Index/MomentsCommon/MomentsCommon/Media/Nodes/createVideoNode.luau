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
local fFlagMomentsVideoLoadAsyncLoadingFixModule = require(momentsCommon.Flags.FFlagMomentsVideoLoadAsyncLoadingFix)
local fFlagMomentsOptimisticProfilePending = require(parent.SharedFlags).FFlagMomentsOptimisticProfilePending
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
		Corner = if p1.cornerRadius ~= nil then if p1.surfaceCornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = p1.surfaceCornerRadius }) else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) })
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
		-- upvalues: fFlagMomentsVideoPermissionContextFixModule (ref), createSignal (ref), defaultObserveLoaded (ref), createComputed (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (ref), fFlagMomentsVideoLoadAsyncLoadingFixModule (ref), fFlagMomentsOptimisticProfilePending (ref), reactModule (ref), VideoSurface (ref)
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
		local var38 = false
		local var39 = 0
		local var40 = false
		
		local _ = function()
			-- upvalues: var3 (ref), var17 (ref)
			local var41 = var3(false)
			
			return if var41 == nil then var17(false) else var41.endTime
		end
		
		local _ = function()
			-- upvalues: var23 (write), var3 (ref), var17 (ref), var29 (write)
			if not var23 then return end
			local var41 = var3(false)
			local var42 = var17(false)
			local var43 = if var41 ~= nil then var42 > 0 and (var41.startTime <= 0.05 and var42 - 0.05 <= var41.endTime) else true
			var29 = var43
			var23.Looping = var43
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
			local var41 = var3(false)
			local var42 = if var41 ~= nil then 0 else var41.startTime
			local timePosition = var23.TimePosition
			
			if not var29 then
				local var43 = var3(false)
				
				if (if var43 ~= nil then var17(false) else var43.endTime) - 0.05 <= timePosition then
					timePosition = var42
					var23.TimePosition = var42
				end
			end
			var20(timePosition - var42)
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
				local var41 = var3(false)
				videoPlayer_1.TimePosition = if var41 ~= nil then 0 else var41.startTime
			end
			videoPlayer_1.Parent = parent
			var23 = videoPlayer_1
			
			return videoPlayer_1
		end
		
		local function runLoad(p3, p4, p5)
			-- upvalues: var40 (write), var23 (write), var30 (write), loadVideo (ref), var14 (ref), var34 (write), var12 (ref), startPlayerPlaybackIfReady (ref), fFlagMomentsVideoLoadAsyncLoadingFixModule (copy), var31 (write), var32 (write), var38 (write), runLoad (ref)
			if var40 or var23 ~= p3 or not var30 then return end
			local ok, status = pcall(loadVideo, p3)
			
			if var40 or var23 ~= p3 or not var30 then return end
			if not ok then
				var14(`video load errored: {tostring(status)}`)
				
				return
			elseif status == Enum.AssetFetchStatus.Success then
				var34 = true
				var12(p4.getIsLoaded())
				var14(nil)
				startPlayerPlaybackIfReady()
				
				return
			elseif not fFlagMomentsVideoLoadAsyncLoadingFixModule or status ~= Enum.AssetFetchStatus.Loading or p5 then
				var14(`video load failed: {status.Name}`)
				
				return
			end
			var12(p4.getIsLoaded())
			
			if var31 and not var32 then
				var38 = true
				
				return
			end
			runLoad(p3, p4, true)
		end
		
		local function startLoadIfReady()
			-- upvalues: var23 (write), var26 (write), var40 (write), var30 (write), var33 (write), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var31 (write), var32 (write), var37 (write), var36 (write), startLoadIfReady (ref), var34 (write), runLoad (ref)
			if var40 or not var30 or (var33 or var23 == nil) or var26 == nil then return end
			if fFlagMomentsPreloadVideoPlayerInstanceModule and var31 and (not var32 and not var37) then
				if var36 == nil then
					var36 = var26
					task.delay(2, function()
						-- upvalues: var36 (copy), var26 (ref), var40 (copy), var30 (copy), var23 (copy), var23 (ref), var26 (copy), var37 (copy), startLoadIfReady (copy)
						if var36 ~= var26 then return end
						var36 = nil
						
						if var40 or not var30 or (var23 ~= var23 or var26 ~= var26) then
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
				task.spawn(runLoad, var23, var26, false)
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
				-- upvalues: var39 (write), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var23 (write), content (ref), var3 (ref), parent (ref), var31 (write), contentProvider (ref), var40 (write), var32 (write), fFlagMomentsVideoLoadAsyncLoadingFixModule (copy), var38 (write), var26 (write), var30 (write), runLoad (ref), fFlagMomentsOptimisticProfilePending (copy), var2 (write), var6 (ref), startLoadIfReady (ref)
				if fFlagMomentsPreloadVideoPlayerInstanceModule then
					local var41 = var23
					
					if not var41 then
						local videoPlayer_1 = Instance.new("VideoPlayer")
						videoPlayer_1.Name = "VideoPlayer"
						videoPlayer_1.Looping = false
						videoPlayer_1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
						videoPlayer_1.VideoContent = content
						
						if fFlagMomentsPreloadVideoPlayerInstanceModule then
							local var42 = var3(false)
							videoPlayer_1.TimePosition = if var42 ~= nil then 0 else var42.startTime
						end
						videoPlayer_1.Parent = parent
						var23 = videoPlayer_1
						var41 = videoPlayer_1
					end
					var31 = true
					pcall(function()
						-- upvalues: contentProvider (copy), var41 (ref)
						contentProvider:PreloadAsync({ var41 })
					end)
					
					if var40 or var39 ~= var39 or var23 ~= var41 then return end
					var32 = true
					
					if fFlagMomentsVideoLoadAsyncLoadingFixModule and var38 then
						var38 = false
						local var43 = var26
						
						if var30 and var43 ~= nil and not var43.getIsLoaded() then
							task.spawn(runLoad, var41, var43, true)
						end
					end
				elseif not fFlagMomentsOptimisticProfilePending or var2.Uri ~= nil then
					contentProvider:PreloadAsync({ var2.Uri })
				end
				if var40 or var39 ~= var39 then
					return
				end
				var6(true)
				startLoadIfReady()
			end,
			decode = function()
				-- upvalues: var40 (write), var30 (write), var14 (ref), var23 (write), content (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var3 (ref), parent (ref), observeLoaded (ref), var26 (write), var12 (ref), var27 (write), startPlayerPlaybackIfReady (ref), var16 (ref), t (ref), var18 (ref), var17 (ref), var29 (write), var25 (write), var24 (write), startLoadIfReady (ref), var8 (ref)
				if var40 or var30 then return end
				var14(nil)
				local var41 = var23
				
				if not var41 then
					local videoPlayer_1 = Instance.new("VideoPlayer")
					videoPlayer_1.Name = "VideoPlayer"
					videoPlayer_1.Looping = false
					videoPlayer_1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
					videoPlayer_1.VideoContent = content
					
					if fFlagMomentsPreloadVideoPlayerInstanceModule then
						local var42 = var3(false)
						videoPlayer_1.TimePosition = if var42 ~= nil then 0 else var42.startTime
					end
					videoPlayer_1.Parent = parent
					var23 = videoPlayer_1
					var41 = videoPlayer_1
				end
				local var43 = observeLoaded(var41)
				var26 = var43
				var12(var43.getIsLoaded())
				var27 = var43.connect(function(p3)
					-- upvalues: var12 (copy), startPlayerPlaybackIfReady (copy)
					var12(p3)
					
					if p3 then
						startPlayerPlaybackIfReady()
					end
				end)
				
				local function readResolution()
					-- upvalues: var41 (ref), var16 (copy)
					local resolution = var41.Resolution
					var16(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				end
				
				local resolution = var41.Resolution
				var16(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				table.insert(t, var41:GetPropertyChangedSignal("Resolution"):Connect(readResolution))
				var18(var41.TimeLength)
				table.insert(t, var41:GetPropertyChangedSignal("TimeLength"):Connect(function()
					-- upvalues: var18 (copy), var41 (ref), var23 (copy), var3 (copy), var17 (copy), var29 (copy)
					var18(var41.TimeLength)
					
					if not var23 then return end
					local var44 = var3(false)
					local var45 = var17(false)
					local var46 = if var44 ~= nil then var45 > 0 and (var44.startTime <= 0.05 and var45 - 0.05 <= var44.endTime) else true
					var29 = var46
					var23.Looping = var46
				end))
				var30 = true
				resolution = var23
				
				if resolution then
					local var44 = var3(false)
					local var45 = var17(false)
					local var46 = if var44 ~= nil then var45 > 0 and (var44.startTime <= 0.05 and var45 - 0.05 <= var44.endTime) else true
					var29 = var46
					resolution.Looping = var46
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
				-- upvalues: var23 (write), var30 (write), var36 (write), var38 (write), var35 (write), var28 (write), var10 (ref), var24 (write), var27 (write), var26 (write), t (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var31 (write), var32 (write), var33 (write), var34 (write), var8 (ref), var12 (ref), var14 (ref), var20 (ref)
				if not var23 or not var30 then return end
				var30 = false
				var36 = nil
				var38 = false
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
					cornerRadius = cornerRadius,
					surfaceCornerRadius = p3.cornerRadius
				})
			end,
			play = function()
				-- upvalues: var23 (write), var30 (write), var3 (ref), var20 (ref), fFlagMomentsPreloadVideoPlayerInstanceModule (copy), var35 (write), startPlayerPlaybackIfReady (ref), var10 (ref), var28 (write), runService (ref), onStep (ref)
				if not var23 or not var30 then return end
				local var41 = var3(false)
				var23.TimePosition = if var41 ~= nil then 0 else var41.startTime
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
					local var41 = var3(false)
					local var42 = if var41 ~= nil then 0 else var41.startTime
					local var43 = var3(false)
					local clampedValue = math.clamp(var42 + p3, var42, if var43 ~= nil then var17(false) else var43.endTime)
					var23.TimePosition = clampedValue
					var20(clampedValue - var42)
					
					return
				end
			end,
			setRegion = function(value)
				-- upvalues: var4 (ref), var23 (write), var3 (ref), var17 (ref), var29 (write), var20 (ref)
				var4(value)
				
				if var23 then
					local var41 = var3(false)
					local var42 = var17(false)
					local var43 = if var41 ~= nil then var42 > 0 and (var41.startTime <= 0.05 and var42 - 0.05 <= var41.endTime) else true
					var29 = var43
					var23.Looping = var43
				end
				if var23 ~= nil then
					local var44 = var3(false)
					local var45 = if var44 ~= nil then 0 else var44.startTime
					local var46 = var3(false)
					local clampedValue = math.clamp(var23.TimePosition, var45, if var46 ~= nil then var17(false) else var46.endTime)
					var23.TimePosition = clampedValue
					var20(clampedValue - var45)
				end
			end,
			dispose = function()
				-- upvalues: var40 (write), var39 (write), var30 (write), var36 (write), var38 (write), var33 (write), var34 (write), var35 (write), var28 (write), var24 (write), var27 (write), var26 (write), t (ref), var23 (write), var25 (write)
				if var40 then return end
				var40 = true
				var39 += 1
				var30 = false
				var36 = nil
				var38 = false
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
				local var41 = var25
				
				if var30 and var23 and var41 then
					if var24 then return end
					local wire = Instance.new("Wire")
					wire.SourceInstance = var23
					wire.TargetInstance = var41
					wire.Parent = var23
					var24 = wire
				end
			end
		}
	end
}