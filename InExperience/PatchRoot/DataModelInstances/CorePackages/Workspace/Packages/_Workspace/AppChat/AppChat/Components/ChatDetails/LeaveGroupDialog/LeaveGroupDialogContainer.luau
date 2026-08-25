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

function LeaveGroupDialogContainer(p0)
	-- upvalues: cryoModule (ref), t (ref), useState (ref), useTelemetryModule (ref), chatDialogTelemetryLayerModule (ref), useEffectOnMount (ref), chatDetailsTelemetryEventsModule (ref), useDispatch (ref), useCallback (ref), appChatNetworkingModule (ref), useSelector (ref), getFFlagIsSquadEnabled (ref), removedConversationModule (ref), useLocalization (ref), reactModule (ref), leaveGroupDialogModule (ref), responseIndicator (ref)
	local var11 = cryoModule.Dictionary.join(t, p0)
	local var12, var13 = useState(true)
	local var14, var15 = useState(false)
	local var16, var17 = useState(false)
	local var18 = useTelemetryModule(chatDialogTelemetryLayerModule.Context)
	useEffectOnMount(function()
		-- upvalues: var18 (ref), chatDetailsTelemetryEventsModule (copy)
		var18.emit(chatDetailsTelemetryEventsModule.LeaveGroupDialogRendered, {})
	end)
	local var19 = useDispatch()
	local var20 = useCallback(function(p1, p2)
		-- upvalues: var19 (ref), appChatNetworkingModule (copy)
		return var19(appChatNetworkingModule.rodux.RemoveUserFromConversation.API(p2, p1))
	end, { var19 })
	local var21 = useSelector(function(p3)
		-- upvalues: var11 (ref), getFFlagIsSquadEnabled (copy)
		local conversationId = p3.ChatAppReducer.Conversations[var11.conversationId] or { title = nil, hasGroupUp = nil }
		
		return {
			localUserId = p3.LocalUserId,
			conversationTitle = conversationId.title,
			hasGroupUp = if getFFlagIsSquadEnabled() then conversationId.hasGroupUp else nil
		}
	end)
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		LeaveGroupDialog = var12 and reactModule.createElement(leaveGroupDialogModule, cryoModule.Dictionary.join(var11, useLocalization({
			titleText = var11.titleKey,
			cancelText = var11.cancelKey,
			confirmText = var11.confirmKey,
			bodyText = var11.bodyKey,
			failureTitleText = var11.failureTitleKey,
			failureBodyText = {
				var11.failureBodyKey,
				CONVERSATION_TITLE = var21.conversationTitle
			},
			failureButtonText = var11.failureButtonKey
		}), var21, {
			onActivated = useCallback(function()
				-- upvalues: var15 (ref), var13 (ref), var18 (ref), chatDetailsTelemetryEventsModule (copy), var11 (ref), var20 (ref), var21 (ref), var19 (ref), removedConversationModule (copy), var17 (ref)
				var15(true)
				var13(false)
				var18.emit(chatDetailsTelemetryEventsModule.LeaveGroupDialogLeaveClicked, {})
				
				if var11.conversationId then
					var20(var21.localUserId, var11.conversationId):andThen(function()
						-- upvalues: var11 (copy), var19 (copy), removedConversationModule (copy)
						if var11.isRooted then
							var19(removedConversationModule(var11.conversationId))
						end
						var11.onModalClose()
						var11.onLeaveSuccess()
					end):catch(function()
						-- upvalues: var15 (copy), var13 (copy), var17 (copy)
						var15(false)
						var13(true)
						var17(true)
					end)
				end
				return true
			end, {
				var21.localUserId, var21.hasGroupUp, var11.conversationId, var11.isRooted,
				var11.onModalClose, var11.onLeaveSuccess, var19, var20, var18
			}),
			displayFailed = var16,
			onModalClose = useCallback(function(...)
				-- upvalues: var18 (ref), chatDetailsTelemetryEventsModule (copy), var11 (ref)
				var18.emit(chatDetailsTelemetryEventsModule.LeaveGroupDialogStayClicked, {})
				var11.onModalClose(...)
			end, { var11.onModalClose, var11.conversationId, var18 })
		})),
		ResponseIndicator = var14 and reactModule.createElement(responseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		})
	})
end

return memo(LeaveGroupDialogContainer)