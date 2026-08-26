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
		-- upvalues: createSignal (ref), defaultObserveLoaded (ref), createComputed (ref), getFFlagMomentsVideoSurfaceMediaRectModule (ref), reactModule (ref), VideoSurface (ref)
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
		local var27 = false
		local var28 = 0
		local var29 = false
		
		local _ = function()
			-- upvalues: var2 (ref), var16 (ref)
			local var30 = var2(false)
			
			return if var30 == nil then var16(false) else var30.endTime
		end
		
		local _ = function()
			-- upvalues: var22 (write), var2 (ref), var16 (ref), var27 (write)
			if not var22 then return end
			local var30 = var2(false)
			local var31 = var16(false)
			local var32 = if var30 ~= nil then var31 > 0 and (var30.startTime <= 0.05 and var31 - 0.05 <= var30.endTime) else true
			var27 = var32
			var22.Looping = var32
		end
		
		local _ = function()
			-- upvalues: var22 (write), var24 (write), var23 (write)
			if var22 and var24 and not var23 then
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
			-- upvalues: var22 (write), var2 (ref), var27 (write), var16 (ref), var19 (ref)
			if not var22 then return end
			local var30 = var2(false)
			local var31 = if var30 ~= nil then 0 else var30.startTime
			local timePosition = var22.TimePosition
			
			if not var27 then
				local var32 = var2(false)
				
				if (if var32 ~= nil then var16(false) else var32.endTime) - 0.05 <= timePosition then
					timePosition = var31
					var22.TimePosition = var31
				end
			end
			var19(timePosition - var31)
		end
		
		local _ = function()
			-- upvalues: var26 (write), runService (ref), onStep (ref)
			if var26 then
				return
			end
			var26 = runService.RenderStepped:Connect(onStep)
		end
		
		local _ = function()
			-- upvalues: var26 (write)
			if var26 then
				var26:Disconnect()
				var26 = nil
			end
		end
		
		return {
			kind = "video",
			usesDecoder = true,
			id = id,
			zIndex = zIndex,
			audioStem = { defaultVolume = 1, stemId = id },
			assets = function()
				-- upvalues: content (ref)
				return { content }
			end,
			download = function()
				-- upvalues: var28 (write), contentProvider (ref), content (ref), var29 (write), var5 (ref)
				contentProvider:PreloadAsync({ content.Uri })
				
				if var29 or var28 ~= var28 then
					return
				end
				var5(true)
			end,
			decode = function()
				-- upvalues: var29 (write), var22 (write), var13 (ref), content (ref), parent (ref), observeLoaded (ref), var11 (ref), var25 (write), var15 (ref), t (ref), var17 (ref), var2 (ref), var16 (ref), var27 (write), var24 (write), var23 (write), loadVideo (ref), var7 (ref)
				if var29 or var22 then return end
				var13(nil)
				local videoPlayer_1 = Instance.new("VideoPlayer")
				videoPlayer_1.Name = "VideoPlayer"
				videoPlayer_1.Looping = false
				videoPlayer_1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
				videoPlayer_1.VideoContent = content
				videoPlayer_1.Parent = parent
				var22 = videoPlayer_1
				local var30 = observeLoaded(videoPlayer_1)
				var11(var30.getIsLoaded())
				var25 = var30.connect(function(p3)
					-- upvalues: var11 (copy)
					var11(p3)
				end)
				
				local function readResolution()
					-- upvalues: videoPlayer_1 (ref), var15 (copy)
					local resolution = videoPlayer_1.Resolution
					var15(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				end
				
				local resolution = videoPlayer_1.Resolution
				var15(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				table.insert(t, videoPlayer_1:GetPropertyChangedSignal("Resolution"):Connect(readResolution))
				var17(videoPlayer_1.TimeLength)
				table.insert(t, videoPlayer_1:GetPropertyChangedSignal("TimeLength"):Connect(function()
					-- upvalues: var17 (copy), videoPlayer_1 (ref), var22 (copy), var2 (copy), var16 (copy), var27 (copy)
					var17(videoPlayer_1.TimeLength)
					
					if not var22 then return end
					local var31 = var2(false)
					local var32 = var16(false)
					local var33 = if var31 ~= nil then var32 > 0 and (var31.startTime <= 0.05 and var32 - 0.05 <= var31.endTime) else true
					var27 = var33
					var22.Looping = var33
				end))
				resolution = var22
				
				if resolution then
					local var31 = var2(false)
					local var32 = var16(false)
					local var33 = if var31 ~= nil then var32 > 0 and (var31.startTime <= 0.05 and var32 - 0.05 <= var31.endTime) else true
					var27 = var33
					resolution.Looping = var33
				end
				resolution = var22
				
				if resolution and var24 and not var23 then
					local wire = Instance.new("Wire")
					wire.SourceInstance = resolution
					wire.TargetInstance = var24
					wire.Parent = resolution
					var23 = wire
				end
				task.spawn(function()
					-- upvalues: var29 (copy), var22 (copy), videoPlayer_1 (ref), loadVideo (copy), var13 (copy), var11 (copy), var30 (ref)
					if var29 or var22 ~= videoPlayer_1 then return end
					local ok, status = pcall(loadVideo, videoPlayer_1)
					
					if var29 or var22 ~= videoPlayer_1 then return end
					if not ok then
						var13(`video load errored: {tostring(status)}`)
						
						return
					elseif status == Enum.AssetFetchStatus.Success then
						var11(var30.getIsLoaded())
						var13(nil)
						
						return
					end
					var13(`video load failed: {status.Name}`)
				end)
				var7(true)
			end,
			releaseDecoder = function()
				-- upvalues: var22 (write), var26 (write), var9 (ref), var23 (write), var25 (write), t (ref), var7 (ref), var11 (ref), var13 (ref), var19 (ref)
				if not var22 then return end
				if var26 then
					var26:Disconnect()
					var26 = nil
				end
				var9(false)
				
				if var23 then
					var23:Destroy()
					var23 = nil
				end
				if var25 then
					var25()
					var25 = nil
				end
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				var22 = nil
				var22:Destroy()
				var7(false)
				var11(false)
				var13(nil)
				var19(0)
			end,
			getResourceLevel = var20,
			getAudioSource = function()
				-- upvalues: var22 (write)
				assert(var22, "createVideoNode: getAudioSource() requires decode() first")
				
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
				-- upvalues: var22 (write), var2 (ref), var19 (ref), var9 (ref), var26 (write), runService (ref), onStep (ref)
				if not var22 then return end
				local var30 = var2(false)
				var22.TimePosition = if var30 ~= nil then 0 else var30.startTime
				var19(0)
				var22:Play()
				var9(true)
				
				if var26 then
					return
				end
				var26 = runService.RenderStepped:Connect(onStep)
			end,
			pause = function()
				-- upvalues: var22 (write), var9 (ref), var26 (write)
				if not var22 then return end
				var22:Pause()
				var9(false)
				
				if var26 then
					var26:Disconnect()
					var26 = nil
				end
			end,
			seek = function(p3)
				-- upvalues: var22 (write), var2 (ref), var16 (ref), var19 (ref)
				if var22 then
					local var30 = var2(false)
					local var31 = if var30 ~= nil then 0 else var30.startTime
					local var32 = var2(false)
					local clampedValue = math.clamp(var31 + p3, var31, if var32 ~= nil then var16(false) else var32.endTime)
					var22.TimePosition = clampedValue
					var19(clampedValue - var31)
					
					return
				end
			end,
			setRegion = function(value)
				-- upvalues: var3 (ref), var22 (write), var2 (ref), var16 (ref), var27 (write), var19 (ref)
				var3(value)
				
				if var22 then
					local var30 = var2(false)
					local var31 = var16(false)
					local var32 = if var30 ~= nil then var31 > 0 and (var30.startTime <= 0.05 and var31 - 0.05 <= var30.endTime) else true
					var27 = var32
					var22.Looping = var32
				end
				if var22 ~= nil then
					local var33 = var2(false)
					local var34 = if var33 ~= nil then 0 else var33.startTime
					local var35 = var2(false)
					local clampedValue = math.clamp(var22.TimePosition, var34, if var35 ~= nil then var16(false) else var35.endTime)
					var22.TimePosition = clampedValue
					var19(clampedValue - var34)
				end
			end,
			dispose = function()
				-- upvalues: var29 (write), var28 (write), var26 (write), var23 (write), var25 (write), t (ref), var22 (write), var24 (write)
				if var29 then return end
				var29 = true
				var28 += 1
				
				if var26 then
					var26:Disconnect()
					var26 = nil
				end
				if var23 then
					var23:Destroy()
					var23 = nil
				end
				if var25 then
					var25()
					var25 = nil
				end
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
			setSurface = function(value)
				-- upvalues: var24 (write), var23 (write), var22 (write)
				if value == var24 then return end
				if var23 then
					var23:Destroy()
					var23 = nil
				end
				var24 = value
				local var30 = var24
				
				if var22 and var30 then
					if var23 then return end
					local wire = Instance.new("Wire")
					wire.SourceInstance = var22
					wire.TargetInstance = var30
					wire.Parent = var22
					var23 = wire
				end
			end
		}
	end
}