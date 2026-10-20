local GuiService = game:GetService("GuiService")
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local FoundationModule = require(Parent.Foundation)
local InputTypeModule = require(Parent.InputType)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local SignalsReactModule = require(Parent.SignalsReact)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local FFlagExpChatUseMessagesStore = require(Parent.SharedFlags).FFlagExpChatUseMessagesStore
local Text = FoundationModule.Text
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local LocalizationModule = require(ExpChat.Localization)
local PresetCooldownProviderModule = require(script.Parent.PresetCooldownProvider)
local PresetMessageButtonModule = require(script.Parent.PresetMessageButton)
local PresetTrayKeyboardSelectedModule = require(ExpChat.Actions.PresetTrayKeyboardSelected)
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local SetIsPresetTrayOpenModule = require(script.Parent.Thunks.setIsPresetTrayOpen)
local FFlagExpChatUniverseChatPresetEnabledModule = require(ExpChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local FFlagExpChatPresetChatGamepadEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local FIntPresetChatCooldownLuaMsRatio = ExpChatSharedModule.Flags.FIntPresetChatCooldownLuaMs / 1000
local PresetChatContainer = ExpChatSharedModule.Logger:new("ExpChat/PresetChat/PresetChatContainer")

local function _()
	-- upvalues: TextChatService (copy)
	local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), GetPresetChatStoreModule (copy), UseDispatchFunction (copy), SignalsReactModule (copy), FFlagExpChatUseMessagesStore (copy), GetMessagesStoreModule (copy), UseSelectorFunction (copy), LocalizationModule (copy), ReactModule (copy), SetIsPresetTrayOpenModule (copy), PresetTrayKeyboardSelectedModule (copy), ExpChatSharedModule (copy), ConstantsModule (copy), FFlagExpChatPresetChatGamepadEnabledModule (copy), InputTypeModule (copy), UserInputService (copy), GuiService (copy), GetTransparencyStoreModule (copy), TextChatService (copy), FIntPresetChatCooldownLuaMsRatio (copy), FFlagExpChatUniverseChatPresetEnabledModule (copy), PresetChatContainer (copy), PresetMessageButtonModule (copy), Text (copy), PresetCooldownProviderModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local PresetChatStoreModule = GetPresetChatStoreModule(false)
	local UseDispatchResult = UseDispatchFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(PresetChatStoreModule.getIsLoading)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(PresetChatStoreModule.getCategoryGroups)
	local UseSignalStateResult2 = if FFlagExpChatUseMessagesStore then SignalsReactModule.useSignalState(GetMessagesStoreModule(false).getCanLocalUserChat) else UseSelectorFunction(function(p2)
		return p2.CanLocalUserChat
	end)
	local UseLocalizationResult = LocalizationModule.useLocalization({ footerDescription = "Feature.Chat.PresetChat.Disclaimer" })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SetIsPresetTrayOpenModule (upval), PresetChatStoreModule (copy)
		SetIsPresetTrayOpenModule(PresetChatStoreModule, false)
	end, { PresetChatStoreModule })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), UseDispatchResult (copy), PresetTrayKeyboardSelectedModule (upval), ExpChatSharedModule (upval), ConstantsModule (upval)
		UseResult()
		UseDispatchResult(PresetTrayKeyboardSelectedModule())
		ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = ConstantsModule.Analytics.EventTypes.Click,
			component = ConstantsModule.Analytics.Components.PresetKeyboardIcon
		}, ExpChatSharedModule.Analytics.DefaultStandardizedFields)
	end, { UseResult, UseDispatchResult })
	local UseRefResult = ReactModule.useRef(nil)
	local CategoryGroupId = UseSignalStateResult1 and #UseSignalStateResult1 > 0 and UseSignalStateResult1[1].categoryGroupId or ""
	local UseStateResult, UseStateResult2 = ReactModule.useState(CategoryGroupId)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), CategoryGroupId (copy), UseStateResult2 (copy)
		if UseStateResult == "" and CategoryGroupId ~= "" then
			UseStateResult2(CategoryGroupId)
		end
	end, { CategoryGroupId, UseStateResult })
	local UseSignalStateResult3 = if FFlagExpChatPresetChatGamepadEnabledModule then SignalsReactModule.useSignalState(PresetChatStoreModule.getIsTrayOpen) else nil
	local UseRefResult1 = ReactModule.useRef(nil)
	
	local function _(p2)
		if p2 == nil then
			return false
		else
			local Success, Result = pcall(function(): boolean
				-- upvalues: p2 (copy)
				return p2:IsDescendantOf(game) and p2:FindFirstAncestorOfClass("ScreenGui") ~= nil
			end)
			
			return Success and Result
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: FFlagExpChatPresetChatGamepadEnabledModule (upval), UseSignalStateResult3 (copy), UseRefResult (copy), InputTypeModule (upval), UserInputService (upval), UseRefResult1 (copy), GuiService (upval)
		if FFlagExpChatPresetChatGamepadEnabledModule and not UseSignalStateResult3 then return end
		local Current = UseRefResult.current
		
		if Current == nil then return end
		if InputTypeModule.getInputGroup(UserInputService:GetLastInputType()) ~= InputTypeModule.InputTypeConstants.Gamepad then return end
		if UseRefResult1.current == nil then
			UseRefResult1.current = if FFlagExpChatPresetChatGamepadEnabledModule then GuiService.SelectedCoreObject else GuiService.SelectedObject
		end
		task.defer(function()
			-- upvalues: Current (copy), FFlagExpChatPresetChatGamepadEnabledModule (upval), GuiService (upval)
			local v1 = nil
			if Current == nil then
				v1 = false
			else
				local Success, Result = pcall(function(): boolean
					-- upvalues: Current (copy)
					return Current:IsDescendantOf(game) and Current:FindFirstAncestorOfClass("ScreenGui") ~= nil
				end)
				v1 = Success and Result
			end
			if v1 then
				pcall(function()
					-- upvalues: FFlagExpChatPresetChatGamepadEnabledModule (upval), GuiService (upval), Current (upval)
					if FFlagExpChatPresetChatGamepadEnabledModule then
						GuiService.SelectedCoreObject = Current
						
						return
					else
						GuiService.SelectedObject = Current
					end
				end)
			end
		end)
	end, if FFlagExpChatPresetChatGamepadEnabledModule then { UseStateResult, UseSignalStateResult3 } else { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: GetTransparencyStoreModule (upval), UseRefResult1 (copy), FFlagExpChatPresetChatGamepadEnabledModule (upval), GuiService (upval)
		local TransparencyStoreModule = GetTransparencyStoreModule(false)
		TransparencyStoreModule.setContextMenuOpen()
		
		return function()
			-- upvalues: TransparencyStoreModule (copy), UseRefResult1 (upval), FFlagExpChatPresetChatGamepadEnabledModule (upval), GuiService (upval)
			TransparencyStoreModule.clearContextMenuOpen()
			local Current = UseRefResult1.current
			pcall(function()
				-- upvalues: Current (copy), FFlagExpChatPresetChatGamepadEnabledModule (upval), GuiService (upval)
				local v1 = nil
				if Current == nil then
					v1 = false
				else
					local Success, Result = pcall(function(): boolean
						-- upvalues: Current (copy)
						return Current:IsDescendantOf(game) and Current:FindFirstAncestorOfClass("ScreenGui") ~= nil
					end)
					v1 = Success and Result
				end
				if v1 then
					if FFlagExpChatPresetChatGamepadEnabledModule then
						GuiService.SelectedCoreObject = Current
						
						return
					else
						GuiService.SelectedObject = Current
						
						return
					end
				elseif FFlagExpChatPresetChatGamepadEnabledModule then
					GuiService.SelectedCoreObject = nil
					
					return
				else
					GuiService.SelectedObject = nil
				end
			end)
			UseRefResult1.current = nil
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function(PresetId)
		-- upvalues: p1 (copy), TextChatService (upval), PresetChatStoreModule (copy), FIntPresetChatCooldownLuaMsRatio (upval), FFlagExpChatUniverseChatPresetEnabledModule (upval), PresetChatContainer (upval), UseResult (copy)
		local TextChannel = p1.textChannel
		
		if TextChannel ~= nil and TextChannel.Name ~= "RBXGeneral" then
			local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
			TextChannel = if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
		end
		PresetChatStoreModule.setPresetCooldownEndsAt(os.clock() + FIntPresetChatCooldownLuaMsRatio)
		
		if TextChannel then
			if not pcall(function()
				-- upvalues: TextChannel (ref), PresetId (copy)
				TextChannel:SendPresetAsync(PresetId)
			end) then
				PresetChatStoreModule.setPresetCooldownEndsAt(nil)
			end
		else
			if not FFlagExpChatUniverseChatPresetEnabledModule then
				PresetChatContainer:warning("Preset {} activated but no target text channel was provided; skipping send.", PresetId)
				PresetChatStoreModule.setPresetCooldownEndsAt(nil)
				UseResult()
				
				return
			end
			if not pcall(function()
				-- upvalues: TextChatService (upval), PresetId (copy)
				TextChatService:SendUniverseChatPresetAsync(PresetId)
			end) then
				PresetChatStoreModule.setPresetCooldownEndsAt(nil)
			end
		end
		PresetChatStoreModule.incrementPresetClickCount(PresetId)
		UseResult()
	end, { p1.textChannel, PresetChatStoreModule, UseResult })
	
	if UseSignalStateResult then
		return ReactModule.createElement(FoundationModule.Text, {
			Text = "Loading presets...",
			tag = "size-full text-body-medium content-muted"
		})
	end
	if not UseSignalStateResult1 or #UseSignalStateResult1 == 0 then
		return nil
	end
	local v1 = nil
	
	for _, value in UseSignalStateResult1 do
		if value.categoryGroupId == UseStateResult then
			v1 = value
			break
		end
	end
	local FontStyle = {
		LineHeight = 1.4,
		Font = Enum.Font.BuilderSansBold,
		FontSize = UseTokensResult.FontSize.FontSize_300
	}
	local Elements = {}
	local Flag = true
	
	if v1 then
		for LayoutOrder, category in v1.categories do
			local Elements1 = {}
			
			for LayoutOrder1, message in category.messages do
				Elements1["Msg_" .. message.presetId] = ReactModule.createElement(PresetMessageButtonModule, {
					presetId = message.presetId,
					text = message.value,
					layoutOrder = LayoutOrder1,
					onActivated = UseResult2,
					buttonRef = if Flag then UseRefResult else nil
				})
				Flag = false
			end
			Elements["Category_" .. category.categoryId] = ReactModule.createElement(FoundationModule.View, {
				tag = "col gap-small size-full-0 auto-y",
				LayoutOrder = LayoutOrder
			}, {
				Header = ReactModule.createElement(FoundationModule.Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-align-x-left content-default",
					Text = category.name or category.categoryId,
					fontStyle = FontStyle
				}),
				Pills = ReactModule.createElement(FoundationModule.View, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y",
					layout = {
						Wraps = true,
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, UseTokensResult.Padding.Small)
					}
				}, Elements1)
			})
		end
		Elements.Footer = ReactModule.createElement(Text, {
			TextWrapped = true,
			tag = "size-full-0 auto-y text-body-small text-align-x-left content-muted",
			LayoutOrder = #v1.categories + 1,
			Text = UseLocalizationResult.footerDescription
		})
	end
	local config = {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseTokensResult.Padding.XLarge),
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		})
	}
	local v2 = #UseSignalStateResult1 > 1
	for LayoutOrder2, value1 in UseSignalStateResult1 do
		local CategoryGroupId1 = value1.categoryGroupId
		local IsCategoryGroupIdMatch = CategoryGroupId1 == UseStateResult
		local config1 = {
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, 36),
			LayoutOrder = LayoutOrder2,
			Text = value1.name or CategoryGroupId1,
			fontStyle = UseTokensResult.Typography.LabelMedium,
			textStyle = if IsCategoryGroupIdMatch or not v2 then UseTokensResult.Color.Content.Emphasis else UseTokensResult.Color.Content.Muted,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}
		local Config = if IsCategoryGroupIdMatch and v2 then {
			Indicator = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0.5, 1),
				Position = UDim2.new(0.5, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, 2),
				BackgroundColor3 = UseTokensResult.Color.Content.Emphasis.Color3
			})
		} else nil
		
		if v2 then
			function config1.onActivated()
				-- upvalues: UseStateResult2 (copy), CategoryGroupId1 (copy)
				UseStateResult2(CategoryGroupId1)
			end
		end
		config["Tab_" .. CategoryGroupId1] = ReactModule.createElement(Text, config1, Config)
	end
	return ReactModule.createElement(PresetCooldownProviderModule, {}, ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		RootLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		TabRow = ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
			}),
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, UseTokensResult.Padding.Large),
				PaddingRight = UDim.new(0, UseTokensResult.Padding.Large),
				PaddingTop = UDim.new(0, UseTokensResult.Padding.XSmall)
			}),
			TabsGroup = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.fromScale(0, 0)
			}, config),
			KeyboardButton = if UseSignalStateResult2 and p1.shouldShowKeyboardButton then ReactModule.createElement(FoundationModule.IconButton, {
				LayoutOrder = 2,
				isCircular = true,
				isDisabled = false,
				icon = { name = "keyboard", variant = "Regular" },
				variant = FoundationModule.Enums.ButtonVariant.Utility,
				size = FoundationModule.Enums.InputSize.Small,
				onActivated = UseResult1
			}) else nil
		}),
		TabRowBaseline = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = UseTokensResult.Color.Stroke.Default.Color3,
			BackgroundTransparency = UseTokensResult.Color.Stroke.Default.Transparency
		}),
		Scroll = ReactModule.createElement(FoundationModule.ScrollView, {
			LayoutOrder = 3,
			tag = "grow size-full-0",
			scroll = {
				scrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility.Always,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(0, 0, 0, 0)
			}
		}, {
			Categories = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, UseTokensResult.Padding.Large)
				},
				padding = {
					top = UDim.new(0, UseTokensResult.Padding.Large),
					bottom = UDim.new(0, UseTokensResult.Padding.Large),
					left = UDim.new(0, UseTokensResult.Padding.Large),
					right = UDim.new(0, UseTokensResult.Padding.Large)
				}
			}, Elements)
		})
	}))
end)