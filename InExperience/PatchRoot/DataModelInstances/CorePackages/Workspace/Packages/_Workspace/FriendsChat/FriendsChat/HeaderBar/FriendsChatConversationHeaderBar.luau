local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local UseInterpolatedClientSettingsModule = require(Parent.ExpChatIntegration.useInterpolatedClientSettings)
local UseChatWindowSettingsModule = require(Parent.ExpChatIntegration.useChatWindowSettings)
local FFlagFriendsChatAddTopBarDividerModule = require(script.Parent.Parent.Flags.FFlagFriendsChatAddTopBarDivider)
local FriendsChatFacePileModule = require(script.Parent.FriendsChatFacePile)
local ResolveFadeModule = require(script.Parent.Parent.Utils.resolveFade)
local FFlagFriendsCallingClientGateDEV = require(Parent.SharedFlags).FFlagFriendsCallingClientGate_DEV
local UseIsCallButtonEligibleModule = if FFlagFriendsCallingClientGateDEV then require(Parent.AppChat.useIsCallButtonEligible) else nil
local StartConversationCallModule = if FFlagFriendsCallingClientGateDEV then require(Parent.AppChat.startConversationCall) else nil
local View = FoundationModule.View
local Divider = FoundationModule.Divider
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NewResult = ExpChatSharedModule.Logger:new(script.Name)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseChatWindowSettingsModule (copy), ReactModule (copy), UseInterpolatedClientSettingsModule (copy), NewResult (copy), FFlagFriendsCallingClientGateDEV (copy), UseIsCallButtonEligibleModule (copy), StartConversationCallModule (copy), ResolveFadeModule (copy), View (copy), IconButton (copy), IconName (copy), ButtonVariant (copy), ButtonSize (copy), FriendsChatFacePileModule (copy), InputSize (copy), FFlagFriendsChatAddTopBarDividerModule (copy), Divider (copy)
	local UseTokensResult = UseTokensFunction()
	local UseChatWindowSettingsModuleResult = UseChatWindowSettingsModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseChatWindowSettingsModuleResult (copy)
		return {
			BackgroundColor3 = UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3,
			BackgroundTransparency = UseChatWindowSettingsModuleResult.ChatWindowBackgroundTransparency
		}
	end, { UseChatWindowSettingsModuleResult })
	local ChatWindowSettings = p1.chatWindowSettings
	local UseInterpolatedClientSettingsModuleResult = UseInterpolatedClientSettingsModule(ChatWindowSettings or UseMemoResult)
	local FontFace = if ChatWindowSettings then ChatWindowSettings.FontFace else nil
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FontFace (copy), UseTokensResult (copy)
		if FontFace == nil then
			return nil
		else
			local Copy = table.clone(UseTokensResult.Typography.TitleMedium)
			Copy.Font = if typeof(FontFace) == "Font" then Font.new(FontFace.Family, Enum.FontWeight.Bold, FontFace.Style) else FontFace
			
			return { title = Copy }
		end
	end, { UseTokensResult, FontFace })
	local OnBackFunction = p1.onBack
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NewResult (upval), OnBackFunction (copy)
		NewResult:info("Back button activated")
		
		if OnBackFunction then
			OnBackFunction()
		end
	end, { OnBackFunction })
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), p1 (copy)
		local Current = UseRefResult.current
		
		if Current and p1.onAbsoluteSizeChanged then
			p1.onAbsoluteSizeChanged(Current)
		end
	end, { p1.onAbsoluteSizeChanged })
	local ConversationId = p1.conversationId
	local UseIsCallButtonEligibleModuleResult = if FFlagFriendsCallingClientGateDEV and UseIsCallButtonEligibleModule then UseIsCallButtonEligibleModule(ConversationId) else false
	local UseResult1 = if StartConversationCallModule == nil then nil else ReactModule.useCallback(function()
		-- upvalues: ConversationId (copy), StartConversationCallModule (upval)
		if ConversationId ~= nil then
			StartConversationCallModule(ConversationId)
			
			return
		end
	end, { ConversationId })
	
	return ReactModule.createElement("Frame", {
		Name = "FriendsChatConversationHeaderBar",
		BackgroundColor3 = UseInterpolatedClientSettingsModuleResult.BackgroundColor3 or UseTokensResult.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = if p1.suppressBackground then 1 else ResolveFadeModule(UseInterpolatedClientSettingsModuleResult.BackgroundTransparency, p1.transparencyValue),
		Active = p1.interactable == nil or p1.interactable,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex,
		[ReactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged,
		[ReactModule.Event.MouseEnter] = p1.onHovered,
		[ReactModule.Event.MouseLeave] = p1.onUnhovered,
		ref = UseRefResult
	}, {
		Content = ReactModule.createElement("CanvasGroup", {
			Name = "FriendsChatConversationHeaderContent",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			GroupTransparency = ResolveFadeModule(0, p1.transparencyValue),
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			Interactable = p1.interactable,
			ZIndex = p1.zIndex
		}, {
			Row = ReactModule.createElement(View, {
				tag = "row align-y-center gap-small size-full-0 auto-y padding-x-small padding-y-small"
			}, {
				BackButton = ReactModule.createElement(IconButton, {
					testId = "friends-chat-back-button",
					LayoutOrder = 1,
					icon = IconName.ChevronLargeLeft,
					variant = ButtonVariant.Utility,
					size = ButtonSize.XSmall,
					onActivated = UseResult,
					ref = p1.backButtonRef
				}),
				FacePileContainer = ReactModule.createElement(View, { tag = "fill size-0-800", LayoutOrder = 2 }, {
					FacePile = ReactModule.createElement(FriendsChatFacePileModule, {
						participantUserIds = p1.participantUserIds,
						localUserId = p1.localUserId,
						titleText = p1.titleText,
						titleStyle = if UseMemoResult1 then UseMemoResult1.title else nil,
						onActivated = p1.onActivated,
						selectable = p1.onActivated ~= nil or nil
					})
				}),
				CallButton = if FFlagFriendsCallingClientGateDEV and ConversationId and UseIsCallButtonEligibleModuleResult and UseResult1 then ReactModule.createElement(IconButton, {
					isCircular = true,
					testId = "friends-chat-call-button",
					LayoutOrder = 3,
					icon = IconName.Phone,
					size = InputSize.Small,
					onActivated = UseResult1
				}) else nil
			}),
			BottomDivider = if FFlagFriendsChatAddTopBarDividerModule then ReactModule.createElement(Divider, {
				Position = UDim2.new(0, 0, 1, -1),
				Size = UDim2.new(1, 0, 0, 1),
				ZIndex = p1.zIndex
			}) else nil
		})
	})
end