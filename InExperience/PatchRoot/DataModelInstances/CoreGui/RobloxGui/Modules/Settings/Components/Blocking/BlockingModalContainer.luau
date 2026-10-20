local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local IsNewInGameMenuEnabledModule = require(Modules.isNewInGameMenuEnabled)
local Toast = require(CorePackages.Packages.UIBlox).App.Dialog.Toast
local ActionModalModule = require(script.Parent.ActionModal)

return function(p1)
	-- upvalues: BlockingUtilityModule (copy), ReactModule (copy), IsNewInGameMenuEnabledModule (copy), Modules (copy), UseLocalizationFunction (copy), Toast (copy), ActionModalModule (copy)
	local Player = p1.player
	local CloseModalFunction = p1.closeModal
	local BlockingUtility = p1.blockingUtility or BlockingUtilityModule
	local Analytics = p1.analytics
	local Source = p1.source
	local OnBlockingSuccessFunction = p1.onBlockingSuccess
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(1000, 1000))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: BlockingUtility (copy), Player (copy), Analytics (copy), Source (copy), OnBlockingSuccessFunction (copy), CloseModalFunction (copy), UseStateResult2_1 (copy)
		if not BlockingUtility:BlockPlayerAsync(Player) then
			UseStateResult2_1(true)
			
			return
		end
		Analytics:action("SettingsHub", "blockUser", { blockeeUserId = Player.UserId, source = Source })
		
		if OnBlockingSuccessFunction then
			OnBlockingSuccessFunction()
		end
		CloseModalFunction()
	end, {
		CloseModalFunction,
		Player,
		Analytics,
		Source,
		OnBlockingSuccessFunction
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), Source (copy), IsNewInGameMenuEnabledModule (upval), Modules (upval), Player (copy)
		UseResult()
		local Source1 = Source or "BlockingModal"
		
		if IsNewInGameMenuEnabledModule() then
			require(Modules.InGameMenuInit).openReportDialog(Player, Source1)
			
			return
		else
			require(Modules.Settings.Pages.ReportAbuseMenuContainerPage):ReportPlayer(Player, Source1)
		end
	end, { UseResult, Player, Source })
	local UseLocalizationResult = UseLocalizationFunction({
		bodyKey = "Feature.BlockingModal.Message.BlockConfirmation.FriendsRename",
		cancelTextKey = "Feature.BlockingModal.Action.Cancel",
		blockTextKey = "Feature.BlockingModal.Action.Block",
		blockAndReportTextKey = "Feature.BlockingModal.Action.BlockAndReport",
		blockingFailed = "Feature.Toast.NetworkingError.SomethingIsWrong",
		titleKey = {
			"Feature.BlockingModal.Heading.BlockUser",
			DisplayName = Player.DisplayName
		}
	})
	
	return if UseStateResult1 then ReactModule.createElement(Toast, {
		duration = 3,
		show = UseStateResult1,
		toastContent = {
			toastTitle = UseLocalizationResult.blockingFailed,
			onDismissed = CloseModalFunction
		}
	}) else ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ZIndex = 2,
		[ReactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize)
		end
	}, {
		BlockingModal = ReactModule.createElement(ActionModalModule, {
			screenSize = UseStateResult,
			title = UseLocalizationResult.titleKey,
			body = UseLocalizationResult.bodyKey,
			blockText = UseLocalizationResult.blockTextKey,
			blockAndReportText = UseLocalizationResult.blockAndReportTextKey,
			cancelText = UseLocalizationResult.cancelTextKey,
			cancel = CloseModalFunction,
			block = UseResult,
			blockAndReport = UseResult1
		})
	})
end