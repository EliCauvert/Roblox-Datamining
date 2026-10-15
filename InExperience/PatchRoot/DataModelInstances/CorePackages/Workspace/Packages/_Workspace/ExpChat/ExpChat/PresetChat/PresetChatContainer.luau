local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local foundationModule = require(parent.Foundation)
local inputTypeModule = require(parent.InputType)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local signalsReactModule = require(parent.SignalsReact)
local engineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local text = foundationModule.Text
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local localizationModule = require(expChat.Localization)
local presetBorderlessGridButtonModule = require(script.Parent.PresetBorderlessGridButton)
local presetCooldownProviderModule = require(script.Parent.PresetCooldownProvider)
local presetMessageButtonModule = require(script.Parent.PresetMessageButton)
local presetTrayKeyboardSelectedModule = require(expChat.Actions.PresetTrayKeyboardSelected)
local constantsModule = require(expChat.PresetChat.Constants)
local setIsPresetTrayOpenModule = require(script.Parent.Thunks.setIsPresetTrayOpen)
local useOnEmojiActivatedModule = require(script.Parent.useOnEmojiActivated)
local useOnPresetActivatedModule = require(script.Parent.useOnPresetActivated)
local fFlagExpChatPresetChatGamepadEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local fFlagExpChatPresetChatTabMemoryModule = require(expChat.Flags.FFlagExpChatPresetChatTabMemory)
local fFlagExpChatPresetTrayDismissAnalyticsModule = require(expChat.Flags.FFlagExpChatPresetTrayDismissAnalytics)

return reactModule.memo(function(value)
	-- upvalues: foundationModule (ref), getPresetChatStoreModule (ref), useDispatch (ref), signalsReactModule (ref), getMessagesStoreModule (ref), localizationModule (ref), reactModule (ref), setIsPresetTrayOpenModule (ref), presetTrayKeyboardSelectedModule (ref), expChatSharedModule (ref), constantsModule (ref), fFlagExpChatPresetChatTabMemoryModule (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), fFlagExpChatPresetTrayDismissAnalyticsModule (ref), inputTypeModule (ref), userInputService (ref), guiService (ref), getTransparencyStoreModule (ref), useOnPresetActivatedModule (ref), useOnEmojiActivatedModule (ref), engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (ref), presetBorderlessGridButtonModule (ref), presetMessageButtonModule (ref), text (ref), presetCooldownProviderModule (ref)
	local var1
	local var2 = foundationModule.Hooks.useTokens()
	local var3 = getPresetChatStoreModule(false)
	local var4 = useDispatch()
	local var5 = signalsReactModule.useSignalState(var3.getIsLoading)
	local var6 = signalsReactModule.useSignalState(var3.getCategoryGroups)
	local var7 = signalsReactModule.useSignalState(getMessagesStoreModule(false).getCanLocalUserChat)
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
	local _ = nil
	
	if fFlagExpChatPresetChatTabMemoryModule then
		local var14 = var6 and var6[signalsReactModule.useSignalState(var3.getSelectedGroupIndex)]
		var1 = if var14 then var14.categoryGroupId else categoryGroupId
	else
		var1 = var12
	end
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatPresetChatTabMemoryModule (copy), var1 (write), categoryGroupId (ref), var13 (ref)
		if not fFlagExpChatPresetChatTabMemoryModule and var1 == "" and categoryGroupId ~= "" then
			var13(categoryGroupId)
		end
	end, { categoryGroupId, var1 })
	local var15 = if fFlagExpChatPresetChatGamepadEnabledModule or fFlagExpChatPresetTrayDismissAnalyticsModule then signalsReactModule.useSignalState(var3.getIsTrayOpen) else nil
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatPresetTrayDismissAnalyticsModule (copy), var15 (ref), var5 (ref), var1 (write), var3 (ref)
		if fFlagExpChatPresetTrayDismissAnalyticsModule and var15 and (not var5 and var1 ~= "") then
			var3.markGroupViewed(var1)
		end
	end, { var15, var5, var1, var3 })
	local var16 = reactModule.useRef(nil)
	
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
		-- upvalues: fFlagExpChatPresetChatGamepadEnabledModule (copy), var15 (ref), var11 (ref), inputTypeModule (copy), userInputService (copy), var16 (ref), guiService (copy)
		if fFlagExpChatPresetChatGamepadEnabledModule and not var15 then return end
		local current = var11.current
		
		if current == nil then return end
		if inputTypeModule.getInputGroup(userInputService:GetLastInputType()) ~= inputTypeModule.InputTypeConstants.Gamepad then return end
		if var16.current == nil then
			var16.current = if fFlagExpChatPresetChatGamepadEnabledModule then guiService.SelectedCoreObject else guiService.SelectedObject
		end
		task.defer(function()
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
	end, if fFlagExpChatPresetChatGamepadEnabledModule then { var1, var15 } else { var1 })
	reactModule.useEffect(function()
		-- upvalues: getTransparencyStoreModule (copy), var16 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
		local var17 = getTransparencyStoreModule(false)
		var17.setContextMenuOpen()
		
		return function()
			-- upvalues: var17 (ref), var16 (copy), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
			var17.clearContextMenuOpen()
			local current = var16.current
			pcall(function()
				-- upvalues: current (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
				local var18
				local var19 = current
				
				if var19 == nil then
					var18 = false
				else
					local ok, status = pcall(function()
						-- upvalues: var19 (ref)
						return var19:IsDescendantOf(game) and var19:FindFirstAncestorOfClass("ScreenGui") ~= nil
					end)
					var18 = ok and status
				end
				if var18 then
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
			var16.current = nil
		end
	end, {})
	local var17 = useOnPresetActivatedModule({ textChannel = value.textChannel, closePresetTray = var9 })
	local var18 = useOnEmojiActivatedModule({
		textChannel = value.textChannel,
		onSendChat = value.onSendChat,
		onSendGlobalChat = value.onSendGlobalChat,
		closePresetTray = var9
	})
	
	if var5 then
		return reactModule.createElement(foundationModule.Text, {
			Text = "Loading presets...",
			tag = "size-full text-body-medium content-muted"
		})
	elseif not var6 or #var6 == 0 then
		return nil
	end
	local v
	local var19 = nil
	
	for i, v in var6 do
		if v.categoryGroupId == var1 then
			var19 = v
			break
		end
	end
	local t = {
		LineHeight = 1.4,
		Font = Enum.Font.BuilderSansBold,
		FontSize = var2.FontSize.FontSize_300
	}
	local t_1 = {}
	local var20 = true
	
	if var19 then
		for i_1, v_1 in var19.categories do
			local t_2 = {}
			
			for i_2, v_2 in if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then v_1.contents else v_1.messages do
				if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint and v_2.kind == "Emoji" then
					t_2["Emoji_" .. v_2.emoteId] = reactModule.createElement(presetBorderlessGridButtonModule, {
						unicode = v_2.unicode,
						layoutOrder = i_2,
						onActivated = var18,
						buttonRef = if var20 then var11 else nil
					})
				else
					t_2["Msg_" .. v_2.presetId] = reactModule.createElement(presetMessageButtonModule, {
						presetId = v_2.presetId,
						text = if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then v_2.text else v_2.value,
						layoutOrder = i_2,
						onActivated = var17,
						buttonRef = if var20 then var11 else nil
					})
				end
				var20 = false
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
			LayoutOrder = #var19.categories + 1,
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
		local var21 = categoryGroupId_1 == var1
		local t_3 = {
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, 36),
			LayoutOrder = i_1,
			Text = v_1.name or categoryGroupId_1,
			fontStyle = var2.Typography.LabelMedium,
			textStyle = if var21 or not v then var2.Color.Content.Emphasis else var2.Color.Content.Muted,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}
		local var22 = if var21 and v then {
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
				-- upvalues: fFlagExpChatPresetChatTabMemoryModule (copy), var3 (ref), i_1 (ref), var13 (ref), categoryGroupId_1 (ref)
				if fFlagExpChatPresetChatTabMemoryModule then
					var3.setSelectedGroupIndex(i_1)
					
					return
				end
				var13(categoryGroupId_1)
			end
		end
		t_2["Tab_" .. categoryGroupId_1] = reactModule.createElement(text, t_3, var22)
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