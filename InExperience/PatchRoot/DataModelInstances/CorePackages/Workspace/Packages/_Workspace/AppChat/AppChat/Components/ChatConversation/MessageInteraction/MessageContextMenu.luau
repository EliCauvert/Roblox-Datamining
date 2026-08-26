local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local _ = require(appChat.types)
local signal = require(parent.AppCommonLib).Signal
local deviceType = require(parent.RobloxAppEnums).DeviceType
local loggerModule = require(script.Parent.Logger)
local eventNamesModule = require(appChat.Analytics.EventNames)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local peekView = require(parent.PeekView).PeekView
local peekViewState = require(parent.PeekView).PeekViewState
local contextualMenu = UIBloxModule.App.Menu.ContextualMenu
local menuDirection = UIBloxModule.App.Menu.MenuDirection
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local useStyle = UIBloxModule.Core.Style.useStyle
local useDeviceType = require(parent.RobloxAppHooks).useDeviceType
local useNavigation = require(parent.Navigation).useNavigation
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getReplyingToStoreModule = require(appChat.Stores.GetReplyingToStore)
local useReplyingToMessageDispatchModule = require(appChat.Components.ChatConversation.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch)
local fFlagAppChatSignalsReplyStoreModule = require(appChat.Flags.FFlagAppChatSignalsReplyStore)
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local useAnalyticsModule = require(appChat.Analytics.useAnalytics)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local getFFlagAppChatEnableManualTranslationModule = require(appChat.Flags.getFFlagAppChatEnableManualTranslation)
local t = {
	message = nil,
	userOwnsMessage = false,
	unitTestDeviceType = nil,
	unitTestScreenSize = nil,
	inputBoxRef = reactModule.createRef()
}

if t.unitTestDeviceType ~= nil then
	loggerModule:error("Default unit test device type must ALWAYS BE NIL!")
	error("Default unit test device type was not nil.")
end
if t.unitTestScreenSize ~= nil then
	loggerModule:error("Default unit test screen size must ALWAYS BE NIL!")
	error("Default unit test screen size was not nil.")
end
function MessageContextMenu(p1)
	-- upvalues: cryoModule (ref), t (ref), fFlagAppChatSignalsReplyStoreModule (ref), getReplyingToStoreModule (ref), useReplyingToMessageDispatchModule (ref), useStyle (ref), reactModule (ref), signal (ref), useLayerCollector (ref), useNavigation (ref), useDeviceType (ref), useAnalyticsModule (ref), useLocalization (ref), peekViewState (ref), eventNamesModule (ref), deviceType (ref), default (ref), getFFlagAppChatEnableManualTranslationModule (ref), useDispatch (ref), appChatNetworkingModule (ref), loggerModule (ref), images (ref), contextualMenu (ref), menuDirection (ref), peekView (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = if fFlagAppChatSignalsReplyStoreModule then getReplyingToStoreModule(false) else nil
	local var3 = useReplyingToMessageDispatchModule()
	local tokens = useStyle().Tokens
	local var4 = reactModule.useRef(signal.new())
	local unitTestScreenSize = var1.unitTestScreenSize or useLayerCollector().absoluteSize
	local var5 = useNavigation()
	local unitTestDeviceType = var1.unitTestDeviceType or useDeviceType()
	local var6 = useAnalyticsModule()
	local var7 = useLocalization({
		replyText = "Feature.Chat.Action.Reply",
		copyText = "Feature.Chat.Action.Copy",
		editText = "Feature.Chat.Action.Edit",
		deleteText = "Feature.Chat.Action.Delete",
		reportText = "Feature.Chat.Action.Report",
		translateText = "Feature.Chat.Action.Translate"
	})
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), var1 (ref)
		if var6 then
			var6.fireAnalyticsEvent(p2, {
				conversationId = if var1.message then var1.message.conversationId else nil,
				targetMessageSenderId = if var1.message then var1.message.senderTargetId else nil,
				targetMessageId = if var1.message then var1.message.id else nil,
				targetMessageSentAt = if var1.message and var1.message.sent then tostring(var1.message.sent.dateTime) else nil,
				targetMessageLength = if var1.message and var1.message.content then #var1.message.content else nil
			})
		end
	end, { var1.message })
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		if var1.inputBoxRef and var1.inputBoxRef.current then
			var1.inputBoxRef.current:CaptureFocus()
		end
	end, { var1.inputBoxRef })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5.goBack()
	end, { var5 and var5.goBack })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4.current:fire()
	end, { var4.current })
	local var13 = reactModule.useCallback(function(p2, _)
		-- upvalues: peekViewState (copy), var11 (ref)
		if p2 == peekViewState.Closed then
			var11()
		end
	end, { var11 })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), eventNamesModule (copy), var1 (ref), var9 (ref)
		var8(eventNamesModule.ChatMessageMenuOpened)
		
		if var1.inputBoxRef and var1.inputBoxRef.current then
			var9.current = var1.inputBoxRef.current:IsFocused()
		end
	end, {})
	local var14 = reactModule.useCallback(function()
		-- upvalues: unitTestDeviceType (ref), deviceType (copy), var12 (ref), var11 (ref)
		if unitTestDeviceType == deviceType.Phone then
			var12()
			
			return
		end
		var11()
	end, { unitTestDeviceType, var12, var11 })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), var9 (ref), var10 (ref)
		var14()
		
		if var9.current then
			var10()
		end
	end, { var14, var9.current, var10 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), eventNamesModule (copy), var14 (ref), fFlagAppChatSignalsReplyStoreModule (copy), var2 (ref), var1 (ref), var3 (ref), var10 (ref)
		var8(eventNamesModule.ChatMessageMenuReplyBtnActivated)
		var14()
		
		if fFlagAppChatSignalsReplyStoreModule and var2 then
			var2.setReplyingTo(var1.message.id)
		else
			var3(var1.message)
		end
		var10()
	end, {
		var8, var14, if fFlagAppChatSignalsReplyStoreModule then var2 else nil,
		var3, var1.message, var10
	})
	local var17 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), eventNamesModule (copy), var14 (ref), default (copy), var1 (ref)
		var8(eventNamesModule.ChatMessageMenuCopyBtnActivated)
		var14()
		default:shareText({
			context = "AppChat-ChatConversation-MessageContextMenu",
			text = var1.message.content
		})
	end, { var8, var14, var1.message })
	local var18 = reactModule.useCallback(function() end)
	local var19 = reactModule.useCallback(function() end)
	local var20 = nil
	
	if getFFlagAppChatEnableManualTranslationModule() then
		local var21 = useDispatch()
		var20 = reactModule.useCallback(function()
			-- upvalues: var14 (ref), var21 (ref), appChatNetworkingModule (copy), var1 (ref), loggerModule (copy)
			var14()
			var21(appChatNetworkingModule.rodux.TranslateUserMessage.API(var1.message.conversationId, var1.message.id)):catch(function(p2)
				-- upvalues: loggerModule (copy)
				loggerModule:error("Error translating message: ", p2)
			end)
		end, { var1.message, var14, var21 })
	end
	local var22, vector2, vector2_1, uDim, uDim_1
	local var23 = reactModule.useCallback(function() end)
	local var24 = reactModule.useMemo(function()
		-- upvalues: images (copy), var7 (ref), var16 (ref), var17 (ref), var1 (ref), var18 (ref), tokens (ref), var19 (ref), getFFlagAppChatEnableManualTranslationModule (copy), var20 (write), var23 (ref)
		local list = {
			{
				icon = images["icons/placeholder/placeholderOff"],
				text = var7.replyText,
				onActivated = var16
			},
			{
				icon = images["icons/actions/edit/copy"],
				text = var7.copyText,
				onActivated = var17
			}
		}
		
		if var1.userOwnsMessage then
			table.insert(list, {
				icon = images["icons/actions/edit/edit"],
				text = var7.editText,
				onActivated = var18
			})
			table.insert(list, {
				icon = images["icons/actions/edit/delete"],
				iconColorOverride = tokens.Color.System.Alert.Color3,
				text = var7.deleteText,
				textColorOverride = tokens.Color.System.Alert.Color3,
				onActivated = var19
			})
			
			return list
		elseif getFFlagAppChatEnableManualTranslationModule() then
			table.insert(list, {
				text = "Translate",
				icon = images["icons/placeholder/placeholderOff"],
				onActivated = var20
			})
		end
		table.insert(list, {
			icon = images["icons/placeholder/placeholderOff"],
			iconColorOverride = tokens.Color.System.Alert.Color3,
			text = var7.reportText,
			textColorOverride = tokens.Color.System.Alert.Color3,
			onActivated = var23
		})
		
		return list
	end, {
		var7.replyText, var7.copyText, var7.editText, var7.deleteText,
		var7.reportText, var7.translateText, var16, var17, var18, var19,
		if getFFlagAppChatEnableManualTranslationModule() then var20 else nil, var23,
		var1.userOwnsMessage
	})
	local var25 = #var24 * 56
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if unitTestDeviceType == deviceType.Desktop or unitTestDeviceType == deviceType.Tablet then
		var22 = 20
		vector2 = unitTestScreenSize
		vector2_1 = Vector2.new(0.5, 0.5)
		uDim = UDim.new(0.5, 0)
		uDim_1 = UDim.new(0.5, 0)
	else
		var22 = 0
		vector2 = Vector2.new(0, 0)
		vector2_1 = Vector2.new(0.5, 1)
		uDim = UDim.new(0, var25)
		uDim_1 = UDim.new(1, 0)
	end
	local var26 = reactModule.createElement(contextualMenu, {
		isElementBackgroundVisible = true,
		isElementDividerVisible = true,
		open = true,
		screenSize = vector2,
		menuDirection = menuDirection.Up,
		openPositionY = uDim,
		anchorPointOverride = vector2_1,
		horizontalAlignment = Enum.HorizontalAlignment.Center,
		contextMenuWidthOverride = uDim_1,
		borderCornerRadius = var22,
		buttonProps = var24,
		onDismiss = var15
	})
	
	return if unitTestDeviceType == deviceType.Desktop or unitTestDeviceType == deviceType.Tablet then var26 else reactModule.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		[reactModule.Event.Activated] = var15
	}, {
		PeekView = reactModule.createElement(peekView, {
			mountAsFullView = false,
			mountAnimation = true,
			showDraggerInClosedState = false,
			briefViewContentHeight = UDim.new(0, var25),
			fullViewContentHeight = UDim.new(1, -var25),
			closeSignal = var4.current,
			viewStateChanged = var13
		}, { var26 })
	})
end

return reactModule.memo(MessageContextMenu)