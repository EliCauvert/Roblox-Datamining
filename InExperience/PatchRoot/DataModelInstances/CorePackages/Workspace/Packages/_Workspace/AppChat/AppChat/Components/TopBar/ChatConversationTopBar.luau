local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local chatTopBarBaseModule = require(script.Parent.ChatTopBarBase)
local createBackFuncModule = require(script.Parent.createBackFunc)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local headerBarTitleLeftAlignedModule = require(appChat.Components.ChatConversation.HeaderBarTitleLeftAligned)
local useChatPlacementContext = require(appChat.Contexts.ChatPlacementContext).useChatPlacementContext
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local signalsReactModule = require(parent.SignalsReact)
local appHeaderBarModule = require(parent.AppHeaderBar)
local squadJoinButtonModule = require(parent.Squads.SquadJoinButton)
local squadButtonSourceEnum = require(parent.Squads.Enums).SquadButtonSourceEnum
local squadComponentAccessWrapperModule = require(parent.Squads.SquadComponentAccessWrapper)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagFriendsCallingClientGateDEV = sharedFlagsModule.FFlagFriendsCallingClientGate_DEV
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled
local useSignalState = signalsReactModule.useSignalState

local function noOp() --[[ line: 40 ]]
	return nil
end

return function(p0) --[[ line: 49 | named "ChatConversationTopBar" ]]
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), useSignalState (ref), useChatPlacementContext (ref), useLocalization (ref), appHeaderBarModule (ref), createBackFuncModule (ref), fFlagFriendsCallingClientGateDEV (ref), reactModule (ref), foundationModule (ref), noOp (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), getFFlagIsSquadEnabled (ref), enumScreensModule (ref), squadComponentAccessWrapperModule (ref), squadJoinButtonModule (ref), squadButtonSourceEnum (ref), headerBarTitleLeftAlignedModule (ref), chatTopBarBaseModule (ref)
	if not fFlagAppChatTopBarConfigDrivenModule() then
		return nil
	end
	local screenName = p0.screenName
	local navigation = p0.navigation
	local var17 = useSignalState(getTopBarStoreModule(false).getScreenTopBar(screenName))
	local headerText = var17.headerText or {}
	local backButtonEnabled = var17.backButtonEnabled
	local isRoot = var17.isRoot
	local conversationId = var17.conversationId
	local navigateToChatDetails = var17.navigateToChatDetails
	local rightPaddingOverride = var17.rightPaddingOverride
	local var19 = useChatPlacementContext()
	local var20 = useLocalization({
		headerText = if headerText.shouldLocalize then headerText.raw else nil
	})
	local var21 = if backButtonEnabled then appHeaderBarModule.makeBackButton(createBackFuncModule({
		navigation = navigation,
		navigateToRootStack = navigation.getScreenProps("navigateToRootStack", nil),
		isRoot = isRoot
	})) else nil
	local var22 = nil
	
	if fFlagFriendsCallingClientGateDEV and conversationId then
		var22 = function() --[[ line: 85 ]]
			-- upvalues: reactModule (copy), foundationModule (copy), noOp (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
			return reactModule.createElement(foundationModule.View, { tag = "row align-x-right align-y-center auto-xy" }, {
				CallButton = reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					icon = foundationModule.Enums.IconName.Phone,
					size = foundationModule.Enums.InputSize.Medium,
					onActivated = noOp,
					testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatConversationTopBarButton("call") else nil
				})
			})
		end
	elseif getFFlagIsSquadEnabled() and conversationId then
		local var23 = function() --[[ line: 101 ]]
			-- upvalues: navigation (ref), enumScreensModule (copy), conversationId (ref)
			navigation.navigate(enumScreensModule.SquadLobby, { conversationId = conversationId })
		end
		
		var22 = function() --[[ line: 104 ]]
			-- upvalues: reactModule (copy), foundationModule (copy), squadComponentAccessWrapperModule (copy), conversationId (ref), squadJoinButtonModule (copy), var23 (ref), squadButtonSourceEnum (copy), var19 (ref)
			return reactModule.createElement(foundationModule.View, { tag = "row align-x-right auto-xy" }, {
				GroupUpButton = reactModule.createElement(squadComponentAccessWrapperModule, { parentChannelId = conversationId }, reactModule.createElement(squadJoinButtonModule, {
					isFullWidth = false,
					isInCard = false,
					layoutOrder = 0,
					shouldAnimate = true,
					shouldShowSignifier = true,
					conversationId = conversationId,
					onActivated = var23,
					squadButtonSource = squadButtonSourceEnum.ChatConversationScreen,
					squadLocation = var19.chatPlacement
				}))
			})
		end
	end
	return reactModule.createElement(chatTopBarBaseModule, {
		screenName = screenName,
		navigation = navigation,
		renderLeft = noOp,
		renderCenter = function() --[[ line: 129 ]]
			-- upvalues: headerText (ref), var20 (ref), reactModule (copy), headerBarTitleLeftAlignedModule (copy), var21 (ref), var22 (write), conversationId (ref), navigateToChatDetails (ref), rightPaddingOverride (ref)
			return reactModule.createElement(headerBarTitleLeftAlignedModule, {
				renderLeft = var21,
				renderRight = var22,
				titleText = if headerText.shouldLocalize then var20.headerText else headerText.raw or "",
				conversationId = conversationId or "",
				navigateToChatDetails = navigateToChatDetails or function() --[[ line: 136 ]] end,
				ignoreRightMargin = rightPaddingOverride ~= nil
			})
		end
	})
end