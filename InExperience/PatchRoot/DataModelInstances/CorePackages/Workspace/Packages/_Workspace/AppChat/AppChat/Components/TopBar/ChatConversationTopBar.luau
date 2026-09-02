local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local chatTopBarBaseModule = require(script.Parent.ChatTopBarBase)
local createBackFuncModule = require(script.Parent.createBackFunc)
local useCallButtonEligibilityModule = require(appChat.Hooks.useCallButtonEligibility)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local headerBarTitleLeftAlignedModule = require(appChat.Components.ChatConversation.HeaderBarTitleLeftAligned)
local useChatPlacementContext = require(appChat.Contexts.ChatPlacementContext).useChatPlacementContext
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
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

local function noOp()
	return nil
end

return function(p1)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), useSignalState (ref), fFlagFriendsCallingClientGateDEV (ref), useCallButtonEligibilityModule (ref), useChatPlacementContext (ref), useLocalization (ref), appHeaderBarModule (ref), createBackFuncModule (ref), reactModule (ref), conversationChannelsModule (ref), getFFlagIsSquadEnabled (ref), foundationModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), squadComponentAccessWrapperModule (ref), squadJoinButtonModule (ref), enumScreensModule (ref), squadButtonSourceEnum (ref), headerBarTitleLeftAlignedModule (ref), chatTopBarBaseModule (ref), noOp (ref)
	if not fFlagAppChatTopBarConfigDrivenModule() then
		return nil
	end
	local screenName = p1.screenName
	local navigation = p1.navigation
	local var1 = useSignalState(getTopBarStoreModule(false).getScreenTopBar(screenName))
	local headerText = var1.headerText or {}
	local backButtonEnabled = var1.backButtonEnabled
	local isRoot = var1.isRoot
	local conversationId = var1.conversationId
	local var2 = if fFlagFriendsCallingClientGateDEV then useCallButtonEligibilityModule(conversationId) else nil
	local navigateToChatDetails = var1.navigateToChatDetails
	local rightPaddingOverride = var1.rightPaddingOverride
	local var3 = useChatPlacementContext()
	local var4 = useLocalization({
		headerText = if headerText.shouldLocalize then headerText.raw else nil
	})
	local var5 = if backButtonEnabled then appHeaderBarModule.makeBackButton(createBackFuncModule({
		navigation = navigation,
		navigateToRootStack = navigation.getScreenProps("navigateToRootStack", nil),
		isRoot = isRoot
	})) else nil
	local var6 = reactModule.useCallback(function()
		-- upvalues: fFlagFriendsCallingClientGateDEV (copy), var2 (ref), conversationChannelsModule (copy), conversationId (ref)
		if not fFlagFriendsCallingClientGateDEV or var2 ~= conversationChannelsModule.CallButtonEligibility.Eligible then return end
		if conversationId then
			game:GetService("CallingService"):CreateCall({}, conversationId)
		end
	end, { conversationId or false, var2 or false })
	local var7 = if fFlagFriendsCallingClientGateDEV and (conversationId ~= nil and var2 == conversationChannelsModule.CallButtonEligibility.Eligible) then function()
		-- upvalues: reactModule (copy), foundationModule (copy), var6 (ref), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
		return reactModule.createElement(foundationModule.View, { tag = "row align-x-right align-y-center auto-xy" }, {
			CallButton = reactModule.createElement(foundationModule.IconButton, {
				isCircular = true,
				icon = foundationModule.Enums.IconName.Phone,
				size = foundationModule.Enums.InputSize.Medium,
				onActivated = var6,
				testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatConversationTopBarButton("call") else nil
			})
		})
	end elseif not fFlagFriendsCallingClientGateDEV and (getFFlagIsSquadEnabled() and conversationId ~= nil) then function()
		-- upvalues: reactModule (copy), foundationModule (copy), squadComponentAccessWrapperModule (copy), conversationId (ref), squadJoinButtonModule (copy), navigation (ref), enumScreensModule (copy), squadButtonSourceEnum (copy), var3 (ref)
		return reactModule.createElement(foundationModule.View, { tag = "row align-x-right auto-xy" }, {
			GroupUpButton = reactModule.createElement(squadComponentAccessWrapperModule, { parentChannelId = conversationId }, reactModule.createElement(squadJoinButtonModule, {
				isFullWidth = false,
				isInCard = false,
				layoutOrder = 0,
				shouldAnimate = true,
				shouldShowSignifier = true,
				conversationId = conversationId,
				onActivated = function()
					-- upvalues: navigation (copy), enumScreensModule (copy), conversationId (copy)
					navigation.navigate(enumScreensModule.SquadLobby, { conversationId = conversationId })
				end,
				squadButtonSource = squadButtonSourceEnum.ChatConversationScreen,
				squadLocation = var3.chatPlacement
			}))
		})
	end else nil
	
	return reactModule.createElement(chatTopBarBaseModule, {
		screenName = screenName,
		navigation = navigation,
		renderLeft = noOp,
		renderCenter = function()
			-- upvalues: headerText (ref), var4 (ref), reactModule (copy), headerBarTitleLeftAlignedModule (copy), var5 (ref), var7 (ref), conversationId (ref), navigateToChatDetails (ref), rightPaddingOverride (ref)
			return reactModule.createElement(headerBarTitleLeftAlignedModule, {
				renderLeft = var5,
				renderRight = var7,
				titleText = if headerText.shouldLocalize then var4.headerText else headerText.raw or "",
				conversationId = conversationId or "",
				navigateToChatDetails = navigateToChatDetails or function() end,
				ignoreRightMargin = rightPaddingOverride ~= nil
			})
		end
	})
end