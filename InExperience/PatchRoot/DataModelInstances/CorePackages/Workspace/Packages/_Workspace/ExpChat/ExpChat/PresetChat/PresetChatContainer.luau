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
local setIsPresetTrayOpenModule = require(script.Parent.Thunks.setIsPresetTrayOpen)
local fFlagExpChatUniverseChatPresetEnabledModule = require(expChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local fFlagExpChatPresetChatGamepadEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local var22 = expChatSharedModule.Flags.FIntPresetChatCooldownLuaMs / 1000
local presetChatContainer = expChatSharedModule.Logger:new("ExpChat/PresetChat/PresetChatContainer")

local function _() --[[ line: 40 | named "getRBXGeneralChannel" ]]
	-- upvalues: textChatService (ref)
	local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return reactModule.memo(function(value) --[[ line: 48 | named "PresetChatContainer" ]]
	-- upvalues: foundationModule (ref), getPresetChatStoreModule (ref), useDispatch (ref), signalsReactModule (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), useSelector (ref), localizationModule (ref), reactModule (ref), setIsPresetTrayOpenModule (ref), presetTrayKeyboardSelectedModule (ref), expChatSharedModule (ref), constantsModule (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), inputTypeModule (ref), userInputService (ref), guiService (ref), getTransparencyStoreModule (ref), textChatService (ref), var22 (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref), presetChatContainer (ref), presetMessageButtonModule (ref), text (ref), presetCooldownProviderModule (ref)
	local var25 = foundationModule.Hooks.useTokens()
	local var26 = getPresetChatStoreModule(false)
	local var27 = useDispatch()
	local var28 = signalsReactModule.useSignalState(var26.getIsLoading)
	local var29 = signalsReactModule.useSignalState(var26.getCategoryGroups)
	local var30 = if fFlagExpChatUseMessagesStore then signalsReactModule.useSignalState(getMessagesStoreModule(false).getCanLocalUserChat) else useSelector(function(p0) --[[ line: 61 ]]
		return p0.CanLocalUserChat
	end)
	local var31 = localizationModule.useLocalization({ footerDescription = "Feature.Chat.PresetChat.Disclaimer" })
	local var32 = reactModule.useCallback(function() --[[ line: 70 ]]
		-- upvalues: setIsPresetTrayOpenModule (copy), var26 (ref)
		setIsPresetTrayOpenModule(var26, false)
	end, { var26 })
	local var33 = reactModule.useCallback(function() --[[ line: 74 ]]
		-- upvalues: var32 (ref), var27 (ref), presetTrayKeyboardSelectedModule (copy), expChatSharedModule (copy), constantsModule (copy)
		var32()
		var27(presetTrayKeyboardSelectedModule())
		expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = constantsModule.Analytics.EventTypes.Click,
			component = constantsModule.Analytics.Components.PresetKeyboardIcon
		}, expChatSharedModule.Analytics.DefaultStandardizedFields)
	end, { var32, var27 })
	local var34 = reactModule.useRef(nil)
	local categoryGroupId = var29 and (#var29 <= 0 and (var29[1].categoryGroupId or ""))
	local var36, var37 = reactModule.useState(categoryGroupId)
	reactModule.useEffect(function() --[[ line: 89 ]]
		-- upvalues: var36 (ref), categoryGroupId (ref), var37 (ref)
		if var36 == "" and categoryGroupId ~= "" then
			var37(categoryGroupId)
		end
	end, { categoryGroupId, var36 })
	local var38 = if fFlagExpChatPresetChatGamepadEnabledModule then signalsReactModule.useSignalState(var26.getIsTrayOpen) else nil
	local var39 = reactModule.useRef(nil)
	
	local function _(p1) --[[ line: 100 | named "isValidSelection" ]]
		if p1 == nil then
			return false
		end
		local ok, status = pcall(function() --[[ line: 104 ]]
			-- upvalues: p1 (ref)
			return p1:IsDescendantOf(game) and p1:FindFirstAncestorOfClass("ScreenGui") ~= nil
		end)
		
		return ok and status
	end
	
	reactModule.useEffect(function() --[[ line: 111 ]]
		-- upvalues: fFlagExpChatPresetChatGamepadEnabledModule (copy), var38 (ref), var34 (ref), inputTypeModule (copy), userInputService (copy), var39 (ref), guiService (copy)
		if fFlagExpChatPresetChatGamepadEnabledModule and not var38 then return end
		local current = var34.current
		
		if current == nil then return end
		if inputTypeModule.getInputGroup(userInputService:GetLastInputType()) ~= inputTypeModule.InputTypeConstants.Gamepad then return end
		if var39.current == nil then
			var39.current = if fFlagExpChatPresetChatGamepadEnabledModule then guiService.SelectedCoreObject else guiService.SelectedObject
		end
		task.defer(function() --[[ line: 128 ]]
			-- upvalues: current (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
			local var51
			local var50 = current
			
			if var50 == nil then
				var51 = false
			else
				local ok, status = pcall(function() --[[ line: 104 ]]
					-- upvalues: var50 (ref)
					return var50:IsDescendantOf(game) and var50:FindFirstAncestorOfClass("ScreenGui") ~= nil
				end)
				var51 = ok and status
			end
			if var51 then
				pcall(function() --[[ line: 130 ]]
					-- upvalues: fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy), current (copy)
					if fFlagExpChatPresetChatGamepadEnabledModule then
						guiService.SelectedCoreObject = current
						
						return
					end
					guiService.SelectedObject = current
				end)
			end
		end)
	end, if fFlagExpChatPresetChatGamepadEnabledModule then { var36, var38 } else { var36 })
	reactModule.useEffect(function() --[[ line: 145 ]]
		-- upvalues: getTransparencyStoreModule (copy), var39 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
		local var52 = getTransparencyStoreModule(false)
		var52.setContextMenuOpen()
		
		return function() --[[ line: 148 ]]
			-- upvalues: var52 (ref), var39 (copy), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
			var52.clearContextMenuOpen()
			local current = var39.current
			pcall(function() --[[ line: 151 ]]
				-- upvalues: current (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy)
				local var54
				local var53 = current
				
				if var53 == nil then
					var54 = false
				else
					local ok, status = pcall(function() --[[ line: 104 ]]
						-- upvalues: var53 (ref)
						return var53:IsDescendantOf(game) and var53:FindFirstAncestorOfClass("ScreenGui") ~= nil
					end)
					var54 = ok and status
				end
				if var54 then
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
			var39.current = nil
		end
	end, {})
	local var40 = reactModule.useCallback(function(p2) --[[ line: 170 ]]
		-- upvalues: value (ref), textChatService (copy), var26 (ref), var22 (copy), fFlagExpChatUniverseChatPresetEnabledModule (copy), presetChatContainer (copy), var32 (ref)
		local textChannel = value.textChannel
		
		if textChannel ~= nil and textChannel.Name ~= "RBXGeneral" then
			local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
			textChannel = if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
		end
		var26.setPresetCooldownEndsAt(os.clock() + var22)
		
		if not textChannel then
			if not fFlagExpChatUniverseChatPresetEnabledModule then
				presetChatContainer:warning("Preset {} activated but no target text channel was provided; skipping send.", p2)
				var26.setPresetCooldownEndsAt(nil)
				var32()
				
				return
			elseif not pcall(function() --[[ line: 192 ]]
				-- upvalues: textChatService (copy), p2 (ref)
				textChatService:SendUniverseChatPresetAsync(p2)
			end) then
				var26.setPresetCooldownEndsAt(nil)
			end
		elseif not pcall(function() --[[ line: 199 ]]
			-- upvalues: textChannel (write), p2 (ref)
			textChannel:SendPresetAsync(p2)
		end) then
			var26.setPresetCooldownEndsAt(nil)
		end
		var26.incrementPresetClickCount(p2)
		var32()
	end, { value.textChannel, var26, var32 })
	
	if var28 then
		return reactModule.createElement(foundationModule.Text, {
			Text = "Loading presets...",
			tag = "size-full text-body-medium content-muted"
		})
	elseif not var29 or #var29 == 0 then
		return nil
	end
	local v
	local var41 = nil
	
	for i, v in var29 do
		if v.categoryGroupId == var36 then
			var41 = v
			break
		end
	end
	local t = {
		LineHeight = 1.4,
		Font = Enum.Font.BuilderSansBold,
		FontSize = var25.FontSize.FontSize_300
	}
	local t_1 = {}
	local var44 = true
	
	if var41 then
		for i_1, v_1 in var41.categories do
			local t_2 = {}
			
			for i_2, v_2 in v_1.messages do
				t_2["Msg_" .. v_2.presetId] = reactModule.createElement(presetMessageButtonModule, {
					presetId = v_2.presetId,
					text = v_2.value,
					layoutOrder = i_2,
					onActivated = var40,
					buttonRef = if var44 then var34 else nil
				})
				var44 = false
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
						Padding = UDim.new(0, var25.Padding.Small)
					}
				}, t_2)
			})
		end
		t_1.Footer = reactModule.createElement(text, {
			TextWrapped = true,
			tag = "size-full-0 auto-y text-body-small text-align-x-left content-muted",
			LayoutOrder = #var41.categories + 1,
			Text = var31.footerDescription
		})
	end
	local t_2 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var25.Padding.XLarge),
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		})
	}
	v = #var29 > 1
	
	for i_1, v_1 in var29 do
		local categoryGroupId_1 = v_1.categoryGroupId
		local var47 = categoryGroupId_1 == var36
		local t_3 = {
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, 36),
			LayoutOrder = i_1,
			Text = v_1.name or categoryGroupId_1,
			fontStyle = var25.Typography.LabelMedium,
			textStyle = if var47 or not v then var25.Color.Content.Emphasis else var25.Color.Content.Muted,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}
		local var49 = if var47 and v then {
			Indicator = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0.5, 1),
				Position = UDim2.new(0.5, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, 2),
				BackgroundColor3 = var25.Color.Content.Emphasis.Color3
			})
		} else nil
		
		if v then
			function t_3.onActivated() --[[ line: 319 ]]
				-- upvalues: var37 (ref), categoryGroupId_1 (ref)
				var37(categoryGroupId_1)
			end
		end
		t_2["Tab_" .. categoryGroupId_1] = reactModule.createElement(text, t_3, var49)
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
				PaddingLeft = UDim.new(0, var25.Padding.Large),
				PaddingRight = UDim.new(0, var25.Padding.Large),
				PaddingTop = UDim.new(0, var25.Padding.XSmall)
			}),
			TabsGroup = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.fromScale(0, 0)
			}, t_2),
			KeyboardButton = if var30 and value.shouldShowKeyboardButton then reactModule.createElement(foundationModule.IconButton, {
				LayoutOrder = 2,
				isCircular = true,
				isDisabled = false,
				icon = { name = "keyboard", variant = "Regular" },
				variant = foundationModule.Enums.ButtonVariant.Utility,
				size = foundationModule.Enums.InputSize.Small,
				onActivated = var33
			}) else nil
		}),
		TabRowBaseline = reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = var25.Color.Stroke.Default.Color3,
			BackgroundTransparency = var25.Color.Stroke.Default.Transparency
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
					Padding = UDim.new(0, var25.Padding.Large)
				},
				padding = {
					top = UDim.new(0, var25.Padding.Large),
					bottom = UDim.new(0, var25.Padding.Large),
					left = UDim.new(0, var25.Padding.Large),
					right = UDim.new(0, var25.Padding.Large)
				}
			}, t_1)
		})
	}))
end)