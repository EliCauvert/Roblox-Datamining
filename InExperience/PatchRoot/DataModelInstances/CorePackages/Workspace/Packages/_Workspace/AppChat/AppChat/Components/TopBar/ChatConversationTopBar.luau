local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local ChatTopBarBaseModule = require(script.Parent.ChatTopBarBase)
local CreateBackFuncModule = require(script.Parent.createBackFunc)
local UseCallButtonEligibilityModule = require(AppChat.Hooks.useCallButtonEligibility)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local HeaderBarTitleLeftAlignedModule = require(AppChat.Components.ChatConversation.HeaderBarTitleLeftAligned)
local UseChatPlacementContextFunction = require(AppChat.Contexts.ChatPlacementContext).useChatPlacementContext
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppHeaderBarModule = require(Parent.AppHeaderBar)
local SquadJoinButtonModule = require(Parent.Squads.SquadJoinButton)
local SquadButtonSourceEnum = require(Parent.Squads.Enums).SquadButtonSourceEnum
local SquadComponentAccessWrapperModule = require(Parent.Squads.SquadComponentAccessWrapper)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagFriendsCallingClientGateDEV = SharedFlagsModule.FFlagFriendsCallingClientGate_DEV
local GetFFlagIsSquadEnabledFunction = SharedFlagsModule.GetFFlagIsSquadEnabled
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

local function noOp()
	return nil
end

return function(p1)
	-- upvalues: GetTopBarStoreModule (copy), UseSignalStateFunction (copy), FFlagFriendsCallingClientGateDEV (copy), UseCallButtonEligibilityModule (copy), UseChatPlacementContextFunction (copy), UseLocalizationFunction (copy), AppHeaderBarModule (copy), CreateBackFuncModule (copy), ReactModule (copy), ConversationChannelsModule (copy), GetFFlagIsSquadEnabledFunction (copy), FoundationModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), SquadComponentAccessWrapperModule (copy), SquadJoinButtonModule (copy), EnumScreensModule (copy), SquadButtonSourceEnum (copy), HeaderBarTitleLeftAlignedModule (copy), ChatTopBarBaseModule (copy), noOp (copy)
	local ScreenName = p1.screenName
	local Navigation = p1.navigation
	local UseSignalStateResult = UseSignalStateFunction((GetTopBarStoreModule(false).getScreenTopBar(ScreenName)))
	local HeaderText = UseSignalStateResult.headerText or {}
	local BackButtonEnabled = UseSignalStateResult.backButtonEnabled
	local IsRoot = UseSignalStateResult.isRoot
	local ConversationId = UseSignalStateResult.conversationId
	local UseCallButtonEligibilityModuleResult = if FFlagFriendsCallingClientGateDEV then UseCallButtonEligibilityModule(ConversationId) else nil
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
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagFriendsCallingClientGateDEV (upval), UseCallButtonEligibilityModuleResult (copy), ConversationChannelsModule (upval), ConversationId (copy)
		if not FFlagFriendsCallingClientGateDEV or UseCallButtonEligibilityModuleResult ~= ConversationChannelsModule.CallButtonEligibility.Eligible then return end
		if ConversationId then
			local CallingService = game:GetService("CallingService")
			task.spawn(function()
				-- upvalues: CallingService (copy), ConversationId (upval)
				pcall(function()
					-- upvalues: CallingService (upval), ConversationId (upval)
					CallingService:CreateCallAsync({}, ConversationId)
				end)
			end)
		end
	end, {
		ConversationId or false,
		UseCallButtonEligibilityModuleResult or false
	})
	local IsUseCallButtonEligibilityModuleResultMatch: boolean = FFlagFriendsCallingClientGateDEV and (ConversationId ~= nil and UseCallButtonEligibilityModuleResult == ConversationChannelsModule.CallButtonEligibility.Eligible)
	local HasConversationId: boolean = not FFlagFriendsCallingClientGateDEV and (GetFFlagIsSquadEnabledFunction() and ConversationId ~= nil)
	local RenderRight = if IsUseCallButtonEligibilityModuleResultMatch then function()
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