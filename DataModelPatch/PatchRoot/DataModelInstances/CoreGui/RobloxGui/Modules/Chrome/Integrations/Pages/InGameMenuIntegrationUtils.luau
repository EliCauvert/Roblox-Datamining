local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local GameInviteAnalyticsManager = require(CorePackages.Workspace.Packages.GameInvite).GameInviteAnalyticsManager
local GameInviteModalManager = require(CorePackages.Workspace.Packages.GameInvite).GameInviteModalManager
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local MappedSignal = require(script:FindFirstAncestor("Chrome").ChromeShared.Service.ChromeUtils).MappedSignal
local _ = require(RobloxGui.Modules.Settings.EnumReactPage)
local ReactPageSignalModule = require(RobloxGui.Modules.Settings.ReactPageSignal)

return {
	createPageOpenSignal = function(p1)
		-- upvalues: Signal (copy), MappedSignal (copy), RobloxGui (copy)
		local IsNameMatch = false
		local NewSignal = Signal.new()
		local NewMappedSignal = MappedSignal.new(NewSignal, function()
			-- upvalues: IsNameMatch (ref)
			return IsNameMatch
		end)
		task.defer(function()
			-- upvalues: RobloxGui (upval), p1 (copy), IsNameMatch (ref), NewSignal (copy)
			local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
			SettingsHubModule.CurrentPageSignal:connect(function(Name)
				-- upvalues: SettingsHubModule (copy), p1 (upval), IsNameMatch (upval), NewSignal (upval)
				local SettingsHubModuleInstanceEntry = SettingsHubModule.Instance[p1]
				IsNameMatch = SettingsHubModuleInstanceEntry ~= nil and Name == SettingsHubModuleInstanceEntry.Page.Name
				NewSignal:fire()
			end)
		end)
		
		return NewMappedSignal
	end,
	toggleIGMPage = function(p1, p2)
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
	toggleReactPage = function(p1, p2, p3)
		-- upvalues: RobloxGui (copy), ReactPageSignalModule (copy)
		local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
		local SettingsHubModuleInstanceEntry = SettingsHubModule.Instance[p1]
		local ReactPageSignalModuleResult = ReactPageSignalModule()
		
		if not SettingsHubModule:GetVisibility() then
			SettingsHubModule:SetVisibility(true, false, SettingsHubModuleInstanceEntry)
			ReactPageSignalModuleResult.setCurrentReactPage(p3)
			
			return
		end
		if p2 then
			SettingsHubModule:SetVisibility(false)
			ReactPageSignalModuleResult.setCurrentReactPage(nil)
			
			return
		else
			SettingsHubModule:SwitchToPage(SettingsHubModuleInstanceEntry, true)
			ReactPageSignalModuleResult.setCurrentReactPage(p3)
		end
	end,
	toggleInviteFriendsPage = function()
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