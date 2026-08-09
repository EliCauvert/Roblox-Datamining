local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local expChatSharedModule = require(parent.ExpChatShared)
local configModule = require(expChat.Config)
local useInterpolatedClientSettingsModule = require(expChat.ClientSettings.useInterpolatedClientSettings)
local friendsChatFacePileModule = require(script.Parent.FriendsChatFacePile)
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local buttonVariant = foundationModule.Enums.ButtonVariant
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local name = expChatSharedModule.Logger:new(script.Name)
local t = {
	BackgroundColor3 = configModule.ChatWindowBackgroundColor3,
	BackgroundTransparency = configModule.ChatWindowBackgroundTransparency
}

local function _(p0, p1) --[[ line: 79 | named "resolveFade" ]]
	return if type(p1) == "number" then p0 + p1 * (1 - p0) elseif p1 == nil then p0 else p1:map(function(p2) --[[ line: 83 ]]
		-- upvalues: p0 (ref)
		return p0 + p2 * (1 - p0)
	end)
end

return function(p3) --[[ line: 90 | named "FriendsChatConversationHeaderBar" ]]
	-- upvalues: useTokens (ref), useInterpolatedClientSettingsModule (ref), t (ref), reactModule (ref), name (ref), view (ref), iconButton (ref), iconName (ref), buttonVariant (ref), buttonSize (ref), friendsChatFacePileModule (ref)
	local var19
	local var9 = useTokens()
	local chatWindowSettings = p3.chatWindowSettings
	local var10 = useInterpolatedClientSettingsModule(chatWindowSettings or t)
	local var11 = if chatWindowSettings then chatWindowSettings.FontFace else nil
	local var12 = reactModule.useMemo(function() --[[ line: 104 ]]
		-- upvalues: var11 (ref), var9 (ref)
		if var11 == nil then
			return nil
		end
		local cloned = table.clone(var9.Typography.TitleMedium)
		cloned.Font = if typeof(var11) == "Font" then Font.new(var11.Family, Enum.FontWeight.Bold, var11.Style) else var11
		
		return { title = cloned }
	end, { var9, var11 })
	local onBack = p3.onBack
	local var13 = reactModule.useCallback(function() --[[ line: 122 ]]
		-- upvalues: name (copy), onBack (ref)
		name:info("Back button activated")
		
		if onBack then
			onBack()
		end
	end, { onBack })
	local createElement = reactModule.createElement
	local var14 = "Frame"
	local t_1 = {
		BackgroundColor3 = var10.BackgroundColor3 or var9.Color.Surface.Surface_0.Color3
	}
	local backgroundTransparency = var10.BackgroundTransparency
	local transparencyValue = p3.transparencyValue
	t_1.BackgroundTransparency = if type(transparencyValue) == "number" then backgroundTransparency + transparencyValue * (1 - backgroundTransparency) elseif transparencyValue ~= nil then backgroundTransparency else transparencyValue:map(function(p4) --[[ line: 83 ]]
		-- upvalues: backgroundTransparency (ref)
		return backgroundTransparency + p4 * (1 - backgroundTransparency)
	end)
	t_1.Active = true
	t_1.BorderSizePixel = 0
	t_1.AutomaticSize = Enum.AutomaticSize.Y
	t_1.Size = UDim2.new(1, 0, 0, 0)
	t_1.LayoutOrder = p3.layoutOrder
	t_1[reactModule.Event.MouseEnter] = p3.onHovered
	t_1[reactModule.Event.MouseLeave] = p3.onUnhovered
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local var17 = "CanvasGroup"
	local t_3 = { BackgroundTransparency = 1, BorderSizePixel = 0 }
	local transparencyValue_1 = p3.transparencyValue
	
	if type(transparencyValue_1) == "number" then
		var19 = 0 + transparencyValue_1 * 1
	elseif transparencyValue_1 == nil then
		var19 = 0
	else
		local var20 = 0
		var19 = transparencyValue_1:map(function(p5) --[[ line: 83 ]]
			-- upvalues: var20 (ref)
			return var20 + p5 * (1 - var20)
		end)
	end
	t_3.GroupTransparency = var19
	t_3.AutomaticSize = Enum.AutomaticSize.Y
	t_3.Size = UDim2.new(1, 0, 0, 0)
	t_2.Content = createElement_1(var17, t_3, {
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
					participantUserIds = p3.participantUserIds,
					localUserId = p3.localUserId,
					titleText = p3.titleText,
					titleStyle = if var12 then var12.title else nil
				})
			})
		})
	})
	
	return createElement(var14, t_1, t_2)
end