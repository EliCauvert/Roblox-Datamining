local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local gameInviteAnalyticsManager = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteAnalyticsManager
local gameInviteModalManager = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteModalManager
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local mappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local _ = require(robloxGui.Modules.Settings.EnumReactPage)
local reactPageSignalModule = require(robloxGui.Modules.Settings.ReactPageSignal)

return {
	createPageOpenSignal = function(value) --[[ line: 21 ]]
		-- upvalues: signal (ref), mappedSignal (ref), robloxGui (ref)
		local var4 = false
		local var5 = signal.new()
		local var6 = mappedSignal.new(var5, function() --[[ line: 24 ]]
			-- upvalues: var4 (write)
			return var4
		end)
		task.defer(function() --[[ line: 28 ]]
			-- upvalues: robloxGui (copy), value (ref), var4 (write), var5 (ref)
			local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
			settingsHubModule.CurrentPageSignal:connect(function(p0) --[[ line: 30 ]]
				-- upvalues: settingsHubModule (ref), value (copy), var4 (copy), var5 (copy)
				local var8 = settingsHubModule.Instance[value]
				var4 = var8 ~= nil and p0 == var8.Page.Name
				var5:fire()
			end)
		end)
		
		return var6
	end,
	toggleIGMPage = function(p1, p2) --[[ line: 40 ]]
		-- upvalues: robloxGui (ref)
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		local var10 = settingsHubModule.Instance[p1]
		
		if not settingsHubModule:GetVisibility() then
			settingsHubModule:SetVisibility(true, false, var10)
			
			return
		elseif p2 then
			settingsHubModule:SetVisibility(false)
			
			return
		end
		settingsHubModule:SwitchToPage(var10, true)
	end,
	toggleReactPage = function(p3, p4, p5) --[[ line: 54 ]]
		-- upvalues: robloxGui (ref), reactPageSignalModule (ref)
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		local var12 = settingsHubModule.Instance[p3]
		local var13 = reactPageSignalModule()
		
		if not settingsHubModule:GetVisibility() then
			settingsHubModule:SetVisibility(true, false, var12)
			var13.setCurrentReactPage(p5)
			
			return
		elseif p4 then
			settingsHubModule:SetVisibility(false)
			var13.setCurrentReactPage(nil)
			
			return
		end
		settingsHubModule:SwitchToPage(var12, true)
		var13.setCurrentReactPage(p5)
	end,
	toggleInviteFriendsPage = function() --[[ line: 73 ]]
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