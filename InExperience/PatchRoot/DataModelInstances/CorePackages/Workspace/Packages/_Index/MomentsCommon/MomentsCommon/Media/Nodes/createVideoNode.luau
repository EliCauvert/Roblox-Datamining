local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
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
local fFlagLuaAppMomentsInternalVideoUsage = sharedFlagsModule.FFlagLuaAppMomentsInternalVideoUsage
local var9 = createSignal(Enum.ScaleType.Crop)

local function VideoSurface(p0) --[[ line: 76 ]]
	-- upvalues: useSignalState (ref), reactModule (ref), createComputed (ref), var9 (ref), fFlagMomentsVideoCropRoundedCornersModule (ref), getFitSizeModule (ref), getCropSizeModule (ref)
	local var12 = useSignalState(p0.getItemSize)
	local getResolution = p0.getResolution
	local var13 = useSignalState(reactModule.useMemo(function() --[[ line: 82 ]]
		-- upvalues: createComputed (copy), getResolution (ref)
		return createComputed(function(p1) --[[ line: 83 ]]
			-- upvalues: getResolution (copy)
			return getResolution(p1)
		end)
	end, { getResolution }))
	local var14 = useSignalState(p0.getScaleType or var9)
	local uDim2 = UDim2.fromScale(1, 1)
	local stretch = Enum.ScaleType.Stretch
	
	if fFlagMomentsVideoCropRoundedCornersModule and var14 ~= Enum.ScaleType.Fit then
		stretch = Enum.ScaleType.Crop
	elseif var13 ~= nil and var13.X > 0 and var13.Y > 0 then
		uDim2 = if var14 == Enum.ScaleType.Fit then getFitSizeModule(var12, var13) else getCropSizeModule(var12, var13)
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

local function defaultObserveLoaded(p2) --[[ line: 170 ]]
	return {
		getIsLoaded = function() --[[ line: 172 ]]
			-- upvalues: p2 (ref)
			return p2.IsLoaded
		end,
		connect = function(p3) --[[ line: 175 ]]
			-- upvalues: p2 (ref)
			local var16 = p2:GetPropertyChangedSignal("IsLoaded"):Connect(function() --[[ line: 176 ]]
				-- upvalues: p3 (ref), p2 (copy)
				p3(p2.IsLoaded)
			end)
			
			return function() --[[ line: 179 ]]
				-- upvalues: var16 (ref)
				var16:Disconnect()
			end
		end
	}
end

return {
	kind = "video",
	create = function(p4, p5) --[[ line: 186 ]]
		-- upvalues: createSignal (ref), defaultObserveLoaded (ref), createComputed (ref), fFlagLuaAppMomentsInternalVideoUsage (ref), getFFlagMomentsVideoSurfaceMediaRectModule (ref), reactModule (ref), VideoSurface (ref)
		local id = p4.id
		local content = p4.content
		local var17, var18 = createSignal(p4.region)
		local parent = p4.parent
		local zIndex = p4.zIndex or 0
		local cornerRadius = p4.cornerRadius
		local runService = p5.runService
		local contentProvider = p5.contentProvider
		local observeLoaded = p5.observeLoaded or defaultObserveLoaded
		local loadVideo = p5.loadVideo or function(p6) --[[ line: 207 ]]
			return p6:LoadAsync()
		end
		
		local function _() --[[ line: 211 | named "getRegionStart" ]]
			-- upvalues: var17 (ref)
			local var50 = var17(false)
			
			return if var50 == nil then 0 else var50.startTime
		end
		
		local var22, var23 = createSignal(false)
		local var24, var25 = createSignal(false)
		local var26, var27 = createSignal(false)
		local var28, var29 = createSignal(false)
		local var30, var31 = createSignal(nil)
		local var32, var33 = createSignal(nil)
		local var34, var35 = createSignal(0)
		local var36, var37 = createSignal(0)
		local var38 = createComputed(function(p7) --[[ line: 233 ]]
			-- upvalues: var26 (ref), var24 (ref), var22 (ref)
			return if var26(p7) then "Playing" elseif var24(p7) then "Decoded" elseif var22(p7) then "Downloaded" else "Idle"
		end)
		local var39 = createComputed(function(p8) --[[ line: 244 ]]
			-- upvalues: var17 (ref), var34 (ref)
			local var51 = var17(p8)
			
			return if var51 == nil then var34(p8) else var51.endTime - var51.startTime
		end)
		local var40 = nil
		local var41 = nil
		local var42 = nil
		local t = {}
		local var44 = nil
		local var45 = nil
		local var46 = false
		local var47 = 0
		local var48 = false
		
		local _ = function() --[[ line: 266 | named "regionEnd" ]]
			-- upvalues: var17 (ref), var34 (ref)
			local var52 = var17(false)
			
			return if var52 == nil then var34(false) else var52.endTime
		end
		
		local _ = function() --[[ line: 273 | named "applyLoopingMode" ]]
			-- upvalues: var40 (write), var17 (ref), var34 (ref), var46 (write)
			if not var40 then return end
			local var53 = var17(false)
			local var54 = var34(false)
			local var55 = if var53 ~= nil then var54 > 0 and (var53.startTime <= 0.05 and var54 - 0.05 <= var53.endTime) else true
			var46 = var55
			var40.Looping = var55
		end
		
		local _ = function() --[[ line: 286 | named "ensureWire" ]]
			-- upvalues: var40 (write), var42 (write), var41 (write)
			if var40 and var42 and not var41 then
				local wire = Instance.new("Wire")
				wire.SourceInstance = var40
				wire.TargetInstance = var42
				wire.Parent = var40
				var41 = wire
				
				return
			end
		end
		
		local _ = function() --[[ line: 301 | named "tearWire" ]]
			-- upvalues: var41 (write)
			if var41 then
				var41:Destroy()
				var41 = nil
			end
		end
		
		local function onStep() --[[ line: 308 ]]
			-- upvalues: var40 (write), var17 (ref), var46 (write), var34 (ref), var37 (ref)
			if not var40 then return end
			local var57 = var17(false)
			local var58 = if var57 ~= nil then 0 else var57.startTime
			local timePosition = var40.TimePosition
			
			if not var46 then
				local var59 = var17(false)
				
				if (if var59 ~= nil then var34(false) else var59.endTime) - 0.05 <= timePosition then
					timePosition = var58
					var40.TimePosition = var58
				end
			end
			var37(timePosition - var58)
		end
		
		local _ = function() --[[ line: 322 | named "startPlaybackLoop" ]]
			-- upvalues: var45 (write), runService (ref), onStep (ref)
			if var45 then
				return
			end
			var45 = runService.RenderStepped:Connect(onStep)
		end
		
		local _ = function() --[[ line: 329 | named "stopPlaybackLoop" ]]
			-- upvalues: var45 (write)
			if var45 then
				var45:Disconnect()
				var45 = nil
			end
		end
		
		return {
			kind = "video",
			usesDecoder = true,
			id = id,
			zIndex = zIndex,
			audioStem = { defaultVolume = 1, stemId = id },
			assets = function() --[[ line: 336 ]]
				-- upvalues: content (ref)
				return { content }
			end,
			download = function() --[[ line: 340 ]]
				-- upvalues: var47 (write), contentProvider (ref), content (ref), var48 (write), var23 (ref)
				contentProvider:PreloadAsync({ content.Uri })
				
				if var48 or var47 ~= var47 then
					return
				end
				var23(true)
			end,
			decode = function() --[[ line: 354 ]]
				-- upvalues: var48 (write), var40 (write), var31 (ref), fFlagLuaAppMomentsInternalVideoUsage (copy), content (ref), parent (ref), observeLoaded (ref), var29 (ref), var44 (write), var33 (ref), t (ref), var35 (ref), var17 (ref), var34 (ref), var46 (write), var42 (write), var41 (write), loadVideo (ref), var25 (ref)
				if var48 or var40 then return end
				var31(nil)
				local videoPlayer_1 = Instance.new("VideoPlayer")
				videoPlayer_1.Name = "VideoPlayer"
				videoPlayer_1.Looping = false
				
				if fFlagLuaAppMomentsInternalVideoUsage then
					videoPlayer_1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
				end
				videoPlayer_1.VideoContent = content
				videoPlayer_1.Parent = parent
				var40 = videoPlayer_1
				local var61 = observeLoaded(videoPlayer_1)
				var29(var61.getIsLoaded())
				var44 = var61.connect(function(p9) --[[ line: 372 ]]
					-- upvalues: var29 (copy)
					var29(p9)
				end)
				
				local function readResolution() --[[ line: 376 ]]
					-- upvalues: videoPlayer_1 (ref), var33 (copy)
					local resolution = videoPlayer_1.Resolution
					var33(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				end
				
				local resolution = videoPlayer_1.Resolution
				var33(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				table.insert(t, videoPlayer_1:GetPropertyChangedSignal("Resolution"):Connect(readResolution))
				var35(videoPlayer_1.TimeLength)
				table.insert(t, videoPlayer_1:GetPropertyChangedSignal("TimeLength"):Connect(function() --[[ line: 386 ]]
					-- upvalues: var35 (copy), videoPlayer_1 (ref), var40 (copy), var17 (copy), var34 (copy), var46 (copy)
					var35(videoPlayer_1.TimeLength)
					
					if not var40 then return end
					local var67 = var17(false)
					local var68 = var34(false)
					local var69 = if var67 ~= nil then var68 > 0 and (var67.startTime <= 0.05 and var68 - 0.05 <= var67.endTime) else true
					var46 = var69
					var40.Looping = var69
				end))
				resolution = var40
				
				if resolution then
					local var63 = var17(false)
					local var64 = var34(false)
					local var65 = if var63 ~= nil then var64 > 0 and (var63.startTime <= 0.05 and var64 - 0.05 <= var63.endTime) else true
					var46 = var65
					resolution.Looping = var65
				end
				resolution = var40
				
				if resolution and var42 and not var41 then
					local wire = Instance.new("Wire")
					wire.SourceInstance = resolution
					wire.TargetInstance = var42
					wire.Parent = resolution
					var41 = wire
				end
				task.spawn(function() --[[ line: 399 ]]
					-- upvalues: var48 (copy), var40 (copy), videoPlayer_1 (ref), loadVideo (copy), var31 (copy), var29 (copy), var61 (ref)
					if var48 or var40 ~= videoPlayer_1 then return end
					local ok, status = pcall(loadVideo, videoPlayer_1)
					
					if var48 or var40 ~= videoPlayer_1 then return end
					if not ok then
						var31(`video load errored: {tostring(status)}`)
						
						return
					elseif status == Enum.AssetFetchStatus.Success then
						var29(var61.getIsLoaded())
						var31(nil)
						
						return
					end
					var31(`video load failed: {status.Name}`)
				end)
				var25(true)
			end,
			releaseDecoder = function() --[[ line: 423 ]]
				-- upvalues: var40 (write), var45 (write), var27 (ref), var41 (write), var44 (write), t (ref), var25 (ref), var29 (ref), var31 (ref), var37 (ref)
				if not var40 then return end
				if var45 then
					var45:Disconnect()
					var45 = nil
				end
				var27(false)
				
				if var41 then
					var41:Destroy()
					var41 = nil
				end
				if var44 then
					var44()
					var44 = nil
				end
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				var40 = nil
				var40:Destroy()
				var25(false)
				var29(false)
				var31(nil)
				var37(0)
			end,
			getResourceLevel = var38,
			getAudioSource = function() --[[ line: 504 ]]
				-- upvalues: var40 (write)
				assert(var40, "createVideoNode: getAudioSource() requires decode() first")
				
				return var40
			end,
			render = function(p10) --[[ line: 521 ]]
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
					ref = function(p11) --[[ line: 541 ]]
						-- upvalues: p10 (ref)
						p10.setSurface(p11)
					end
				}, {
					Corner = if cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) })
				})
			end,
			play = function() --[[ line: 453 ]]
				-- upvalues: var40 (write), var17 (ref), var37 (ref), var27 (ref), var45 (write), runService (ref), onStep (ref)
				if not var40 then return end
				local var70 = var17(false)
				var40.TimePosition = if var70 ~= nil then 0 else var70.startTime
				var37(0)
				var40:Play()
				var27(true)
				
				if var45 then
					return
				end
				var45 = runService.RenderStepped:Connect(onStep)
			end,
			pause = function() --[[ line: 467 ]]
				-- upvalues: var40 (write), var27 (ref), var45 (write)
				if not var40 then return end
				var40:Pause()
				var27(false)
				
				if var45 then
					var45:Disconnect()
					var45 = nil
				end
			end,
			seek = function(p12) --[[ line: 477 ]]
				-- upvalues: var40 (write), var17 (ref), var34 (ref), var37 (ref)
				if var40 then
					local var71 = var17(false)
					local var72 = if var71 ~= nil then 0 else var71.startTime
					local var73 = var17(false)
					local clampedValue = math.clamp(var72 + p12, var72, if var73 ~= nil then var34(false) else var73.endTime)
					var40.TimePosition = clampedValue
					var37(clampedValue - var72)
					
					return
				end
			end,
			setRegion = function(value) --[[ line: 490 ]]
				-- upvalues: var18 (ref), var40 (write), var17 (ref), var34 (ref), var46 (write), var37 (ref)
				var18(value)
				
				if var40 then
					local var75 = var17(false)
					local var76 = var34(false)
					local var77 = if var75 ~= nil then var76 > 0 and (var75.startTime <= 0.05 and var76 - 0.05 <= var75.endTime) else true
					var46 = var77
					var40.Looping = var77
				end
				if var40 ~= nil then
					local var78 = var17(false)
					local var79 = if var78 ~= nil then 0 else var78.startTime
					local var80 = var17(false)
					local clampedValue = math.clamp(var40.TimePosition, var79, if var80 ~= nil then var34(false) else var80.endTime)
					var40.TimePosition = clampedValue
					var37(clampedValue - var79)
				end
			end,
			dispose = function() --[[ line: 554 ]]
				-- upvalues: var48 (write), var47 (write), var45 (write), var41 (write), var44 (write), t (ref), var40 (write), var42 (write)
				if var48 then return end
				var48 = true
				var47 += 1
				
				if var45 then
					var45:Disconnect()
					var45 = nil
				end
				if var41 then
					var41:Destroy()
					var41 = nil
				end
				if var44 then
					var44()
					var44 = nil
				end
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				
				if var40 then
					var40:Destroy()
					var40 = nil
				end
				var42 = nil
			end,
			getIsLoaded = var28,
			getFailureReason = var30,
			getResolution = var32,
			getTimeLength = var34,
			getDuration = var39,
			getPosition = var36,
			setSurface = function(value) --[[ line: 512 ]]
				-- upvalues: var42 (write), var41 (write), var40 (write)
				if value == var42 then return end
				if var41 then
					var41:Destroy()
					var41 = nil
				end
				var42 = value
				local var82 = var42
				
				if var40 and var82 then
					if var41 then return end
					local wire = Instance.new("Wire")
					wire.SourceInstance = var40
					wire.TargetInstance = var82
					wire.Parent = var40
					var41 = wire
				end
			end
		}
	end
}