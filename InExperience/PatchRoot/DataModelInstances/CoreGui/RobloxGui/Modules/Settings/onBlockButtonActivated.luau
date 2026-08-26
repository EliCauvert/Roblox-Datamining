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
local var1 = nil

local _ = function()
	-- upvalues: var1 (write), roactModule (ref), contextActionService (ref)
	if var1 ~= nil then
		roactModule.unmount(var1)
		var1 = nil
		contextActionService:UnbindCoreAction("BlockingModalScreen")
	end
end

return function(p1, p2, p3, p4)
	-- upvalues: promiseModule (ref), blockingAnalyticsModule (ref), var1 (write), roactModule (ref), contextActionService (ref), fFlagAddNewPlayerListMobileFocusNav (ref), guiService (ref), blockingModalScreenModule (ref), coreScriptsRootProvider (ref), robloxGui (ref)
	return promiseModule.new(function(p5)
		-- upvalues: p2 (ref), blockingAnalyticsModule (copy), p1 (ref), p3 (ref), var1 (copy), roactModule (copy), contextActionService (copy), fFlagAddNewPlayerListMobileFocusNav (copy), p4 (ref), guiService (copy), blockingModalScreenModule (copy), coreScriptsRootProvider (copy), robloxGui (copy)
		local p6 = p2 or blockingAnalyticsModule.new()
		p6:action("SettingsHub", "blockUserButtonClick", { blockeeUserId = p1.UserId, source = p3 })
		
		if var1 ~= nil then
			roactModule.unmount(var1)
			var1 = nil
			contextActionService:UnbindCoreAction("BlockingModalScreen")
		end
		local var2 = function()
			-- upvalues: var1 (copy), roactModule (copy), contextActionService (copy), p5 (ref), fFlagAddNewPlayerListMobileFocusNav (copy), p4 (copy), guiService (copy)
			if var1 ~= nil then
				roactModule.unmount(var1)
				var1 = nil
				contextActionService:UnbindCoreAction("BlockingModalScreen")
			end
			p5()
			
			if fFlagAddNewPlayerListMobileFocusNav then
				if p4 and p4.onBlockingModalClose then
					p4.onBlockingModalClose()
					
					return
				end
			elseif fFlagAddNewPlayerListMobileFocusNav then
				guiService.SelectedCoreObject = nil
			end
		end
		
		var1 = roactModule.mount(roactModule.createElement(coreScriptsRootProvider, {}, {
			BlockingModalScreen = roactModule.createElement(blockingModalScreenModule, {
				player = p1,
				closeModal = var2,
				analytics = p6,
				source = p3,
				onBlockingSuccess = if p4 then p4.onBlockingSuccess else nil
			})
		}), robloxGui, "BlockingContainer")
		contextActionService:BindCoreAction("BlockingModalScreen", var2, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end)
end