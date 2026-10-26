local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local _ = require(CorePackages.Workspace.Packages.VoiceChat.createVoiceRestrictionController)
local UniversalFeatureRestrictionsModule = require(CorePackages.Workspace.Packages.UniversalFeatureRestrictions)

return function(p1)
	-- upvalues: Players (copy), UniversalFeatureRestrictionsModule (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		local UserId = LocalPlayer.UserId
		local Manager = p1.manager
		local Analytics = Manager.Analytics
		local BanReason = p1.settings.banReason
		local PreviousSessionId = if Manager.service then Manager.previousSessionId else ""
		local Flag = false
		local Flag1 = false
		local Flag2 = false
		
		local function _(p2)
			-- upvalues: Analytics (copy), BanReason (copy), UserId (copy), PreviousSessionId (copy)
			Analytics:reportBanMessageEvent(p2)
			Analytics:reportBanMessageEventV2(p2, BanReason, UserId, PreviousSessionId)
		end
		
		UniversalFeatureRestrictionsModule.showFeatureRestriction(UniversalFeatureRestrictionsModule.AbuseVector.Voice, {
			onShown = function()
				-- upvalues: Flag (ref), Analytics (copy), BanReason (copy), UserId (copy), PreviousSessionId (copy)
				if not Flag then
					Flag = true
					Analytics:reportBanMessageEvent("Shown")
					Analytics:reportBanMessageEventV2("Shown", BanReason, UserId, PreviousSessionId)
				end
			end,
			onAppeal = function()
				-- upvalues: Flag1 (ref), Analytics (copy), BanReason (copy), UserId (copy), PreviousSessionId (copy)
				Flag1 = true
				Analytics:reportBanMessageEvent("Denied")
				Analytics:reportBanMessageEventV2("Denied", BanReason, UserId, PreviousSessionId)
			end,
			onDismiss = function()
				-- upvalues: Flag2 (ref), Flag1 (ref), Analytics (copy), BanReason (copy), UserId (copy), PreviousSessionId (copy)
				if Flag2 then return end
				Flag2 = true
				
				if not Flag1 then
					Analytics:reportBanMessageEvent("Acknowledged")
					Analytics:reportBanMessageEventV2("Acknowledged", BanReason, UserId, PreviousSessionId)
				end
			end,
			onAcknowledgementSuccess = p1.onAcknowledgementSuccess
		})
		
		return
	end
end