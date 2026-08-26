local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local parent = script:FindFirstAncestor("CoreGuiCommon").Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local useLocalization = localizationModule.Hooks.useLocalization

function HeadsetDisconnectDialog(value)
	-- upvalues: guiService (ref), VRService (ref), useLocalization (ref), reactModule (ref), contextActionService (ref), dialog (ref), foundationModule (ref)
	local mockGuiService = value.mockGuiService or guiService
	local mockVRService = value.mockVRService or VRService
	local var1 = useLocalization({
		titleText = "InGame.ConnectionError.Heading.VRDisconnected",
		bodyText = "InGame.ConnectionError.Message.RestartApp",
		buttonText = "InGame.ConnectionError.Action.Restart"
	})
	local var2, var3 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: mockVRService (ref), var3 (ref)
		local var4 = mockVRService:GetPropertyChangedSignal("VRDeviceAvailable"):Connect(function(p1)
			-- upvalues: var3 (copy)
			var3(not p1)
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	local var4 = reactModule.useCallback(function()
		-- upvalues: mockGuiService (ref)
		local notificationTypeList = mockGuiService:GetNotificationTypeList()
		
		if game:GetEngineFeature("EnableLuaControlsRestartApp") then
			mockGuiService:BroadcastNotification("", notificationTypeList.RESTART_APP)
			
			return
		end
		mockGuiService:BroadcastNotification("", notificationTypeList.NATIVE_EXIT)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), mockGuiService (ref), contextActionService (copy), var4 (ref)
		if var2 then
			mockGuiService:SetMenuIsOpen(true, "HeadsetDisconnectedDialog")
			contextActionService:BindCoreAction("TopBarGamepadDisableMenuShortcut", function()
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.ButtonStart, Enum.KeyCode.Escape)
			contextActionService:BindCoreAction("TopBarDialogConfirm", function(_, p1, _)
				-- upvalues: var4 (copy)
				if p1 == Enum.UserInputState.Begin then
					var4()
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.Return, Enum.KeyCode.ButtonA)
		else
			mockGuiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog")
			contextActionService:UnbindCoreAction("TopBarGamepadDisableMenuShortcut")
			contextActionService:UnbindCoreAction("TopBarDialogConfirm")
		end
		return function()
			-- upvalues: mockGuiService (copy), contextActionService (copy)
			mockGuiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog")
			contextActionService:UnbindCoreAction("TopBarGamepadDisableMenuShortcut")
			contextActionService:UnbindCoreAction("TopBarDialogConfirm")
		end
	end, { var2 })
	
	return if var2 then reactModule.createElement(dialog.Root, {
		testId = "headset-disconnect-dialog",
		size = foundationModule.Enums.DialogSize.Small,
		hasBackdrop = value.hasBackdrop ~= nil or value.hasBackdrop,
		disablePortal = value.disablePortal
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var1.titleText }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var1.bodyText })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			actions = {
				{
					testId = "restart-button",
					text = var1.buttonText,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = var4
				}
			}
		})
	}) else nil
end

return reactModule.memo(HeadsetDisconnectDialog)