local playersService = game:GetService("Players")
local voiceChatService = game:GetService("VoiceChatService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local coreGuiService = game:GetService("CoreGui")
local peopleService = script:FindFirstAncestor("PeopleService")
local parent = peopleService.Parent
local flagsModule = require(peopleService.Flags)
local fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = flagsModule.FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry
local fFlagVoiceVolumeControlsPerUserPlayerListButton = flagsModule.FFlagVoiceVolumeControlsPerUserPlayerListButton
local fFlagVoiceVolumeControlsPerUserPlayerGridMenu = flagsModule.FFlagVoiceVolumeControlsPerUserPlayerGridMenu
local voiceVolumeControlsEligibility = require(parent.VoiceChatCore).VoiceVolumeControlsEligibility
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local var1 = false
local var2 = false
local var3 = false
local var4 = nil
local var5 = nil
local var6 = nil

local function _()
	-- upvalues: coreGuiService (ref)
	return require(coreGuiService:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("VoiceChat"):WaitForChild("VoiceChatServiceManager")).default
end

local _ = function()
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	return if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil
end

local _ = function(p1)
	local var7 = nil
	
	return if pcall(function()
		-- upvalues: var7 (write), p1 (ref)
		var7 = p1:GetSessionId()
	end) and var7 ~= nil and var7 ~= "" then var7 else nil
end

local _ = function(p1)
	-- upvalues: var2 (write), var3 (write), voiceVolumeControlsEligibility (ref), voiceChatService (ref), var4 (write), peopleService (ref)
	if var2 then return end
	var2 = true
	var3 = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, voiceChatService.UseNewAudioApi)
	local var7 = nil
	var4 = if pcall(function()
		-- upvalues: var7 (write), p1 (ref)
		var13 = p1:GetSessionId()
	end) and var7 ~= nil and var7 ~= "" then var7 else nil
	
	if var3 then
		require(peopleService.Analytics.PeopleAnalyticsManager):resetPerUserVoiceVolumeSession()
	end
end

local _ = function()
	-- upvalues: var2 (write), var3 (write), var4 (write), peopleService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	if not var2 then return end
	var2 = false
	
	if var3 then
		require(peopleService.Analytics.PeopleAnalyticsManager):flushPerUserVoiceVolumeSession(if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil, var4)
		var3 = false
		var4 = nil
		
		return
	end
	var3 = false
	var4 = nil
end

local _ = function(p1)
	-- upvalues: var2 (write), var3 (write), voiceVolumeControlsEligibility (ref), voiceChatService (ref), var4 (write), peopleService (ref)
	local service = p1:getService()
	
	if (service and service.VoiceChatState) == Enum.VoiceChatState.Joined then
		if var2 then return end
		var2 = true
		var3 = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, voiceChatService.UseNewAudioApi)
		local var7 = nil
		var4 = if pcall(function()
			-- upvalues: var7 (write), p1 (ref)
			var13 = p1:GetSessionId()
		end) and var7 ~= nil and var7 ~= "" then var7 else nil
		
		if var3 then
			require(peopleService.Analytics.PeopleAnalyticsManager):resetPerUserVoiceVolumeSession()
		end
	end
end

return {
	ensureStarted = function()
		-- upvalues: var1 (write), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), fFlagVoiceVolumeControlsPerUserPlayerListButton (ref), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (ref), coreGuiService (ref), playersService (ref), var6 (write), var2 (write), var3 (write), var4 (write), peopleService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), var5 (write), voiceVolumeControlsEligibility (ref), voiceChatService (ref)
		if var1 then return end
		if not fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then return end
		if not fFlagVoiceVolumeControlsPerUserPlayerListButton and not fFlagVoiceVolumeControlsPerUserPlayerGridMenu then return end
		if game:GetEngineFeature("VoiceChatSupported") then
			var1 = true
			task.defer(function()
				-- upvalues: coreGuiService (copy), playersService (copy), var6 (copy), var2 (copy), var3 (copy), var4 (copy), peopleService (copy), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), var5 (copy), voiceVolumeControlsEligibility (copy), voiceChatService (copy)
				local default = require(coreGuiService:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("VoiceChat"):WaitForChild("VoiceChatServiceManager")).default
				local localPlayer = playersService.LocalPlayer
				
				if localPlayer then
					var6 = playersService.PlayerRemoving:Connect(function(p1)
						-- upvalues: localPlayer (ref), var2 (copy), var3 (copy), var4 (copy), peopleService (copy), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy)
						if p1 ~= localPlayer then return end
						if not var2 then return end
						var2 = false
						
						if var3 then
							require(peopleService.Analytics.PeopleAnalyticsManager):flushPerUserVoiceVolumeSession(if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil, var4)
							var3 = false
							var4 = nil
							
							return
						end
						var3 = false
						var4 = nil
					end)
				end
				default:asyncInit():andThen(function()
					-- upvalues: var5 (copy), default (ref), var2 (copy), var3 (copy), voiceVolumeControlsEligibility (copy), voiceChatService (copy), var4 (copy), peopleService (copy), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy)
					var5 = function(_, p1)
						-- upvalues: default (copy), var2 (copy), var3 (copy), voiceVolumeControlsEligibility (copy), voiceChatService (copy), var4 (copy), peopleService (copy), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy)
						if p1 == Enum.VoiceChatState.Joined then
							local var7 = default
							
							if var2 then return end
							var2 = true
							var3 = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, voiceChatService.UseNewAudioApi)
							local var8 = nil
							var4 = if pcall(function()
								-- upvalues: var8 (write), var7 (ref)
								var13 = var7:GetSessionId()
							end) and var8 ~= nil and var8 ~= "" then var8 else nil
							
							if var3 then
								require(peopleService.Analytics.PeopleAnalyticsManager):resetPerUserVoiceVolumeSession()
								
								return
							end
						elseif p1 == Enum.VoiceChatState.Ended or p1 == Enum.VoiceChatState.Failed then
							if not var2 then return end
							var2 = false
							
							if not var3 then
								var3 = false
								var4 = nil
								
								return
							end
							require(peopleService.Analytics.PeopleAnalyticsManager):flushPerUserVoiceVolumeSession(if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil, var4)
							var3 = false
							var4 = nil
						end
					end
					
					default:subscribe("OnStateChanged", var5)
					local service = default:getService()
					
					if (service and service.VoiceChatState) == Enum.VoiceChatState.Joined then
						if var2 then return end
						var2 = true
						var3 = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, voiceChatService.UseNewAudioApi)
						local var7 = nil
						var4 = if pcall(function()
							-- upvalues: var7 (write), default (ref)
							var13 = default:GetSessionId()
						end) and var7 ~= nil and var7 ~= "" then var7 else nil
						
						if var3 then
							require(peopleService.Analytics.PeopleAnalyticsManager):resetPerUserVoiceVolumeSession()
						end
					end
				end):catch(function() end)
			end)
			
			return
		end
	end
}