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
local var7 = false
local var8 = false
local var9 = false
local var10 = nil
local var11 = nil
local var12 = nil

local function _()
	-- upvalues: coreGuiService (ref)
	return require(coreGuiService:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("VoiceChat"):WaitForChild("VoiceChatServiceManager")).default
end

local _ = function()
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	return if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil
end

local _ = function(p0)
	local var13 = nil
	
	return if pcall(function()
		-- upvalues: var13 (write), p0 (ref)
		var13 = p0:GetSessionId()
	end) and var13 ~= nil and var13 ~= "" then var13 else nil
end

local _ = function(p1)
	-- upvalues: var8 (write), var9 (write), voiceVolumeControlsEligibility (ref), voiceChatService (ref), var10 (write), peopleService (ref)
	if var8 then return end
	var8 = true
	var9 = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, voiceChatService.UseNewAudioApi)
	local var14 = nil
	var10 = if pcall(function()
		-- upvalues: var14 (write), p1 (ref)
		var13 = p1:GetSessionId()
	end) and var14 ~= nil and var14 ~= "" then var14 else nil
	
	if var9 then
		require(peopleService.Analytics.PeopleAnalyticsManager):resetPerUserVoiceVolumeSession()
	end
end

local _ = function()
	-- upvalues: var8 (write), var9 (write), var10 (write), peopleService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	if not var8 then return end
	var8 = false
	
	if var9 then
		require(peopleService.Analytics.PeopleAnalyticsManager):flushPerUserVoiceVolumeSession(if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil, var10)
		var9 = false
		var10 = nil
		
		return
	end
	var9 = false
	var10 = nil
end

local _ = function(p2)
	-- upvalues: var8 (write), var9 (write), voiceVolumeControlsEligibility (ref), voiceChatService (ref), var10 (write), peopleService (ref)
	local service = p2:getService()
	
	if (service and service.VoiceChatState) == Enum.VoiceChatState.Joined then
		if var8 then return end
		var8 = true
		var9 = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, voiceChatService.UseNewAudioApi)
		local var16 = nil
		var10 = if pcall(function()
			-- upvalues: var16 (write), p2 (ref)
			var13 = p2:GetSessionId()
		end) and var16 ~= nil and var16 ~= "" then var16 else nil
		
		if var9 then
			require(peopleService.Analytics.PeopleAnalyticsManager):resetPerUserVoiceVolumeSession()
		end
	end
end

return {
	ensureStarted = function()
		-- upvalues: var7 (write), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), fFlagVoiceVolumeControlsPerUserPlayerListButton (ref), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (ref), coreGuiService (ref), playersService (ref), var12 (write), var8 (write), var9 (write), var10 (write), peopleService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), var11 (write), voiceVolumeControlsEligibility (ref), voiceChatService (ref)
		if var7 then return end
		if not fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then return end
		if not fFlagVoiceVolumeControlsPerUserPlayerListButton and not fFlagVoiceVolumeControlsPerUserPlayerGridMenu then return end
		if game:GetEngineFeature("VoiceChatSupported") then
			var7 = true
			task.defer(function()
				-- upvalues: coreGuiService (copy), playersService (copy), var12 (copy), var8 (copy), var9 (copy), var10 (copy), peopleService (copy), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), var11 (copy), voiceVolumeControlsEligibility (copy), voiceChatService (copy)
				local default = require(coreGuiService:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("VoiceChat"):WaitForChild("VoiceChatServiceManager")).default
				local localPlayer = playersService.LocalPlayer
				
				if localPlayer then
					var12 = playersService.PlayerRemoving:Connect(function(p3)
						-- upvalues: localPlayer (ref), var8 (copy), var9 (copy), var10 (copy), peopleService (copy), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy)
						if p3 ~= localPlayer then return end
						if not var8 then return end
						var8 = false
						
						if var9 then
							require(peopleService.Analytics.PeopleAnalyticsManager):flushPerUserVoiceVolumeSession(if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil, var10)
							var9 = false
							var10 = nil
							
							return
						end
						var9 = false
						var10 = nil
					end)
				end
				default:asyncInit():andThen(function()
					-- upvalues: var11 (copy), default (ref), var8 (copy), var9 (copy), voiceVolumeControlsEligibility (copy), voiceChatService (copy), var10 (copy), peopleService (copy), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy)
					var11 = function(_, p4)
						-- upvalues: default (copy), var8 (copy), var9 (copy), voiceVolumeControlsEligibility (copy), voiceChatService (copy), var10 (copy), peopleService (copy), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy)
						if p4 == Enum.VoiceChatState.Joined then
							local var19 = default
							
							if var8 then return end
							var8 = true
							var9 = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, voiceChatService.UseNewAudioApi)
							local var20 = nil
							var10 = if pcall(function()
								-- upvalues: var20 (write), var19 (ref)
								var13 = var19:GetSessionId()
							end) and var20 ~= nil and var20 ~= "" then var20 else nil
							
							if var9 then
								require(peopleService.Analytics.PeopleAnalyticsManager):resetPerUserVoiceVolumeSession()
								
								return
							end
						elseif p4 == Enum.VoiceChatState.Ended or p4 == Enum.VoiceChatState.Failed then
							if not var8 then return end
							var8 = false
							
							if not var9 then
								var9 = false
								var10 = nil
								
								return
							end
							require(peopleService.Analytics.PeopleAnalyticsManager):flushPerUserVoiceVolumeSession(if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil, var10)
							var9 = false
							var10 = nil
						end
					end
					
					default:subscribe("OnStateChanged", var11)
					local service = default:getService()
					
					if (service and service.VoiceChatState) == Enum.VoiceChatState.Joined then
						if var8 then return end
						var8 = true
						var9 = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, voiceChatService.UseNewAudioApi)
						local var18 = nil
						var10 = if pcall(function()
							-- upvalues: var18 (write), default (ref)
							var13 = default:GetSessionId()
						end) and var18 ~= nil and var18 ~= "" then var18 else nil
						
						if var9 then
							require(peopleService.Analytics.PeopleAnalyticsManager):resetPerUserVoiceVolumeSession()
						end
					end
				end):catch(function() end)
			end)
			
			return
		end
	end
}