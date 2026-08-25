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
local var8 = createSignal(Enum.ScaleType.Crop)

local function VideoSurface(p0)
	-- upvalues: useSignalState (ref), reactModule (ref), createComputed (ref), var8 (ref), fFlagMomentsVideoCropRoundedCornersModule (ref), getFitSizeModule (ref), getCropSizeModule (ref)
	local var11 = useSignalState(p0.getItemSize)
	local getResolution = p0.getResolution
	local var12 = useSignalState(reactModule.useMemo(function()
		-- upvalues: createComputed (copy), getResolution (ref)
		return createComputed(function(p1)
			-- upvalues: getResolution (copy)
			return getResolution(p1)
		end)
	end, { getResolution }))
	local var13 = useSignalState(p0.getScaleType or var8)
	local uDim2 = UDim2.fromScale(1, 1)
	local stretch = Enum.ScaleType.Stretch
	
	if fFlagMomentsVideoCropRoundedCornersModule and var13 ~= Enum.ScaleType.Fit then
		stretch = Enum.ScaleType.Crop
	elseif var12 ~= nil and var12.X > 0 and var12.Y > 0 then
		uDim2 = if var13 == Enum.ScaleType.Fit then getFitSizeModule(var11, var12) else getCropSizeModule(var11, var12)
	end
	return reactModule.createElement("VideoDisplay", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = uDim2,
		ScaleType = stretch,
		ZIndex = p0.zIndex,
		ref = p0.setSurface
	}, {
		Corner = if p0.cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) })
	})
end

local function defaultObserveLoaded(p2)
	return {
		getIsLoaded = function()
			-- upvalues: p2 (ref)
			return p2.IsLoaded
		end,
		connect = function(p3)
			-- upvalues: p2 (ref)
			local var15 = p2:GetPropertyChangedSignal("IsLoaded"):Connect(function()
				-- upvalues: p3 (ref), p2 (copy)
				p3(p2.IsLoaded)
			end)
			
			return function()
				-- upvalues: var15 (ref)
				var15:Disconnect()
			end
		end
	}
end

return {
	kind = "video",
	create = function(p4, p5)
		-- upvalues: createSignal (ref), defaultObserveLoaded (ref), createComputed (ref), getFFlagMomentsVideoSurfaceMediaRectModule (ref), reactModule (ref), VideoSurface (ref)
		local id = p4.id
		local content = p4.content
		local var16, var17 = createSignal(p4.region)
		local parent = p4.parent
		local zIndex = p4.zIndex or 0
		local cornerRadius = p4.cornerRadius
		local runService = p5.runService
		local contentProvider = p5.contentProvider
		local observeLoaded = p5.observeLoaded or defaultObserveLoaded
		local loadVideo = p5.loadVideo or function(p6)
			return p6:LoadAsync()
		end
		
		local function _()
			-- upvalues: var16 (ref)
			local var49 = var16(false)
			
			return if var49 == nil then 0 else var49.startTime
		end
		
		local var21, var22 = createSignal(false)
		local var23, var24 = createSignal(false)
		local var25, var26 = createSignal(false)
		local var27, var28 = createSignal(false)
		local var29, var30 = createSignal(nil)
		local var31, var32 = createSignal(nil)
		local var33, var34 = createSignal(0)
		local var35, var36 = createSignal(0)
		local var37 = createComputed(function(p7)
			-- upvalues: var25 (ref), var23 (ref), var21 (ref)
			return if var25(p7) then "Playing" elseif var23(p7) then "Decoded" elseif var21(p7) then "Downloaded" else "Idle"
		end)
		local var38 = createComputed(function(p8)
			-- upvalues: var16 (ref), var33 (ref)
			local var50 = var16(p8)
			
			return if var50 == nil then var33(p8) else var50.endTime - var50.startTime
		end)
		local var39 = nil
		local var40 = nil
		local var41 = nil
		local t = {}
		local var43 = nil
		local var44 = nil
		local var45 = false
		local var46 = 0
		local var47 = false
		
		local _ = function()
			-- upvalues: var16 (ref), var33 (ref)
			local var51 = var16(false)
			
			return if var51 == nil then var33(false) else var51.endTime
		end
		
		local _ = function()
			-- upvalues: var39 (write), var16 (ref), var33 (ref), var45 (write)
			if not var39 then return end
			local var52 = var16(false)
			local var53 = var33(false)
			local var54 = if var52 ~= nil then var53 > 0 and (var52.startTime <= 0.05 and var53 - 0.05 <= var52.endTime) else true
			var45 = var54
			var39.Looping = var54
		end
		
		local _ = function()
			-- upvalues: var39 (write), var41 (write), var40 (write)
			if var39 and var41 and not var40 then
				local wire = Instance.new("Wire")
				wire.SourceInstance = var39
				wire.TargetInstance = var41
				wire.Parent = var39
				var40 = wire
				
				return
			end
		end
		
		local _ = function()
			-- upvalues: var40 (write)
			if var40 then
				var40:Destroy()
				var40 = nil
			end
		end
		
		local function onStep()
			-- upvalues: var39 (write), var16 (ref), var45 (write), var33 (ref), var36 (ref)
			if not var39 then return end
			local var56 = var16(false)
			local var57 = if var56 ~= nil then 0 else var56.startTime
			local timePosition = var39.TimePosition
			
			if not var45 then
				local var58 = var16(false)
				
				if (if var58 ~= nil then var33(false) else var58.endTime) - 0.05 <= timePosition then
					timePosition = var57
					var39.TimePosition = var57
				end
			end
			var36(timePosition - var57)
		end
		
		local _ = function()
			-- upvalues: var44 (write), runService (ref), onStep (ref)
			if var44 then
				return
			end
			var44 = runService.RenderStepped:Connect(onStep)
		end
		
		local _ = function()
			-- upvalues: var44 (write)
			if var44 then
				var44:Disconnect()
				var44 = nil
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
				-- upvalues: var46 (write), contentProvider (ref), content (ref), var47 (write), var22 (ref)
				contentProvider:PreloadAsync({ content.Uri })
				
				if var47 or var46 ~= var46 then
					return
				end
				var22(true)
			end,
			decode = function()
				-- upvalues: var47 (write), var39 (write), var30 (ref), content (ref), parent (ref), observeLoaded (ref), var28 (ref), var43 (write), var32 (ref), t (ref), var34 (ref), var16 (ref), var33 (ref), var45 (write), var41 (write), var40 (write), loadVideo (ref), var24 (ref)
				if var47 or var39 then return end
				var30(nil)
				local videoPlayer_1 = Instance.new("VideoPlayer")
				videoPlayer_1.Name = "VideoPlayer"
				videoPlayer_1.Looping = false
				videoPlayer_1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
				videoPlayer_1.VideoContent = content
				videoPlayer_1.Parent = parent
				var39 = videoPlayer_1
				local var60 = observeLoaded(videoPlayer_1)
				var28(var60.getIsLoaded())
				var43 = var60.connect(function(p9)
					-- upvalues: var28 (copy)
					var28(p9)
				end)
				
				local function readResolution()
					-- upvalues: videoPlayer_1 (ref), var32 (copy)
					local resolution = videoPlayer_1.Resolution
					var32(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				end
				
				local resolution = videoPlayer_1.Resolution
				var32(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				table.insert(t, videoPlayer_1:GetPropertyChangedSignal("Resolution"):Connect(readResolution))
				var34(videoPlayer_1.TimeLength)
				table.insert(t, videoPlayer_1:GetPropertyChangedSignal("TimeLength"):Connect(function()
					-- upvalues: var34 (copy), videoPlayer_1 (ref), var39 (copy), var16 (copy), var33 (copy), var45 (copy)
					var34(videoPlayer_1.TimeLength)
					
					if not var39 then return end
					local var66 = var16(false)
					local var67 = var33(false)
					local var68 = if var66 ~= nil then var67 > 0 and (var66.startTime <= 0.05 and var67 - 0.05 <= var66.endTime) else true
					var45 = var68
					var39.Looping = var68
				end))
				resolution = var39
				
				if resolution then
					local var62 = var16(false)
					local var63 = var33(false)
					local var64 = if var62 ~= nil then var63 > 0 and (var62.startTime <= 0.05 and var63 - 0.05 <= var62.endTime) else true
					var45 = var64
					resolution.Looping = var64
				end
				resolution = var39
				
				if resolution and var41 and not var40 then
					local wire = Instance.new("Wire")
					wire.SourceInstance = resolution
					wire.TargetInstance = var41
					wire.Parent = resolution
					var40 = wire
				end
				task.spawn(function()
					-- upvalues: var47 (copy), var39 (copy), videoPlayer_1 (ref), loadVideo (copy), var30 (copy), var28 (copy), var60 (ref)
					if var47 or var39 ~= videoPlayer_1 then return end
					local ok, status = pcall(loadVideo, videoPlayer_1)
					
					if var47 or var39 ~= videoPlayer_1 then return end
					if not ok then
						var30(`video load errored: {tostring(status)}`)
						
						return
					elseif status == Enum.AssetFetchStatus.Success then
						var28(var60.getIsLoaded())
						var30(nil)
						
						return
					end
					var30(`video load failed: {status.Name}`)
				end)
				var24(true)
			end,
			releaseDecoder = function()
				-- upvalues: var39 (write), var44 (write), var26 (ref), var40 (write), var43 (write), t (ref), var24 (ref), var28 (ref), var30 (ref), var36 (ref)
				if not var39 then return end
				if var44 then
					var44:Disconnect()
					var44 = nil
				end
				var26(false)
				
				if var40 then
					var40:Destroy()
					var40 = nil
				end
				if var43 then
					var43()
					var43 = nil
				end
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				var39 = nil
				var39:Destroy()
				var24(false)
				var28(false)
				var30(nil)
				var36(0)
			end,
			getResourceLevel = var37,
			getAudioSource = function()
				-- upvalues: var39 (write)
				assert(var39, "createVideoNode: getAudioSource() requires decode() first")
				
				return var39
			end,
			render = function(p10)
				-- upvalues: getFFlagMomentsVideoSurfaceMediaRectModule (copy), reactModule (copy), VideoSurface (copy), zIndex (ref), cornerRadius (ref)
				return if getFFlagMomentsVideoSurfaceMediaRectModule() then reactModule.createElement(VideoSurface, {
					getItemSize = p10.getItemSize,
					getResolution = p10.getResolution,
					getScaleType = p10.getScaleType,
					setSurface = p10.setSurface,
					zIndex = zIndex,
					cornerRadius = cornerRadius
				}) else reactModule.createElement("VideoDisplay", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ScaleType = p10.scaleType or Enum.ScaleType.Crop,
					ZIndex = zIndex,
					ref = function(p11)
						-- upvalues: p10 (ref)
						p10.setSurface(p11)
					end
				}, {
					Corner = if cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) })
				})
			end,
			play = function()
				-- upvalues: var39 (write), var16 (ref), var36 (ref), var26 (ref), var44 (write), runService (ref), onStep (ref)
				if not var39 then return end
				local var69 = var16(false)
				var39.TimePosition = if var69 ~= nil then 0 else var69.startTime
				var36(0)
				var39:Play()
				var26(true)
				
				if var44 then
					return
				end
				var44 = runService.RenderStepped:Connect(onStep)
			end,
			pause = function()
				-- upvalues: var39 (write), var26 (ref), var44 (write)
				if not var39 then return end
				var39:Pause()
				var26(false)
				
				if var44 then
					var44:Disconnect()
					var44 = nil
				end
			end,
			seek = function(p12)
				-- upvalues: var39 (write), var16 (ref), var33 (ref), var36 (ref)
				if var39 then
					local var70 = var16(false)
					local var71 = if var70 ~= nil then 0 else var70.startTime
					local var72 = var16(false)
					local clampedValue = math.clamp(var71 + p12, var71, if var72 ~= nil then var33(false) else var72.endTime)
					var39.TimePosition = clampedValue
					var36(clampedValue - var71)
					
					return
				end
			end,
			setRegion = function(value)
				-- upvalues: var17 (ref), var39 (write), var16 (ref), var33 (ref), var45 (write), var36 (ref)
				var17(value)
				
				if var39 then
					local var74 = var16(false)
					local var75 = var33(false)
					local var76 = if var74 ~= nil then var75 > 0 and (var74.startTime <= 0.05 and var75 - 0.05 <= var74.endTime) else true
					var45 = var76
					var39.Looping = var76
				end
				if var39 ~= nil then
					local var77 = var16(false)
					local var78 = if var77 ~= nil then 0 else var77.startTime
					local var79 = var16(false)
					local clampedValue = math.clamp(var39.TimePosition, var78, if var79 ~= nil then var33(false) else var79.endTime)
					var39.TimePosition = clampedValue
					var36(clampedValue - var78)
				end
			end,
			dispose = function()
				-- upvalues: var47 (write), var46 (write), var44 (write), var40 (write), var43 (write), t (ref), var39 (write), var41 (write)
				if var47 then return end
				var47 = true
				var46 += 1
				
				if var44 then
					var44:Disconnect()
					var44 = nil
				end
				if var40 then
					var40:Destroy()
					var40 = nil
				end
				if var43 then
					var43()
					var43 = nil
				end
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				
				if var39 then
					var39:Destroy()
					var39 = nil
				end
				var41 = nil
			end,
			getIsLoaded = var27,
			getFailureReason = var29,
			getResolution = var31,
			getTimeLength = var33,
			getDuration = var38,
			getPosition = var35,
			setSurface = function(value)
				-- upvalues: var41 (write), var40 (write), var39 (write)
				if value == var41 then return end
				if var40 then
					var40:Destroy()
					var40 = nil
				end
				var41 = value
				local var81 = var41
				
				if var39 and var81 then
					if var40 then return end
					local wire = Instance.new("Wire")
					wire.SourceInstance = var39
					wire.TargetInstance = var81
					wire.Parent = var39
					var40 = wire
				end
			end
		}
	end
}