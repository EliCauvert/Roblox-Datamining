local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local switchServer = script:FindFirstAncestor("SwitchServer")
local parent = switchServer.Parent
local runService = game:GetService("RunService")
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local constantsModule = require(switchServer.Constants)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local orientation = foundationModule.Enums.Orientation
local useLocalization = localizationModule.Hooks.useLocalization
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack
}
local launchGame = require(parent.GameLaunch).LaunchGame
local default = require(parent.ExperienceService).GameProtocol.default
local switchServerTelemetryModule = require(switchServer.Telemetry.SwitchServerTelemetry)

local function SwitchServerConfirmationDialog(p1)
	-- upvalues: useLocalization (ref), constantsModule (ref), guiService (ref), runService (ref), reactModule (ref), switchServerTelemetryModule (ref), launchGame (ref), default (ref), contextActionService (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), dialog (ref), dialogSize (ref), orientation (ref), buttonVariant (ref)
	local var1 = useLocalization({
		title = constantsModule.CONFIRMATION.TITLE,
		body = constantsModule.CONFIRMATION.BODY,
		confirm = constantsModule.CONFIRMATION.CONFIRM,
		cancel = constantsModule.CONFIRMATION.CANCEL
	})
	
	local _ = function()
		-- upvalues: guiService (copy), runService (copy)
		guiService.SelectedCoreObject = nil
		runService.RenderStepped:Wait()
		runService.RenderStepped:Wait()
		game:Shutdown()
	end
	
	local var2 = reactModule.useCallback(function()
		-- upvalues: switchServerTelemetryModule (copy), p1 (ref), launchGame (copy), constantsModule (copy), default (copy), guiService (copy), runService (copy)
		switchServerTelemetryModule.sendSwitchServerConfirmationActions({ event_type = "confirm" })
		p1.setSwitchServerConfirmationOpen(false)
		launchGame(tostring(game.PlaceId), constantsModule.REFERRAL_PAGE, { gameIdToExclude = tostring(game.JobId) }, default, constantsModule.SOURCE)
		guiService.SelectedCoreObject = nil
		runService.RenderStepped:Wait()
		runService.RenderStepped:Wait()
		game:Shutdown()
	end, {
		p1.setSwitchServerConfirmationOpen,
		game.PlaceId,
		game.JobId
	})
	local var3 = reactModule.useRef(false)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), switchServerTelemetryModule (copy), p1 (ref)
		if var3.current then
			return
		end
		var3.current = true
		switchServerTelemetryModule.sendSwitchServerConfirmationActions({ event_type = "cancel" })
		p1.setSwitchServerConfirmationOpen(false)
	end, { p1.setSwitchServerConfirmationOpen })
	reactModule.useEffect(function()
		-- upvalues: contextActionService (copy), var4 (ref)
		contextActionService:BindCoreAction("SwitchServerConfirmationCloseOnBack", function(_, p2)
			-- upvalues: var4 (copy)
			if p2 == Enum.UserInputState.Begin then
				var4()
			end
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB)
		
		return function()
			-- upvalues: contextActionService (copy)
			contextActionService:UnbindCoreAction("SwitchServerConfirmationCloseOnBack")
		end
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: guiService (copy)
		guiService:SetMenuIsOpen(true, "SwitchServerConfirmation")
		
		return function()
			-- upvalues: guiService (copy)
			guiService:SetMenuIsOpen(false, "SwitchServerConfirmation")
		end
	end, {})
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		ref = useFocusRoot({
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = t,
			eventHandlers = reactModule.useMemo(function()
				-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var4 (ref)
				return {
					[focusNavigationEventNameEnum.NavigateBack] = {
						handler = inputHandlersModule.onRelease(function(p2)
							-- upvalues: var4 (copy)
							var4()
							p2:cancel()
						end)
					}
				}
			end, { var4 })
		}),
		size = dialogSize.Small,
		onClose = var4
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.title }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var1.body })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Vertical,
			actions = {
				{
					text = var1.confirm,
					variant = buttonVariant.Emphasis,
					onActivated = var2
				},
				{
					text = var1.cancel,
					variant = buttonVariant.Standard,
					onActivated = var4
				}
			}
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), reactFocusNavigationModule (ref), SwitchServerConfirmationDialog (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: reactFocusNavigationModule (copy)
		return reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			var1:teardown()
		end
	end, { var1 })
	
	return reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var1 }, reactModule.createElement(SwitchServerConfirmationDialog, p1))
end)