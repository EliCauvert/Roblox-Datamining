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
local var24 = expChatSharedModule.Flags.FIntPresetChatCooldownLuaMs / 1000
local presetChatContainer = expChatSharedModule.Logger:new("ExpChat/PresetChat/PresetChatContainer")

local function _()
	-- upvalues: textChatService (ref)
	local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return reactModule.memo(function(value)
	-- upvalues: foundationModule (ref), getPresetChatStoreModule (ref), useDispatch (ref), signalsReactModule (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), useSelector (ref), localizationModule (ref), reactModule (ref), setIsPresetTrayOpenModule (ref), presetTrayKeyboardSelectedModule (ref), expChatSharedModule (ref), constantsModule (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), inputTypeModule (ref), userInputService (ref), guiService (ref), getTransparencyStoreModule (ref), fFlagExpChatPresetChatAutocompleteEnabledModule (ref), var24 (ref), sendPresetModule (ref), presetChatContainer (ref), textChatService (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref), presetMessageButtonModule (ref), text (ref), presetCooldownProviderModule (ref)
	local var27 = foundationModule.Hooks.useTokens()
	local var28 = getPresetChatStoreModule(false)
	local var29 = useDispatch()
	local var30 = signalsReactModule.useSignalState(var28.getIsLoading)
	local var31 = signalsReactModule.useSignalState(var28.getCategoryGroups)
	local var32 = if fFlagExpChatUseMessagesStore then signalsReactModule.useSignalState(getMessagesStoreModule(false).getCanLocalUserChat) else useSelector(function(p0)
		return p0.CanLocalUserChat
	end)
	local var33 = localizationModule.useLocalization({ footerDescription = "Feature.Chat.PresetChat.Disclaimer" })
	local var34 = reactModule.useCallback(function()
		-- upvalues: setIsPresetTrayOpenModule (copy), var28 (ref)
		setIsPresetTrayOpenModule(var28, false)
	end, { var28 })
	local var35 = reactModule.useCallback(function()
		-- upvalues: var34 (ref), var29 (ref), presetTrayKeyboardSelectedModule (copy), expChatSharedModule (copy), constantsModule (copy)
		var34()
		var29(presetTrayKeyboardSelectedModule())
		expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = constantsModule.Analytics.EventTypes.Click,
			component = constantsModule.Analytics.Components.PresetKeyboardIcon
		}, expChatSharedModule.Analytics.DefaultStandardizedFields)
	end, { var34, var29 })
	local var36 = reactModule.useRef(nil)
	local categoryGroupId = var31 and (#var31 <= 0 and (var31[1].categoryGroupId or ""))
	local var38, var39 = reactModule.useState(categoryGroupId)
	reactModule.useEffect(function()
		-- upvalues: var38 (ref), categoryGroupId (ref), var39 (ref)
		if var38 == "" and categoryGroupId ~= "" then
			var39(categoryGroupId)
		end
	end, { categoryGroupId, var38 })
	local var40 = if fFlagExpChatPresetChatGamepadEnabledModule then signalsReactModule.useSignalState(var28.getIsTrayOpen) else nil
	local var41 = reactModule.useRef(nil)
	
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
		-- upvalues: fFlagExpChatPresetChatGamepadEnabledModule (copy), var40 (ref), var36 (ref), inputTypeModule (copy), userInputService (copy), var41 (ref), guiService (copy)
		if fFlagExpChatPresetChatGamepadEnabledModule and not var40 then return end
		local current = var36.current
		
		if current == nil then return end
		if inputTypeModule.getInputGroup(userInputService:GetLastInputType()) ~= inputTypeModule.InputTypeConstants.Gamepad then return end
		if var41.current == nil then
			var41.current = if fFlagExpChatPresetChatGamepadEnabledModule then guiService.SelectedCoreObject else guiService.SelectedObject
		end
		task.defer(function()
			-- upvalues: current (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
			local var53
			local var52 = current
			
			if var52 == nil then
				var53 = false
			else
				local ok, status = pcall(function()
					-- upvalues: var52 (ref)
					return var52:IsDescendantOf(game) and var52:FindFirstAncestorOfClass("ScreenGui") ~= nil
				end)
				var53 = ok and status
			end
			if var53 then
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
	end, if fFlagExpChatPresetChatGamepadEnabledModule then { var38, var40 } else { var38 })
	reactModule.useEffect(function()
		-- upvalues: getTransparencyStoreModule (copy), var41 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
		local var54 = getTransparencyStoreModule(false)
		var54.setContextMenuOpen()
		
		return function()
			-- upvalues: var54 (ref), var41 (copy), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
			var54.clearContextMenuOpen()
			local current = var41.current
			pcall(function()
				-- upvalues: current (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
				local var56
				local var55 = current
				
				if var55 == nil then
					var56 = false
				else
					local ok, status = pcall(function()
						-- upvalues: var55 (ref)
						return var55:IsDescendantOf(game) and var55:FindFirstAncestorOfClass("ScreenGui") ~= nil
					end)
					var56 = ok and status
				end
				if var56 then
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
			var41.current = nil
		end
	end, {})
	local var42 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagExpChatPresetChatAutocompleteEnabledModule (copy), var28 (ref), var24 (copy), sendPresetModule (copy), value (ref), presetChatContainer (copy), var34 (ref), textChatService (copy), fFlagExpChatUniverseChatPresetEnabledModule (copy)
		if fFlagExpChatPresetChatAutocompleteEnabledModule then
			var28.setPresetCooldownEndsAt(os.clock() + var24)
			local var57 = sendPresetModule(p2, value.textChannel)
			
			if var57 ~= "Sent" then
				var28.setPresetCooldownEndsAt(nil)
			end
			if var57 == "NoChannel" then
				presetChatContainer:warning("Preset {} activated but no target text channel was provided; skipping send.", p2)
				var34()
				
				return
			end
			var28.incrementPresetClickCount(p2)
			var34()
			
			return
		else
			local textChannel = value.textChannel
			
			if textChannel ~= nil and textChannel.Name ~= "RBXGeneral" then
				local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
				textChannel = if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
			end
			var28.setPresetCooldownEndsAt(os.clock() + var24)
			
			if not textChannel then
				if not fFlagExpChatUniverseChatPresetEnabledModule then
					presetChatContainer:warning("Preset {} activated but no target text channel was provided; skipping send.", p2)
					var28.setPresetCooldownEndsAt(nil)
					var34()
					
					return
				elseif not pcall(function()
					-- upvalues: textChatService (copy), p2 (ref)
					textChatService:SendUniverseChatPresetAsync(p2)
				end) then
					var28.setPresetCooldownEndsAt(nil)
				end
			elseif not pcall(function()
				-- upvalues: textChannel (write), p2 (ref)
				textChannel:SendPresetAsync(p2)
			end) then
				var28.setPresetCooldownEndsAt(nil)
			end
			var28.incrementPresetClickCount(p2)
			var34()
		end
	end, { value.textChannel, var28, var34 })
	
	if var30 then
		return reactModule.createElement(foundationModule.Text, {
			Text = "Loading presets...",
			tag = "size-full text-body-medium content-muted"
		})
	elseif not var31 or #var31 == 0 then
		return nil
	end
	local v
	local var43 = nil
	
	for i, v in var31 do
		if v.categoryGroupId == var38 then
			var43 = v
			break
		end
	end
	local t = {
		LineHeight = 1.4,
		Font = Enum.Font.BuilderSansBold,
		FontSize = var27.FontSize.FontSize_300
	}
	local t_1 = {}
	local var46 = true
	
	if var43 then
		for i_1, v_1 in var43.categories do
			local t_2 = {}
			
			for i_2, v_2 in v_1.messages do
				t_2["Msg_" .. v_2.presetId] = reactModule.createElement(presetMessageButtonModule, {
					presetId = v_2.presetId,
					text = v_2.value,
					layoutOrder = i_2,
					onActivated = var42,
					buttonRef = if var46 then var36 else nil
				})
				var46 = false
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
						Padding = UDim.new(0, var27.Padding.Small)
					}
				}, t_2)
			})
		end
		t_1.Footer = reactModule.createElement(text, {
			TextWrapped = true,
			tag = "size-full-0 auto-y text-body-small text-align-x-left content-muted",
			LayoutOrder = #var43.categories + 1,
			Text = var33.footerDescription
		})
	end
	local t_2 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var27.Padding.XLarge),
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		})
	}
	v = #var31 > 1
	
	for i_1, v_1 in var31 do
		local categoryGroupId_1 = v_1.categoryGroupId
		local var49 = categoryGroupId_1 == var38
		local t_3 = {
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, 36),
			LayoutOrder = i_1,
			Text = v_1.name or categoryGroupId_1,
			fontStyle = var27.Typography.LabelMedium,
			textStyle = if var49 or not v then var27.Color.Content.Emphasis else var27.Color.Content.Muted,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}
		local var51 = if var49 and v then {
			Indicator = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0.5, 1),
				Position = UDim2.new(0.5, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, 2),
				BackgroundColor3 = var27.Color.Content.Emphasis.Color3
			})
		} else nil
		
		if v then
			function t_3.onActivated()
				-- upvalues: var39 (ref), categoryGroupId_1 (ref)
				var39(categoryGroupId_1)
			end
		end
		t_2["Tab_" .. categoryGroupId_1] = reactModule.createElement(text, t_3, var51)
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
				PaddingLeft = UDim.new(0, var27.Padding.Large),
				PaddingRight = UDim.new(0, var27.Padding.Large),
				PaddingTop = UDim.new(0, var27.Padding.XSmall)
			}),
			TabsGroup = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.fromScale(0, 0)
			}, t_2),
			KeyboardButton = if var32 and value.shouldShowKeyboardButton then reactModule.createElement(foundationModule.IconButton, {
				LayoutOrder = 2,
				isCircular = true,
				isDisabled = false,
				icon = { name = "keyboard", variant = "Regular" },
				variant = foundationModule.Enums.ButtonVariant.Utility,
				size = foundationModule.Enums.InputSize.Small,
				onActivated = var35
			}) else nil
		}),
		TabRowBaseline = reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = var27.Color.Stroke.Default.Color3,
			BackgroundTransparency = var27.Color.Stroke.Default.Transparency
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
					Padding = UDim.new(0, var27.Padding.Large)
				},
				padding = {
					top = UDim.new(0, var27.Padding.Large),
					bottom = UDim.new(0, var27.Padding.Large),
					left = UDim.new(0, var27.Padding.Large),
					right = UDim.new(0, var27.Padding.Large)
				}
			}, t_1)
		})
	}))
end)