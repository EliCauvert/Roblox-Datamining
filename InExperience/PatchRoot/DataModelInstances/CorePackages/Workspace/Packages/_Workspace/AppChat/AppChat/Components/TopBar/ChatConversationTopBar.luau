local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local ChatTopBarBaseModule = require(script.Parent.ChatTopBarBase)
local CreateBackFuncModule = require(script.Parent.createBackFunc)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local HeaderBarTitleLeftAlignedModule = require(AppChat.Components.ChatConversation.HeaderBarTitleLeftAligned)
local UseChatPlacementContextFunction = require(AppChat.Contexts.ChatPlacementContext).useChatPlacementContext
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SignalsReactModule = require(Parent.SignalsReact)
local AppHeaderBarModule = require(Parent.AppHeaderBar)
local SquadJoinButtonModule = require(Parent.Squads.SquadJoinButton)
local SquadButtonSourceEnum = require(Parent.Squads.Enums).SquadButtonSourceEnum
local SquadComponentAccessWrapperModule = require(Parent.Squads.SquadComponentAccessWrapper)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagFriendsCallingClientGateDEV = SharedFlagsModule.FFlagFriendsCallingClientGate_DEV
local UseIsCallButtonEligibleModule = if FFlagFriendsCallingClientGateDEV then require(AppChat.Hooks.useIsCallButtonEligible) else nil
local GetFFlagIsSquadEnabledFunction = SharedFlagsModule.GetFFlagIsSquadEnabled
local StartConversationCallModule = if FFlagFriendsCallingClientGateDEV then require(AppChat.Utils.startConversationCall) else nil
local UseSignalStateFunction = SignalsReactModule.useSignalState

local function noOp()
	return nil
end

return function(p1)
	-- upvalues: GetTopBarStoreModule (copy), UseSignalStateFunction (copy), FFlagFriendsCallingClientGateDEV (copy), UseIsCallButtonEligibleModule (copy), UseChatPlacementContextFunction (copy), UseLocalizationFunction (copy), AppHeaderBarModule (copy), CreateBackFuncModule (copy), StartConversationCallModule (copy), ReactModule (copy), GetFFlagIsSquadEnabledFunction (copy), FoundationModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), SquadComponentAccessWrapperModule (copy), SquadJoinButtonModule (copy), EnumScreensModule (copy), SquadButtonSourceEnum (copy), HeaderBarTitleLeftAlignedModule (copy), ChatTopBarBaseModule (copy), noOp (copy)
	local ScreenName = p1.screenName
	local Navigation = p1.navigation
	local UseSignalStateResult = UseSignalStateFunction((GetTopBarStoreModule(false).getScreenTopBar(ScreenName)))
	local HeaderText = UseSignalStateResult.headerText or {}
	local BackButtonEnabled = UseSignalStateResult.backButtonEnabled
	local IsRoot = UseSignalStateResult.isRoot
	local ConversationId = UseSignalStateResult.conversationId
	local UseIsCallButtonEligibleModuleResult = if FFlagFriendsCallingClientGateDEV and UseIsCallButtonEligibleModule then UseIsCallButtonEligibleModule(ConversationId) else false
	local NavigateToChatDetails = UseSignalStateResult.navigateToChatDetails
	local RightPaddingOverride = UseSignalStateResult.rightPaddingOverride
	local UseChatPlacementContextResult = UseChatPlacementContextFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		headerText = HeaderText.shouldLocalize and HeaderText.raw or nil
	})
	local MakeBackButtonFunction = AppHeaderBarModule.makeBackButton
	local BackFuncModule = CreateBackFuncModule({
		navigation = Navigation,
		navigateToRootStack = Navigation.getScreenProps("navigateToRootStack", nil),
		isRoot = IsRoot
	})
	local BackButton = if BackButtonEnabled then MakeBackButtonFunction(BackFuncModule) else nil
	local UseResult = if StartConversationCallModule == nil then nil else ReactModule.useCallback(function()
		-- upvalues: ConversationId (copy), StartConversationCallModule (upval)
		if ConversationId ~= nil then
			StartConversationCallModule(ConversationId)
			
			return
		end
	end, { ConversationId })
	local UseIsCallButtonEligibleModuleResult1 = FFlagFriendsCallingClientGateDEV and (ConversationId ~= nil and UseIsCallButtonEligibleModuleResult)
	local HasConversationId: boolean = not FFlagFriendsCallingClientGateDEV and (GetFFlagIsSquadEnabledFunction() and ConversationId ~= nil)
	local RenderRight = if UseIsCallButtonEligibleModuleResult1 and UseResult then function()
		-- upvalues: ReactModule (upval), FoundationModule (upval), UseResult (copy), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval)
		return ReactModule.createElement(FoundationModule.View, { tag = "row align-x-right align-y-center auto-xy" }, {
			CallButton = ReactModule.createElement(FoundationModule.IconButton, {
				isCircular = true,
				icon = FoundationModule.Enums.IconName.Phone,
				size = FoundationModule.Enums.InputSize.Medium,
				onActivated = UseResult,
				testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatConversationTopBarButton("call") else nil
			})
		})
	end elseif HasConversationId then function()
		-- upvalues: ReactModule (upval), FoundationModule (upval), SquadComponentAccessWrapperModule (upval), ConversationId (copy), SquadJoinButtonModule (upval), Navigation (copy), EnumScreensModule (upval), SquadButtonSourceEnum (upval), UseChatPlacementContextResult (copy)
		return ReactModule.createElement(FoundationModule.View, { tag = "row align-x-right auto-xy" }, {
			GroupUpButton = ReactModule.createElement(SquadComponentAccessWrapperModule, { parentChannelId = ConversationId }, ReactModule.createElement(SquadJoinButtonModule, {
				isFullWidth = false,
				isInCard = false,
				layoutOrder = 0,
				shouldAnimate = true,
				shouldShowSignifier = true,
				conversationId = ConversationId,
				onActivated = function()
					-- upvalues: Navigation (upval), EnumScreensModule (upval), ConversationId (upval)
					Navigation.navigate(EnumScreensModule.SquadLobby, { conversationId = ConversationId })
				end,
				squadButtonSource = SquadButtonSourceEnum.ChatConversationScreen,
				squadLocation = UseChatPlacementContextResult.chatPlacement
			}))
		})
	end else nil
	
	return ReactModule.createElement(ChatTopBarBaseModule, {
		screenName = ScreenName,
		navigation = Navigation,
		renderLeft = noOp,
		renderCenter = function()
			-- upvalues: HeaderText (copy), UseLocalizationResult (copy), ReactModule (upval), HeaderBarTitleLeftAlignedModule (upval), BackButton (copy), RenderRight (copy), ConversationId (copy), NavigateToChatDetails (copy), RightPaddingOverride (copy)
			return ReactModule.createElement(HeaderBarTitleLeftAlignedModule, {
				renderLeft = BackButton,
				renderRight = RenderRight,
				titleText = HeaderText.shouldLocalize and UseLocalizationResult.headerText or (HeaderText.raw or ""),
				conversationId = ConversationId or "",
				navigateToChatDetails = NavigateToChatDetails or function() end,
				ignoreRightMargin = RightPaddingOverride ~= nil
			})
		end
	})
end