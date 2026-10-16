local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local FoundationModule = require(Parent.Foundation)
local InputTypeModule = require(Parent.InputType)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(Parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local Text = FoundationModule.Text
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local LocalizationModule = require(ExpChat.Localization)
local PresetBorderlessGridButtonModule = require(script.Parent.PresetBorderlessGridButton)
local PresetCooldownProviderModule = require(script.Parent.PresetCooldownProvider)
local PresetMessageButtonModule = require(script.Parent.PresetMessageButton)
local PresetTrayKeyboardSelectedModule = require(ExpChat.Actions.PresetTrayKeyboardSelected)
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local SetIsPresetTrayOpenModule = require(script.Parent.Thunks.setIsPresetTrayOpen)
local UseOnEmojiActivatedModule = require(script.Parent.useOnEmojiActivated)
local UseOnPresetActivatedModule = require(script.Parent.useOnPresetActivated)
local FFlagExpChatPresetChatGamepadEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local FFlagExpChatPresetChatTabMemoryModule = require(ExpChat.Flags.FFlagExpChatPresetChatTabMemory)
local FFlagExpChatPresetTrayDismissAnalyticsModule = require(ExpChat.Flags.FFlagExpChatPresetTrayDismissAnalytics)

return ReactModule.memo(function(p1) --[[ Line: 46 | Named "PresetChatContainer" ]]
	-- upvalues: FoundationModule (copy), GetPresetChatStoreModule (copy), UseDispatchFunction (copy), SignalsReactModule (copy), GetMessagesStoreModule (copy), LocalizationModule (copy), ReactModule (copy), SetIsPresetTrayOpenModule (copy), PresetTrayKeyboardSelectedModule (copy), ExpChatSharedModule (copy), ConstantsModule (copy), FFlagExpChatPresetChatTabMemoryModule (copy), FFlagExpChatPresetChatGamepadEnabledModule (copy), FFlagExpChatPresetTrayDismissAnalyticsModule (copy), InputTypeModule (copy), UserInputService (copy), GuiService (copy), GetTransparencyStoreModule (copy), UseOnPresetActivatedModule (copy), UseOnEmojiActivatedModule (copy), EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy), PresetBorderlessGridButtonModule (copy), PresetMessageButtonModule (copy), Text (copy), PresetCooldownProviderModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local PresetChatStoreModule = GetPresetChatStoreModule(false)
	local UseDispatchResult = UseDispatchFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(PresetChatStoreModule.getIsLoading)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(PresetChatStoreModule.getCategoryGroups)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(GetMessagesStoreModule(false).getCanLocalUserChat)
	local UseLocalizationResult = LocalizationModule.useLocalization({ footerDescription = "Feature.Chat.PresetChat.Disclaimer" })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 59 ]]
		-- upvalues: SetIsPresetTrayOpenModule (upval), PresetChatStoreModule (copy)
		SetIsPresetTrayOpenModule(PresetChatStoreModule, false)
	end, { PresetChatStoreModule })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 63 ]]
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
	local CategoryGroupId1 = nil
	
	if FFlagExpChatPresetChatTabMemoryModule then
		local UseSignalStateResult3 = SignalsReactModule.useSignalState(PresetChatStoreModule.getSelectedGroupIndex)
		local UseSignalStateResultEntry = UseSignalStateResult1 and UseSignalStateResult1[UseSignalStateResult3]
		CategoryGroupId1 = if UseSignalStateResultEntry then UseSignalStateResultEntry.categoryGroupId else CategoryGroupId
	else
		CategoryGroupId1 = UseStateResult
	end
	ReactModule.useEffect(function() --[[ Line: 87 ]]
		-- upvalues: FFlagExpChatPresetChatTabMemoryModule (upval), CategoryGroupId1 (ref), CategoryGroupId (copy), UseStateResult2 (copy)
		if not FFlagExpChatPresetChatTabMemoryModule and CategoryGroupId1 == "" and CategoryGroupId ~= "" then
			UseStateResult2(CategoryGroupId)
		end
	end, { CategoryGroupId, CategoryGroupId1 })
	local UseSignalStateResult4 = if FFlagExpChatPresetChatGamepadEnabledModule or FFlagExpChatPresetTrayDismissAnalyticsModule then SignalsReactModule.useSignalState(PresetChatStoreModule.getIsTrayOpen) else nil
	ReactModule.useEffect(function() --[[ Line: 97 ]]
		-- upvalues: FFlagExpChatPresetTrayDismissAnalyticsModule (upval), UseSignalStateResult4 (copy), UseSignalStateResult (copy), CategoryGroupId1 (ref), PresetChatStoreModule (copy)
		if FFlagExpChatPresetTrayDismissAnalyticsModule and UseSignalStateResult4 and not UseSignalStateResult and CategoryGroupId1 ~= "" then
			PresetChatStoreModule.markGroupViewed(CategoryGroupId1)
		end
	end, {
		UseSignalStateResult4,
		UseSignalStateResult,
		CategoryGroupId1,
		PresetChatStoreModule
	})
	local UseRefResult1 = ReactModule.useRef(nil)
	
	local function _(p2) --[[ Line: 105 | Named "isValidSelection" ]]
		if p2 == nil then
			return false
		else
			local Success, Result = pcall(function(): boolean --[[ Line: 109 ]]
				-- upvalues: p2 (copy)
				return p2:IsDescendantOf(game) and p2:FindFirstAncestorOfClass("ScreenGui") ~= nil
			end)
			
			return Success and Result
		end
	end
	
	ReactModule.useEffect(function() --[[ Line: 116 ]]
		-- upvalues: FFlagExpChatPresetChatGamepadEnabledModule (upval), UseSignalStateResult4 (copy), UseRefResult (copy), InputTypeModule (upval), UserInputService (upval), UseRefResult1 (copy), GuiService (upval)
		if FFlagExpChatPresetChatGamepadEnabledModule and not UseSignalStateResult4 then return end
		local Current = UseRefResult.current
		
		if Current == nil then return end
		if InputTypeModule.getInputGroup(UserInputService:GetLastInputType()) ~= InputTypeModule.InputTypeConstants.Gamepad then return end
		if UseRefResult1.current == nil then
			UseRefResult1.current = if FFlagExpChatPresetChatGamepadEnabledModule then GuiService.SelectedCoreObject else GuiService.SelectedObject
		end
		task.defer(function() --[[ Line: 133 ]]
			-- upvalues: Current (copy), FFlagExpChatPresetChatGamepadEnabledModule (upval), GuiService (upval)
			local v1 = nil
			if Current == nil then
				v1 = false
			else
				local Success, Result = pcall(function(): boolean --[[ Line: 109 ]]
					-- upvalues: Current (copy)
					return Current:IsDescendantOf(game) and Current:FindFirstAncestorOfClass("ScreenGui") ~= nil
				end)
				v1 = Success and Result
			end
			if v1 then
				pcall(function() --[[ Line: 135 ]]
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
	end, if FFlagExpChatPresetChatGamepadEnabledModule then { CategoryGroupId1, UseSignalStateResult4 } else { CategoryGroupId1 })
	ReactModule.useEffect(function() --[[ Line: 150 ]]
		-- upvalues: GetTransparencyStoreModule (upval), UseRefResult1 (copy), FFlagExpChatPresetChatGamepadEnabledModule (upval), GuiService (upval)
		local TransparencyStoreModule = GetTransparencyStoreModule(false)
		TransparencyStoreModule.setContextMenuOpen()
		
		return function() --[[ Line: 153 ]]
			-- upvalues: TransparencyStoreModule (copy), UseRefResult1 (upval), FFlagExpChatPresetChatGamepadEnabledModule (upval), GuiService (upval)
			TransparencyStoreModule.clearContextMenuOpen()
			local Current = UseRefResult1.current
			pcall(function() --[[ Line: 156 ]]
				-- upvalues: Current (copy), FFlagExpChatPresetChatGamepadEnabledModule (upval), GuiService (upval)
				local v1 = nil
				if Current == nil then
					v1 = false
				else
					local Success, Result = pcall(function(): boolean --[[ Line: 109 ]]
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
	local UseOnPresetActivatedModuleResult = UseOnPresetActivatedModule({
		textChannel = p1.textChannel,
		closePresetTray = UseResult
	})
	local UseOnEmojiActivatedModuleResult = UseOnEmojiActivatedModule({
		textChannel = p1.textChannel,
		onSendChat = p1.onSendChat,
		onSendGlobalChat = p1.onSendGlobalChat,
		closePresetTray = UseResult
	})
	
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
		if value.categoryGroupId == CategoryGroupId1 then
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
			local Contents = if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then category.contents else category.messages
			for LayoutOrder1, content in Contents do
				if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint and content.kind == "Emoji" then
					Elements1["Emoji_" .. content.emoteId] = ReactModule.createElement(PresetBorderlessGridButtonModule, {
						unicode = content.unicode,
						layoutOrder = LayoutOrder1,
						onActivated = UseOnEmojiActivatedModuleResult,
						buttonRef = if Flag then UseRefResult else nil
					})
				else
					Elements1["Msg_" .. content.presetId] = ReactModule.createElement(PresetMessageButtonModule, {
						presetId = content.presetId,
						text = if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then content.text else content.value,
						layoutOrder = LayoutOrder1,
						onActivated = UseOnPresetActivatedModuleResult,
						buttonRef = if Flag then UseRefResult else nil
					})
				end
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
		local CategoryGroupId2 = value1.categoryGroupId
		local IsCategoryGroupIdMatch = CategoryGroupId2 == CategoryGroupId1
		local config1 = {
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, 36),
			LayoutOrder = LayoutOrder2,
			Text = value1.name or CategoryGroupId2,
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
			function config1.onActivated() --[[ Line: 306 ]]
				-- upvalues: FFlagExpChatPresetChatTabMemoryModule (upval), PresetChatStoreModule (copy), LayoutOrder2 (copy), UseStateResult2 (copy), CategoryGroupId2 (copy)
				if FFlagExpChatPresetChatTabMemoryModule then
					PresetChatStoreModule.setSelectedGroupIndex(LayoutOrder2)
					
					return
				else
					UseStateResult2(CategoryGroupId2)
				end
			end
		end
		config["Tab_" .. CategoryGroupId2] = ReactModule.createElement(Text, config1, Config)
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