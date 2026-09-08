local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local expChatSharedModule = require(parent.ExpChatShared)
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local fFlagFriendsChatAddTopBarDividerModule = require(script.Parent.Parent.Flags.FFlagFriendsChatAddTopBarDivider)
local friendsChatFacePileModule = require(script.Parent.FriendsChatFacePile)
local resolveFadeModule = require(script.Parent.Parent.Utils.resolveFade)
local view = foundationModule.View
local divider = foundationModule.Divider
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local buttonVariant = foundationModule.Enums.ButtonVariant
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local name = expChatSharedModule.Logger:new(script.Name)

return function(p1)
	-- upvalues: useTokens (ref), useChatWindowSettingsModule (ref), reactModule (ref), useInterpolatedClientSettingsModule (ref), name (ref), resolveFadeModule (ref), view (ref), iconButton (ref), iconName (ref), buttonVariant (ref), buttonSize (ref), friendsChatFacePileModule (ref), fFlagFriendsChatAddTopBarDividerModule (ref), divider (ref)
	local var1 = useTokens()
	local var2 = useChatWindowSettingsModule()
	local chatWindowSettings = p1.chatWindowSettings
	local var3 = useInterpolatedClientSettingsModule(chatWindowSettings or reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		return {
			BackgroundColor3 = var2.ChatWindowBackgroundColor3,
			BackgroundTransparency = var2.ChatWindowBackgroundTransparency
		}
	end, { var2 }))
	local var4 = if chatWindowSettings then chatWindowSettings.FontFace else nil
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), var1 (ref)
		if var4 == nil then
			return nil
		end
		local cloned = table.clone(var1.Typography.TitleMedium)
		cloned.Font = if typeof(var4) == "Font" then Font.new(var4.Family, Enum.FontWeight.Bold, var4.Style) else var4
		
		return { title = cloned }
	end, { var1, var4 })
	local onBack = p1.onBack
	local var6 = reactModule.useCallback(function()
		-- upvalues: name (copy), onBack (ref)
		name:info("Back button activated")
		
		if onBack then
			onBack()
		end
	end, { onBack })
	local var7 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), p1 (ref)
		local current = var7.current
		
		if current and p1.onAbsoluteSizeChanged then
			p1.onAbsoluteSizeChanged(current)
		end
	end, { p1.onAbsoluteSizeChanged })
	
	return reactModule.createElement("Frame", {
		Name = "FriendsChatConversationHeaderBar",
		BackgroundColor3 = var3.BackgroundColor3 or var1.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = if p1.suppressBackground then 1 else resolveFadeModule(var3.BackgroundTransparency, p1.transparencyValue),
		Active = p1.interactable == nil or p1.interactable,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex,
		[reactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged,
		[reactModule.Event.MouseEnter] = p1.onHovered,
		[reactModule.Event.MouseLeave] = p1.onUnhovered,
		ref = var7
	}, {
		Content = reactModule.createElement("CanvasGroup", {
			Name = "FriendsChatConversationHeaderContent",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			GroupTransparency = resolveFadeModule(0, p1.transparencyValue),
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			Interactable = p1.interactable,
			ZIndex = p1.zIndex
		}, {
			Row = reactModule.createElement(view, {
				tag = "row align-y-center gap-small size-full-0 auto-y padding-x-small padding-y-small"
			}, {
				BackButton = reactModule.createElement(iconButton, {
					testId = "friends-chat-back-button",
					LayoutOrder = 1,
					icon = iconName.ChevronLargeLeft,
					variant = buttonVariant.Utility,
					size = buttonSize.XSmall,
					onActivated = var6
				}),
				FacePileContainer = reactModule.createElement(view, { tag = "fill size-0-800", LayoutOrder = 2 }, {
					FacePile = reactModule.createElement(friendsChatFacePileModule, {
						participantUserIds = p1.participantUserIds,
						localUserId = p1.localUserId,
						titleText = p1.titleText,
						titleStyle = if var5 then var5.title else nil,
						onActivated = p1.onActivated,
						selectable = if p1.onActivated ~= nil then nil else true
					})
				})
			}),
			BottomDivider = if fFlagFriendsChatAddTopBarDividerModule then reactModule.createElement(divider, {
				Position = UDim2.new(0, 0, 1, -1),
				Size = UDim2.new(1, 0, 0, 1),
				ZIndex = p1.zIndex
			}) else nil
		})
	})
end