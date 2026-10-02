local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local buildProactiveVoiceRestrictionDetailModule = require(script.Parent.buildProactiveVoiceRestrictionDetail)
local _ = require(corePackagesService.Workspace.Packages.VoiceChat.createVoiceRestrictionController)
local getRestrictionTypeModule = require(script.Parent.getRestrictionType)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local universalFeatureRestrictionsModule = require(corePackagesService.Workspace.Packages.UniversalFeatureRestrictions)
local voiceChatModule = require(corePackagesService.Workspace.Packages.VoiceChat)
local var1 = localization.new(localizationService.RobloxLocaleId)

local function format(p1, p2)
	-- upvalues: var1 (ref)
	return var1:Format(p1, p2)
end

return function(p1)
	-- upvalues: playersService (ref), getRestrictionTypeModule (ref), buildProactiveVoiceRestrictionDetailModule (ref), format (ref), voiceChatModule (ref), universalFeatureRestrictionsModule (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then return end
	local userId = localPlayer.UserId
	local manager = p1.manager
	local settings = p1.settings
	local origin = p1.origin
	local isCurrent = p1.isCurrent
	local var2 = if manager.service then manager.previousSessionId else ""
	local analytics = manager.Analytics
	local var3 = getRestrictionTypeModule(settings)
	local var4 = if settings then settings.banReason else nil
	local var5 = nil
	local var6 = nil
	
	if not settings then
		local nudgeAnalyticsData, nudgeAnalyticsData_1 = manager:GetNudgeAnalyticsData()
		var5 = nudgeAnalyticsData
		var6 = nudgeAnalyticsData_1
	end
	local var7 = buildProactiveVoiceRestrictionDetailModule({
		settings = settings,
		userId = userId,
		now = DateTime.now().UnixTimestamp,
		format = format
	})
	local var8 = false
	local var9 = false
	local var10 = false
	
	local function _(p2)
		-- upvalues: analytics (ref), var4 (ref), userId (ref), var2 (ref)
		analytics:reportBanMessageEvent(p2)
		analytics:reportBanMessageEventV2(p2, var4, userId, var2)
	end
	
	universalFeatureRestrictionsModule.showFeatureRestrictionDirect(universalFeatureRestrictionsModule.AbuseVector.Voice, var7, {
		onShown = function()
			-- upvalues: var10 (write), var3 (ref), analytics (ref), var4 (ref), userId (ref), var2 (ref)
			if not var10 then
				var10 = true
				
				if var3 ~= "Nudge" then
					analytics:reportBanMessageEvent("Shown")
					analytics:reportBanMessageEventV2("Shown", var4, userId, var2)
				end
			end
		end,
		onDismiss = function()
			-- upvalues: var8 (write), var3 (ref), origin (ref), isCurrent (ref), voiceChatModule (copy), manager (ref), analytics (ref), var5 (write), var6 (write), var9 (write), var4 (ref), userId (ref), var2 (ref)
			if var8 then return end
			var8 = true
			
			if origin ~= "mic" and (if var3 ~= "TemporaryBan" then var3 == "NudgeBan" else true) and isCurrent() then
				voiceChatModule.PostInformedOfBan(function(p2, p3, p4)
					-- upvalues: manager (copy)
					return manager:PostRequest(p2, p3, p4)
				end, true)
			end
			if var3 == "Nudge" then
				analytics:reportClosedNudge(var5, var6)
				
				if var9 then
					return
				else
					analytics:reportAcknowledgedNudge(var5, var6)
					
					return
				end
			elseif not var9 then
				local var11 = if var3 == "NudgeBan" then "Understood" else "Acknowledged"
				analytics:reportBanMessageEvent(var11)
				analytics:reportBanMessageEventV2(var11, var4, userId, var2)
			end
		end,
		onAppeal = if var3 == "Nudge" or var3 == "NudgeBan" then function()
			-- upvalues: var9 (write), var3 (ref), analytics (ref), var5 (write), var6 (write), var4 (ref), userId (ref), var2 (ref)
			var9 = true
			
			if var3 == "Nudge" then
				analytics:reportDeniedNudge(var5, var6)
				
				return
			end
			analytics:reportBanMessageEvent("Denied")
			analytics:reportBanMessageEventV2("Denied", var4, userId, var2)
		end else nil
	})
end