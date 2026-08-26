local guiService = game:GetService("GuiService")
local textChatService = game:GetService("TextChatService")
local userInputService = game:GetService("UserInputService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local foundationModule = require(parent.Foundation)
local inputTypeModule = require(parent.InputType)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local text = foundationModule.Text
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local localizationModule = require(expChat.Localization)
local presetCooldownProviderModule = require(script.Parent.PresetCooldownProvider)
local presetMessageButtonModule = require(script.Parent.PresetMessageButton)
local presetTrayKeyboardSelectedModule = require(expChat.Actions.PresetTrayKeyboardSelected)
local constantsModule = require(expChat.PresetChat.Constants)
local sendPresetModule = require(script.Parent.sendPreset)
local setIsPresetTrayOpenModule = require(script.Parent.Thunks.setIsPresetTrayOpen)
local fFlagExpChatUniverseChatPresetEnabledModule = require(expChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local fFlagExpChatPresetChatGamepadEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local fFlagExpChatPresetChatAutocompleteEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatAutocompleteEnabled)
local var1 = expChatSharedModule.Flags.FIntPresetChatCooldownLuaMs / 1000
local presetChatContainer = expChatSharedModule.Logger:new("ExpChat/PresetChat/PresetChatContainer")

local function _()
	-- upvalues: textChatService (ref)
	local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return reactModule.memo(function(value)
	-- upvalues: foundationModule (ref), getPresetChatStoreModule (ref), useDispatch (ref), signalsReactModule (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), useSelector (ref), localizationModule (ref), reactModule (ref), setIsPresetTrayOpenModule (ref), presetTrayKeyboardSelectedModule (ref), expChatSharedModule (ref), constantsModule (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), inputTypeModule (ref), userInputService (ref), guiService (ref), getTransparencyStoreModule (ref), fFlagExpChatPresetChatAutocompleteEnabledModule (ref), var1 (ref), sendPresetModule (ref), presetChatContainer (ref), textChatService (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref), presetMessageButtonModule (ref), text (ref), presetCooldownProviderModule (ref)
	local var2 = foundationModule.Hooks.useTokens()
	local var3 = getPresetChatStoreModule(false)
	local var4 = useDispatch()
	local var5 = signalsReactModule.useSignalState(var3.getIsLoading)
	local var6 = signalsReactModule.useSignalState(var3.getCategoryGroups)
	local var7 = if fFlagExpChatUseMessagesStore then signalsReactModule.useSignalState(getMessagesStoreModule(false).getCanLocalUserChat) else useSelector(function(p1)
		return p1.CanLocalUserChat
	end)
	local var8 = localizationModule.useLocalization({ footerDescription = "Feature.Chat.PresetChat.Disclaimer" })
	local var9 = reactModule.useCallback(function()
		-- upvalues: setIsPresetTrayOpenModule (copy), var3 (ref)
		setIsPresetTrayOpenModule(var3, false)
	end, { var3 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var4 (ref), presetTrayKeyboardSelectedModule (copy), expChatSharedModule (copy), constantsModule (copy)
		var9()
		var4(presetTrayKeyboardSelectedModule())
		expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = constantsModule.Analytics.EventTypes.Click,
			component = constantsModule.Analytics.Components.PresetKeyboardIcon
		}, expChatSharedModule.Analytics.DefaultStandardizedFields)
	end, { var9, var4 })
	local var11 = reactModule.useRef(nil)
	local categoryGroupId = var6 and (#var6 <= 0 and (var6[1].categoryGroupId or ""))
	local var12, var13 = reactModule.useState(categoryGroupId)
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), categoryGroupId (ref), var13 (ref)
		if var12 == "" and categoryGroupId ~= "" then
			var13(categoryGroupId)
		end
	end, { categoryGroupId, var12 })
	local var14 = if fFlagExpChatPresetChatGamepadEnabledModule then signalsReactModule.useSignalState(var3.getIsTrayOpen) else nil
	local var15 = reactModule.useRef(nil)
	
	local function _(p1)
		if p1 == nil then
			return false
		end
		local ok, status = pcall(function()
			-- upvalues: p1 (ref)
			return p1:IsDescendantOf(game) and p1:FindFirstAncestorOfClass("ScreenGui") ~= nil
		end)
		
		return ok and status
	end
	
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatPresetChatGamepadEnabledModule (copy), var14 (ref), var11 (ref), inputTypeModule (copy), userInputService (copy), var15 (ref), guiService (copy)
		if fFlagExpChatPresetChatGamepadEnabledModule and not var14 then return end
		local current = var11.current
		
		if current == nil then return end
		if inputTypeModule.getInputGroup(userInputService:GetLastInputType()) ~= inputTypeModule.InputTypeConstants.Gamepad then return end
		if var15.current == nil then
			var15.current = if fFlagExpChatPresetChatGamepadEnabledModule then guiService.SelectedCoreObject else guiService.SelectedObject
		end
		task.defer(function()
			-- upvalues: current (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
			local var16
			local var17 = current
			
			if var17 == nil then
				var16 = false
			else
				local ok, status = pcall(function()
					-- upvalues: var17 (ref)
					return var17:IsDescendantOf(game) and var17:FindFirstAncestorOfClass("ScreenGui") ~= nil
				end)
				var16 = ok and status
			end
			if var16 then
				pcall(function()
					-- upvalues: fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy), current (copy)
					if fFlagExpChatPresetChatGamepadEnabledModule then
						guiService.SelectedCoreObject = current
						
						return
					end
					guiService.SelectedObject = current
				end)
			end
		end)
	end, if fFlagExpChatPresetChatGamepadEnabledModule then { var12, var14 } else { var12 })
	reactModule.useEffect(function()
		-- upvalues: getTransparencyStoreModule (copy), var15 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
		local var16 = getTransparencyStoreModule(false)
		var16.setContextMenuOpen()
		
		return function()
			-- upvalues: var16 (ref), var15 (copy), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
			var16.clearContextMenuOpen()
			local current = var15.current
			pcall(function()
				-- upvalues: current (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
				local var17
				local var18 = current
				
				if var18 == nil then
					var17 = false
				else
					local ok, status = pcall(function()
						-- upvalues: var18 (ref)
						return var18:IsDescendantOf(game) and var18:FindFirstAncestorOfClass("ScreenGui") ~= nil
					end)
					var17 = ok and status
				end
				if var17 then
					if fFlagExpChatPresetChatGamepadEnabledModule then
						guiService.SelectedCoreObject = current
						
						return
					end
					guiService.SelectedObject = current
					
					return
				elseif fFlagExpChatPresetChatGamepadEnabledModule then
					guiService.SelectedCoreObject = nil
					
					return
				end
				guiService.SelectedObject = nil
			end)
			var15.current = nil
		end
	end, {})
	local var16 = reactModule.useCallback(function(p1)
		-- upvalues: fFlagExpChatPresetChatAutocompleteEnabledModule (copy), var3 (ref), var1 (copy), sendPresetModule (copy), value (ref), presetChatContainer (copy), var9 (ref), textChatService (copy), fFlagExpChatUniverseChatPresetEnabledModule (copy)
		if fFlagExpChatPresetChatAutocompleteEnabledModule then
			var3.setPresetCooldownEndsAt(os.clock() + var1)
			local var17 = sendPresetModule(p1, value.textChannel)
			
			if var17 ~= "Sent" then
				var3.setPresetCooldownEndsAt(nil)
			end
			if var17 == "NoChannel" then
				presetChatContainer:warning("Preset {} activated but no target text channel was provided; skipping send.", p1)
				var9()
				
				return
			end
			var3.incrementPresetClickCount(p1)
			var9()
			
			return
		else
			local textChannel = value.textChannel
			
			if textChannel ~= nil and textChannel.Name ~= "RBXGeneral" then
				local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
				textChannel = if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
			end
			var3.setPresetCooldownEndsAt(os.clock() + var1)
			
			if not textChannel then
				if not fFlagExpChatUniverseChatPresetEnabledModule then
					presetChatContainer:warning("Preset {} activated but no target text channel was provided; skipping send.", p1)
					var3.setPresetCooldownEndsAt(nil)
					var9()
					
					return
				elseif not pcall(function()
					-- upvalues: textChatService (copy), p1 (ref)
					textChatService:SendUniverseChatPresetAsync(p1)
				end) then
					var3.setPresetCooldownEndsAt(nil)
				end
			elseif not pcall(function()
				-- upvalues: textChannel (write), p1 (ref)
				textChannel:SendPresetAsync(p1)
			end) then
				var3.setPresetCooldownEndsAt(nil)
			end
			var3.incrementPresetClickCount(p1)
			var9()
		end
	end, { value.textChannel, var3, var9 })
	
	if var5 then
		return reactModule.createElement(foundationModule.Text, {
			Text = "Loading presets...",
			tag = "size-full text-body-medium content-muted"
		})
	elseif not var6 or #var6 == 0 then
		return nil
	end
	local v
	local var17 = nil
	
	for i, v in var6 do
		if v.categoryGroupId == var12 then
			var17 = v
			break
		end
	end
	local t = {
		LineHeight = 1.4,
		Font = Enum.Font.BuilderSansBold,
		FontSize = var2.FontSize.FontSize_300
	}
	local t_1 = {}
	local var18 = true
	
	if var17 then
		for i_1, v_1 in var17.categories do
			local t_2 = {}
			
			for i_2, v_2 in v_1.messages do
				t_2["Msg_" .. v_2.presetId] = reactModule.createElement(presetMessageButtonModule, {
					presetId = v_2.presetId,
					text = v_2.value,
					layoutOrder = i_2,
					onActivated = var16,
					buttonRef = if var18 then var11 else nil
				})
				var18 = false
			end
			t_1["Category_" .. v_1.categoryId] = reactModule.createElement(foundationModule.View, {
				tag = "col gap-small size-full-0 auto-y",
				LayoutOrder = i_1
			}, {
				Header = reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-align-x-left content-default",
					Text = v_1.name or v_1.categoryId,
					fontStyle = t
				}),
				Pills = reactModule.createElement(foundationModule.View, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y",
					layout = {
						Wraps = true,
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, var2.Padding.Small)
					}
				}, t_2)
			})
		end
		t_1.Footer = reactModule.createElement(text, {
			TextWrapped = true,
			tag = "size-full-0 auto-y text-body-small text-align-x-left content-muted",
			LayoutOrder = #var17.categories + 1,
			Text = var8.footerDescription
		})
	end
	local t_2 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var2.Padding.XLarge),
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		})
	}
	v = #var6 > 1
	
	for i_1, v_1 in var6 do
		local categoryGroupId_1 = v_1.categoryGroupId
		local var19 = categoryGroupId_1 == var12
		local t_3 = {
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, 36),
			LayoutOrder = i_1,
			Text = v_1.name or categoryGroupId_1,
			fontStyle = var2.Typography.LabelMedium,
			textStyle = if var19 or not v then var2.Color.Content.Emphasis else var2.Color.Content.Muted,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}
		local var20 = if var19 and v then {
			Indicator = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0.5, 1),
				Position = UDim2.new(0.5, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, 2),
				BackgroundColor3 = var2.Color.Content.Emphasis.Color3
			})
		} else nil
		
		if v then
			function t_3.onActivated()
				-- upvalues: var13 (ref), categoryGroupId_1 (ref)
				var13(categoryGroupId_1)
			end
		end
		t_2["Tab_" .. categoryGroupId_1] = reactModule.createElement(text, t_3, var20)
	end
	return reactModule.createElement(presetCooldownProviderModule, {}, reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		RootLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		TabRow = reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
			}),
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var2.Padding.Large),
				PaddingRight = UDim.new(0, var2.Padding.Large),
				PaddingTop = UDim.new(0, var2.Padding.XSmall)
			}),
			TabsGroup = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.fromScale(0, 0)
			}, t_2),
			KeyboardButton = if var7 and value.shouldShowKeyboardButton then reactModule.createElement(foundationModule.IconButton, {
				LayoutOrder = 2,
				isCircular = true,
				isDisabled = false,
				icon = { name = "keyboard", variant = "Regular" },
				variant = foundationModule.Enums.ButtonVariant.Utility,
				size = foundationModule.Enums.InputSize.Small,
				onActivated = var10
			}) else nil
		}),
		TabRowBaseline = reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = var2.Color.Stroke.Default.Color3,
			BackgroundTransparency = var2.Color.Stroke.Default.Transparency
		}),
		Scroll = reactModule.createElement(foundationModule.ScrollView, {
			LayoutOrder = 3,
			tag = "grow size-full-0",
			scroll = {
				scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility.Always,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(0, 0, 0, 0)
			}
		}, {
			Categories = reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, var2.Padding.Large)
				},
				padding = {
					top = UDim.new(0, var2.Padding.Large),
					bottom = UDim.new(0, var2.Padding.Large),
					left = UDim.new(0, var2.Padding.Large),
					right = UDim.new(0, var2.Padding.Large)
				}
			}, t_1)
		})
	}))
end)