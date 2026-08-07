local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local parent = script:FindFirstAncestor("CoreGuiCommon").Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local useLocalization = localizationModule.Hooks.useLocalization

function HeadsetDisconnectDialog(value) --[[ line: 30 ]]
	-- upvalues: guiService (ref), VRService (ref), useLocalization (ref), reactModule (ref), contextActionService (ref), dialog (ref), foundationModule (ref)
	local mockGuiService = value.mockGuiService or guiService
	local mockVRService = value.mockVRService or VRService
	local var8 = useLocalization({
		titleText = "InGame.ConnectionError.Heading.VRDisconnected",
		bodyText = "InGame.ConnectionError.Message.RestartApp",
		buttonText = "InGame.ConnectionError.Action.Restart"
	})
	local var9, var10 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: mockVRService (ref), var10 (ref)
		local var12 = mockVRService:GetPropertyChangedSignal("VRDeviceAvailable"):Connect(function(p0) --[[ line: 44 ]]
			-- upvalues: var10 (copy)
			var10(not p0)
		end)
		
		return function() --[[ line: 48 ]]
			-- upvalues: var12 (ref)
			var12:Disconnect()
		end
	end, {})
	local var11 = reactModule.useCallback(function() --[[ line: 53 ]]
		-- upvalues: mockGuiService (ref)
		local notificationTypeList = mockGuiService:GetNotificationTypeList()
		
		if game:GetEngineFeature("EnableLuaControlsRestartApp") then
			mockGuiService:BroadcastNotification("", notificationTypeList.RESTART_APP)
			
			return
		end
		mockGuiService:BroadcastNotification("", notificationTypeList.NATIVE_EXIT)
	end, {})
	reactModule.useEffect(function() --[[ line: 63 ]]
		-- upvalues: var9 (ref), mockGuiService (ref), contextActionService (copy), var11 (ref)
		if var9 then
			mockGuiService:SetMenuIsOpen(true, "HeadsetDisconnectedDialog")
			contextActionService:BindCoreAction("TopBarGamepadDisableMenuShortcut", function() --[[ line: 67 ]]
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.ButtonStart, Enum.KeyCode.Escape)
			contextActionService:BindCoreAction("TopBarDialogConfirm", function(_, p1, _) --[[ line: 71 ]]
				-- upvalues: var11 (copy)
				if p1 == Enum.UserInputState.Begin then
					var11()
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.Return, Enum.KeyCode.ButtonA)
		else
			mockGuiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog")
			contextActionService:UnbindCoreAction("TopBarGamepadDisableMenuShortcut")
			contextActionService:UnbindCoreAction("TopBarDialogConfirm")
		end
		return function() --[[ line: 85 ]]
			-- upvalues: mockGuiService (copy), contextActionService (copy)
			mockGuiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog")
			contextActionService:UnbindCoreAction("TopBarGamepadDisableMenuShortcut")
			contextActionService:UnbindCoreAction("TopBarDialogConfirm")
		end
	end, { var9 })
	
	return if var9 then reactModule.createElement(dialog.Root, {
		testId = "headset-disconnect-dialog",
		size = foundationModule.Enums.DialogSize.Small,
		hasBackdrop = value.hasBackdrop ~= nil or value.hasBackdrop,
		disablePortal = value.disablePortal
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var8.titleText }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var8.bodyText })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			actions = {
				{
					testId = "restart-button",
					text = var8.buttonText,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = var11
				}
			}
		})
	}) else nil
end

return reactModule.memo(HeadsetDisconnectDialog)