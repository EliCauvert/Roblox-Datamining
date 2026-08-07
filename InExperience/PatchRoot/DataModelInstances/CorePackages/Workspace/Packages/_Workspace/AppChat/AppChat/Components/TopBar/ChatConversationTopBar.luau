local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
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
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local useSignalState = signalsReactModule.useSignalState

local function noOp() --[[ line: 36 ]]
	return nil
end

return function(p0) --[[ line: 45 | named "ChatConversationTopBar" ]]
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), useSignalState (ref), useChatPlacementContext (ref), useLocalization (ref), appHeaderBarModule (ref), createBackFuncModule (ref), getFFlagIsSquadEnabled (ref), enumScreensModule (ref), reactModule (ref), foundationModule (ref), squadComponentAccessWrapperModule (ref), squadJoinButtonModule (ref), squadButtonSourceEnum (ref), headerBarTitleLeftAlignedModule (ref), chatTopBarBaseModule (ref), noOp (ref)
	if not fFlagAppChatTopBarConfigDrivenModule() then
		return nil
	end
	local screenName = p0.screenName
	local navigation = p0.navigation
	local var14 = useSignalState(getTopBarStoreModule(false).getScreenTopBar(screenName))
	local headerText = var14.headerText or {}
	local backButtonEnabled = var14.backButtonEnabled
	local isRoot = var14.isRoot
	local conversationId = var14.conversationId
	local navigateToChatDetails = var14.navigateToChatDetails
	local rightPaddingOverride = var14.rightPaddingOverride
	local var16 = useChatPlacementContext()
	local var17 = useLocalization({
		headerText = if headerText.shouldLocalize then headerText.raw else nil
	})
	local var18 = if backButtonEnabled then appHeaderBarModule.makeBackButton(createBackFuncModule({
		navigation = navigation,
		navigateToRootStack = navigation.getScreenProps("navigateToRootStack", nil),
		isRoot = isRoot
	})) else nil
	local var19 = nil
	
	if getFFlagIsSquadEnabled() and conversationId then
		local var20 = function() --[[ line: 81 ]]
			-- upvalues: navigation (ref), enumScreensModule (copy), conversationId (ref)
			navigation.navigate(enumScreensModule.SquadLobby, { conversationId = conversationId })
		end
		
		var19 = function() --[[ line: 84 ]]
			-- upvalues: reactModule (copy), foundationModule (copy), squadComponentAccessWrapperModule (copy), conversationId (ref), squadJoinButtonModule (copy), var20 (ref), squadButtonSourceEnum (copy), var16 (ref)
			return reactModule.createElement(foundationModule.View, { tag = "row align-x-right auto-xy" }, {
				GroupUpButton = reactModule.createElement(squadComponentAccessWrapperModule, { parentChannelId = conversationId }, reactModule.createElement(squadJoinButtonModule, {
					isFullWidth = false,
					isInCard = false,
					layoutOrder = 0,
					shouldAnimate = true,
					shouldShowSignifier = true,
					conversationId = conversationId,
					onActivated = var20,
					squadButtonSource = squadButtonSourceEnum.ChatConversationScreen,
					squadLocation = var16.chatPlacement
				}))
			})
		end
	end
	return reactModule.createElement(chatTopBarBaseModule, {
		screenName = screenName,
		navigation = navigation,
		renderLeft = noOp,
		renderCenter = function() --[[ line: 109 ]]
			-- upvalues: headerText (ref), var17 (ref), reactModule (copy), headerBarTitleLeftAlignedModule (copy), var18 (ref), var19 (write), conversationId (ref), navigateToChatDetails (ref), rightPaddingOverride (ref)
			return reactModule.createElement(headerBarTitleLeftAlignedModule, {
				renderLeft = var18,
				renderRight = var19,
				titleText = if headerText.shouldLocalize then var17.headerText else headerText.raw or "",
				conversationId = conversationId or "",
				navigateToChatDetails = navigateToChatDetails or function() --[[ line: 116 ]] end,
				ignoreRightMargin = rightPaddingOverride ~= nil
			})
		end
	})
end