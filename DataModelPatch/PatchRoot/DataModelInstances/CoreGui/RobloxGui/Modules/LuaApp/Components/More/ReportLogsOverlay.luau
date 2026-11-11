local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Default = require(CorePackages.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local LogReporterService = game:GetService("LogReporterService")
local Players = game:GetService("Players")
local VoiceChatService = game:GetService("VoiceChatService")
local ReportDeviceLogsFunction = require(CorePackages.Workspace.Packages.LogReporting).reportDeviceLogs

return function()
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), Players (copy), VoiceChatService (copy), ReportDeviceLogsFunction (copy), LogReporterService (copy), CloseCentralOverlayModule (copy), UseLocalizationModule (copy), UseStyleFunction (copy), UseSelectorFunction (copy), InteractiveAlert (copy), Default (copy), ButtonType (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Players (upval), VoiceChatService (upval), ReportDeviceLogsFunction (upval), LogReporterService (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		local PlaceId = game.PlaceId
		local LocalPlayer = Players.LocalPlayer
		local UserId = LocalPlayer and LocalPlayer.UserId or 0
		local Success, Result = pcall(function()
			-- upvalues: LocalPlayer (copy), VoiceChatService (upval), UserId (copy)
			if LocalPlayer then
				return VoiceChatService:IsVoiceEnabledForUserIdAsync(UserId)
			else
				return false, false
			end
		end)
		local ReportDeviceLogsResult = ReportDeviceLogsFunction(LogReporterService, UserId, PlaceId, Success and Result or false)
		UseStateResult2(ReportDeviceLogsResult.url)
		UseStateResult2_1(ReportDeviceLogsResult.reportId)
		UseStateResult2_2(true)
	end, { game.PlaceId })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayModule (upval)
		UseDispatchResult(CloseCentralOverlayModule())
	end, {})
	local UseLocalizationModuleResult = UseLocalizationModule({
		cancelButtonText = "CommonUI.Features.Action.Close",
		sendButtonText = "CommonUI.Features.Action.Send",
		dialogTitle = "CommonUI.Features.Label.ReportLogs",
		promptText = "CommonUI.Features.Prompt.ReportLogsQuestion",
		resultText = "CommonUI.Features.Prompt.ReportLogsResult"
	})
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Active = true,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color
	}, {
		AlertWindow = ReactModule.createElement(InteractiveAlert, {
			title = UseLocalizationModuleResult.dialogTitle,
			screenSize = UseSelectorFunction(function(p1)
				return p1.ScreenSize
			end),
			bodyText = if UseStateResult3 then string.format("%s\nreportId: %s", UseLocalizationModuleResult.resultText, UseStateResult1) else UseLocalizationModuleResult.promptText,
			middleContent = function()
				-- upvalues: ReactModule (upval), UseStateResult (copy), UseStyleResult (copy), UseStateResult3 (copy), Default (upval)
				return ReactModule.createElement("TextButton", {
					Text = UseStateResult,
					TextColor3 = UseStyleResult.Tokens.Color.Content.Link.Color3,
					TextWrapped = true,
					TextSize = UseStyleResult.Tokens.FontSize.FontSize_300,
					Size = if UseStateResult3 then UDim2.new(1, 0, 0, 75) else UDim2.new(0, 0, 0, 0),
					BackgroundTransparency = 1,
					[ReactModule.Event.Activated] = function()
						-- upvalues: Default (upval), UseStateResult (upval)
						Default:shareUrl({ context = "ReportLogsUrlShare", url = UseStateResult })
					end
				})
			end,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = {
							onActivated = UseResult1,
							text = UseLocalizationModuleResult.cancelButtonText
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							text = UseLocalizationModuleResult.sendButtonText,
							userInteractionEnabled = not UseStateResult3,
							isDisabled = UseStateResult3,
							onActivated = UseResult
						}
					}
				}
			}
		})
	})
end