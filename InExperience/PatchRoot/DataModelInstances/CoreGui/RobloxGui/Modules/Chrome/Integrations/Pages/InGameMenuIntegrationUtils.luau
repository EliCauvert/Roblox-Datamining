local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local GameInviteAnalyticsManager = require(CorePackages.Workspace.Packages.GameInvite).GameInviteAnalyticsManager
local GameInviteModalManager = require(CorePackages.Workspace.Packages.GameInvite).GameInviteModalManager
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local MappedSignal = require(script:FindFirstAncestor("Chrome").ChromeShared.Service.ChromeUtils).MappedSignal

return {
	createPageOpenSignal = function(p1) --[[ Line: 17 ]]
		-- upvalues: Signal (copy), MappedSignal (copy), RobloxGui (copy)
		local IsNameMatch = false
		local NewSignal = Signal.new()
		local NewMappedSignal = MappedSignal.new(NewSignal, function() --[[ Line: 20 ]]
			-- upvalues: IsNameMatch (ref)
			return IsNameMatch
		end)
		task.defer(function() --[[ Line: 24 ]]
			-- upvalues: RobloxGui (upval), p1 (copy), IsNameMatch (ref), NewSignal (copy)
			local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
			SettingsHubModule.CurrentPageSignal:connect(function(Name) --[[ Line: 26 ]]
				-- upvalues: SettingsHubModule (copy), p1 (upval), IsNameMatch (upval), NewSignal (upval)
				local SettingsHubModuleInstanceEntry = SettingsHubModule.Instance[p1]
				IsNameMatch = SettingsHubModuleInstanceEntry ~= nil and Name == SettingsHubModuleInstanceEntry.Page.Name
				NewSignal:fire()
			end)
		end)
		
		return NewMappedSignal
	end,
	toggleIGMPage = function(p1, p2) --[[ Line: 36 ]]
		-- upvalues: RobloxGui (copy)
		local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
		local SettingsHubModuleInstanceEntry = SettingsHubModule.Instance[p1]
		
		if not SettingsHubModule:GetVisibility() then
			SettingsHubModule:SetVisibility(true, false, SettingsHubModuleInstanceEntry)
			
			return
		end
		if p2 then
			SettingsHubModule:SetVisibility(false)
			
			return
		else
			SettingsHubModule:SwitchToPage(SettingsHubModuleInstanceEntry, true)
		end
	end,
	toggleInviteFriendsPage = function() --[[ Line: 51 ]]
		-- upvalues: GameInviteModalManager (copy), RobloxGui (copy), GameInviteAnalyticsManager (copy)
		if GameInviteModalManager:isGameModalOpen() then
			GameInviteModalManager:closeModal()
			
			return
		else
			local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
			GameInviteAnalyticsManager:withButtonName(GameInviteAnalyticsManager.ButtonName.SettingsHub)
			SettingsHubModule:InviteToGame()
		end
	end
}