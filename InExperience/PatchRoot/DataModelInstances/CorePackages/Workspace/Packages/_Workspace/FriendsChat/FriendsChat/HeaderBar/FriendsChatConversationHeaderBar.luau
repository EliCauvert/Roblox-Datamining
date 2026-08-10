local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local expChatSharedModule = require(parent.ExpChatShared)
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local friendsChatFacePileModule = require(script.Parent.FriendsChatFacePile)
local resolveFadeModule = require(script.Parent.Parent.Utils.resolveFade)
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local buttonVariant = foundationModule.Enums.ButtonVariant
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local name = expChatSharedModule.Logger:new(script.Name)

return function(p0) --[[ line: 73 | named "FriendsChatConversationHeaderBar" ]]
	-- upvalues: useTokens (ref), useChatWindowSettingsModule (ref), reactModule (ref), useInterpolatedClientSettingsModule (ref), name (ref), resolveFadeModule (ref), view (ref), iconButton (ref), iconName (ref), buttonVariant (ref), buttonSize (ref), friendsChatFacePileModule (ref)
	local var8 = useTokens()
	local var9 = useChatWindowSettingsModule()
	local chatWindowSettings = p0.chatWindowSettings
	local var10 = useInterpolatedClientSettingsModule(chatWindowSettings or reactModule.useMemo(function() --[[ line: 76 ]]
		-- upvalues: var9 (ref)
		return {
			BackgroundColor3 = var9.ChatWindowBackgroundColor3,
			BackgroundTransparency = var9.ChatWindowBackgroundTransparency
		}
	end, { var9 }))
	local var11 = if chatWindowSettings then chatWindowSettings.FontFace else nil
	local var12 = reactModule.useMemo(function() --[[ line: 94 ]]
		-- upvalues: var11 (ref), var8 (ref)
		if var11 == nil then
			return nil
		end
		local cloned = table.clone(var8.Typography.TitleMedium)
		cloned.Font = if typeof(var11) == "Font" then Font.new(var11.Family, Enum.FontWeight.Bold, var11.Style) else var11
		
		return { title = cloned }
	end, { var8, var11 })
	local onBack = p0.onBack
	local var13 = reactModule.useCallback(function() --[[ line: 112 ]]
		-- upvalues: name (copy), onBack (ref)
		name:info("Back button activated")
		
		if onBack then
			onBack()
		end
	end, { onBack })
	local var14 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 120 ]]
		-- upvalues: var14 (ref), p0 (ref)
		local current = var14.current
		
		if current and p0.onAbsoluteSizeChanged then
			p0.onAbsoluteSizeChanged(current)
		end
	end, { p0.onAbsoluteSizeChanged })
	
	return reactModule.createElement("Frame", {
		Name = "FriendsChatConversationHeaderBar",
		BackgroundColor3 = var10.BackgroundColor3 or var8.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = if p0.suppressBackground then 1 else resolveFadeModule(var10.BackgroundTransparency, p0.transparencyValue),
		Active = p0.interactable == nil or p0.interactable,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p0.layoutOrder,
		ZIndex = p0.zIndex,
		[reactModule.Change.AbsoluteSize] = p0.onAbsoluteSizeChanged,
		[reactModule.Event.MouseEnter] = p0.onHovered,
		[reactModule.Event.MouseLeave] = p0.onUnhovered,
		ref = var14
	}, {
		Content = reactModule.createElement("CanvasGroup", {
			Name = "FriendsChatConversationHeaderContent",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			GroupTransparency = resolveFadeModule(0, p0.transparencyValue),
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			Interactable = p0.interactable,
			ZIndex = p0.zIndex
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
					onActivated = var13
				}),
				FacePileContainer = reactModule.createElement(view, { tag = "fill size-0-800", LayoutOrder = 2 }, {
					FacePile = reactModule.createElement(friendsChatFacePileModule, {
						participantUserIds = p0.participantUserIds,
						localUserId = p0.localUserId,
						titleText = p0.titleText,
						titleStyle = if var12 then var12.title else nil,
						onActivated = p0.onActivated,
						selectable = if p0.onActivated ~= nil then nil else true
					})
				})
			})
		})
	})
end