local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local gameInviteAnalyticsManager = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteAnalyticsManager
local gameInviteModalManager = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteModalManager
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local mappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal

return {
	createPageOpenSignal = function(value) --[[ line: 17 ]]
		-- upvalues: signal (ref), mappedSignal (ref), robloxGui (ref)
		local var3 = false
		local var4 = signal.new()
		local var5 = mappedSignal.new(var4, function() --[[ line: 20 ]]
			-- upvalues: var3 (write)
			return var3
		end)
		task.defer(function() --[[ line: 24 ]]
			-- upvalues: robloxGui (copy), value (ref), var3 (write), var4 (ref)
			local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
			settingsHubModule.CurrentPageSignal:connect(function(p0) --[[ line: 26 ]]
				-- upvalues: settingsHubModule (ref), value (copy), var3 (copy), var4 (copy)
				local var7 = settingsHubModule.Instance[value]
				var3 = var7 ~= nil and p0 == var7.Page.Name
				var4:fire()
			end)
		end)
		
		return var5
	end,
	toggleIGMPage = function(p1, p2) --[[ line: 36 ]]
		-- upvalues: robloxGui (ref)
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		local var9 = settingsHubModule.Instance[p1]
		
		if not settingsHubModule:GetVisibility() then
			settingsHubModule:SetVisibility(true, false, var9)
			
			return
		elseif p2 then
			settingsHubModule:SetVisibility(false)
			
			return
		end
		settingsHubModule:SwitchToPage(var9, true)
	end,
	toggleInviteFriendsPage = function() --[[ line: 51 ]]
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