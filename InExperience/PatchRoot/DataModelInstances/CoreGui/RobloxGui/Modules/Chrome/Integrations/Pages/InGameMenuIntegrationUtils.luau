local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local gameInviteAnalyticsManager = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteAnalyticsManager
local gameInviteModalManager = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteModalManager
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local mappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal

return {
	createPageOpenSignal = function(value)
		-- upvalues: signal (ref), mappedSignal (ref), robloxGui (ref)
		local var1 = false
		local var2 = signal.new()
		local var3 = mappedSignal.new(var2, function()
			-- upvalues: var1 (write)
			return var1
		end)
		task.defer(function()
			-- upvalues: robloxGui (copy), value (ref), var1 (write), var2 (ref)
			local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
			settingsHubModule.CurrentPageSignal:connect(function(p1)
				-- upvalues: settingsHubModule (ref), value (copy), var1 (copy), var2 (copy)
				local var4 = settingsHubModule.Instance[value]
				var1 = var4 ~= nil and p1 == var4.Page.Name
				var2:fire()
			end)
		end)
		
		return var3
	end,
	toggleIGMPage = function(p1, p2)
		-- upvalues: robloxGui (ref)
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		local var1 = settingsHubModule.Instance[p1]
		
		if not settingsHubModule:GetVisibility() then
			settingsHubModule:SetVisibility(true, false, var1)
			
			return
		elseif p2 then
			settingsHubModule:SetVisibility(false)
			
			return
		end
		settingsHubModule:SwitchToPage(var1, true)
	end,
	toggleInviteFriendsPage = function()
		-- upvalues: gameInviteModalManager (ref), robloxGui (ref), gameInviteAnalyticsManager (ref)
		if gameInviteModalManager:isGameModalOpen() then
			gameInviteModalManager:closeModal()
			
			return
		end
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		gameInviteAnalyticsManager:withButtonName(gameInviteAnalyticsManager.ButtonName.SettingsHub)
		settingsHubModule:InviteToGame()
	end
}