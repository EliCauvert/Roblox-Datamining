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
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local t = {
	titleKey = "Feature.Chat.Heading.LeaveGroup",
	cancelKey = "Feature.Chat.Action.Stay",
	confirmKey = "Feature.Chat.Action.Leave",
	failureTitleKey = "Feature.Chat.Heading.FailedToLeaveGroup",
	failureButtonKey = "Feature.Chat.Action.Confirm",
	onModalClose = function() --[[ line: 45 ]] end,
	onLeaveSuccess = function() --[[ line: 46 ]] end,
	bodyKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Message.LeaveGroup.V2" else "Feature.Chat.Message.LeaveGroup",
	failureBodyKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Message.FailedToLeaveGroup.V2" else "Feature.Chat.Message.FailedToLeaveGroup"
}

function LeaveGroupDialogContainer(p0) --[[ line: 63 ]]
	-- upvalues: cryoModule (ref), t (ref), useState (ref), useTelemetryModule (ref), chatDialogTelemetryLayerModule (ref), useEffectOnMount (ref), chatDetailsTelemetryEventsModule (ref), useDispatch (ref), useCallback (ref), appChatNetworkingModule (ref), useSelector (ref), getFFlagIsSquadEnabled (ref), useLocalization (ref), reactModule (ref), leaveGroupDialogModule (ref), responseIndicator (ref)
	local var10 = cryoModule.Dictionary.join(t, p0)
	local var11, var12 = useState(true)
	local var13, var14 = useState(false)
	local var15, var16 = useState(false)
	local var17 = useTelemetryModule(chatDialogTelemetryLayerModule.Context)
	useEffectOnMount(function() --[[ line: 70 ]]
		-- upvalues: var17 (ref), chatDetailsTelemetryEventsModule (copy)
		var17.emit(chatDetailsTelemetryEventsModule.LeaveGroupDialogRendered, {})
	end)
	local var18 = useDispatch()
	local var19 = useCallback(function(p1, p2) --[[ line: 75 ]]
		-- upvalues: var18 (ref), appChatNetworkingModule (copy)
		return var18(appChatNetworkingModule.rodux.RemoveUserFromConversation.API(p2, p1))
	end, { var18 })
	local var20 = useSelector(function(p3) --[[ line: 79 ]]
		-- upvalues: var10 (ref), getFFlagIsSquadEnabled (copy)
		local conversationId = p3.ChatAppReducer.Conversations[var10.conversationId] or { title = nil, hasGroupUp = nil }
		
		return {
			localUserId = p3.LocalUserId,
			conversationTitle = conversationId.title,
			hasGroupUp = if getFFlagIsSquadEnabled() then conversationId.hasGroupUp else nil
		}
	end)
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		LeaveGroupDialog = var11 and reactModule.createElement(leaveGroupDialogModule, cryoModule.Dictionary.join(var10, useLocalization({
			titleText = var10.titleKey,
			cancelText = var10.cancelKey,
			confirmText = var10.confirmKey,
			bodyText = var10.bodyKey,
			failureTitleText = var10.failureTitleKey,
			failureBodyText = {
				var10.failureBodyKey,
				CONVERSATION_TITLE = var20.conversationTitle
			},
			failureButtonText = var10.failureButtonKey
		}), var20, {
			onActivated = useCallback(function() --[[ line: 93 ]]
				-- upvalues: var14 (ref), var12 (ref), var17 (ref), chatDetailsTelemetryEventsModule (copy), var10 (ref), var19 (ref), var20 (ref), var16 (ref)
				var14(true)
				var12(false)
				var17.emit(chatDetailsTelemetryEventsModule.LeaveGroupDialogLeaveClicked, {})
				
				if var10.conversationId then
					var19(var20.localUserId, var10.conversationId):andThen(function() --[[ line: 100 ]]
						-- upvalues: var10 (copy)
						var10.onModalClose()
						var10.onLeaveSuccess()
					end):catch(function() --[[ line: 104 ]]
						-- upvalues: var14 (copy), var12 (copy), var16 (copy)
						var14(false)
						var12(true)
						var16(true)
					end)
				end
				return true
			end, {
				var20.localUserId,
				var20.hasGroupUp,
				var10.conversationId,
				var19,
				var17
			}),
			displayFailed = var15,
			onModalClose = useCallback(function(...) --[[ line: 120 ]]
				-- upvalues: var17 (ref), chatDetailsTelemetryEventsModule (copy), var10 (ref)
				var17.emit(chatDetailsTelemetryEventsModule.LeaveGroupDialogStayClicked, {})
				var10.onModalClose(...)
			end, { var10.onModalClose, var10.conversationId, var17 })
		})),
		ResponseIndicator = var13 and reactModule.createElement(responseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		})
	})
end

return memo(LeaveGroupDialogContainer)