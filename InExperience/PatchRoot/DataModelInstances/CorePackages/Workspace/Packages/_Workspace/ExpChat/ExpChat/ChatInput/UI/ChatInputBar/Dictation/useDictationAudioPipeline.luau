local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local engineAudioSTTIsDictationEnabled = game:DefineFastFlag("EngineAudioSTTIsDictationEnabled", false)

local function _(p0) --[[ line: 43 | named "destroyIfExists" ]]
	if p0.current then
		p0.current:Destroy()
		p0.current = nil
	end
end

local _ = function(p1) --[[ line: 50 | named "disconnectIfExists" ]]
	if p1.current then
		p1.current:Disconnect()
		p1.current = nil
	end
end

local _ = function(p2) --[[ line: 57 | named "teardownInstances" ]]
	local textConnection = p2.textConnection
	
	if textConnection.current then
		textConnection.current:Disconnect()
		textConnection.current = nil
	end
	local vadConnection = p2.vadConnection
	
	if vadConnection.current then
		vadConnection.current:Disconnect()
		vadConnection.current = nil
	end
	local wire = p2.wire
	
	if wire.current then
		wire.current:Destroy()
		wire.current = nil
	end
	local audioSTT = p2.audioSTT
	
	if audioSTT.current then
		audioSTT.current:Destroy()
		audioSTT.current = nil
	end
	local audioDeviceInput = p2.audioDeviceInput
	
	if audioDeviceInput.current then
		audioDeviceInput.current:Destroy()
		audioDeviceInput.current = nil
	end
	local container = p2.container
	
	if container.current then
		container.current:Destroy()
		container.current = nil
	end
end

return function() --[[ line: 66 | named "useDictationAudioPipeline" ]]
	-- upvalues: reactModule (ref), playersService (ref), coreGuiService (ref), engineAudioSTTIsDictationEnabled (ref)
	local var4, var5 = reactModule.useState(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useMemo(function() --[[ line: 76 ]]
		-- upvalues: var6 (ref), var7 (ref), var8 (ref), var9 (ref), var10 (ref), var11 (ref)
		return {
			audioDeviceInput = var6,
			audioSTT = var7,
			wire = var8,
			container = var9,
			textConnection = var10,
			vadConnection = var11
		}
	end, {})
	local var13 = reactModule.useCallback(function() --[[ line: 87 ]]
		-- upvalues: var12 (ref), var5 (ref)
		local textConnection = var12.textConnection
		
		if textConnection.current then
			textConnection.current:Disconnect()
			textConnection.current = nil
		end
		local vadConnection = var12.vadConnection
		
		if vadConnection.current then
			vadConnection.current:Disconnect()
			vadConnection.current = nil
		end
		local wire = var12.wire
		
		if wire.current then
			wire.current:Destroy()
			wire.current = nil
		end
		local audioSTT = var12.audioSTT
		
		if audioSTT.current then
			audioSTT.current:Destroy()
			audioSTT.current = nil
		end
		local audioDeviceInput = var12.audioDeviceInput
		
		if audioDeviceInput.current then
			audioDeviceInput.current:Destroy()
			audioDeviceInput.current = nil
		end
		local container = var12.container
		
		if container.current then
			container.current:Destroy()
			container.current = nil
		end
		var5(nil)
	end, { var12 })
	local var14 = reactModule.useCallback(function(p3, p4) --[[ line: 93 ]]
		-- upvalues: playersService (copy), var12 (ref), coreGuiService (copy), engineAudioSTTIsDictationEnabled (copy), var5 (ref)
		local localPlayer = playersService.LocalPlayer
		
		if not localPlayer then
			error("No local player")
		end
		local textConnection = var12.textConnection
		
		if textConnection.current then
			textConnection.current:Disconnect()
			textConnection.current = nil
		end
		local vadConnection = var12.vadConnection
		
		if vadConnection.current then
			vadConnection.current:Disconnect()
			vadConnection.current = nil
		end
		local wire = var12.wire
		
		if wire.current then
			wire.current:Destroy()
			wire.current = nil
		end
		local audioSTT = var12.audioSTT
		
		if audioSTT.current then
			audioSTT.current:Destroy()
			audioSTT.current = nil
		end
		local audioDeviceInput = var12.audioDeviceInput
		
		if audioDeviceInput.current then
			audioDeviceInput.current:Destroy()
			audioDeviceInput.current = nil
		end
		local container = var12.container
		
		if container.current then
			container.current:Destroy()
			container.current = nil
		end
		local var15 = p4 ~= nil and p4.continuous == true
		local expChatDictation = Instance.new("Folder")
		expChatDictation.Name = "ExpChatDictation"
		expChatDictation.Parent = coreGuiService
		var12.container.current = expChatDictation
		local audioDeviceInput_1 = Instance.new("AudioDeviceInput")
		audioDeviceInput_1.Player = localPlayer
		audioDeviceInput_1.Muted = false
		audioDeviceInput_1.Parent = expChatDictation
		audioDeviceInput_1.Active = true
		var12.audioDeviceInput.current = audioDeviceInput_1
		local audioSpeechToText = Instance.new("AudioSpeechToText")
		
		if engineAudioSTTIsDictationEnabled then
			audioSpeechToText.DictationEnabled = true
		end
		audioSpeechToText.Enabled = true
		audioSpeechToText.Parent = expChatDictation
		var12.audioSTT.current = audioSpeechToText
		local wire_1 = Instance.new("Wire")
		wire_1.SourceInstance = audioDeviceInput_1
		wire_1.TargetInstance = audioSpeechToText
		wire_1.Parent = expChatDictation
		var12.wire.current = wire_1
		var12.textConnection.current = audioSpeechToText:GetPropertyChangedSignal("Text"):Connect(function() --[[ line: 139 ]]
			-- upvalues: audioSpeechToText (ref), var15 (ref), p3 (ref)
			local text = audioSpeechToText.Text
			
			if text and text ~= "" then
				if var15 then
					audioSpeechToText.Text = ""
				end
				p3.onTranscription(text)
			end
		end)
		
		if p3.onSpeechStarted then
			local onSpeechStarted = p3.onSpeechStarted
			var12.vadConnection.current = audioSpeechToText:GetPropertyChangedSignal("VoiceDetected"):Connect(function() --[[ line: 153 ]]
				-- upvalues: audioSpeechToText (ref), onSpeechStarted (ref)
				if audioSpeechToText.VoiceDetected then
					onSpeechStarted()
				end
			end)
		end
		var5(audioDeviceInput_1)
		
		return audioDeviceInput_1
	end, { var12 })
	reactModule.useEffect(function() --[[ line: 166 ]]
		-- upvalues: var12 (ref)
		return function() --[[ line: 167 ]]
			-- upvalues: var12 (copy)
			local textConnection = var12.textConnection
			
			if textConnection.current then
				textConnection.current:Disconnect()
				textConnection.current = nil
			end
			local vadConnection = var12.vadConnection
			
			if vadConnection.current then
				vadConnection.current:Disconnect()
				vadConnection.current = nil
			end
			local wire = var12.wire
			
			if wire.current then
				wire.current:Destroy()
				wire.current = nil
			end
			local audioSTT = var12.audioSTT
			
			if audioSTT.current then
				audioSTT.current:Destroy()
				audioSTT.current = nil
			end
			local audioDeviceInput = var12.audioDeviceInput
			
			if audioDeviceInput.current then
				audioDeviceInput.current:Destroy()
				audioDeviceInput.current = nil
			end
			local container = var12.container
			
			if container.current then
				container.current:Destroy()
				container.current = nil
			end
		end
	end, { var12 })
	
	return reactModule.useMemo(function() --[[ line: 172 ]]
		-- upvalues: var14 (ref), var13 (ref), var4 (ref), var6 (ref)
		return {
			start = var14,
			stop = var13,
			audioDeviceInput = var4,
			audioDeviceInputRef = var6
		}
	end, { var14, var13, var4 })
end