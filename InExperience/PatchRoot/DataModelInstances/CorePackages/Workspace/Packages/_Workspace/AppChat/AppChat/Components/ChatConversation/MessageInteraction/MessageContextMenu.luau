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
function MessageContextMenu(p0) --[[ line: 86 ]]
	-- upvalues: cryoModule (ref), t (ref), fFlagAppChatSignalsReplyStoreModule (ref), getReplyingToStoreModule (ref), useReplyingToMessageDispatchModule (ref), useStyle (ref), reactModule (ref), signal (ref), useLayerCollector (ref), useNavigation (ref), useDeviceType (ref), useAnalyticsModule (ref), useLocalization (ref), peekViewState (ref), eventNamesModule (ref), deviceType (ref), default (ref), getFFlagAppChatEnableManualTranslationModule (ref), useDispatch (ref), appChatNetworkingModule (ref), loggerModule (ref), images (ref), contextualMenu (ref), menuDirection (ref), peekView (ref)
	local var13 = cryoModule.Dictionary.union(t, p0)
	local var14 = if fFlagAppChatSignalsReplyStoreModule then getReplyingToStoreModule(false) else nil
	local var15 = useReplyingToMessageDispatchModule()
	local tokens = useStyle().Tokens
	local var16 = reactModule.useRef(signal.new())
	local unitTestScreenSize = var13.unitTestScreenSize or useLayerCollector().absoluteSize
	local var18 = useNavigation()
	local unitTestDeviceType = var13.unitTestDeviceType or useDeviceType()
	local var20 = useAnalyticsModule()
	local var21 = useLocalization({
		replyText = "Feature.Chat.Action.Reply",
		copyText = "Feature.Chat.Action.Copy",
		editText = "Feature.Chat.Action.Edit",
		deleteText = "Feature.Chat.Action.Delete",
		reportText = "Feature.Chat.Action.Report",
		translateText = "Feature.Chat.Action.Translate"
	})
	local var22 = reactModule.useCallback(function(p1) --[[ line: 112 ]]
		-- upvalues: var20 (ref), var13 (ref)
		if var20 then
			var20.fireAnalyticsEvent(p1, {
				conversationId = if var13.message then var13.message.conversationId else nil,
				targetMessageSenderId = if var13.message then var13.message.senderTargetId else nil,
				targetMessageId = if var13.message then var13.message.id else nil,
				targetMessageSentAt = if var13.message and var13.message.sent then tostring(var13.message.sent.dateTime) else nil,
				targetMessageLength = if var13.message and var13.message.content then #var13.message.content else nil
			})
		end
	end, { var13.message })
	local var23 = reactModule.useRef(false)
	local var24 = reactModule.useCallback(function() --[[ line: 132 ]]
		-- upvalues: var13 (ref)
		if var13.inputBoxRef and var13.inputBoxRef.current then
			var13.inputBoxRef.current:CaptureFocus()
		end
	end, { var13.inputBoxRef })
	local var25 = reactModule.useCallback(function() --[[ line: 139 ]]
		-- upvalues: var18 (ref)
		var18.goBack()
	end, { var18 and var18.goBack })
	local var26 = reactModule.useCallback(function() --[[ line: 144 ]]
		-- upvalues: var16 (ref)
		var16.current:fire()
	end, { var16.current })
	local var27 = reactModule.useCallback(function(p2, _) --[[ line: 150 ]]
		-- upvalues: peekViewState (copy), var25 (ref)
		if p2 == peekViewState.Closed then
			var25()
		end
	end, { var25 })
	reactModule.useEffect(function() --[[ line: 156 ]]
		-- upvalues: var22 (ref), eventNamesModule (copy), var13 (ref), var23 (ref)
		var22(eventNamesModule.ChatMessageMenuOpened)
		
		if var13.inputBoxRef and var13.inputBoxRef.current then
			var23.current = var13.inputBoxRef.current:IsFocused()
		end
	end, {})
	local var28 = reactModule.useCallback(function() --[[ line: 165 ]]
		-- upvalues: unitTestDeviceType (ref), deviceType (copy), var26 (ref), var25 (ref)
		if unitTestDeviceType == deviceType.Phone then
			var26()
			
			return
		end
		var25()
	end, { unitTestDeviceType, var26, var25 })
	local var29 = reactModule.useCallback(function() --[[ line: 173 ]]
		-- upvalues: var28 (ref), var23 (ref), var24 (ref)
		var28()
		
		if var23.current then
			var24()
		end
	end, { var28, var23.current, var24 })
	local var30 = reactModule.useCallback(function() --[[ line: 181 ]]
		-- upvalues: var22 (ref), eventNamesModule (copy), var28 (ref), fFlagAppChatSignalsReplyStoreModule (copy), var14 (ref), var13 (ref), var15 (ref), var24 (ref)
		var22(eventNamesModule.ChatMessageMenuReplyBtnActivated)
		var28()
		
		if fFlagAppChatSignalsReplyStoreModule and var14 then
			var14.setReplyingTo(var13.message.id)
		else
			var15(var13.message)
		end
		var24()
	end, {
		var22, var28, if fFlagAppChatSignalsReplyStoreModule then var14 else nil,
		var15, var13.message, var24
	})
	local var31 = reactModule.useCallback(function() --[[ line: 205 ]]
		-- upvalues: var22 (ref), eventNamesModule (copy), var28 (ref), default (copy), var13 (ref)
		var22(eventNamesModule.ChatMessageMenuCopyBtnActivated)
		var28()
		default:shareText({
			context = "AppChat-ChatConversation-MessageContextMenu",
			text = var13.message.content
		})
	end, { var22, var28, var13.message })
	local var32 = reactModule.useCallback(function() --[[ line: 220 ]] end)
	local var33 = reactModule.useCallback(function() --[[ line: 224 ]] end)
	local var34 = nil
	
	if getFFlagAppChatEnableManualTranslationModule() then
		local var35 = useDispatch()
		var34 = reactModule.useCallback(function() --[[ line: 232 ]]
			-- upvalues: var28 (ref), var35 (ref), appChatNetworkingModule (copy), var13 (ref), loggerModule (copy)
			var28()
			var35(appChatNetworkingModule.rodux.TranslateUserMessage.API(var13.message.conversationId, var13.message.id)):catch(function(p3) --[[ line: 236 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:error("Error translating message: ", p3)
			end)
		end, { var13.message, var28, var35 })
	end
	local var39, vector2, vector2_1, uDim, uDim_1
	local var36 = reactModule.useCallback(function() --[[ line: 248 ]] end)
	local var37 = reactModule.useMemo(function() --[[ line: 253 ]]
		-- upvalues: images (copy), var21 (ref), var30 (ref), var31 (ref), var13 (ref), var32 (ref), tokens (ref), var33 (ref), getFFlagAppChatEnableManualTranslationModule (copy), var34 (write), var36 (ref)
		local list = {
			{
				icon = images["icons/placeholder/placeholderOff"],
				text = var21.replyText,
				onActivated = var30
			},
			{
				icon = images["icons/actions/edit/copy"],
				text = var21.copyText,
				onActivated = var31
			}
		}
		
		if var13.userOwnsMessage then
			table.insert(list, {
				icon = images["icons/actions/edit/edit"],
				text = var21.editText,
				onActivated = var32
			})
			table.insert(list, {
				icon = images["icons/actions/edit/delete"],
				iconColorOverride = tokens.Color.System.Alert.Color3,
				text = var21.deleteText,
				textColorOverride = tokens.Color.System.Alert.Color3,
				onActivated = var33
			})
			
			return list
		elseif getFFlagAppChatEnableManualTranslationModule() then
			table.insert(list, {
				text = "Translate",
				icon = images["icons/placeholder/placeholderOff"],
				onActivated = var34
			})
		end
		table.insert(list, {
			icon = images["icons/placeholder/placeholderOff"],
			iconColorOverride = tokens.Color.System.Alert.Color3,
			text = var21.reportText,
			textColorOverride = tokens.Color.System.Alert.Color3,
			onActivated = var36
		})
		
		return list
	end, {
		var21.replyText, var21.copyText, var21.editText, var21.deleteText,
		var21.reportText, var21.translateText, var30, var31, var32, var33,
		if getFFlagAppChatEnableManualTranslationModule() then var34 else nil, var36,
		var13.userOwnsMessage
	})
	local var38 = #var37 * 56
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if unitTestDeviceType == deviceType.Desktop or unitTestDeviceType == deviceType.Tablet then
		var39 = 20
		vector2 = unitTestScreenSize
		vector2_1 = Vector2.new(0.5, 0.5)
		uDim = UDim.new(0.5, 0)
		uDim_1 = UDim.new(0.5, 0)
	else
		var39 = 0
		vector2 = Vector2.new(0, 0)
		vector2_1 = Vector2.new(0.5, 1)
		uDim = UDim.new(0, var38)
		uDim_1 = UDim.new(1, 0)
	end
	local var44 = reactModule.createElement(contextualMenu, {
		isElementBackgroundVisible = true,
		isElementDividerVisible = true,
		open = true,
		screenSize = vector2,
		menuDirection = menuDirection.Up,
		openPositionY = uDim,
		anchorPointOverride = vector2_1,
		horizontalAlignment = Enum.HorizontalAlignment.Center,
		contextMenuWidthOverride = uDim_1,
		borderCornerRadius = var39,
		buttonProps = var37,
		onDismiss = var29
	})
	
	return if unitTestDeviceType == deviceType.Desktop or unitTestDeviceType == deviceType.Tablet then var44 else reactModule.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		[reactModule.Event.Activated] = var29
	}, {
		PeekView = reactModule.createElement(peekView, {
			mountAsFullView = false,
			mountAnimation = true,
			showDraggerInClosedState = false,
			briefViewContentHeight = UDim.new(0, var38),
			fullViewContentHeight = UDim.new(1, -var38),
			closeSignal = var16.current,
			viewStateChanged = var27
		}, { var44 })
	})
end

return reactModule.memo(MessageContextMenu)