local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ConfigModule = require(ExpChat.Config)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local PresetChatButtonModule = require(script.Parent.PresetChatButton)
local PresetChatContainerModule = require(script.Parent.PresetChatContainer)
local SetIsPresetTrayOpenModule = require(script.Parent.Thunks.setIsPresetTrayOpen)
local FFlagExpChatPresetChatGamepadEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local FlyOutWidth = ConfigModule.PresetTray.FlyOutWidth
local FlyOutHeight = ConfigModule.PresetTray.FlyOutHeight

return ReactModule.memo(function(p1)
	-- upvalues: GetPresetChatStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), SetIsPresetTrayOpenModule (copy), FFlagExpChatPresetChatGamepadEnabledModule (copy), UserInputService (copy), GuiService (copy), FoundationModule (copy), PresetChatButtonModule (copy), FlyOutWidth (copy), FlyOutHeight (copy), PresetChatContainerModule (copy)
	local PresetChatStoreModule = GetPresetChatStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(PresetChatStoreModule.getIsTrayOpen)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SetIsPresetTrayOpenModule (upval), PresetChatStoreModule (copy)
		SetIsPresetTrayOpenModule(PresetChatStoreModule, false)
	end, { PresetChatStoreModule })
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), FFlagExpChatPresetChatGamepadEnabledModule (upval), UserInputService (upval), SetIsPresetTrayOpenModule (upval), PresetChatStoreModule (copy), GuiService (upval)
		if not UseSignalStateResult then return end
		local InputBeganConnection = if FFlagExpChatPresetChatGamepadEnabledModule then UserInputService.InputBegan:Connect(function(Input, _)
			-- upvalues: SetIsPresetTrayOpenModule (upval), PresetChatStoreModule (upval)
			if Input.KeyCode == Enum.KeyCode.Escape or Input.KeyCode == Enum.KeyCode.ButtonB then
				SetIsPresetTrayOpenModule(PresetChatStoreModule, false)
			end
		end) else nil
		local MenuOpenedConnection = GuiService.MenuOpened:Connect(function()
			-- upvalues: PresetChatStoreModule (upval)
			PresetChatStoreModule.setIsTrayOpen(false)
		end)
		
		return function()
			-- upvalues: InputBeganConnection (ref), MenuOpenedConnection (copy)
			if InputBeganConnection then
				InputBeganConnection:Disconnect()
			end
			MenuOpenedConnection:Disconnect()
		end
	end, { UseSignalStateResult, PresetChatStoreModule })
	
	return ReactModule.createElement(FoundationModule.Popover.Root, { isOpen = UseSignalStateResult }, {
		Anchor = ReactModule.createElement(FoundationModule.Popover.Anchor, nil, {
			AnchorWrapper = ReactModule.createElement(FoundationModule.View, {
				tag = "size-0-full auto-x",
				padding = if p1.addTopPadding then { top = UDim.new(0, 6) } else nil,
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Bottom,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, {
				Button = ReactModule.createElement(PresetChatButtonModule, {
					fullWidth = p1.fullWidthButton,
					size = p1.buttonSize,
					isCircular = p1.buttonIsCircular,
					targetTextChannel = p1.textChannel
				})
			})
		}),
		Content = ReactModule.createElement(FoundationModule.Popover.Content, {
			hasArrow = false,
			side = {
				offset = 7,
				position = FoundationModule.Enums.PopoverSide.Right
			},
			align = {
				offset = 3,
				position = FoundationModule.Enums.PopoverAlign.Start
			},
			radius = FoundationModule.Enums.Radius.Medium,
			onPressedOutside = UseResult
		}, {
			ContentWrapper = ReactModule.createElement(FoundationModule.View, { Size = UDim2.fromOffset(FlyOutWidth, FlyOutHeight) }, {
				Container = ReactModule.createElement(PresetChatContainerModule, { compact = true, textChannel = p1.textChannel })
			})
		})
	})
end)