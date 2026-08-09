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
local _ = require(momentsCommon.Media.Nodes.createVideoNode)
local _ = require(momentsCommon.Media.Nodes.createScreenshotNode)
local _ = require(momentsCommon.Media.Nodes.createMusicNode)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local loopEpsilonSeconds = preloadConstantsModule.loopEpsilonSeconds

return function(p0, p1) --[[ line: 98 | named "createMomentMediaController" ]]
	-- upvalues: defaultMediaNodeRegistryModule (ref), mediaRootModule (ref), createAudioGraphModule (ref), createSignal (ref), createComputed (ref), cryoModule (ref), loopEpsilonSeconds (ref)
	local services = p1.services
	local registry = p1.registry or defaultMediaNodeRegistryModule()
	local var8 = p0.captureType == Enum.CaptureType.Video
	local var9 = mediaRootModule(p0.momentId, p1.parent)
	local folder = var9.folder
	local var10 = createAudioGraphModule(folder, p1.audioDeviceOutput, p1.masterVolume)
	local edits = p0.edits
	local t = {}
	local t_1 = {}
	
	local function _(p2) --[[ line: 114 | named "addNode" ]]
		-- upvalues: t (ref), t_1 (ref)
		table.insert(t, p2)
		t_1[p2.id] = p2
	end
	
	local var13 = nil
	local var14 = nil
	
	if var8 then
		local video = registry.create("video", {
			id = "video",
			kind = "video",
			zIndex = 0,
			content = p0.content,
			region = if edits ~= nil then nil else edits.trim,
			parent = folder,
			cornerRadius = p0.cornerRadius
		}, services)
		var13 = video
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
		var14 = screenshot
		table.insert(t, screenshot)
		t_1[screenshot.id] = screenshot
	end
	local var17 = nil
	
	if edits ~= nil and edits.music ~= nil then
		local music = registry.create("music", {
			id = "music",
			kind = "music",
			assetId = edits.music.assetId,
			startTime = edits.music.startTime,
			parent = folder
		}, services)
		var17 = music
		table.insert(t, music)
		t_1[music.id] = music
	end
	local var19 = var17 ~= nil
	
	if edits ~= nil and edits.textOverlays ~= nil then
		for i, v in edits.textOverlays do
			local text = registry.create("text", { kind = "text", id = `text:{i - 1}`, overlay = v }, services)
			table.insert(t, text)
			t_1[text.id] = text
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
	table.sort(t_3, function(p3, p4) --[[ line: 200 ]]
		return p3.zIndex < p4.zIndex
	end)
	local var23 = createSignal(t_3)
	local t_4 = {}
	
	local _ = function(p5) --[[ line: 212 | named "addStem" ]]
		-- upvalues: t_4 (ref), var10 (ref)
		local audioStem = p5.audioStem
		local getAudioSource = p5.getAudioSource
		
		if audioStem == nil or getAudioSource == nil or t_4[audioStem.stemId] ~= nil then
			return
		end
		t_4[audioStem.stemId] = var10.addStem(audioStem.stemId, getAudioSource(), audioStem.defaultVolume)
	end
	
	local _ = function(p6) --[[ line: 220 | named "removeStem" ]]
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
				t_4[audioStem.stemId] = var10.addStem(audioStem.stemId, getAudioSource(), audioStem.defaultVolume)
			end
		end
	end
	local var25, var26 = createSignal(false)
	local var27, var28 = createSignal(false)
	local var29, var30 = createSignal(false)
	local var31, var32 = createSignal(0)
	local var33, var34 = createSignal(false)
	local var35 = false
	local var36 = nil
	local var37 = if var13 ~= nil then var14.getPosition else var13.getPosition
	local var38 = createComputed(function(p7) --[[ line: 265 ]]
		-- upvalues: var29 (ref), var27 (ref), var25 (ref)
		return if var29(p7) then "Playing" elseif var27(p7) then "Decoded" elseif var25(p7) then "Downloaded" else "Idle"
	end)
	local var39 = createComputed(function(p8) --[[ line: 279 ]]
		-- upvalues: var13 (write), var27 (ref), var25 (ref), var14 (write), var29 (ref), var33 (ref)
		local var49, var50, duration, timeLength
		local _ = nil
		local resolution = nil
		local _ = nil
		local _ = nil
		local _ = nil
		
		if var13 == nil then
			local var53 = var14
			local failureReason = var53.getFailureReason(p8)
			var49 = if failureReason ~= nil then if var53.getIsImageLoaded(p8) then "Ready" else "Loading" else "Failed"
			var50 = failureReason
			duration = var53.getDuration()
			timeLength = var53.getDuration()
		else
			local failureReason = var13.getFailureReason(p8)
			var49 = if failureReason ~= nil then if var13.getIsLoaded(p8) then "Ready" elseif var27(p8) or var25(p8) then "Loading" else "Idle" else "Failed"
			var50 = failureReason
			resolution = var13.getResolution(p8)
			duration = var13.getDuration(p8)
			timeLength = var13.getTimeLength(p8)
		end
		return {
			readiness = var49,
			resolution = resolution,
			duration = duration,
			timeLength = timeLength,
			isPlaying = var29(p8),
			isMuted = var33(p8),
			failureReason = var50
		}
	end, cryoModule.Dictionary.equals)
	local var40 = nil
	local var41 = 0
	
	local _ = function() --[[ line: 332 | named "startRealignLoop" ]]
		-- upvalues: var40 (write), var17 (write), var41 (write), var37 (ref), services (ref), var35 (write), loopEpsilonSeconds (copy)
		if var40 == nil and var17 ~= nil then
			var41 = var37(false)
			var40 = services.runService.RenderStepped:Connect(function() --[[ line: 337 ]]
				-- upvalues: var35 (copy), var37 (copy), var41 (copy), loopEpsilonSeconds (copy), var17 (copy)
				if var35 then return end
				local var55 = var37(false)
				
				if var55 < var41 - loopEpsilonSeconds then
					var17.realignToRegionStart()
				end
				var41 = var55
			end)
			
			return
		end
	end
	
	local _ = function() --[[ line: 348 | named "stopRealignLoop" ]]
		-- upvalues: var40 (write)
		if var40 ~= nil then
			var40:Disconnect()
			var40 = nil
		end
	end
	
	local function download() --[[ line: 355 ]]
		-- upvalues: var35 (write), t (ref), var26 (ref)
		if var35 then return end
		for i, v in t do
			v.download()
		end
		if var35 then
			return
		end
		var26(true)
	end
	
	local function decode() --[[ line: 373 ]]
		-- upvalues: var35 (write), t_2 (ref), t_4 (ref), var10 (ref), var19 (ref), var28 (ref)
		if var35 then return end
		for i, v in t_2 do
			local decode = v.decode
			
			if decode ~= nil then
				decode()
			end
			local audioStem = v.audioStem
			local getAudioSource = v.getAudioSource
			
			if audioStem ~= nil and getAudioSource ~= nil and t_4[audioStem.stemId] == nil then
				t_4[audioStem.stemId] = var10.addStem(audioStem.stemId, getAudioSource(), audioStem.defaultVolume)
			end
		end
		if var19 and t_4.video ~= nil then
			var10.setMuted("video", true)
		end
		var28(true)
	end
	
	local function releaseDecoder() --[[ line: 394 ]]
		-- upvalues: var35 (write), t_2 (ref), t_4 (ref), var28 (ref), var30 (ref)
		if var35 then return end
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
		var28(false)
		var30(false)
	end
	
	local function play() --[[ line: 411 ]]
		-- upvalues: var35 (write), var36 (write), var17 (write), var14 (write), t (ref), var30 (ref), var40 (write), var41 (write), var37 (ref), services (ref), loopEpsilonSeconds (copy)
		if var35 then return end
		var36 = nil
		
		if var17 ~= nil then
			var17.realignToRegionStart()
		end
		if var14 ~= nil then
			var14.seek(0)
		end
		for i, v in t do
			local play = v.play
			
			if play ~= nil then
				play()
			end
		end
		if var36 ~= nil and var36 > 0 then
			for i, v_1 in t do
				local seek = v_1.seek
				
				if seek ~= nil then
					seek(var36)
				end
			end
		end
		var30(true)
		
		if var40 == nil then
			if var17 == nil then return end
			var41 = var37(false)
			var40 = services.runService.RenderStepped:Connect(function() --[[ line: 337 ]]
				-- upvalues: var35 (copy), var37 (copy), var41 (copy), loopEpsilonSeconds (copy), var17 (copy)
				if var35 then return end
				if var37(false) < var41 - loopEpsilonSeconds then
					var17.realignToRegionStart()
				end
			end)
		end
	end
	
	local function pauseAndRemember(p9) --[[ line: 455 ]]
		-- upvalues: var35 (write), var13 (write), var36 (write), var37 (ref), t (ref), var30 (ref), var40 (write)
		if var35 then return end
		if var13 ~= nil then
			var36 = math.max(0, var37(false) - p9)
		end
		for i, v in t do
			local pause = v.pause
			
			if pause ~= nil then
				pause()
			end
		end
		var30(false)
		
		if var40 ~= nil then
			var40:Disconnect()
			var40 = nil
		end
	end
	
	return {
		getState = var39,
		getPosition = var37,
		getUserToggleNonce = var31,
		getVisualLayers = var23,
		getResourceLevel = var38,
		audio = {
			setVolume = function(value, p10) --[[ line: 552 ]]
				-- upvalues: var35 (write), var10 (ref)
				if not var35 then
					var10.setVolume(value, p10)
				end
			end,
			setMuted = function(value, p11) --[[ line: 557 ]]
				-- upvalues: var35 (write), var10 (ref)
				if not var35 then
					var10.setMuted(value, p11)
				end
			end,
			setMasterMuted = function(value) --[[ line: 519 ]]
				-- upvalues: var35 (write), var10 (ref), var34 (ref)
				if var35 then
					return
				end
				var10.setMasterMuted(value)
				var34(value)
			end
		},
		download = download,
		decode = decode,
		releaseDecoder = releaseDecoder,
		play = play,
		pause = function(p12) --[[ line: 475 ]]
			-- upvalues: pauseAndRemember (ref)
			pauseAndRemember(p12 or 2)
		end,
		toggle = function() --[[ line: 479 ]]
			-- upvalues: var35 (write), var29 (ref), pauseAndRemember (ref), play (ref), var32 (ref), var31 (ref)
			if var35 then return end
			if var29(false) then
				pauseAndRemember(0)
			else
				play()
			end
			var32(var31(false) + 1)
		end,
		seek = function(p13) --[[ line: 496 ]]
			-- upvalues: var35 (write), t (ref)
			if var35 then return end
			for i, v in t do
				local seek = v.seek
				
				if seek ~= nil then
					seek(p13)
				end
			end
		end,
		setRegion = function(value) --[[ line: 510 ]]
			-- upvalues: var35 (write), var13 (write)
			if var35 then return end
			if var13 ~= nil then
				var13.setRegion(value)
			end
		end,
		setActive = function(value) --[[ line: 529 ]]
			-- upvalues: var36 (write), var35 (write), var10 (ref), var34 (ref)
			if value then
				var36 = nil
			end
			local var56 = not value
			
			if var35 then
				return
			end
			var10.setMasterMuted(var56)
			var34(var56)
		end,
		setSurface = function(value, p14) --[[ line: 541 ]]
			-- upvalues: var35 (write), t_1 (ref)
			if var35 then return end
			local var57 = t_1[value]
			
			if var57 ~= nil and var57.setSurface ~= nil then
				var57.setSurface(p14)
			end
		end,
		getVideoPreviewSource = function() --[[ line: 583 ]]
			-- upvalues: var8 (ref), p0 (ref), edits (ref)
			return if var8 then {
				content = p0.content,
				region = if edits ~= nil then nil else edits.trim
			} else nil
		end,
		getHasVideoPreview = function() --[[ line: 593 ]]
			-- upvalues: var8 (ref)
			return var8
		end,
		dispose = function() --[[ line: 565 ]]
			-- upvalues: var35 (write), var40 (write), t (ref), var10 (ref), var9 (ref)
			if var35 then return end
			var35 = true
			
			if var40 ~= nil then
				var40:Disconnect()
				var40 = nil
			end
			for i, v in t do
				v.dispose()
			end
			var10.dispose()
			var9.dispose()
		end
	}
end