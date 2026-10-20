local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local ChatTopBarBaseModule = require(script.Parent.ChatTopBarBase)
local CreateBackFuncModule = require(script.Parent.createBackFunc)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local HeaderBarTitleLeftAlignedModule = require(AppChat.Components.ChatConversation.HeaderBarTitleLeftAligned)
local UseChatPlacementContextFunction = require(AppChat.Contexts.ChatPlacementContext).useChatPlacementContext
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppHeaderBarModule = require(Parent.AppHeaderBar)
local SquadJoinButtonModule = require(Parent.Squads.SquadJoinButton)
local SquadButtonSourceEnum = require(Parent.Squads.Enums).SquadButtonSourceEnum
local SquadComponentAccessWrapperModule = require(Parent.Squads.SquadComponentAccessWrapper)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

local function noOp()
	return nil
end

return function(p1)
	-- upvalues: FFlagAppChatTopBarConfigDrivenModule (copy), GetTopBarStoreModule (copy), UseSignalStateFunction (copy), UseChatPlacementContextFunction (copy), UseLocalizationFunction (copy), AppHeaderBarModule (copy), CreateBackFuncModule (copy), GetFFlagIsSquadEnabledFunction (copy), EnumScreensModule (copy), ReactModule (copy), FoundationModule (copy), SquadComponentAccessWrapperModule (copy), SquadJoinButtonModule (copy), SquadButtonSourceEnum (copy), HeaderBarTitleLeftAlignedModule (copy), ChatTopBarBaseModule (copy), noOp (copy)
	if not FFlagAppChatTopBarConfigDrivenModule() then
		return nil
	end
	local ScreenName = p1.screenName
	local Navigation = p1.navigation
	local UseSignalStateResult = UseSignalStateFunction((GetTopBarStoreModule(false).getScreenTopBar(ScreenName)))
	local HeaderText = UseSignalStateResult.headerText or {}
	local BackButtonEnabled = UseSignalStateResult.backButtonEnabled
	local IsRoot = UseSignalStateResult.isRoot
	local ConversationId = UseSignalStateResult.conversationId
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
	local RenderRight: (() -> any)? = nil
	
	if GetFFlagIsSquadEnabledFunction() and ConversationId then
		local function OnActivated()
			-- upvalues: Navigation (copy), EnumScreensModule (upval), ConversationId (copy)
			Navigation.navigate(EnumScreensModule.SquadLobby, { conversationId = ConversationId })
		end
		
		RenderRight = function()
			-- upvalues: ReactModule (upval), FoundationModule (upval), SquadComponentAccessWrapperModule (upval), ConversationId (copy), SquadJoinButtonModule (upval), OnActivated (copy), SquadButtonSourceEnum (upval), UseChatPlacementContextResult (copy)
			return ReactModule.createElement(FoundationModule.View, { tag = "row align-x-right auto-xy" }, {
				GroupUpButton = ReactModule.createElement(SquadComponentAccessWrapperModule, { parentChannelId = ConversationId }, ReactModule.createElement(SquadJoinButtonModule, {
					isFullWidth = false,
					isInCard = false,
					layoutOrder = 0,
					shouldAnimate = true,
					shouldShowSignifier = true,
					conversationId = ConversationId,
					onActivated = OnActivated,
					squadButtonSource = SquadButtonSourceEnum.ChatConversationScreen,
					squadLocation = UseChatPlacementContextResult.chatPlacement
				}))
			})
		end
	end
	return ReactModule.createElement(ChatTopBarBaseModule, {
		screenName = ScreenName,
		navigation = Navigation,
		renderLeft = noOp,
		renderCenter = function()
			-- upvalues: HeaderText (copy), UseLocalizationResult (copy), ReactModule (upval), HeaderBarTitleLeftAlignedModule (upval), BackButton (copy), RenderRight (ref), ConversationId (copy), NavigateToChatDetails (copy), RightPaddingOverride (copy)
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