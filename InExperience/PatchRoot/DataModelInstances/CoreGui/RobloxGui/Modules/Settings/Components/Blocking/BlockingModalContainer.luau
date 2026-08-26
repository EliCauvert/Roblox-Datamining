local corePackagesService = game:GetService("CorePackages")
local modules = game:GetService("CoreGui").RobloxGui.Modules
local reactModule = require(corePackagesService.Packages.React)
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local isNewInGameMenuEnabledModule = require(modules.isNewInGameMenuEnabled)
local toast = require(corePackagesService.Packages.UIBlox).App.Dialog.Toast
local actionModalModule = require(script.Parent.ActionModal)
local fFlagConnectionsToFriendsRename = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionsToFriendsRename

return function(p1)
	-- upvalues: blockingUtilityModule (ref), reactModule (ref), isNewInGameMenuEnabledModule (ref), modules (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), toast (ref), actionModalModule (ref)
	local player = p1.player
	local closeModal = p1.closeModal
	local blockingUtility = p1.blockingUtility or blockingUtilityModule
	local analytics = p1.analytics
	local source = p1.source
	local onBlockingSuccess = p1.onBlockingSuccess
	local var1, var2 = reactModule.useState(Vector2.new(1000, 1000))
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useCallback(function()
		-- upvalues: blockingUtility (ref), player (ref), analytics (ref), source (ref), onBlockingSuccess (ref), closeModal (ref), var4 (ref)
		if not blockingUtility:BlockPlayerAsync(player) then
			var4(true)
			
			return
		end
		analytics:action("SettingsHub", "blockUser", { blockeeUserId = player.UserId, source = source })
		
		if onBlockingSuccess then
			onBlockingSuccess()
		end
		closeModal()
	end, {
		closeModal,
		player,
		analytics,
		source,
		onBlockingSuccess
	})
	local var6 = useLocalization({
		cancelTextKey = "Feature.BlockingModal.Action.Cancel",
		blockTextKey = "Feature.BlockingModal.Action.Block",
		blockAndReportTextKey = "Feature.BlockingModal.Action.BlockAndReport",
		blockingFailed = "Feature.Toast.NetworkingError.SomethingIsWrong",
		titleKey = {
			"Feature.BlockingModal.Heading.BlockUser",
			DisplayName = player.DisplayName
		},
		bodyKey = if fFlagConnectionsToFriendsRename then "Feature.BlockingModal.Message.BlockConfirmation.FriendsRename" else "Feature.BlockingModal.Message.BlockConfirmation"
	})
	
	return if var3 then reactModule.createElement(toast, {
		duration = 3,
		show = var3,
		toastContent = {
			toastTitle = var6.blockingFailed,
			onDismissed = closeModal
		}
	}) else reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ZIndex = 2,
		[reactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: var2 (ref)
			var2(p2.AbsoluteSize)
		end
	}, {
		BlockingModal = reactModule.createElement(actionModalModule, {
			screenSize = var1,
			title = var6.titleKey,
			body = var6.bodyKey,
			blockText = var6.blockTextKey,
			blockAndReportText = var6.blockAndReportTextKey,
			cancelText = var6.cancelTextKey,
			cancel = closeModal,
			block = var5,
			blockAndReport = reactModule.useCallback(function()
				-- upvalues: var5 (ref), source (ref), isNewInGameMenuEnabledModule (copy), modules (copy), player (ref)
				var5()
				local source_1 = source or "BlockingModal"
				
				if isNewInGameMenuEnabledModule() then
					require(modules.InGameMenuInit).openReportDialog(player, source_1)
					
					return
				end
				require(modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(player, source_1)
			end, { var5, player, source })
		})
	})
end