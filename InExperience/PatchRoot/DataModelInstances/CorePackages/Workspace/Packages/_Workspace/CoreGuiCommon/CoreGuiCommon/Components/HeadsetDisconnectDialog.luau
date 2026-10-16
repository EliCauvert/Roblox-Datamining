local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local Parent = script:FindFirstAncestor("CoreGuiCommon").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

function HeadsetDisconnectDialog(p1) --[[ Line: 30 ]]
	-- upvalues: GuiService (copy), VRService (copy), UseLocalizationFunction (copy), ReactModule (copy), ContextActionService (copy), Dialog (copy), FoundationModule (copy)
	local MockGuiService = p1.mockGuiService or GuiService
	local MockVRService = p1.mockVRService or VRService
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "InGame.ConnectionError.Heading.VRDisconnected",
		bodyText = "InGame.ConnectionError.Message.RestartApp",
		buttonText = "InGame.ConnectionError.Action.Restart"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 43 ]]
		-- upvalues: MockVRService (copy), UseStateResult2 (copy)
		local Connection = MockVRService:GetPropertyChangedSignal("VRDeviceAvailable"):Connect(function(p2) --[[ Line: 44 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(not p2)
		end)
		
		return function() --[[ Line: 48 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 53 ]]
		-- upvalues: MockGuiService (copy)
		local NotificationTypeList = MockGuiService:GetNotificationTypeList()
		
		if game:GetEngineFeature("EnableLuaControlsRestartApp") then
			MockGuiService:BroadcastNotification("", NotificationTypeList.RESTART_APP)
			
			return
		else
			MockGuiService:BroadcastNotification("", NotificationTypeList.NATIVE_EXIT)
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 63 ]]
		-- upvalues: UseStateResult (copy), MockGuiService (copy), ContextActionService (upval), UseResult (copy)
		if UseStateResult then
			MockGuiService:SetMenuIsOpen(true, "HeadsetDisconnectedDialog")
			ContextActionService:BindCoreAction("TopBarGamepadDisableMenuShortcut", function() --[[ Line: 67 ]]
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.ButtonStart, Enum.KeyCode.Escape)
			ContextActionService:BindCoreAction("TopBarDialogConfirm", function(_, UserInputState, _) --[[ Line: 71 ]]
				-- upvalues: UseResult (upval)
				if UserInputState == Enum.UserInputState.Begin then
					UseResult()
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end, false, Enum.KeyCode.Return, Enum.KeyCode.ButtonA)
		else
			MockGuiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog")
			ContextActionService:UnbindCoreAction("TopBarGamepadDisableMenuShortcut")
			ContextActionService:UnbindCoreAction("TopBarDialogConfirm")
		end
		return function() --[[ Line: 85 ]]
			-- upvalues: MockGuiService (upval), ContextActionService (upval)
			MockGuiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog")
			ContextActionService:UnbindCoreAction("TopBarGamepadDisableMenuShortcut")
			ContextActionService:UnbindCoreAction("TopBarDialogConfirm")
		end
	end, { UseStateResult })
	
	return if UseStateResult then ReactModule.createElement(Dialog.Root, {
		testId = "headset-disconnect-dialog",
		size = FoundationModule.Enums.DialogSize.Small,
		hasBackdrop = p1.hasBackdrop == nil or p1.hasBackdrop,
		disablePortal = p1.disablePortal
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.titleText }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.bodyText })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			actions = {
				{
					testId = "restart-button",
					text = UseLocalizationResult.buttonText,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = UseResult
				}
			}
		})
	}) else nil
end

return ReactModule.memo(HeadsetDisconnectDialog)