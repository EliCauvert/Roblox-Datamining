local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local fFlagLuaAppMomentsInternalVideoUsage = sharedFlagsModule.FFlagLuaAppMomentsInternalVideoUsage

local function defaultObserveLoaded(p0) --[[ line: 100 ]]
	return {
		getIsLoaded = function() --[[ line: 102 ]]
			-- upvalues: p0 (ref)
			return p0.IsLoaded
		end,
		connect = function(p1) --[[ line: 105 ]]
			-- upvalues: p0 (ref)
			local var5 = p0:GetPropertyChangedSignal("IsLoaded"):Connect(function() --[[ line: 106 ]]
				-- upvalues: p1 (ref), p0 (copy)
				p1(p0.IsLoaded)
			end)
			
			return function() --[[ line: 109 ]]
				-- upvalues: var5 (ref)
				var5:Disconnect()
			end
		end
	}
end

return {
	kind = "video",
	create = function(p2, p3) --[[ line: 116 ]]
		-- upvalues: createSignal (ref), defaultObserveLoaded (ref), createComputed (ref), fFlagLuaAppMomentsInternalVideoUsage (ref), reactModule (ref)
		local id = p2.id
		local content = p2.content
		local var6, var7 = createSignal(p2.region)
		local parent = p2.parent
		local zIndex = p2.zIndex or 0
		local cornerRadius = p2.cornerRadius
		local runService = p3.runService
		local contentProvider = p3.contentProvider
		local observeLoaded = p3.observeLoaded or defaultObserveLoaded
		local loadVideo = p3.loadVideo or function(p4) --[[ line: 137 ]]
			return p4:LoadAsync()
		end
		
		local function _() --[[ line: 141 | named "getRegionStart" ]]
			-- upvalues: var6 (ref)
			local var39 = var6(false)
			
			return if var39 == nil then 0 else var39.startTime
		end
		
		local var11, var12 = createSignal(false)
		local var13, var14 = createSignal(false)
		local var15, var16 = createSignal(false)
		local var17, var18 = createSignal(false)
		local var19, var20 = createSignal(nil)
		local var21, var22 = createSignal(nil)
		local var23, var24 = createSignal(0)
		local var25, var26 = createSignal(0)
		local var27 = createComputed(function(p5) --[[ line: 163 ]]
			-- upvalues: var15 (ref), var13 (ref), var11 (ref)
			return if var15(p5) then "Playing" elseif var13(p5) then "Decoded" elseif var11(p5) then "Downloaded" else "Idle"
		end)
		local var28 = createComputed(function(p6) --[[ line: 174 ]]
			-- upvalues: var6 (ref), var23 (ref)
			local var40 = var6(p6)
			
			return if var40 == nil then var23(p6) else var40.endTime - var40.startTime
		end)
		local var29 = nil
		local var30 = nil
		local var31 = nil
		local t = {}
		local var33 = nil
		local var34 = nil
		local var35 = false
		local var36 = 0
		local var37 = false
		
		local _ = function() --[[ line: 196 | named "regionEnd" ]]
			-- upvalues: var6 (ref), var23 (ref)
			local var41 = var6(false)
			
			return if var41 == nil then var23(false) else var41.endTime
		end
		
		local _ = function() --[[ line: 203 | named "applyLoopingMode" ]]
			-- upvalues: var29 (write), var6 (ref), var23 (ref), var35 (write)
			if not var29 then return end
			local var42 = var6(false)
			local var43 = var23(false)
			local var44 = if var42 ~= nil then var43 > 0 and (var42.startTime <= 0.05 and var43 - 0.05 <= var42.endTime) else true
			var35 = var44
			var29.Looping = var44
		end
		
		local _ = function() --[[ line: 216 | named "ensureWire" ]]
			-- upvalues: var29 (write), var31 (write), var30 (write)
			if var29 and var31 and not var30 then
				local wire = Instance.new("Wire")
				wire.SourceInstance = var29
				wire.TargetInstance = var31
				wire.Parent = var29
				var30 = wire
				
				return
			end
		end
		
		local _ = function() --[[ line: 231 | named "tearWire" ]]
			-- upvalues: var30 (write)
			if var30 then
				var30:Destroy()
				var30 = nil
			end
		end
		
		local function onStep() --[[ line: 238 ]]
			-- upvalues: var29 (write), var6 (ref), var35 (write), var23 (ref), var26 (ref)
			if not var29 then return end
			local var46 = var6(false)
			local var47 = if var46 ~= nil then 0 else var46.startTime
			local timePosition = var29.TimePosition
			
			if not var35 then
				local var48 = var6(false)
				
				if (if var48 ~= nil then var23(false) else var48.endTime) - 0.05 <= timePosition then
					timePosition = var47
					var29.TimePosition = var47
				end
			end
			var26(timePosition - var47)
		end
		
		local _ = function() --[[ line: 252 | named "startPlaybackLoop" ]]
			-- upvalues: var34 (write), runService (ref), onStep (ref)
			if var34 then
				return
			end
			var34 = runService.RenderStepped:Connect(onStep)
		end
		
		local _ = function() --[[ line: 259 | named "stopPlaybackLoop" ]]
			-- upvalues: var34 (write)
			if var34 then
				var34:Disconnect()
				var34 = nil
			end
		end
		
		return {
			kind = "video",
			usesDecoder = true,
			id = id,
			zIndex = zIndex,
			audioStem = { defaultVolume = 1, stemId = id },
			assets = function() --[[ line: 266 ]]
				-- upvalues: content (ref)
				return { content }
			end,
			download = function() --[[ line: 270 ]]
				-- upvalues: var36 (write), contentProvider (ref), content (ref), var37 (write), var12 (ref)
				contentProvider:PreloadAsync({ content.Uri })
				
				if var37 or var36 ~= var36 then
					return
				end
				var12(true)
			end,
			decode = function() --[[ line: 284 ]]
				-- upvalues: var37 (write), var29 (write), var20 (ref), fFlagLuaAppMomentsInternalVideoUsage (copy), content (ref), parent (ref), observeLoaded (ref), var18 (ref), var33 (write), var22 (ref), t (ref), var24 (ref), var6 (ref), var23 (ref), var35 (write), var31 (write), var30 (write), loadVideo (ref), var14 (ref)
				if var37 or var29 then return end
				var20(nil)
				local videoPlayer_1 = Instance.new("VideoPlayer")
				videoPlayer_1.Name = "VideoPlayer"
				videoPlayer_1.Looping = false
				
				if fFlagLuaAppMomentsInternalVideoUsage then
					videoPlayer_1.InternalVideoUsage = Enum.InternalVideoUsage.WatchPage
				end
				videoPlayer_1.VideoContent = content
				videoPlayer_1.Parent = parent
				var29 = videoPlayer_1
				local var50 = observeLoaded(videoPlayer_1)
				var18(var50.getIsLoaded())
				var33 = var50.connect(function(p7) --[[ line: 302 ]]
					-- upvalues: var18 (copy)
					var18(p7)
				end)
				
				local function readResolution() --[[ line: 306 ]]
					-- upvalues: videoPlayer_1 (ref), var22 (copy)
					local resolution = videoPlayer_1.Resolution
					var22(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				end
				
				local resolution = videoPlayer_1.Resolution
				var22(if resolution.X > 0 and resolution.Y > 0 then resolution else nil)
				table.insert(t, videoPlayer_1:GetPropertyChangedSignal("Resolution"):Connect(readResolution))
				var24(videoPlayer_1.TimeLength)
				table.insert(t, videoPlayer_1:GetPropertyChangedSignal("TimeLength"):Connect(function() --[[ line: 316 ]]
					-- upvalues: var24 (copy), videoPlayer_1 (ref), var29 (copy), var6 (copy), var23 (copy), var35 (copy)
					var24(videoPlayer_1.TimeLength)
					
					if not var29 then return end
					local var56 = var6(false)
					local var57 = var23(false)
					local var58 = if var56 ~= nil then var57 > 0 and (var56.startTime <= 0.05 and var57 - 0.05 <= var56.endTime) else true
					var35 = var58
					var29.Looping = var58
				end))
				resolution = var29
				
				if resolution then
					local var52 = var6(false)
					local var53 = var23(false)
					local var54 = if var52 ~= nil then var53 > 0 and (var52.startTime <= 0.05 and var53 - 0.05 <= var52.endTime) else true
					var35 = var54
					resolution.Looping = var54
				end
				resolution = var29
				
				if resolution and var31 and not var30 then
					local wire = Instance.new("Wire")
					wire.SourceInstance = resolution
					wire.TargetInstance = var31
					wire.Parent = resolution
					var30 = wire
				end
				task.spawn(function() --[[ line: 329 ]]
					-- upvalues: var37 (copy), var29 (copy), videoPlayer_1 (ref), loadVideo (copy), var20 (copy), var18 (copy), var50 (ref)
					if var37 or var29 ~= videoPlayer_1 then return end
					local ok, status = pcall(loadVideo, videoPlayer_1)
					
					if var37 or var29 ~= videoPlayer_1 then return end
					if not ok then
						var20(`video load errored: {tostring(status)}`)
						
						return
					elseif status == Enum.AssetFetchStatus.Success then
						var18(var50.getIsLoaded())
						var20(nil)
						
						return
					end
					var20(`video load failed: {status.Name}`)
				end)
				var14(true)
			end,
			releaseDecoder = function() --[[ line: 353 ]]
				-- upvalues: var29 (write), var34 (write), var16 (ref), var30 (write), var33 (write), t (ref), var14 (ref), var18 (ref), var20 (ref), var26 (ref)
				if not var29 then return end
				if var34 then
					var34:Disconnect()
					var34 = nil
				end
				var16(false)
				
				if var30 then
					var30:Destroy()
					var30 = nil
				end
				if var33 then
					var33()
					var33 = nil
				end
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				var29 = nil
				var29:Destroy()
				var14(false)
				var18(false)
				var20(nil)
				var26(0)
			end,
			getResourceLevel = var27,
			getAudioSource = function() --[[ line: 434 ]]
				-- upvalues: var29 (write)
				assert(var29, "createVideoNode: getAudioSource() requires decode() first")
				
				return var29
			end,
			render = function(p8) --[[ line: 451 ]]
				-- upvalues: reactModule (copy), zIndex (ref), cornerRadius (ref)
				return reactModule.createElement("VideoDisplay", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ScaleType = p8.scaleType or Enum.ScaleType.Crop,
					ZIndex = zIndex,
					ref = function(p9) --[[ line: 457 ]]
						-- upvalues: p8 (ref)
						p8.setSurface(p9)
					end
				}, {
					Corner = if cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) })
				})
			end,
			play = function() --[[ line: 383 ]]
				-- upvalues: var29 (write), var6 (ref), var26 (ref), var16 (ref), var34 (write), runService (ref), onStep (ref)
				if not var29 then return end
				local var59 = var6(false)
				var29.TimePosition = if var59 ~= nil then 0 else var59.startTime
				var26(0)
				var29:Play()
				var16(true)
				
				if var34 then
					return
				end
				var34 = runService.RenderStepped:Connect(onStep)
			end,
			pause = function() --[[ line: 397 ]]
				-- upvalues: var29 (write), var16 (ref), var34 (write)
				if not var29 then return end
				var29:Pause()
				var16(false)
				
				if var34 then
					var34:Disconnect()
					var34 = nil
				end
			end,
			seek = function(p10) --[[ line: 407 ]]
				-- upvalues: var29 (write), var6 (ref), var23 (ref), var26 (ref)
				if var29 then
					local var60 = var6(false)
					local var61 = if var60 ~= nil then 0 else var60.startTime
					local var62 = var6(false)
					local clampedValue = math.clamp(var61 + p10, var61, if var62 ~= nil then var23(false) else var62.endTime)
					var29.TimePosition = clampedValue
					var26(clampedValue - var61)
					
					return
				end
			end,
			setRegion = function(value) --[[ line: 420 ]]
				-- upvalues: var7 (ref), var29 (write), var6 (ref), var23 (ref), var35 (write), var26 (ref)
				var7(value)
				
				if var29 then
					local var64 = var6(false)
					local var65 = var23(false)
					local var66 = if var64 ~= nil then var65 > 0 and (var64.startTime <= 0.05 and var65 - 0.05 <= var64.endTime) else true
					var35 = var66
					var29.Looping = var66
				end
				if var29 ~= nil then
					local var67 = var6(false)
					local var68 = if var67 ~= nil then 0 else var67.startTime
					local var69 = var6(false)
					local clampedValue = math.clamp(var29.TimePosition, var68, if var69 ~= nil then var23(false) else var69.endTime)
					var29.TimePosition = clampedValue
					var26(clampedValue - var68)
				end
			end,
			dispose = function() --[[ line: 470 ]]
				-- upvalues: var37 (write), var36 (write), var34 (write), var30 (write), var33 (write), t (ref), var29 (write), var31 (write)
				if var37 then return end
				var37 = true
				var36 += 1
				
				if var34 then
					var34:Disconnect()
					var34 = nil
				end
				if var30 then
					var30:Destroy()
					var30 = nil
				end
				if var33 then
					var33()
					var33 = nil
				end
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				
				if var29 then
					var29:Destroy()
					var29 = nil
				end
				var31 = nil
			end,
			getIsLoaded = var17,
			getFailureReason = var19,
			getResolution = var21,
			getTimeLength = var23,
			getDuration = var28,
			getPosition = var25,
			setSurface = function(value) --[[ line: 442 ]]
				-- upvalues: var31 (write), var30 (write), var29 (write)
				if value == var31 then return end
				if var30 then
					var30:Destroy()
					var30 = nil
				end
				var31 = value
				local var71 = var31
				
				if var29 and var71 then
					if var30 then return end
					local wire = Instance.new("Wire")
					wire.SourceInstance = var29
					wire.TargetInstance = var71
					wire.Parent = var29
					var30 = wire
				end
			end
		}
	end
}