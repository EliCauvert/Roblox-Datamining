local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local SwitchServer = script:FindFirstAncestor("SwitchServer")
local Parent = SwitchServer.Parent
local RunService = game:GetService("RunService")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ConstantsModule = require(SwitchServer.Constants)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Orientation = FoundationModule.Enums.Orientation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack
}
local LaunchGameFunction = require(Parent.GameLaunch).LaunchGame
local Default = require(Parent.ExperienceService).GameProtocol.default
local RecentServerHistoryModule = require(SwitchServer.RecentServerHistory)
local CallTeleportSwitchServerModule = require(SwitchServer.Utils.callTeleportSwitchServer)
local SwitchServerTelemetryModule = require(SwitchServer.Telemetry.SwitchServerTelemetry)
local FFlagUseTeleportForLuaSwitchServerImplModule = require(SwitchServer.Flags.FFlagUseTeleportForLuaSwitchServerImpl)
local FFlagUseMultipleServerIdsForSwitchServerModule = require(SwitchServer.Flags.FFlagUseMultipleServerIdsForSwitchServer)

local function _()
	-- upvalues: GuiService (copy), RunService (copy)
	GuiService.SelectedCoreObject = nil
	RunService.RenderStepped:Wait()
	RunService.RenderStepped:Wait()
	game:Shutdown()
end

local function SwitchServerConfirmationDialog(p1)
	-- upvalues: UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy), SwitchServerTelemetryModule (copy), FFlagUseTeleportForLuaSwitchServerImplModule (copy), FFlagUseMultipleServerIdsForSwitchServerModule (copy), CallTeleportSwitchServerModule (copy), RecentServerHistoryModule (copy), LaunchGameFunction (copy), Default (copy), GuiService (copy), RunService (copy), ContextActionService (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), Dialog (copy), DialogSize (copy), Orientation (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = ConstantsModule.CONFIRMATION.TITLE,
		body = ConstantsModule.CONFIRMATION.BODY,
		confirm = ConstantsModule.CONFIRMATION.CONFIRM,
		cancel = ConstantsModule.CONFIRMATION.CANCEL
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SwitchServerTelemetryModule (upval), p1 (copy), FFlagUseTeleportForLuaSwitchServerImplModule (upval), FFlagUseMultipleServerIdsForSwitchServerModule (upval), CallTeleportSwitchServerModule (upval), RecentServerHistoryModule (upval), LaunchGameFunction (upval), ConstantsModule (upval), Default (upval), GuiService (upval), RunService (upval)
		SwitchServerTelemetryModule.sendSwitchServerConfirmationActions({ event_type = "confirm" })
		p1.setSwitchServerConfirmationOpen(false)
		
		if not FFlagUseTeleportForLuaSwitchServerImplModule or not game:GetEngineFeature("SwitchServerAvailable") then
			LaunchGameFunction(tostring(game.PlaceId), ConstantsModule.REFERRAL_PAGE, { gameIdToExclude = tostring(game.JobId) }, Default, ConstantsModule.SOURCE)
			GuiService.SelectedCoreObject = nil
			RunService.RenderStepped:Wait()
			RunService.RenderStepped:Wait()
			game:Shutdown()
			
			return
		elseif FFlagUseMultipleServerIdsForSwitchServerModule then
			CallTeleportSwitchServerModule(RecentServerHistoryModule.default:getRecentServerIds())
			
			return
		else
			CallTeleportSwitchServerModule()
		end
	end, {
		p1.setSwitchServerConfirmationOpen,
		game.PlaceId,
		game.JobId
	})
	local UseRefResult = ReactModule.useRef(false)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), SwitchServerTelemetryModule (upval), p1 (copy)
		if not UseRefResult.current then
			UseRefResult.current = true
			SwitchServerTelemetryModule.sendSwitchServerConfirmationActions({ event_type = "cancel" })
			p1.setSwitchServerConfirmationOpen(false)
			
			return
		end
	end, { p1.setSwitchServerConfirmationOpen })
	ReactModule.useEffect(function()
		-- upvalues: ContextActionService (upval), UseResult1 (copy)
		ContextActionService:BindCoreAction("SwitchServerConfirmationCloseOnBack", function(_, UserInputState)
			-- upvalues: UseResult1 (upval)
			if UserInputState == Enum.UserInputState.Begin then
				UseResult1()
			end
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB)
		
		return function()
			-- upvalues: ContextActionService (upval)
			ContextActionService:UnbindCoreAction("SwitchServerConfirmationCloseOnBack")
		end
	end, { UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: GuiService (upval)
		GuiService:SetMenuIsOpen(true, "SwitchServerConfirmation")
		
		return function()
			-- upvalues: GuiService (upval)
			GuiService:SetMenuIsOpen(false, "SwitchServerConfirmation")
		end
	end, {})
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		ref = UseFocusRootFunction({
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = EventMap,
			eventHandlers = ReactModule.useMemo(function()
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult1 (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p2)
							-- upvalues: UseResult1 (upval)
							UseResult1()
							p2:cancel()
						end)
					}
				}
			end, { UseResult1 })
		}),
		size = DialogSize.Small,
		onClose = UseResult1
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.body })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			orientation = Orientation.Vertical,
			actions = {
				{
					text = UseLocalizationResult.confirm,
					variant = ButtonVariant.Emphasis,
					onActivated = UseResult
				},
				{
					text = UseLocalizationResult.cancel,
					variant = ButtonVariant.Standard,
					onActivated = UseResult1
				}
			}
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ReactFocusNavigationModule (copy), SwitchServerConfirmationDialog (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactFocusNavigationModule (upval)
		return ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult:teardown()
		end
	end, { UseMemoResult })
	
	return ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = UseMemoResult }, ReactModule.createElement(SwitchServerConfirmationDialog, p1))
end)