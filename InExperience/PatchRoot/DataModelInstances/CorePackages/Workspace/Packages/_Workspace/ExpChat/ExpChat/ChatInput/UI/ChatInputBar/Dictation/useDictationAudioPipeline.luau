local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local engineAudioSTTIsDictationEnabled = game:DefineFastFlag("EngineAudioSTTIsDictationEnabled", false)

local function _(p1)
	if p1.current then
		p1.current:Destroy()
		p1.current = nil
	end
end

local _ = function(p1)
	if p1.current then
		p1.current:Disconnect()
		p1.current = nil
	end
end

local _ = function(p1)
	local textConnection = p1.textConnection
	
	if textConnection.current then
		textConnection.current:Disconnect()
		textConnection.current = nil
	end
	local vadConnection = p1.vadConnection
	
	if vadConnection.current then
		vadConnection.current:Disconnect()
		vadConnection.current = nil
	end
	local wire = p1.wire
	
	if wire.current then
		wire.current:Destroy()
		wire.current = nil
	end
	local audioSTT = p1.audioSTT
	
	if audioSTT.current then
		audioSTT.current:Destroy()
		audioSTT.current = nil
	end
	local audioDeviceInput = p1.audioDeviceInput
	
	if audioDeviceInput.current then
		audioDeviceInput.current:Destroy()
		audioDeviceInput.current = nil
	end
	local container = p1.container
	
	if container.current then
		container.current:Destroy()
		container.current = nil
	end
end

return function()
	-- upvalues: reactModule (ref), playersService (ref), coreGuiService (ref), engineAudioSTTIsDictationEnabled (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var4 (ref), var5 (ref), var6 (ref), var7 (ref), var8 (ref)
		return {
			audioDeviceInput = var3,
			audioSTT = var4,
			wire = var5,
			container = var6,
			textConnection = var7,
			vadConnection = var8
		}
	end, {})
	local var10 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var2 (ref)
		local textConnection = var9.textConnection
		
		if textConnection.current then
			textConnection.current:Disconnect()
			textConnection.current = nil
		end
		local vadConnection = var9.vadConnection
		
		if vadConnection.current then
			vadConnection.current:Disconnect()
			vadConnection.current = nil
		end
		local wire = var9.wire
		
		if wire.current then
			wire.current:Destroy()
			wire.current = nil
		end
		local audioSTT = var9.audioSTT
		
		if audioSTT.current then
			audioSTT.current:Destroy()
			audioSTT.current = nil
		end
		local audioDeviceInput = var9.audioDeviceInput
		
		if audioDeviceInput.current then
			audioDeviceInput.current:Destroy()
			audioDeviceInput.current = nil
		end
		local container = var9.container
		
		if container.current then
			container.current:Destroy()
			container.current = nil
		end
		var2(nil)
	end, { var9 })
	local var11 = reactModule.useCallback(function(p1, p2)
		-- upvalues: playersService (copy), var9 (ref), coreGuiService (copy), engineAudioSTTIsDictationEnabled (copy), var2 (ref)
		local localPlayer = playersService.LocalPlayer
		
		if not localPlayer then
			error("No local player")
		end
		local textConnection = var9.textConnection
		
		if textConnection.current then
			textConnection.current:Disconnect()
			textConnection.current = nil
		end
		local vadConnection = var9.vadConnection
		
		if vadConnection.current then
			vadConnection.current:Disconnect()
			vadConnection.current = nil
		end
		local wire = var9.wire
		
		if wire.current then
			wire.current:Destroy()
			wire.current = nil
		end
		local audioSTT = var9.audioSTT
		
		if audioSTT.current then
			audioSTT.current:Destroy()
			audioSTT.current = nil
		end
		local audioDeviceInput = var9.audioDeviceInput
		
		if audioDeviceInput.current then
			audioDeviceInput.current:Destroy()
			audioDeviceInput.current = nil
		end
		local container = var9.container
		
		if container.current then
			container.current:Destroy()
			container.current = nil
		end
		local var12 = p2 ~= nil and p2.continuous == true
		local expChatDictation = Instance.new("Folder")
		expChatDictation.Name = "ExpChatDictation"
		expChatDictation.Parent = coreGuiService
		var9.container.current = expChatDictation
		local audioDeviceInput_1 = Instance.new("AudioDeviceInput")
		audioDeviceInput_1.Player = localPlayer
		audioDeviceInput_1.Muted = false
		audioDeviceInput_1.Parent = expChatDictation
		audioDeviceInput_1.Active = true
		var9.audioDeviceInput.current = audioDeviceInput_1
		local audioSpeechToText = Instance.new("AudioSpeechToText")
		
		if engineAudioSTTIsDictationEnabled then
			audioSpeechToText.DictationEnabled = true
		end
		audioSpeechToText.Enabled = true
		audioSpeechToText.Parent = expChatDictation
		var9.audioSTT.current = audioSpeechToText
		local wire_1 = Instance.new("Wire")
		wire_1.SourceInstance = audioDeviceInput_1
		wire_1.TargetInstance = audioSpeechToText
		wire_1.Parent = expChatDictation
		var9.wire.current = wire_1
		var9.textConnection.current = audioSpeechToText:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: audioSpeechToText (ref), var12 (ref), p1 (ref)
			local text = audioSpeechToText.Text
			
			if text and text ~= "" then
				if var12 then
					audioSpeechToText.Text = ""
				end
				p1.onTranscription(text)
			end
		end)
		
		if p1.onSpeechStarted then
			local onSpeechStarted = p1.onSpeechStarted
			var9.vadConnection.current = audioSpeechToText:GetPropertyChangedSignal("VoiceDetected"):Connect(function()
				-- upvalues: audioSpeechToText (ref), onSpeechStarted (ref)
				if audioSpeechToText.VoiceDetected then
					onSpeechStarted()
				end
			end)
		end
		var2(audioDeviceInput_1)
		
		return audioDeviceInput_1
	end, { var9 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref)
		return function()
			-- upvalues: var9 (copy)
			local textConnection = var9.textConnection
			
			if textConnection.current then
				textConnection.current:Disconnect()
				textConnection.current = nil
			end
			local vadConnection = var9.vadConnection
			
			if vadConnection.current then
				vadConnection.current:Disconnect()
				vadConnection.current = nil
			end
			local wire = var9.wire
			
			if wire.current then
				wire.current:Destroy()
				wire.current = nil
			end
			local audioSTT = var9.audioSTT
			
			if audioSTT.current then
				audioSTT.current:Destroy()
				audioSTT.current = nil
			end
			local audioDeviceInput = var9.audioDeviceInput
			
			if audioDeviceInput.current then
				audioDeviceInput.current:Destroy()
				audioDeviceInput.current = nil
			end
			local container = var9.container
			
			if container.current then
				container.current:Destroy()
				container.current = nil
			end
		end
	end, { var9 })
	
	return reactModule.useMemo(function()
		-- upvalues: var11 (ref), var10 (ref), var1 (ref), var3 (ref)
		return {
			start = var11,
			stop = var10,
			audioDeviceInput = var1,
			audioDeviceInputRef = var3
		}
	end, { var11, var10, var1 })
end