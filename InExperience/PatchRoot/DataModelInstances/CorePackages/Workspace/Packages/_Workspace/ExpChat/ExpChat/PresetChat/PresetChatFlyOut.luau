local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local configModule = require(expChat.Config)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local presetChatButtonModule = require(script.Parent.PresetChatButton)
local presetChatContainerModule = require(script.Parent.PresetChatContainer)
local setIsPresetTrayOpenModule = require(script.Parent.Thunks.setIsPresetTrayOpen)
local fFlagExpChatPresetChatGamepadEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local flyOutWidth = configModule.PresetTray.FlyOutWidth
local flyOutHeight = configModule.PresetTray.FlyOutHeight

return reactModule.memo(function(value)
	-- upvalues: getPresetChatStoreModule (ref), signalsReactModule (ref), reactModule (ref), setIsPresetTrayOpenModule (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), userInputService (ref), guiService (ref), foundationModule (ref), presetChatButtonModule (ref), flyOutWidth (ref), flyOutHeight (ref), presetChatContainerModule (ref)
	local var1 = getPresetChatStoreModule(false)
	local var2 = signalsReactModule.useSignalState(var1.getIsTrayOpen)
	local var3 = reactModule.useCallback(function()
		-- upvalues: setIsPresetTrayOpenModule (copy), var1 (ref)
		setIsPresetTrayOpenModule(var1, false)
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), userInputService (copy), setIsPresetTrayOpenModule (copy), var1 (ref), guiService (copy)
		if var2 then
			local var4 = if fFlagExpChatPresetChatGamepadEnabledModule then userInputService.InputBegan:Connect(function(p1, _)
				-- upvalues: setIsPresetTrayOpenModule (copy), var1 (copy)
				if p1.KeyCode == Enum.KeyCode.Escape or p1.KeyCode == Enum.KeyCode.ButtonB then
					setIsPresetTrayOpenModule(var1, false)
				end
			end) else nil
			local menuOpenedConnection = guiService.MenuOpened:Connect(function()
				-- upvalues: var1 (copy)
				var1.setIsTrayOpen(false)
			end)
			
			return function()
				-- upvalues: var4 (write), menuOpenedConnection (ref)
				if var4 then
					var4:Disconnect()
				end
				menuOpenedConnection:Disconnect()
			end
		end
	end, { var2, var1 })
	
	return reactModule.createElement(foundationModule.Popover.Root, { isOpen = var2 }, {
		Anchor = reactModule.createElement(foundationModule.Popover.Anchor, nil, {
			AnchorWrapper = reactModule.createElement(foundationModule.View, {
				tag = "size-0-full auto-x",
				padding = if value.addTopPadding then { top = UDim.new(0, 6) } else nil,
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Bottom,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, {
				Button = reactModule.createElement(presetChatButtonModule, {
					fullWidth = value.fullWidthButton,
					size = value.buttonSize,
					isCircular = value.buttonIsCircular,
					targetTextChannel = value.textChannel
				})
			})
		}),
		Content = reactModule.createElement(foundationModule.Popover.Content, {
			hasArrow = false,
			side = {
				offset = 7,
				position = foundationModule.Enums.PopoverSide.Right
			},
			align = {
				offset = 3,
				position = foundationModule.Enums.PopoverAlign.Start
			},
			radius = foundationModule.Enums.Radius.Medium,
			onPressedOutside = var3
		}, {
			ContentWrapper = reactModule.createElement(foundationModule.View, { Size = UDim2.fromOffset(flyOutWidth, flyOutHeight) }, {
				Container = reactModule.createElement(presetChatContainerModule, { compact = true, textChannel = value.textChannel })
			})
		})
	})
end)