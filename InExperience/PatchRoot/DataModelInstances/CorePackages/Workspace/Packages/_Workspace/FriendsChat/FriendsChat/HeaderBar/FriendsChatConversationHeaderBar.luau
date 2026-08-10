local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local expChatSharedModule = require(parent.ExpChatShared)
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local friendsChatFacePileModule = require(script.Parent.FriendsChatFacePile)
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local buttonVariant = foundationModule.Enums.ButtonVariant
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local name = expChatSharedModule.Logger:new(script.Name)

local function _(p0, p1) --[[ line: 76 | named "resolveFade" ]]
	return if type(p1) == "number" then p0 + p1 * (1 - p0) elseif p1 == nil then p0 else p1:map(function(p2) --[[ line: 80 ]]
		-- upvalues: p0 (ref)
		return p0 + p2 * (1 - p0)
	end)
end

return function(p3) --[[ line: 87 | named "FriendsChatConversationHeaderBar" ]]
	-- upvalues: useTokens (ref), useChatWindowSettingsModule (ref), reactModule (ref), useInterpolatedClientSettingsModule (ref), name (ref), view (ref), iconButton (ref), iconName (ref), buttonVariant (ref), buttonSize (ref), friendsChatFacePileModule (ref)
	local var16
	local var7 = useTokens()
	local var8 = useChatWindowSettingsModule()
	local chatWindowSettings = p3.chatWindowSettings
	local var9 = useInterpolatedClientSettingsModule(chatWindowSettings or reactModule.useMemo(function() --[[ line: 90 ]]
		-- upvalues: var8 (ref)
		return {
			BackgroundColor3 = var8.ChatWindowBackgroundColor3,
			BackgroundTransparency = var8.ChatWindowBackgroundTransparency
		}
	end, { var8 }))
	local var10 = if chatWindowSettings then chatWindowSettings.FontFace else nil
	local var11 = reactModule.useMemo(function() --[[ line: 108 ]]
		-- upvalues: var10 (ref), var7 (ref)
		if var10 == nil then
			return nil
		end
		local cloned = table.clone(var7.Typography.TitleMedium)
		cloned.Font = if typeof(var10) == "Font" then Font.new(var10.Family, Enum.FontWeight.Bold, var10.Style) else var10
		
		return { title = cloned }
	end, { var7, var10 })
	local onBack = p3.onBack
	local var12 = reactModule.useCallback(function() --[[ line: 126 ]]
		-- upvalues: name (copy), onBack (ref)
		name:info("Back button activated")
		
		if onBack then
			onBack()
		end
	end, { onBack })
	local var13 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 134 ]]
		-- upvalues: var13 (ref), p3 (ref)
		local current = var13.current
		
		if current and p3.onAbsoluteSizeChanged then
			p3.onAbsoluteSizeChanged(current)
		end
	end, { p3.onAbsoluteSizeChanged })
	local createElement = reactModule.createElement
	local var14 = "Frame"
	local t = {
		Name = "FriendsChatConversationHeaderBar",
		BackgroundColor3 = var9.BackgroundColor3 or var7.Color.Surface.Surface_0.Color3
	}
	
	if p3.suppressBackground then
		var16 = 1
	else
		local backgroundTransparency = var9.BackgroundTransparency
		local transparencyValue = p3.transparencyValue
		var16 = if type(transparencyValue) == "number" then backgroundTransparency + transparencyValue * (1 - backgroundTransparency) elseif transparencyValue ~= nil then backgroundTransparency else transparencyValue:map(function(p4) --[[ line: 80 ]]
			-- upvalues: backgroundTransparency (ref)
			return backgroundTransparency + p4 * (1 - backgroundTransparency)
		end)
	end
	local var20
	t.BackgroundTransparency = var16
	t.Active = p3.interactable == nil or p3.interactable
	t.BorderSizePixel = 0
	t.AutomaticSize = Enum.AutomaticSize.Y
	t.Size = UDim2.new(1, 0, 0, 0)
	t.LayoutOrder = p3.layoutOrder
	t.ZIndex = p3.zIndex
	t[reactModule.Change.AbsoluteSize] = p3.onAbsoluteSizeChanged
	t[reactModule.Event.MouseEnter] = p3.onHovered
	t[reactModule.Event.MouseLeave] = p3.onUnhovered
	t.ref = var13
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var18 = "CanvasGroup"
	local t_2 = {
		Name = "FriendsChatConversationHeaderContent",
		BackgroundTransparency = 1,
		BorderSizePixel = 0
	}
	local transparencyValue = p3.transparencyValue
	
	if type(transparencyValue) == "number" then
		var20 = 0 + transparencyValue * 1
	elseif transparencyValue == nil then
		var20 = 0
	else
		local var21 = 0
		var20 = transparencyValue:map(function(p5) --[[ line: 80 ]]
			-- upvalues: var21 (ref)
			return var21 + p5 * (1 - var21)
		end)
	end
	t_2.GroupTransparency = var20
	t_2.AutomaticSize = Enum.AutomaticSize.Y
	t_2.Size = UDim2.new(1, 0, 0, 0)
	t_2.Interactable = p3.interactable
	t_2.ZIndex = p3.zIndex
	t_1.Content = createElement_1(var18, t_2, {
		Row = reactModule.createElement(view, {
			tag = "row align-y-center gap-small size-full-0 auto-y padding-x-small padding-y-small"
		}, {
			BackButton = reactModule.createElement(iconButton, {
				testId = "friends-chat-back-button",
				LayoutOrder = 1,
				icon = iconName.ChevronLargeLeft,
				variant = buttonVariant.Utility,
				size = buttonSize.XSmall,
				onActivated = var12
			}),
			FacePileContainer = reactModule.createElement(view, { tag = "fill size-0-800", LayoutOrder = 2 }, {
				FacePile = reactModule.createElement(friendsChatFacePileModule, {
					participantUserIds = p3.participantUserIds,
					localUserId = p3.localUserId,
					titleText = p3.titleText,
					titleStyle = if var11 then var11.title else nil,
					onActivated = p3.onActivated,
					selectable = if p3.onActivated ~= nil then nil else true
				})
			})
		})
	})
	
	return createElement(var14, t, t_1)
end