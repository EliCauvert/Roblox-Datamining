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

return function(p1, p2)
	-- upvalues: defaultMediaNodeRegistryModule (ref), mediaRootModule (ref), createAudioGraphModule (ref), getFFlagMomentsStickerButtonModule (ref), createSignal (ref), createComputed (ref), cryoModule (ref), loopEpsilonSeconds (ref), fFlagMomentsLoopOnEndSeekModule (ref)
	local services = p2.services
	local registry = p2.registry or defaultMediaNodeRegistryModule()
	local var1 = p1.captureType == Enum.CaptureType.Video
	local var2 = mediaRootModule(p1.momentId, p2.parent)
	local folder = var2.folder
	local var3 = createAudioGraphModule(folder, p2.audioDeviceOutput, p2.masterVolume)
	local edits = p1.edits
	local t = {}
	local t_1 = {}
	
	local function _(p3)
		-- upvalues: t (ref), t_1 (ref)
		table.insert(t, p3)
		t_1[p3.id] = p3
	end
	
	local var4 = nil
	local var5 = nil
	
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
		var4 = video
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
		var5 = screenshot
		table.insert(t, screenshot)
		t_1[screenshot.id] = screenshot
	end
	local var6 = nil
	
	if edits ~= nil and edits.music ~= nil then
		local music = registry.create("music", {
			id = "music",
			kind = "music",
			assetId = edits.music.assetId,
			startTime = edits.music.startTime,
			parent = folder
		}, services)
		var6 = music
		table.insert(t, music)
		t_1[music.id] = music
	end
	local var7 = var6 ~= nil
	
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
	table.sort(t_3, function(p3, p4)
		return p3.zIndex < p4.zIndex
	end)
	local var8 = createSignal(t_3)
	local t_4 = {}
	
	local _ = function(p3)
		-- upvalues: t_4 (ref), var3 (ref)
		local audioStem = p3.audioStem
		local getAudioSource = p3.getAudioSource
		
		if audioStem == nil or getAudioSource == nil or t_4[audioStem.stemId] ~= nil then
			return
		end
		t_4[audioStem.stemId] = var3.addStem(audioStem.stemId, getAudioSource(), audioStem.defaultVolume)
	end
	
	local _ = function(p3)
		-- upvalues: t_4 (ref)
		local audioStem = p3.audioStem
		
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
				t_4[audioStem.stemId] = var3.addStem(audioStem.stemId, getAudioSource(), audioStem.defaultVolume)
			end
		end
	end
	local var9, var10 = createSignal(false)
	local var11, var12 = createSignal(false)
	local var13, var14 = createSignal(false)
	local var15, var16 = createSignal(0)
	local var17, var18 = createSignal(false)
	local var19 = false
	local var20 = nil
	local var21 = if var4 ~= nil then var5.getPosition else var4.getPosition
	local var22 = createComputed(function(p3)
		-- upvalues: var13 (ref), var11 (ref), var9 (ref)
		return if var13(p3) then "Playing" elseif var11(p3) then "Decoded" elseif var9(p3) then "Downloaded" else "Idle"
	end)
	local var23 = createComputed(function(p3)
		-- upvalues: var4 (write), var11 (ref), var9 (ref), var5 (write), var13 (ref), var17 (ref)
		local var24, var25, duration, timeLength
		local _ = nil
		local resolution = nil
		local _ = nil
		local _ = nil
		local _ = nil
		
		if var4 == nil then
			local var26 = var5
			local failureReason = var26.getFailureReason(p3)
			var24 = if failureReason ~= nil then if var26.getIsImageLoaded(p3) then "Ready" else "Loading" else "Failed"
			var25 = failureReason
			duration = var26.getDuration()
			timeLength = var26.getDuration()
		else
			local failureReason = var4.getFailureReason(p3)
			var24 = if failureReason ~= nil then if var4.getIsLoaded(p3) then "Ready" elseif var11(p3) or var9(p3) then "Loading" else "Idle" else "Failed"
			var25 = failureReason
			resolution = var4.getResolution(p3)
			duration = var4.getDuration(p3)
			timeLength = var4.getTimeLength(p3)
		end
		return {
			readiness = var24,
			resolution = resolution,
			duration = duration,
			timeLength = timeLength,
			isPlaying = var13(p3),
			isMuted = var17(p3),
			failureReason = var25
		}
	end, cryoModule.Dictionary.equals)
	local var24 = nil
	local var25 = 0
	
	local _ = function()
		-- upvalues: var24 (write), var6 (write), var25 (write), var21 (ref), services (ref), var19 (write), loopEpsilonSeconds (copy)
		if var24 == nil and var6 ~= nil then
			var25 = var21(false)
			var24 = services.runService.RenderStepped:Connect(function()
				-- upvalues: var19 (copy), var21 (copy), var25 (copy), loopEpsilonSeconds (copy), var6 (copy)
				if var19 then return end
				local var26 = var21(false)
				
				if var26 < var25 - loopEpsilonSeconds then
					var6.realignToRegionStart()
				end
				var25 = var26
			end)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: var24 (write)
		if var24 ~= nil then
			var24:Disconnect()
			var24 = nil
		end
	end
	
	local function download()
		-- upvalues: var19 (write), t (ref), var10 (ref)
		if var19 then return end
		for i, v in t do
			v.download()
		end
		if var19 then
			return
		end
		var10(true)
	end
	
	local function decode()
		-- upvalues: var19 (write), t_2 (ref), t_4 (ref), var3 (ref), var7 (ref), var12 (ref)
		if var19 then return end
		for i, v in t_2 do
			local decode = v.decode
			
			if decode ~= nil then
				decode()
			end
			local audioStem = v.audioStem
			local getAudioSource = v.getAudioSource
			
			if audioStem ~= nil and getAudioSource ~= nil and t_4[audioStem.stemId] == nil then
				t_4[audioStem.stemId] = var3.addStem(audioStem.stemId, getAudioSource(), audioStem.defaultVolume)
			end
		end
		if var7 and t_4.video ~= nil then
			var3.setMuted("video", true)
		end
		var12(true)
	end
	
	local function releaseDecoder()
		-- upvalues: var19 (write), t_2 (ref), t_4 (ref), var12 (ref), var14 (ref)
		if var19 then return end
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
		var12(false)
		var14(false)
	end
	
	local function play()
		-- upvalues: var19 (write), var20 (write), var6 (write), var5 (write), t (ref), var14 (ref), var24 (write), var25 (write), var21 (ref), services (ref), loopEpsilonSeconds (copy)
		if var19 then return end
		var20 = nil
		
		if var6 ~= nil then
			var6.realignToRegionStart()
		end
		if var5 ~= nil then
			var5.seek(0)
		end
		for i, v in t do
			local play = v.play
			
			if play ~= nil then
				play()
			end
		end
		if var20 ~= nil and var20 > 0 then
			for i, v_1 in t do
				local seek = v_1.seek
				
				if seek ~= nil then
					seek(var20)
				end
			end
		end
		var14(true)
		
		if var24 == nil then
			if var6 == nil then return end
			var25 = var21(false)
			var24 = services.runService.RenderStepped:Connect(function()
				-- upvalues: var19 (copy), var21 (copy), var25 (copy), loopEpsilonSeconds (copy), var6 (copy)
				if var19 then return end
				if var21(false) < var25 - loopEpsilonSeconds then
					var6.realignToRegionStart()
				end
			end)
		end
	end
	
	local function pauseAndRemember(p3)
		-- upvalues: var19 (write), var4 (write), var20 (write), var21 (ref), t (ref), var14 (ref), var24 (write)
		if var19 then return end
		if var4 ~= nil then
			var20 = math.max(0, var21(false) - p3)
		end
		for i, v in t do
			local pause = v.pause
			
			if pause ~= nil then
				pause()
			end
		end
		var14(false)
		
		if var24 ~= nil then
			var24:Disconnect()
			var24 = nil
		end
	end
	
	return {
		getState = var23,
		getPosition = var21,
		getUserToggleNonce = var15,
		getVisualLayers = var8,
		getResourceLevel = var22,
		audio = {
			setVolume = function(value, p4)
				-- upvalues: var19 (write), var3 (ref)
				if not var19 then
					var3.setVolume(value, p4)
				end
			end,
			setMuted = function(value, p4)
				-- upvalues: var19 (write), var3 (ref)
				if not var19 then
					var3.setMuted(value, p4)
				end
			end,
			setMasterMuted = function(value)
				-- upvalues: var19 (write), var3 (ref), var18 (ref)
				if var19 then
					return
				end
				var3.setMasterMuted(value)
				var18(value)
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
			-- upvalues: var19 (write), var13 (ref), pauseAndRemember (ref), play (ref), var16 (ref), var15 (ref)
			if var19 then return end
			if var13(false) then
				pauseAndRemember(0)
			else
				play()
			end
			var16(var15(false) + 1)
		end,
		seek = function(p4)
			-- upvalues: var19 (write), fFlagMomentsLoopOnEndSeekModule (copy), var13 (ref), var23 (ref), t (ref)
			if var19 then return end
			if fFlagMomentsLoopOnEndSeekModule and var13(false) then
				local duration = var23(false).duration
				
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
			-- upvalues: var19 (write), var4 (write)
			if var19 then return end
			if var4 ~= nil then
				var4.setRegion(value)
			end
		end,
		setActive = function(value)
			-- upvalues: var20 (write), var19 (write), var3 (ref), var18 (ref)
			if value then
				var20 = nil
			end
			local var26 = not value
			
			if var19 then
				return
			end
			var3.setMasterMuted(var26)
			var18(var26)
		end,
		setSurface = function(value, p5)
			-- upvalues: var19 (write), t_1 (ref)
			if var19 then return end
			local var26 = t_1[value]
			
			if var26 ~= nil and var26.setSurface ~= nil then
				var26.setSurface(p5)
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
			-- upvalues: var19 (write), var24 (write), t (ref), var3 (ref), var2 (ref)
			if var19 then return end
			var19 = true
			
			if var24 ~= nil then
				var24:Disconnect()
				var24 = nil
			end
			for i, v in t do
				v.dispose()
			end
			var3.dispose()
			var2.dispose()
		end
	}
end