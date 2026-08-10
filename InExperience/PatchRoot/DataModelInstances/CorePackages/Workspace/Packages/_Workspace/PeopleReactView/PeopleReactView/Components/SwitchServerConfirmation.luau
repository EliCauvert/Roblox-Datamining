local guiService = game:GetService("GuiService")
local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local runService = game:GetService("RunService")
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local constantsModule = require(peopleReactView.Constants)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local orientation = foundationModule.Enums.Orientation
local useLocalization = localizationModule.Hooks.useLocalization
local launchGame = require(parent.GameLaunch).LaunchGame
local default = require(parent.ExperienceService).GameProtocol.default
local switchServerTelemetryModule = require(peopleReactView.Telemetry.SwitchServerTelemetry)

return reactModule.memo(function(p0) --[[ line: 33 | named "SwitchServerConfirmation" ]]
	-- upvalues: useLocalization (ref), constantsModule (ref), guiService (ref), runService (ref), reactModule (ref), switchServerTelemetryModule (ref), launchGame (ref), default (ref), dialog (ref), dialogSize (ref), orientation (ref), buttonVariant (ref)
	local var8 = useLocalization({
		title = constantsModule.PEOPLEPAGE.SWITCH_SERVER_CONFIRMATION.TITLE,
		body = constantsModule.PEOPLEPAGE.SWITCH_SERVER_CONFIRMATION.BODY,
		confirm = constantsModule.PEOPLEPAGE.SWITCH_SERVER_CONFIRMATION.CONFIRM,
		cancel = constantsModule.PEOPLEPAGE.SWITCH_SERVER_CONFIRMATION.CANCEL
	})
	
	local _ = function() --[[ line: 42 ]]
		-- upvalues: guiService (copy), runService (copy)
		guiService.SelectedCoreObject = nil
		runService.RenderStepped:Wait()
		runService.RenderStepped:Wait()
		game:Shutdown()
	end
	
	local var9 = reactModule.useCallback(function() --[[ line: 66 ]]
		-- upvalues: switchServerTelemetryModule (copy), p0 (ref)
		switchServerTelemetryModule.sendSwitchServerConfirmationActions({ event_type = "cancel" })
		p0.setSwitchServerConfirmationOpen(false)
	end, { p0.setSwitchServerConfirmationOpen })
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = dialogSize.Small,
		onClose = var9
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var8.title }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var8.body })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Vertical,
			actions = {
				{
					text = var8.confirm,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function() --[[ line: 50 ]]
						-- upvalues: switchServerTelemetryModule (copy), p0 (ref), launchGame (copy), constantsModule (copy), default (copy), guiService (copy), runService (copy)
						switchServerTelemetryModule.sendSwitchServerConfirmationActions({ event_type = "confirm" })
						p0.setSwitchServerConfirmationOpen(false)
						launchGame(tostring(game.PlaceId), constantsModule.PEOPLEPAGE.PAGE_ID, { gameIdToExclude = tostring(game.JobId) }, default, constantsModule.PEOPLEPAGE.SOURCE)
						guiService.SelectedCoreObject = nil
						runService.RenderStepped:Wait()
						runService.RenderStepped:Wait()
						game:Shutdown()
					end, {
						p0.setSwitchServerConfirmationOpen,
						game.PlaceId,
						game.JobId
					})
				},
				{
					text = var8.cancel,
					variant = buttonVariant.Standard,
					onActivated = var9
				}
			}
		})
	})
end)