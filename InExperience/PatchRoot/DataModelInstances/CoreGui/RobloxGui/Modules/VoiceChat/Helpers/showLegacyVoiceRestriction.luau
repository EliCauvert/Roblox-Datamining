local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local BuildLegacyVoiceRestrictionDetailModule = require(script.Parent.buildLegacyVoiceRestrictionDetail)
local _ = require(CorePackages.Workspace.Packages.VoiceChat.createVoiceRestrictionController)
local GetRestrictionTypeModule = require(script.Parent.getRestrictionType)
local UniversalFeatureRestrictionsModule = require(CorePackages.Workspace.Packages.UniversalFeatureRestrictions)
local VoiceChatModule = require(CorePackages.Workspace.Packages.VoiceChat)
local NewResult = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)

local function format(p1, p2)
	-- upvalues: NewResult (copy)
	return NewResult:Format(p1, p2)
end

return function(p1)
	-- upvalues: Players (copy), GetRestrictionTypeModule (copy), BuildLegacyVoiceRestrictionDetailModule (copy), format (copy), VoiceChatModule (copy), UniversalFeatureRestrictionsModule (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if not LocalPlayer then return end
	local UserId = LocalPlayer.UserId
	local Manager = p1.manager
	local Settings = p1.settings
	local Trigger = p1.trigger
	local IsCurrentFunction = p1.isCurrent
	local PreviousSessionId = if Manager.service then Manager.previousSessionId else ""
	local Analytics = Manager.Analytics
	local RestrictionTypeModule = GetRestrictionTypeModule(Settings)
	local BanReason = if Settings then Settings.banReason else nil
	local v1 = nil
	local v2 = nil
	
	if not Settings then
		v1, v19 = Manager:GetNudgeAnalyticsData()
	end
	local LegacyVoiceRestrictionDetailModule = BuildLegacyVoiceRestrictionDetailModule({
		settings = Settings,
		userId = UserId,
		now = DateTime.now().UnixTimestamp,
		format = format
	})
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	
	local function _(p2)
		-- upvalues: Analytics (copy), BanReason (copy), UserId (copy), PreviousSessionId (copy)
		Analytics:reportBanMessageEvent(p2)
		Analytics:reportBanMessageEventV2(p2, BanReason, UserId, PreviousSessionId)
	end
	
	local function onAppeal()
		-- upvalues: Flag1 (ref), RestrictionTypeModule (copy), Analytics (copy), v1 (ref), v2 (ref), BanReason (copy), UserId (copy), PreviousSessionId (copy)
		Flag1 = true
		
		if RestrictionTypeModule == "Nudge" then
			Analytics:reportDeniedNudge(v1, v2)
			
			return
		else
			Analytics:reportBanMessageEvent("Denied")
			Analytics:reportBanMessageEventV2("Denied", BanReason, UserId, PreviousSessionId)
		end
	end
	
	UniversalFeatureRestrictionsModule.showFeatureRestrictionDirect(UniversalFeatureRestrictionsModule.AbuseVector.Voice, LegacyVoiceRestrictionDetailModule, {
		onShown = function()
			-- upvalues: Flag2 (ref), RestrictionTypeModule (copy), Analytics (copy), BanReason (copy), UserId (copy), PreviousSessionId (copy)
			if not Flag2 then
				Flag2 = true
				
				if RestrictionTypeModule ~= "Nudge" then
					Analytics:reportBanMessageEvent("Shown")
					Analytics:reportBanMessageEventV2("Shown", BanReason, UserId, PreviousSessionId)
				end
			end
		end,
		onDismiss = function()
			-- upvalues: Flag (ref), RestrictionTypeModule (copy), Trigger (copy), IsCurrentFunction (copy), VoiceChatModule (upval), Manager (copy), Analytics (copy), v1 (ref), v2 (ref), Flag1 (ref), BanReason (copy), UserId (copy), PreviousSessionId (copy)
			if Flag then return end
			Flag = true
			
			if Trigger ~= "micTap" and (RestrictionTypeModule == "TemporaryBan" or RestrictionTypeModule == "NudgeBan") and IsCurrentFunction() then
				VoiceChatModule.PostInformedOfBan(function(p2, p3, p4)
					-- upvalues: Manager (upval)
					return Manager:PostRequest(p2, p3, p4)
				end, true)
			end
			if RestrictionTypeModule == "Nudge" then
				Analytics:reportClosedNudge(v1, v2)
				
				if not Flag1 then
					Analytics:reportAcknowledgedNudge(v1, v2)
					
					return
				end
			elseif not Flag1 then
				local Understood: string = if RestrictionTypeModule == "NudgeBan" then "Understood" else "Acknowledged"
				Analytics:reportBanMessageEvent(Understood)
				Analytics:reportBanMessageEventV2(Understood, BanReason, UserId, PreviousSessionId)
			end
		end,
		onAppeal = if RestrictionTypeModule == "Nudge" or RestrictionTypeModule == "NudgeBan" then onAppeal else nil
	})
end