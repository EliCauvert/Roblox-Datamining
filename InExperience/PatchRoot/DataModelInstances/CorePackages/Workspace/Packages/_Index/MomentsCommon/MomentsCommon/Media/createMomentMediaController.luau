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
local _ = require(momentsCommon.Media.Nodes.createTtsNode)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local getFFlagMomentsStickerButtonModule = require(momentsCommon.Flags.GetFFlagMomentsStickerButton)
local loopEpsilonSeconds = preloadConstantsModule.loopEpsilonSeconds

return function(p1, p2)
	-- upvalues: defaultMediaNodeRegistryModule (ref), mediaRootModule (ref), createAudioGraphModule (ref), getFFlagMomentsStickerButtonModule (ref), createSignal (ref), createComputed (ref), cryoModule (ref), loopEpsilonSeconds (ref), fFlagMomentsLoopOnEndSeekModule (ref)
	local services = p2.services
	local registry = p2.registry or defaultMediaNodeRegistryModule()
	local var1 = p1.captureType == Enum.CaptureType.Video
	local edits = p1.edits
	local var2 = if edits ~= nil then nil else edits.ttsAudios
	local var3 = false
	
	if var2 ~= nil then
		for i, v in var2 do
			if v.assetId ~= nil then
				var3 = true
				break
			end
		end
	end
	local var4 = mediaRootModule(p1.momentId, p2.parent)
	local folder = var4.folder
	local var5 = createAudioGraphModule(folder, p2.audioDeviceOutput, { masterVolume = p2.masterVolume, enableDucking = var3 })
	local t = {}
	local t_1 = {}
	
	local function _(p3)
		-- upvalues: t (ref), t_1 (ref)
		table.insert(t, p3)
		t_1[p3.id] = p3
	end
	
	local var6 = nil
	local var7 = nil
	
	if var1 then
		local video = registry.create("video", {
			id = "video",
			kind = "video",
			zIndex = 0,
			content = p1.content,
			region = if edits ~= nil then nil else edits.trim,
			parent = folder,
			cornerRadius = p1.cornerRadius
		}, services)
		var6 = video
		table.insert(t, video)
		t_1[video.id] = video
	else
		local screenshot = registry.create("screenshot", {
			id = "screenshot",
			kind = "screenshot",
			image = p1.content.Uri,
			poster = if p1.posterContent ~= nil then nil else p1.posterContent.Uri,
			parent = folder
		}, services)
		var7 = screenshot
		table.insert(t, screenshot)
		t_1[screenshot.id] = screenshot
	end
	local var8 = nil
	
	if edits ~= nil and edits.music ~= nil then
		local music = registry.create("music", {
			id = "music",
			kind = "music",
			assetId = edits.music.assetId,
			startTime = edits.music.startTime,
			parent = folder
		}, services)
		var8 = music
		table.insert(t, music)
		t_1[music.id] = music
	end
	local var9 = var8 ~= nil
	local t_2 = {}
	
	if var2 ~= nil then
		for i, v in var2 do
			if v.assetId ~= nil then
				local tts = registry.create("tts", {
					kind = "tts",
					id = `tts:{i - 1}`,
					assetId = v.assetId,
					startTime = v.startTime,
					parent = folder
				}, services)
				table.insert(t_2, tts)
				table.insert(t, tts)
				t_1[tts.id] = tts
			end
		end
	end
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
	local t_3 = {}
	
	for i, v in t do
		if v.usesDecoder then
			table.insert(t_3, v)
		end
	end
	local t_4 = {}
	
	for i_1, v_1 in t do
		local render = v_1.render
		
		if render ~= nil then
			table.insert(t_4, { id = v_1.id, zIndex = v_1.zIndex or 0, render = render })
		end
	end
	table.sort(t_4, function(p3, p4)
		return p3.zIndex < p4.zIndex
	end)
	local var10 = createSignal(t_4)
	local t_5 = {}
	
	local _ = function(p3)
		-- upvalues: t_5 (ref), var5 (ref)
		local audioStem = p3.audioStem
		local getAudioSource = p3.getAudioSource
		
		if audioStem == nil or getAudioSource == nil or t_5[audioStem.stemId] ~= nil then
			return
		end
		t_5[audioStem.stemId] = var5.addStem(audioStem.stemId, getAudioSource(), audioStem.defaultVolume, audioStem.role)
	end
	
	local _ = function(p3)
		-- upvalues: t_5 (ref)
		local audioStem = p3.audioStem
		
		if audioStem == nil then return end
		local stemId = t_5[audioStem.stemId]
		
		if stemId ~= nil then
			stemId()
			t_5[audioStem.stemId] = nil
		end
	end
	
	for i_2, v_2 in t do
		if v_2.getAudioSource ~= nil and not v_2.usesDecoder then
			local audioStem = v_2.audioStem
			local getAudioSource = v_2.getAudioSource
			
			if audioStem ~= nil and getAudioSource ~= nil and t_5[audioStem.stemId] == nil then
				t_5[audioStem.stemId] = var5.addStem(audioStem.stemId, getAudioSource(), audioStem.defaultVolume, audioStem.role)
			end
		end
	end
	local var11, var12 = createSignal(false)
	local var13, var14 = createSignal(false)
	local var15, var16 = createSignal(false)
	local var17, var18 = createSignal(0)
	local var19, var20 = createSignal(false)
	local var21 = false
	local var22 = nil
	local var23 = if var6 ~= nil then var7.getPosition else var6.getPosition
	local var24 = createComputed(function(p3)
		-- upvalues: var15 (ref), var13 (ref), var11 (ref)
		return if var15(p3) then "Playing" elseif var13(p3) then "Decoded" elseif var11(p3) then "Downloaded" else "Idle"
	end)
	local var25 = createComputed(function(p3)
		-- upvalues: var6 (write), var13 (ref), var11 (ref), var7 (write), var15 (ref), var19 (ref)
		local var26, var27, duration, timeLength
		local _ = nil
		local resolution = nil
		local _ = nil
		local _ = nil
		local _ = nil
		
		if var6 == nil then
			local var28 = var7
			local failureReason = var28.getFailureReason(p3)
			var26 = if failureReason ~= nil then if var28.getIsImageLoaded(p3) then "Ready" else "Loading" else "Failed"
			var27 = failureReason
			duration = var28.getDuration()
			timeLength = var28.getDuration()
		else
			local failureReason = var6.getFailureReason(p3)
			var26 = if failureReason ~= nil then if var6.getIsLoaded(p3) then "Ready" elseif var13(p3) or var11(p3) then "Loading" else "Idle" else "Failed"
			var27 = failureReason
			resolution = var6.getResolution(p3)
			duration = var6.getDuration(p3)
			timeLength = var6.getTimeLength(p3)
		end
		return {
			readiness = var26,
			resolution = resolution,
			duration = duration,
			timeLength = timeLength,
			isPlaying = var15(p3),
			isMuted = var19(p3),
			failureReason = var27
		}
	end, cryoModule.Dictionary.equals)
	local var26 = nil
	local var27 = 0
	
	local _ = function()
		-- upvalues: var26 (write), var8 (write), t_2 (ref), var27 (write), var23 (ref), services (ref), var21 (write), loopEpsilonSeconds (copy)
		if var26 == nil and (var8 ~= nil or #t_2 ~= 0) then
			var27 = var23(false)
			var26 = services.runService.RenderStepped:Connect(function()
				-- upvalues: var21 (copy), var23 (copy), var27 (copy), loopEpsilonSeconds (copy), var8 (copy), t_2 (copy)
				if var21 then return end
				local var28 = var23(false)
				
				if var28 < var27 - loopEpsilonSeconds then
					if var8 ~= nil then
						var8.realignToRegionStart()
					end
					for i, v in t_2 do
						v.realignToRegionStart()
					end
				end
				for i, v in t_2 do
					v.syncToClock(var28)
				end
				var27 = var28
			end)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: var26 (write)
		if var26 ~= nil then
			var26:Disconnect()
			var26 = nil
		end
	end
	
	local function download()
		-- upvalues: var21 (write), t (ref), var12 (ref)
		if var21 then return end
		for i, v in t do
			v.download()
		end
		if var21 then
			return
		end
		var12(true)
	end
	
	local function decode()
		-- upvalues: var21 (write), t_3 (ref), t_5 (ref), var5 (ref), var9 (ref), var14 (ref)
		if var21 then return end
		for i, v in t_3 do
			local decode = v.decode
			
			if decode ~= nil then
				decode()
			end
			local audioStem = v.audioStem
			local getAudioSource = v.getAudioSource
			
			if audioStem ~= nil and getAudioSource ~= nil and t_5[audioStem.stemId] == nil then
				t_5[audioStem.stemId] = var5.addStem(audioStem.stemId, getAudioSource(), audioStem.defaultVolume, audioStem.role)
			end
		end
		if var9 and t_5.video ~= nil then
			var5.setMuted("video", true)
		end
		var14(true)
	end
	
	local function releaseDecoder()
		-- upvalues: var21 (write), t_3 (ref), t_5 (ref), var14 (ref), var16 (ref)
		if var21 then return end
		for i, v in t_3 do
			local audioStem = v.audioStem
			
			if audioStem ~= nil then
				local stemId = t_5[audioStem.stemId]
				
				if stemId ~= nil then
					stemId()
					t_5[audioStem.stemId] = nil
				end
			end
			local releaseDecoder = v.releaseDecoder
			
			if releaseDecoder ~= nil then
				releaseDecoder()
			end
		end
		var14(false)
		var16(false)
	end
	
	local function play()
		-- upvalues: var21 (write), var22 (write), var8 (write), t_2 (ref), var7 (write), t (ref), var23 (ref), var16 (ref), var26 (write), var27 (write), services (ref), loopEpsilonSeconds (copy)
		if var21 then return end
		var22 = nil
		
		if var8 ~= nil then
			var8.realignToRegionStart()
		end
		for i, v in t_2 do
			v.realignToRegionStart()
		end
		if var7 ~= nil then
			var7.seek(0)
		end
		for i, v_1 in t do
			local play = v_1.play
			
			if play ~= nil then
				play()
			end
		end
		if var22 ~= nil and var22 > 0 then
			for i, v_2 in t do
				local seek = v_2.seek
				
				if seek ~= nil then
					seek(var22)
				end
			end
		end
		for i, v_2 in t_2 do
			v_2.syncToClock(var23(false))
		end
		var16(true)
		
		if var26 == nil then
			if var8 == nil and #t_2 == 0 then return end
			var27 = var23(false)
			var26 = services.runService.RenderStepped:Connect(function()
				-- upvalues: var21 (copy), var23 (copy), var27 (copy), loopEpsilonSeconds (copy), var8 (copy), t_2 (copy)
				if var21 then return end
				local var28 = var23(false)
				
				if var28 < var27 - loopEpsilonSeconds then
					if var8 ~= nil then
						var8.realignToRegionStart()
					end
					for i, v in t_2 do
						v.realignToRegionStart()
					end
				end
				for i, v in t_2 do
					v.syncToClock(var28)
				end
			end)
		end
	end
	
	local function pauseAndRemember(p3)
		-- upvalues: var21 (write), var6 (write), var22 (write), var23 (ref), t (ref), var16 (ref), var26 (write)
		if var21 then return end
		if var6 ~= nil then
			var22 = math.max(0, var23(false) - p3)
		end
		for i, v in t do
			local pause = v.pause
			
			if pause ~= nil then
				pause()
			end
		end
		var16(false)
		
		if var26 ~= nil then
			var26:Disconnect()
			var26 = nil
		end
	end
	
	return {
		getState = var25,
		getPosition = var23,
		getUserToggleNonce = var17,
		getVisualLayers = var10,
		getResourceLevel = var24,
		audio = {
			setVolume = function(value, p4)
				-- upvalues: var21 (write), var5 (ref)
				if not var21 then
					var5.setVolume(value, p4)
				end
			end,
			setMuted = function(value, p4)
				-- upvalues: var21 (write), var5 (ref)
				if not var21 then
					var5.setMuted(value, p4)
				end
			end,
			setMasterMuted = function(value)
				-- upvalues: var21 (write), var5 (ref), var20 (ref)
				if var21 then
					return
				end
				var5.setMasterMuted(value)
				var20(value)
			end
		},
		download = download,
		decode = decode,
		releaseDecoder = releaseDecoder,
		play = play,
		pause = function(p4)
			-- upvalues: pauseAndRemember (ref)
			pauseAndRemember(p4 or 2)
		end,
		toggle = function()
			-- upvalues: var21 (write), var15 (ref), pauseAndRemember (ref), play (ref), var18 (ref), var17 (ref)
			if var21 then return end
			if var15(false) then
				pauseAndRemember(0)
			else
				play()
			end
			var18(var17(false) + 1)
		end,
		seek = function(p4)
			-- upvalues: var21 (write), fFlagMomentsLoopOnEndSeekModule (copy), var15 (ref), var25 (ref), t (ref)
			if var21 then return end
			if fFlagMomentsLoopOnEndSeekModule and var15(false) then
				local duration = var25(false).duration
				
				if duration > 0 and duration <= p4 then
					p4 = 0
				end
			end
			for i, v in t do
				local seek = v.seek
				
				if seek ~= nil then
					seek(p4)
				end
			end
		end,
		setRegion = function(value)
			-- upvalues: var21 (write), var6 (write)
			if var21 then return end
			if var6 ~= nil then
				var6.setRegion(value)
			end
		end,
		setActive = function(value)
			-- upvalues: var22 (write), var21 (write), var5 (ref), var20 (ref)
			if value then
				var22 = nil
			end
			local var28 = not value
			
			if var21 then
				return
			end
			var5.setMasterMuted(var28)
			var20(var28)
		end,
		setSurface = function(value, p5)
			-- upvalues: var21 (write), t_1 (ref)
			if var21 then return end
			local var28 = t_1[value]
			
			if var28 ~= nil and var28.setSurface ~= nil then
				var28.setSurface(p5)
			end
		end,
		getVideoPreviewSource = function()
			-- upvalues: var1 (ref), p1 (ref), edits (ref)
			return if var1 then {
				content = p1.content,
				region = if edits ~= nil then nil else edits.trim
			} else nil
		end,
		getHasVideoPreview = function()
			-- upvalues: var1 (ref)
			return var1
		end,
		dispose = function()
			-- upvalues: var21 (write), var26 (write), t (ref), var5 (ref), var4 (ref)
			if var21 then return end
			var21 = true
			
			if var26 ~= nil then
				var26:Disconnect()
				var26 = nil
			end
			for i, v in t do
				v.dispose()
			end
			var5.dispose()
			var4.dispose()
		end
	}
end