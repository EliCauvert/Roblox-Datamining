local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local _ = require(parent.MomentsTypes)
local _ = require(momentsCommon.Media.MediaTypes)
local createAudioGraphModule = require(momentsCommon.Media.createAudioGraph)
local mediaRootModule = require(momentsCommon.Media.mediaRoot)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local defaultMediaNodeRegistryModule = require(momentsCommon.Media.defaultMediaNodeRegistry)
local preloadConstantsModule = require(momentsCommon.Media.Preload.preloadConstants)
local fFlagMomentsLoopOnEndSeekModule = require(momentsCommon.Flags.FFlagMomentsLoopOnEndSeek)
local _ = require(momentsCommon.Media.Nodes.createVideoNode)
local _ = require(momentsCommon.Media.Nodes.createScreenshotNode)
local _ = require(momentsCommon.Media.Nodes.createMusicNode)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local getFFlagMomentsStickerButtonModule = require(momentsCommon.Flags.GetFFlagMomentsStickerButton)
local loopEpsilonSeconds = preloadConstantsModule.loopEpsilonSeconds

return function(p0, p1) --[[ line: 102 | named "createMomentMediaController" ]]
	-- upvalues: defaultMediaNodeRegistryModule (ref), mediaRootModule (ref), createAudioGraphModule (ref), getFFlagMomentsStickerButtonModule (ref), createSignal (ref), createComputed (ref), cryoModule (ref), loopEpsilonSeconds (ref), fFlagMomentsLoopOnEndSeekModule (ref)
	local services = p1.services
	local registry = p1.registry or defaultMediaNodeRegistryModule()
	local var10 = p0.captureType == Enum.CaptureType.Video
	local var11 = mediaRootModule(p0.momentId, p1.parent)
	local folder = var11.folder
	local var12 = createAudioGraphModule(folder, p1.audioDeviceOutput, p1.masterVolume)
	local edits = p0.edits
	local t = {}
	local t_1 = {}
	
	local function _(p2) --[[ line: 118 | named "addNode" ]]
		-- upvalues: t (ref), t_1 (ref)
		table.insert(t, p2)
		t_1[p2.id] = p2
	end
	
	local var15 = nil
	local var16 = nil
	
	if var10 then
		local video = registry.create("video", {
			id = "video",
			kind = "video",
			zIndex = 0,
			content = p0.content,
			region = if edits ~= nil then nil else edits.trim,
			parent = folder,
			cornerRadius = p0.cornerRadius
		}, services)
		var15 = video
		table.insert(t, video)
		t_1[video.id] = video
	else
		local screenshot = registry.create("screenshot", {
			id = "screenshot",
			kind = "screenshot",
			image = p0.content.Uri,
			poster = if p0.posterContent ~= nil then nil else p0.posterContent.Uri,
			parent = folder
		}, services)
		var16 = screenshot
		table.insert(t, screenshot)
		t_1[screenshot.id] = screenshot
	end
	local var19 = nil
	
	if edits ~= nil and edits.music ~= nil then
		local music = registry.create("music", {
			id = "music",
			kind = "music",
			assetId = edits.music.assetId,
			startTime = edits.music.startTime,
			parent = folder
		}, services)
		var19 = music
		table.insert(t, music)
		t_1[music.id] = music
	end
	local var21 = var19 ~= nil
	
	if edits ~= nil and edits.textOverlays ~= nil then
		for i, v in edits.textOverlays do
			local text = registry.create("text", { kind = "text", id = `text:{i - 1}`, overlay = v }, services)
			table.insert(t, text)
			t_1[text.id] = text
		end
	end
	if getFFlagMomentsStickerButtonModule() and edits ~= nil and edits.stickerOverlays ~= nil then
		for i, v in edits.stickerOverlays do
			local sticker = registry.create("sticker", { kind = "sticker", id = `sticker:{i - 1}`, overlay = v }, services)
			table.insert(t, sticker)
			t_1[sticker.id] = sticker
		end
	end
	local t_2 = {}
	
	for i, v in t do
		if v.usesDecoder then
			table.insert(t_2, v)
		end
	end
	local t_3 = {}
	
	for i_1, v_1 in t do
		local render = v_1.render
		
		if render ~= nil then
			table.insert(t_3, { id = v_1.id, zIndex = v_1.zIndex or 0, render = render })
		end
	end
	table.sort(t_3, function(p3, p4) --[[ line: 220 ]]
		return p3.zIndex < p4.zIndex
	end)
	local var26 = createSignal(t_3)
	local t_4 = {}
	
	local _ = function(p5) --[[ line: 232 | named "addStem" ]]
		-- upvalues: t_4 (ref), var12 (ref)
		local audioStem = p5.audioStem
		local getAudioSource = p5.getAudioSource
		
		if audioStem == nil or getAudioSource == nil or t_4[audioStem.stemId] ~= nil then
			return
		end
		t_4[audioStem.stemId] = var12.addStem(audioStem.stemId, getAudioSource(), audioStem.defaultVolume)
	end
	
	local _ = function(p6) --[[ line: 240 | named "removeStem" ]]
		-- upvalues: t_4 (ref)
		local audioStem = p6.audioStem
		
		if audioStem == nil then return end
		local stemId = t_4[audioStem.stemId]
		
		if stemId ~= nil then
			stemId()
			t_4[audioStem.stemId] = nil
		end
	end
	
	for i_2, v_2 in t do
		if v_2.getAudioSource ~= nil and not v_2.usesDecoder then
			local audioStem = v_2.audioStem
			local getAudioSource = v_2.getAudioSource
			
			if audioStem ~= nil and getAudioSource ~= nil and t_4[audioStem.stemId] == nil then
				t_4[audioStem.stemId] = var12.addStem(audioStem.stemId, getAudioSource(), audioStem.defaultVolume)
			end
		end
	end
	local var28, var29 = createSignal(false)
	local var30, var31 = createSignal(false)
	local var32, var33 = createSignal(false)
	local var34, var35 = createSignal(0)
	local var36, var37 = createSignal(false)
	local var38 = false
	local var39 = nil
	local var40 = if var15 ~= nil then var16.getPosition else var15.getPosition
	local var41 = createComputed(function(p7) --[[ line: 285 ]]
		-- upvalues: var32 (ref), var30 (ref), var28 (ref)
		return if var32(p7) then "Playing" elseif var30(p7) then "Decoded" elseif var28(p7) then "Downloaded" else "Idle"
	end)
	local var42 = createComputed(function(p8) --[[ line: 299 ]]
		-- upvalues: var15 (write), var30 (ref), var28 (ref), var16 (write), var32 (ref), var36 (ref)
		local var52, var53, duration, timeLength
		local _ = nil
		local resolution = nil
		local _ = nil
		local _ = nil
		local _ = nil
		
		if var15 == nil then
			local var56 = var16
			local failureReason = var56.getFailureReason(p8)
			var52 = if failureReason ~= nil then if var56.getIsImageLoaded(p8) then "Ready" else "Loading" else "Failed"
			var53 = failureReason
			duration = var56.getDuration()
			timeLength = var56.getDuration()
		else
			local failureReason = var15.getFailureReason(p8)
			var52 = if failureReason ~= nil then if var15.getIsLoaded(p8) then "Ready" elseif var30(p8) or var28(p8) then "Loading" else "Idle" else "Failed"
			var53 = failureReason
			resolution = var15.getResolution(p8)
			duration = var15.getDuration(p8)
			timeLength = var15.getTimeLength(p8)
		end
		return {
			readiness = var52,
			resolution = resolution,
			duration = duration,
			timeLength = timeLength,
			isPlaying = var32(p8),
			isMuted = var36(p8),
			failureReason = var53
		}
	end, cryoModule.Dictionary.equals)
	local var43 = nil
	local var44 = 0
	
	local _ = function() --[[ line: 352 | named "startRealignLoop" ]]
		-- upvalues: var43 (write), var19 (write), var44 (write), var40 (ref), services (ref), var38 (write), loopEpsilonSeconds (copy)
		if var43 == nil and var19 ~= nil then
			var44 = var40(false)
			var43 = services.runService.RenderStepped:Connect(function() --[[ line: 357 ]]
				-- upvalues: var38 (copy), var40 (copy), var44 (copy), loopEpsilonSeconds (copy), var19 (copy)
				if var38 then return end
				local var58 = var40(false)
				
				if var58 < var44 - loopEpsilonSeconds then
					var19.realignToRegionStart()
				end
				var44 = var58
			end)
			
			return
		end
	end
	
	local _ = function() --[[ line: 368 | named "stopRealignLoop" ]]
		-- upvalues: var43 (write)
		if var43 ~= nil then
			var43:Disconnect()
			var43 = nil
		end
	end
	
	local function download() --[[ line: 375 ]]
		-- upvalues: var38 (write), t (ref), var29 (ref)
		if var38 then return end
		for i, v in t do
			v.download()
		end
		if var38 then
			return
		end
		var29(true)
	end
	
	local function decode() --[[ line: 393 ]]
		-- upvalues: var38 (write), t_2 (ref), t_4 (ref), var12 (ref), var21 (ref), var31 (ref)
		if var38 then return end
		for i, v in t_2 do
			local decode = v.decode
			
			if decode ~= nil then
				decode()
			end
			local audioStem = v.audioStem
			local getAudioSource = v.getAudioSource
			
			if audioStem ~= nil and getAudioSource ~= nil and t_4[audioStem.stemId] == nil then
				t_4[audioStem.stemId] = var12.addStem(audioStem.stemId, getAudioSource(), audioStem.defaultVolume)
			end
		end
		if var21 and t_4.video ~= nil then
			var12.setMuted("video", true)
		end
		var31(true)
	end
	
	local function releaseDecoder() --[[ line: 414 ]]
		-- upvalues: var38 (write), t_2 (ref), t_4 (ref), var31 (ref), var33 (ref)
		if var38 then return end
		for i, v in t_2 do
			local audioStem = v.audioStem
			
			if audioStem ~= nil then
				local stemId = t_4[audioStem.stemId]
				
				if stemId ~= nil then
					stemId()
					t_4[audioStem.stemId] = nil
				end
			end
			local releaseDecoder = v.releaseDecoder
			
			if releaseDecoder ~= nil then
				releaseDecoder()
			end
		end
		var31(false)
		var33(false)
	end
	
	local function play() --[[ line: 431 ]]
		-- upvalues: var38 (write), var39 (write), var19 (write), var16 (write), t (ref), var33 (ref), var43 (write), var44 (write), var40 (ref), services (ref), loopEpsilonSeconds (copy)
		if var38 then return end
		var39 = nil
		
		if var19 ~= nil then
			var19.realignToRegionStart()
		end
		if var16 ~= nil then
			var16.seek(0)
		end
		for i, v in t do
			local play = v.play
			
			if play ~= nil then
				play()
			end
		end
		if var39 ~= nil and var39 > 0 then
			for i, v_1 in t do
				local seek = v_1.seek
				
				if seek ~= nil then
					seek(var39)
				end
			end
		end
		var33(true)
		
		if var43 == nil then
			if var19 == nil then return end
			var44 = var40(false)
			var43 = services.runService.RenderStepped:Connect(function() --[[ line: 357 ]]
				-- upvalues: var38 (copy), var40 (copy), var44 (copy), loopEpsilonSeconds (copy), var19 (copy)
				if var38 then return end
				if var40(false) < var44 - loopEpsilonSeconds then
					var19.realignToRegionStart()
				end
			end)
		end
	end
	
	local function pauseAndRemember(p9) --[[ line: 475 ]]
		-- upvalues: var38 (write), var15 (write), var39 (write), var40 (ref), t (ref), var33 (ref), var43 (write)
		if var38 then return end
		if var15 ~= nil then
			var39 = math.max(0, var40(false) - p9)
		end
		for i, v in t do
			local pause = v.pause
			
			if pause ~= nil then
				pause()
			end
		end
		var33(false)
		
		if var43 ~= nil then
			var43:Disconnect()
			var43 = nil
		end
	end
	
	return {
		getState = var42,
		getPosition = var40,
		getUserToggleNonce = var34,
		getVisualLayers = var26,
		getResourceLevel = var41,
		audio = {
			setVolume = function(value, p10) --[[ line: 578 ]]
				-- upvalues: var38 (write), var12 (ref)
				if not var38 then
					var12.setVolume(value, p10)
				end
			end,
			setMuted = function(value, p11) --[[ line: 583 ]]
				-- upvalues: var38 (write), var12 (ref)
				if not var38 then
					var12.setMuted(value, p11)
				end
			end,
			setMasterMuted = function(value) --[[ line: 545 ]]
				-- upvalues: var38 (write), var12 (ref), var37 (ref)
				if var38 then
					return
				end
				var12.setMasterMuted(value)
				var37(value)
			end
		},
		download = download,
		decode = decode,
		releaseDecoder = releaseDecoder,
		play = play,
		pause = function(p12) --[[ line: 495 ]]
			-- upvalues: pauseAndRemember (ref)
			pauseAndRemember(p12 or 2)
		end,
		toggle = function() --[[ line: 499 ]]
			-- upvalues: var38 (write), var32 (ref), pauseAndRemember (ref), play (ref), var35 (ref), var34 (ref)
			if var38 then return end
			if var32(false) then
				pauseAndRemember(0)
			else
				play()
			end
			var35(var34(false) + 1)
		end,
		seek = function(p13) --[[ line: 516 ]]
			-- upvalues: var38 (write), fFlagMomentsLoopOnEndSeekModule (copy), var32 (ref), var42 (ref), t (ref)
			if var38 then return end
			if fFlagMomentsLoopOnEndSeekModule and var32(false) then
				local duration = var42(false).duration
				
				if duration > 0 and duration <= p13 then
					p13 = 0
				end
			end
			for i, v in t do
				local seek = v.seek
				
				if seek ~= nil then
					seek(p13)
				end
			end
		end,
		setRegion = function(value) --[[ line: 536 ]]
			-- upvalues: var38 (write), var15 (write)
			if var38 then return end
			if var15 ~= nil then
				var15.setRegion(value)
			end
		end,
		setActive = function(value) --[[ line: 555 ]]
			-- upvalues: var39 (write), var38 (write), var12 (ref), var37 (ref)
			if value then
				var39 = nil
			end
			local var59 = not value
			
			if var38 then
				return
			end
			var12.setMasterMuted(var59)
			var37(var59)
		end,
		setSurface = function(value, p14) --[[ line: 567 ]]
			-- upvalues: var38 (write), t_1 (ref)
			if var38 then return end
			local var60 = t_1[value]
			
			if var60 ~= nil and var60.setSurface ~= nil then
				var60.setSurface(p14)
			end
		end,
		getVideoPreviewSource = function() --[[ line: 609 ]]
			-- upvalues: var10 (ref), p0 (ref), edits (ref)
			return if var10 then {
				content = p0.content,
				region = if edits ~= nil then nil else edits.trim
			} else nil
		end,
		getHasVideoPreview = function() --[[ line: 619 ]]
			-- upvalues: var10 (ref)
			return var10
		end,
		dispose = function() --[[ line: 591 ]]
			-- upvalues: var38 (write), var43 (write), t (ref), var12 (ref), var11 (ref)
			if var38 then return end
			var38 = true
			
			if var43 ~= nil then
				var43:Disconnect()
				var43 = nil
			end
			for i, v in t do
				v.dispose()
			end
			var12.dispose()
			var11.dispose()
		end
	}
end