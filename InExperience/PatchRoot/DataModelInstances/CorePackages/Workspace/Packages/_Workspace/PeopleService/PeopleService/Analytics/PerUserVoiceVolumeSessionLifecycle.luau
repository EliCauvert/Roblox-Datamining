local Players = game:GetService("Players")
local VoiceChatService = game:GetService("VoiceChatService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CoreGui = game:GetService("CoreGui")
local PeopleService = script:FindFirstAncestor("PeopleService")
local FlagsModule = require(PeopleService.Flags)
local FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = FlagsModule.FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry
local FFlagVoiceVolumeControlsPerUserPlayerListButton = FlagsModule.FFlagVoiceVolumeControlsPerUserPlayerListButton
local FFlagVoiceVolumeControlsPerUserPlayerGridMenu = FlagsModule.FFlagVoiceVolumeControlsPerUserPlayerGridMenu
local VoiceVolumeControlsEligibility = require(PeopleService.Parent.VoiceChatCore).VoiceVolumeControlsEligibility
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local Flag = false
local Flag1 = false
local IsVoiceChatVolumeSliderVisible = false
local v1 = nil
local v2 = nil
local PlayerRemovingConnection = nil

local function _() --[[ Line: 29 | Named "getVoiceChatServiceManager" ]]
	-- upvalues: CoreGui (copy)
	return require(CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("VoiceChat"):WaitForChild("VoiceChatServiceManager")).default
end

local _ = function() --[[ Line: 34 | Named "getPlaySessionId" ]]
	-- upvalues: RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy)
	return if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else nil
end

local _ = function(p1) --[[ Line: 41 | Named "getVoiceSessionId" ]]
	local SessionId = nil
	
	return if pcall(function() --[[ Line: 43 ]]
		-- upvalues: SessionId (ref), p1 (copy)
		SessionId = p1:GetSessionId()
	end) and SessionId ~= nil and SessionId ~= "" then SessionId else nil
end

local _ = function(p1) --[[ Line: 52 | Named "beginSession" ]]
	-- upvalues: Flag1 (ref), IsVoiceChatVolumeSliderVisible (ref), VoiceVolumeControlsEligibility (copy), VoiceChatService (copy), v1 (ref), PeopleService (copy)
	if Flag1 then return end
	Flag1 = true
	IsVoiceChatVolumeSliderVisible = VoiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, VoiceChatService.UseNewAudioApi)
	local SessionId = nil
	v1 = if pcall(function() --[[ Line: 43 ]]
		-- upvalues: SessionId (ref), p1 (copy)
		SessionId = p1:GetSessionId()
	end) and SessionId ~= nil and SessionId ~= "" then SessionId else nil
	
	if IsVoiceChatVolumeSliderVisible then
		require(PeopleService.Analytics.PeopleAnalyticsManager):resetPerUserVoiceVolumeSession()
	end
end

local _ = function() --[[ Line: 66 | Named "flushSession" ]]
	-- upvalues: Flag1 (ref), IsVoiceChatVolumeSliderVisible (ref), v1 (ref), PeopleService (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy)
	if not Flag1 then return end
	Flag1 = false
	
	if IsVoiceChatVolumeSliderVisible then
		require(PeopleService.Analytics.PeopleAnalyticsManager):flushPerUserVoiceVolumeSession(if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else nil, v1)
		IsVoiceChatVolumeSliderVisible = false
		v1 = nil
		
		return
	else
		IsVoiceChatVolumeSliderVisible = false
		v1 = nil
	end
end

local _ = function(p1) --[[ Line: 85 | Named "tryBeginIfJoined" ]]
	-- upvalues: Flag1 (ref), IsVoiceChatVolumeSliderVisible (ref), VoiceVolumeControlsEligibility (copy), VoiceChatService (copy), v1 (ref), PeopleService (copy)
	local Service = p1:getService()
	
	if (Service and Service.VoiceChatState) == Enum.VoiceChatState.Joined then
		if Flag1 then return end
		Flag1 = true
		IsVoiceChatVolumeSliderVisible = VoiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, VoiceChatService.UseNewAudioApi)
		local SessionId = nil
		v1 = if pcall(function() --[[ Line: 43 ]]
			-- upvalues: SessionId (ref), p1 (copy)
			SessionId = p1:GetSessionId()
		end) and SessionId ~= nil and SessionId ~= "" then SessionId else nil
		
		if IsVoiceChatVolumeSliderVisible then
			require(PeopleService.Analytics.PeopleAnalyticsManager):resetPerUserVoiceVolumeSession()
		end
	end
end

return {
	ensureStarted = function() --[[ Line: 93 ]]
		-- upvalues: Flag (ref), FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), FFlagVoiceVolumeControlsPerUserPlayerListButton (copy), FFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), CoreGui (copy), Players (copy), PlayerRemovingConnection (ref), Flag1 (ref), IsVoiceChatVolumeSliderVisible (ref), v1 (ref), PeopleService (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), v2 (ref), VoiceVolumeControlsEligibility (copy), VoiceChatService (copy)
		if Flag then return end
		if not FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then return end
		if not FFlagVoiceVolumeControlsPerUserPlayerListButton and not FFlagVoiceVolumeControlsPerUserPlayerGridMenu then return end
		if game:GetEngineFeature("VoiceChatSupported") then
			Flag = true
			task.defer(function() --[[ Line: 111 ]]
				-- upvalues: CoreGui (upval), Players (upval), PlayerRemovingConnection (upval), Flag1 (upval), IsVoiceChatVolumeSliderVisible (upval), v1 (upval), PeopleService (upval), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (upval), RbxAnalyticsService (upval), v2 (upval), VoiceVolumeControlsEligibility (upval), VoiceChatService (upval)
				local Default = require(CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("VoiceChat"):WaitForChild("VoiceChatServiceManager")).default
				local LocalPlayer = Players.LocalPlayer
				
				if LocalPlayer then
					PlayerRemovingConnection = Players.PlayerRemoving:Connect(function(Player) --[[ Line: 116 ]]
						-- upvalues: LocalPlayer (copy), Flag1 (upval), IsVoiceChatVolumeSliderVisible (upval), v1 (upval), PeopleService (upval), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (upval), RbxAnalyticsService (upval)
						if Player ~= LocalPlayer then return end
						if not Flag1 then return end
						Flag1 = false
						
						if IsVoiceChatVolumeSliderVisible then
							require(PeopleService.Analytics.PeopleAnalyticsManager):flushPerUserVoiceVolumeSession(if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else nil, v1)
							IsVoiceChatVolumeSliderVisible = false
							v1 = nil
							
							return
						else
							IsVoiceChatVolumeSliderVisible = false
							v1 = nil
						end
					end)
				end
				Default:asyncInit():andThen(function() --[[ Line: 125 ]]
					-- upvalues: v2 (upval), Default (copy), Flag1 (upval), IsVoiceChatVolumeSliderVisible (upval), VoiceVolumeControlsEligibility (upval), VoiceChatService (upval), v1 (upval), PeopleService (upval), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (upval), RbxAnalyticsService (upval)
					v2 = function(_, VoiceChatState) --[[ Line: 126 ]]
						-- upvalues: Default (upval), Flag1 (upval), IsVoiceChatVolumeSliderVisible (upval), VoiceVolumeControlsEligibility (upval), VoiceChatService (upval), v1 (upval), PeopleService (upval), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (upval), RbxAnalyticsService (upval)
						if VoiceChatState == Enum.VoiceChatState.Joined then
							if Flag1 then return end
							Flag1 = true
							IsVoiceChatVolumeSliderVisible = VoiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, VoiceChatService.UseNewAudioApi)
							local SessionId = nil
							v1 = if pcall(function() --[[ Line: 43 ]]
								-- upvalues: SessionId (ref), Default (copy)
								SessionId = Default:GetSessionId()
							end) and SessionId ~= nil and SessionId ~= "" then SessionId else nil
							
							if IsVoiceChatVolumeSliderVisible then
								require(PeopleService.Analytics.PeopleAnalyticsManager):resetPerUserVoiceVolumeSession()
								
								return
							end
						elseif VoiceChatState == Enum.VoiceChatState.Ended or VoiceChatState == Enum.VoiceChatState.Failed then
							if not Flag1 then return end
							Flag1 = false
							
							if not IsVoiceChatVolumeSliderVisible then
								IsVoiceChatVolumeSliderVisible = false
								v1 = nil
								
								return
							end
							require(PeopleService.Analytics.PeopleAnalyticsManager):flushPerUserVoiceVolumeSession(if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else nil, v1)
							IsVoiceChatVolumeSliderVisible = false
							v1 = nil
						end
					end
					
					Default:subscribe("OnStateChanged", v2)
					local Service = Default:getService()
					
					if (Service and Service.VoiceChatState) == Enum.VoiceChatState.Joined then
						if Flag1 then return end
						Flag1 = true
						IsVoiceChatVolumeSliderVisible = VoiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, VoiceChatService.UseNewAudioApi)
						local SessionId = nil
						v1 = if pcall(function() --[[ Line: 43 ]]
							-- upvalues: SessionId (ref), Default (copy)
							SessionId = Default:GetSessionId()
						end) and SessionId ~= nil and SessionId ~= "" then SessionId else nil
						
						if IsVoiceChatVolumeSliderVisible then
							require(PeopleService.Analytics.PeopleAnalyticsManager):resetPerUserVoiceVolumeSession()
						end
					end
				end):catch(function() --[[ Line: 140 ]] end)
			end)
			
			return
		end
	end
}