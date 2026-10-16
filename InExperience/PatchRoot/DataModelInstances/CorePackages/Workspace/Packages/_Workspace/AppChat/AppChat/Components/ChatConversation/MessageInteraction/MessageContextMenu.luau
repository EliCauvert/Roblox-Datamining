local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local _ = require(AppChat.types)
local Signal = require(Parent.AppCommonLib).Signal
local DeviceType = require(Parent.RobloxAppEnums).DeviceType
local LoggerModule = require(script.Parent.Logger)
local EventNamesModule = require(AppChat.Analytics.EventNames)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local PeekView = require(Parent.PeekView).PeekView
local PeekViewState = require(Parent.PeekView).PeekViewState
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseDeviceTypeFunction = require(Parent.RobloxAppHooks).useDeviceType
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetReplyingToStoreModule = require(AppChat.Stores.GetReplyingToStore)
local UseReplyingToMessageDispatchModule = require(AppChat.Components.ChatConversation.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch)
local FFlagAppChatSignalsReplyStoreModule = require(AppChat.Flags.FFlagAppChatSignalsReplyStore)
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local UseAnalyticsModule = require(AppChat.Analytics.useAnalytics)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local GetFFlagAppChatEnableManualTranslationModule = require(AppChat.Flags.getFFlagAppChatEnableManualTranslation)
local config = {
	message = nil,
	userOwnsMessage = false,
	unitTestDeviceType = nil,
	unitTestScreenSize = nil,
	inputBoxRef = ReactModule.createRef()
}

if config.unitTestDeviceType ~= nil then
	LoggerModule:error("Default unit test device type must ALWAYS BE NIL!")
	error("Default unit test device type was not nil.")
end
if config.unitTestScreenSize ~= nil then
	LoggerModule:error("Default unit test screen size must ALWAYS BE NIL!")
	error("Default unit test screen size was not nil.")
end
function MessageContextMenu(p1) --[[ Line: 86 ]]
	-- upvalues: CryoModule (copy), config (copy), FFlagAppChatSignalsReplyStoreModule (copy), GetReplyingToStoreModule (copy), UseReplyingToMessageDispatchModule (copy), UseStyleFunction (copy), ReactModule (copy), Signal (copy), UseLayerCollectorFunction (copy), UseNavigationFunction (copy), UseDeviceTypeFunction (copy), UseAnalyticsModule (copy), UseLocalizationFunction (copy), PeekViewState (copy), EventNamesModule (copy), DeviceType (copy), Default (copy), GetFFlagAppChatEnableManualTranslationModule (copy), UseDispatchFunction (copy), AppChatNetworkingModule (copy), LoggerModule (copy), Images (copy), ContextualMenu (copy), MenuDirection (copy), PeekView (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local ReplyingToStoreModule = if FFlagAppChatSignalsReplyStoreModule then GetReplyingToStoreModule(false) else nil
	local UseReplyingToMessageDispatchModuleResult = UseReplyingToMessageDispatchModule()
	local Tokens = UseStyleFunction().Tokens
	local UseRefResult = ReactModule.useRef(Signal.new())
	local UnitTestScreenSize = UnionResult.unitTestScreenSize or UseLayerCollectorFunction().absoluteSize
	local UseNavigationResult = UseNavigationFunction()
	local UnitTestDeviceType = UnionResult.unitTestDeviceType or UseDeviceTypeFunction()
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseLocalizationResult = UseLocalizationFunction({
		replyText = "Feature.Chat.Action.Reply",
		copyText = "Feature.Chat.Action.Copy",
		editText = "Feature.Chat.Action.Edit",
		deleteText = "Feature.Chat.Action.Delete",
		reportText = "Feature.Chat.Action.Report",
		translateText = "Feature.Chat.Action.Translate"
	})
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 112 ]]
		-- upvalues: UseAnalyticsModuleResult (copy), UnionResult (copy)
		if UseAnalyticsModuleResult then
			UseAnalyticsModuleResult.fireAnalyticsEvent(p2, {
				conversationId = if UnionResult.message then UnionResult.message.conversationId else nil,
				targetMessageSenderId = if UnionResult.message then UnionResult.message.senderTargetId else nil,
				targetMessageId = if UnionResult.message then UnionResult.message.id else nil,
				targetMessageSentAt = if UnionResult.message and UnionResult.message.sent then tostring(UnionResult.message.sent.dateTime) else nil,
				targetMessageLength = if UnionResult.message and UnionResult.message.content then #UnionResult.message.content else nil
			})
		end
	end, { UnionResult.message })
	local UseRefResult1 = ReactModule.useRef(false)
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 132 ]]
		-- upvalues: UnionResult (copy)
		if UnionResult.inputBoxRef and UnionResult.inputBoxRef.current then
			UnionResult.inputBoxRef.current:CaptureFocus()
		end
	end, { UnionResult.inputBoxRef })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 139 ]]
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end, { UseNavigationResult and UseNavigationResult.goBack })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 144 ]]
		-- upvalues: UseRefResult (copy)
		UseRefResult.current:fire()
	end, { UseRefResult.current })
	local UseResult4 = ReactModule.useCallback(function(Closed, _) --[[ Line: 150 ]]
		-- upvalues: PeekViewState (upval), UseResult2 (copy)
		if Closed == PeekViewState.Closed then
			UseResult2()
		end
	end, { UseResult2 })
	ReactModule.useEffect(function() --[[ Line: 156 ]]
		-- upvalues: UseResult (copy), EventNamesModule (upval), UnionResult (copy), UseRefResult1 (copy)
		UseResult(EventNamesModule.ChatMessageMenuOpened)
		
		if UnionResult.inputBoxRef and UnionResult.inputBoxRef.current then
			UseRefResult1.current = UnionResult.inputBoxRef.current:IsFocused()
		end
	end, {})
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 165 ]]
		-- upvalues: UnitTestDeviceType (copy), DeviceType (upval), UseResult3 (copy), UseResult2 (copy)
		if UnitTestDeviceType == DeviceType.Phone then
			UseResult3()
			
			return
		else
			UseResult2()
		end
	end, { UnitTestDeviceType, UseResult3, UseResult2 })
	local UseResult6 = ReactModule.useCallback(function() --[[ Line: 173 ]]
		-- upvalues: UseResult5 (copy), UseRefResult1 (copy), UseResult1 (copy)
		UseResult5()
		
		if UseRefResult1.current then
			UseResult1()
		end
	end, { UseResult5, UseRefResult1.current, UseResult1 })
	local UseResult7 = ReactModule.useCallback(function() --[[ Line: 181 ]]
		-- upvalues: UseResult (copy), EventNamesModule (upval), UseResult5 (copy), FFlagAppChatSignalsReplyStoreModule (upval), ReplyingToStoreModule (copy), UnionResult (copy), UseReplyingToMessageDispatchModuleResult (copy), UseResult1 (copy)
		UseResult(EventNamesModule.ChatMessageMenuReplyBtnActivated)
		UseResult5()
		
		if FFlagAppChatSignalsReplyStoreModule and ReplyingToStoreModule then
			ReplyingToStoreModule.setReplyingTo(UnionResult.message.id)
		else
			UseReplyingToMessageDispatchModuleResult(UnionResult.message)
		end
		UseResult1()
	end, {
		UseResult, UseResult5,
		if FFlagAppChatSignalsReplyStoreModule then ReplyingToStoreModule else nil,
		UseReplyingToMessageDispatchModuleResult, UnionResult.message, UseResult1
	})
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 205 ]]
		-- upvalues: UseResult (copy), EventNamesModule (upval), UseResult5 (copy), Default (upval), UnionResult (copy)
		UseResult(EventNamesModule.ChatMessageMenuCopyBtnActivated)
		UseResult5()
		Default:shareText({
			context = "AppChat-ChatConversation-MessageContextMenu",
			text = UnionResult.message.content
		})
	end, { UseResult, UseResult5, UnionResult.message })
	local UseResult9 = ReactModule.useCallback(function() --[[ Line: 220 ]] end)
	local UseResult10 = ReactModule.useCallback(function() --[[ Line: 224 ]] end)
	local UseResult11 = nil
	
	if GetFFlagAppChatEnableManualTranslationModule() then
		local UseDispatchResult = UseDispatchFunction()
		UseResult11 = ReactModule.useCallback(function() --[[ Line: 232 ]]
			-- upvalues: UseResult5 (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), UnionResult (copy), LoggerModule (upval)
			UseResult5()
			UseDispatchResult(AppChatNetworkingModule.rodux.TranslateUserMessage.API(UnionResult.message.conversationId, UnionResult.message.id)):catch(function(Err) --[[ Line: 236 ]]
				-- upvalues: LoggerModule (upval)
				LoggerModule:error("Error translating message: ", Err)
			end)
		end, { UnionResult.message, UseResult5, UseDispatchResult })
	end
	local UseResult12 = ReactModule.useCallback(function() --[[ Line: 248 ]] end)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 253 ]]
		-- upvalues: Images (upval), UseLocalizationResult (copy), UseResult7 (copy), UseResult8 (copy), UnionResult (copy), UseResult9 (copy), Tokens (copy), UseResult10 (copy), GetFFlagAppChatEnableManualTranslationModule (upval), UseResult11 (ref), UseResult12 (copy)
		local List = {
			{
				icon = Images["icons/placeholder/placeholderOff"],
				text = UseLocalizationResult.replyText,
				onActivated = UseResult7
			},
			{
				icon = Images["icons/actions/edit/copy"],
				text = UseLocalizationResult.copyText,
				onActivated = UseResult8
			}
		}
		
		if UnionResult.userOwnsMessage then
			table.insert(List, {
				icon = Images["icons/actions/edit/edit"],
				text = UseLocalizationResult.editText,
				onActivated = UseResult9
			})
			table.insert(List, {
				icon = Images["icons/actions/edit/delete"],
				iconColorOverride = Tokens.Color.System.Alert.Color3,
				text = UseLocalizationResult.deleteText,
				textColorOverride = Tokens.Color.System.Alert.Color3,
				onActivated = UseResult10
			})
			
			return List
		end
		if GetFFlagAppChatEnableManualTranslationModule() then
			table.insert(List, {
				text = "Translate",
				icon = Images["icons/placeholder/placeholderOff"],
				onActivated = UseResult11
			})
		end
		table.insert(List, {
			icon = Images["icons/placeholder/placeholderOff"],
			iconColorOverride = Tokens.Color.System.Alert.Color3,
			text = UseLocalizationResult.reportText,
			textColorOverride = Tokens.Color.System.Alert.Color3,
			onActivated = UseResult12
		})
		
		return List
	end, {
		UseLocalizationResult.replyText, UseLocalizationResult.copyText,
		UseLocalizationResult.editText, UseLocalizationResult.deleteText,
		UseLocalizationResult.reportText, UseLocalizationResult.translateText,
		UseResult7, UseResult8, UseResult9, UseResult10,
		if GetFFlagAppChatEnableManualTranslationModule() then UseResult11 else nil,
		UseResult12, UnionResult.userOwnsMessage
	})
	local Offset = #UseMemoResult * 56
	local ScreenSize = nil
	local BorderCornerRadius = nil
	local _Vector2 = nil
	local _UDim = nil
	local _UDim1 = nil
	
	if UnitTestDeviceType == DeviceType.Desktop or UnitTestDeviceType == DeviceType.Tablet then
		BorderCornerRadius = 20
		ScreenSize = UnitTestScreenSize
		_Vector2 = Vector2.new(0.5, 0.5)
		_UDim = UDim.new(0.5, 0)
		_UDim1 = UDim.new(0.5, 0)
	else
		BorderCornerRadius = 0
		ScreenSize = Vector2.new(0, 0)
		_Vector2 = Vector2.new(0.5, 1)
		_UDim = UDim.new(0, Offset)
		_UDim1 = UDim.new(1, 0)
	end
	local Element = ReactModule.createElement(ContextualMenu, {
		isElementBackgroundVisible = true,
		isElementDividerVisible = true,
		open = true,
		screenSize = ScreenSize,
		menuDirection = MenuDirection.Up,
		openPositionY = _UDim,
		anchorPointOverride = _Vector2,
		horizontalAlignment = Enum.HorizontalAlignment.Center,
		contextMenuWidthOverride = _UDim1,
		borderCornerRadius = BorderCornerRadius,
		buttonProps = UseMemoResult,
		onDismiss = UseResult6
	})
	local ImageButton = ReactModule.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		[ReactModule.Event.Activated] = UseResult6
	}, {
		PeekView = ReactModule.createElement(PeekView, {
			mountAsFullView = false,
			mountAnimation = true,
			showDraggerInClosedState = false,
			briefViewContentHeight = UDim.new(0, Offset),
			fullViewContentHeight = UDim.new(1, -Offset),
			closeSignal = UseRefResult.current,
			viewStateChanged = UseResult4
		}, { Element })
	})
	
	return if UnitTestDeviceType == DeviceType.Desktop or UnitTestDeviceType == DeviceType.Tablet then Element else ImageButton
end

return ReactModule.memo(MessageContextMenu)