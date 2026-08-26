local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local socialLibrariesModule = require(appChat.SocialLibraries)
local _ = require(appChat.types)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local useCallback = reactModule.useCallback
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useState = reactModule.useState
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatDetailsTelemetryEventsModule = require(appChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local chatDialogTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local responseIndicator = socialLibrariesModule.Components.ResponseIndicator
local leaveGroupDialogModule = require(script.Parent.LeaveGroupDialog)
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local t = {
	isRooted = false,
	titleKey = "Feature.Chat.Heading.LeaveGroup",
	cancelKey = "Feature.Chat.Action.Stay",
	confirmKey = "Feature.Chat.Action.Leave",
	failureTitleKey = "Feature.Chat.Heading.FailedToLeaveGroup",
	failureButtonKey = "Feature.Chat.Action.Confirm",
	onModalClose = function() end,
	onLeaveSuccess = function() end,
	bodyKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Message.LeaveGroup.V2" else "Feature.Chat.Message.LeaveGroup",
	failureBodyKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Message.FailedToLeaveGroup.V2" else "Feature.Chat.Message.FailedToLeaveGroup"
}

function LeaveGroupDialogContainer(p1)
	-- upvalues: cryoModule (ref), t (ref), useState (ref), useTelemetryModule (ref), chatDialogTelemetryLayerModule (ref), useEffectOnMount (ref), chatDetailsTelemetryEventsModule (ref), useDispatch (ref), useCallback (ref), appChatNetworkingModule (ref), useSelector (ref), getFFlagIsSquadEnabled (ref), removedConversationModule (ref), useLocalization (ref), reactModule (ref), leaveGroupDialogModule (ref), responseIndicator (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2, var3 = useState(true)
	local var4, var5 = useState(false)
	local var6, var7 = useState(false)
	local var8 = useTelemetryModule(chatDialogTelemetryLayerModule.Context)
	useEffectOnMount(function()
		-- upvalues: var8 (ref), chatDetailsTelemetryEventsModule (copy)
		var8.emit(chatDetailsTelemetryEventsModule.LeaveGroupDialogRendered, {})
	end)
	local var9 = useDispatch()
	local var10 = useCallback(function(p2, p3)
		-- upvalues: var9 (ref), appChatNetworkingModule (copy)
		return var9(appChatNetworkingModule.rodux.RemoveUserFromConversation.API(p3, p2))
	end, { var9 })
	local var11 = useSelector(function(p2)
		-- upvalues: var1 (ref), getFFlagIsSquadEnabled (copy)
		local conversationId = p2.ChatAppReducer.Conversations[var1.conversationId] or { title = nil, hasGroupUp = nil }
		
		return {
			localUserId = p2.LocalUserId,
			conversationTitle = conversationId.title,
			hasGroupUp = if getFFlagIsSquadEnabled() then conversationId.hasGroupUp else nil
		}
	end)
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		LeaveGroupDialog = var2 and reactModule.createElement(leaveGroupDialogModule, cryoModule.Dictionary.join(var1, useLocalization({
			titleText = var1.titleKey,
			cancelText = var1.cancelKey,
			confirmText = var1.confirmKey,
			bodyText = var1.bodyKey,
			failureTitleText = var1.failureTitleKey,
			failureBodyText = {
				var1.failureBodyKey,
				CONVERSATION_TITLE = var11.conversationTitle
			},
			failureButtonText = var1.failureButtonKey
		}), var11, {
			onActivated = useCallback(function()
				-- upvalues: var5 (ref), var3 (ref), var8 (ref), chatDetailsTelemetryEventsModule (copy), var1 (ref), var10 (ref), var11 (ref), var9 (ref), removedConversationModule (copy), var7 (ref)
				var5(true)
				var3(false)
				var8.emit(chatDetailsTelemetryEventsModule.LeaveGroupDialogLeaveClicked, {})
				
				if var1.conversationId then
					var10(var11.localUserId, var1.conversationId):andThen(function()
						-- upvalues: var1 (copy), var9 (copy), removedConversationModule (copy)
						if var1.isRooted then
							var9(removedConversationModule(var1.conversationId))
						end
						var1.onModalClose()
						var1.onLeaveSuccess()
					end):catch(function()
						-- upvalues: var5 (copy), var3 (copy), var7 (copy)
						var5(false)
						var3(true)
						var7(true)
					end)
				end
				return true
			end, {
				var11.localUserId, var11.hasGroupUp, var1.conversationId, var1.isRooted,
				var1.onModalClose, var1.onLeaveSuccess, var9, var10, var8
			}),
			displayFailed = var6,
			onModalClose = useCallback(function(...)
				-- upvalues: var8 (ref), chatDetailsTelemetryEventsModule (copy), var1 (ref)
				var8.emit(chatDetailsTelemetryEventsModule.LeaveGroupDialogStayClicked, {})
				var1.onModalClose(...)
			end, { var1.onModalClose, var1.conversationId, var8 })
		})),
		ResponseIndicator = var4 and reactModule.createElement(responseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		})
	})
end

return memo(LeaveGroupDialogContainer)