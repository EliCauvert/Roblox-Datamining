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

return reactModule.memo(function(value) --[[ line: 27 | named "PresetChatFlyOut" ]]
	-- upvalues: getPresetChatStoreModule (ref), signalsReactModule (ref), reactModule (ref), setIsPresetTrayOpenModule (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), userInputService (ref), guiService (ref), foundationModule (ref), presetChatButtonModule (ref), flyOutWidth (ref), flyOutHeight (ref), presetChatContainerModule (ref)
	local var12 = getPresetChatStoreModule(false)
	local var13 = signalsReactModule.useSignalState(var12.getIsTrayOpen)
	local var14 = reactModule.useCallback(function() --[[ line: 31 ]]
		-- upvalues: setIsPresetTrayOpenModule (copy), var12 (ref)
		setIsPresetTrayOpenModule(var12, false)
	end, { var12 })
	reactModule.useEffect(function() --[[ line: 35 ]]
		-- upvalues: var13 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), userInputService (copy), setIsPresetTrayOpenModule (copy), var12 (ref), guiService (copy)
		if var13 then
			local var15 = if fFlagExpChatPresetChatGamepadEnabledModule then userInputService.InputBegan:Connect(function(p0, _) --[[ line: 42 ]]
				-- upvalues: setIsPresetTrayOpenModule (copy), var12 (copy)
				if p0.KeyCode == Enum.KeyCode.Escape or p0.KeyCode == Enum.KeyCode.ButtonB then
					setIsPresetTrayOpenModule(var12, false)
				end
			end) else nil
			local menuOpenedConnection = guiService.MenuOpened:Connect(function() --[[ line: 49 ]]
				-- upvalues: var12 (copy)
				var12.setIsTrayOpen(false)
			end)
			
			return function() --[[ line: 53 ]]
				-- upvalues: var15 (write), menuOpenedConnection (ref)
				if var15 then
					var15:Disconnect()
				end
				menuOpenedConnection:Disconnect()
			end
		end
	end, { var13, var12 })
	
	return reactModule.createElement(foundationModule.Popover.Root, { isOpen = var13 }, {
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
			onPressedOutside = var14
		}, {
			ContentWrapper = reactModule.createElement(foundationModule.View, { Size = UDim2.fromOffset(flyOutWidth, flyOutHeight) }, {
				Container = reactModule.createElement(presetChatContainerModule, { compact = true, textChannel = value.textChannel })
			})
		})
	})
end)