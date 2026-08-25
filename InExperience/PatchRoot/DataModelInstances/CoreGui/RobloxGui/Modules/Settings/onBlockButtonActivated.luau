local contextActionService = game:GetService("ContextActionService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local promiseModule = require(corePackagesService.Packages.Promise)
local coreScriptsRootProvider = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local blockingAnalyticsModule = require(script.Parent.Analytics.BlockingAnalytics)
local blockingModalScreenModule = require(script.Parent.Components.Blocking.BlockingModalScreen)
local fFlagAddNewPlayerListMobileFocusNav = playerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local var10 = nil

local _ = function()
	-- upvalues: var10 (write), roactModule (ref), contextActionService (ref)
	if var10 ~= nil then
		roactModule.unmount(var10)
		var10 = nil
		contextActionService:UnbindCoreAction("BlockingModalScreen")
	end
end

return function(p0, p1, p2, p3)
	-- upvalues: promiseModule (ref), blockingAnalyticsModule (ref), var10 (write), roactModule (ref), contextActionService (ref), fFlagAddNewPlayerListMobileFocusNav (ref), guiService (ref), blockingModalScreenModule (ref), coreScriptsRootProvider (ref), robloxGui (ref)
	return promiseModule.new(function(p4)
		-- upvalues: p1 (ref), blockingAnalyticsModule (copy), p0 (ref), p2 (ref), var10 (copy), roactModule (copy), contextActionService (copy), fFlagAddNewPlayerListMobileFocusNav (copy), p3 (ref), guiService (copy), blockingModalScreenModule (copy), coreScriptsRootProvider (copy), robloxGui (copy)
		local p1_1 = p1 or blockingAnalyticsModule.new()
		p1_1:action("SettingsHub", "blockUserButtonClick", { blockeeUserId = p0.UserId, source = p2 })
		
		if var10 ~= nil then
			roactModule.unmount(var10)
			var10 = nil
			contextActionService:UnbindCoreAction("BlockingModalScreen")
		end
		local var12 = function()
			-- upvalues: var10 (copy), roactModule (copy), contextActionService (copy), p4 (ref), fFlagAddNewPlayerListMobileFocusNav (copy), p3 (copy), guiService (copy)
			if var10 ~= nil then
				roactModule.unmount(var10)
				var10 = nil
				contextActionService:UnbindCoreAction("BlockingModalScreen")
			end
			p4()
			
			if fFlagAddNewPlayerListMobileFocusNav then
				if p3 and p3.onBlockingModalClose then
					p3.onBlockingModalClose()
					
					return
				end
			elseif fFlagAddNewPlayerListMobileFocusNav then
				guiService.SelectedCoreObject = nil
			end
		end
		
		var10 = roactModule.mount(roactModule.createElement(coreScriptsRootProvider, {}, {
			BlockingModalScreen = roactModule.createElement(blockingModalScreenModule, {
				player = p0,
				closeModal = var12,
				analytics = p1_1,
				source = p2,
				onBlockingSuccess = if p3 then p3.onBlockingSuccess else nil
			})
		}), robloxGui, "BlockingContainer")
		contextActionService:BindCoreAction("BlockingModalScreen", var12, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end)
end