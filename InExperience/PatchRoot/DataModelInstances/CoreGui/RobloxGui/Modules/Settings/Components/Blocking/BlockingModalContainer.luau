local corePackagesService = game:GetService("CorePackages")
local modules = game:GetService("CoreGui").RobloxGui.Modules
local reactModule = require(corePackagesService.Packages.React)
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local isNewInGameMenuEnabledModule = require(modules.isNewInGameMenuEnabled)
local toast = require(corePackagesService.Packages.UIBlox).App.Dialog.Toast
local actionModalModule = require(script.Parent.ActionModal)
local fFlagConnectionsToFriendsRename = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionsToFriendsRename

return function(p0)
	-- upvalues: blockingUtilityModule (ref), reactModule (ref), isNewInGameMenuEnabledModule (ref), modules (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), toast (ref), actionModalModule (ref)
	local player = p0.player
	local closeModal = p0.closeModal
	local blockingUtility = p0.blockingUtility or blockingUtilityModule
	local analytics = p0.analytics
	local source = p0.source
	local onBlockingSuccess = p0.onBlockingSuccess
	local var6, var7 = reactModule.useState(Vector2.new(1000, 1000))
	local var8, var9 = reactModule.useState(false)
	local var10 = reactModule.useCallback(function()
		-- upvalues: blockingUtility (ref), player (ref), analytics (ref), source (ref), onBlockingSuccess (ref), closeModal (ref), var9 (ref)
		if not blockingUtility:BlockPlayerAsync(player) then
			var9(true)
			
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
	local var11 = useLocalization({
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
	
	return if var8 then reactModule.createElement(toast, {
		duration = 3,
		show = var8,
		toastContent = {
			toastTitle = var11.blockingFailed,
			onDismissed = closeModal
		}
	}) else reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ZIndex = 2,
		[reactModule.Change.AbsoluteSize] = function(p1)
			-- upvalues: var7 (ref)
			var7(p1.AbsoluteSize)
		end
	}, {
		BlockingModal = reactModule.createElement(actionModalModule, {
			screenSize = var6,
			title = var11.titleKey,
			body = var11.bodyKey,
			blockText = var11.blockTextKey,
			blockAndReportText = var11.blockAndReportTextKey,
			cancelText = var11.cancelTextKey,
			cancel = closeModal,
			block = var10,
			blockAndReport = reactModule.useCallback(function()
				-- upvalues: var10 (ref), source (ref), isNewInGameMenuEnabledModule (copy), modules (copy), player (ref)
				var10()
				local source_1 = source or "BlockingModal"
				
				if isNewInGameMenuEnabledModule() then
					require(modules.InGameMenuInit).openReportDialog(player, source_1)
					
					return
				end
				require(modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(player, source_1)
			end, { var10, player, source })
		})
	})
end