local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local colorSystem = UIBloxModule.Common.Style.ColorSystem
local cryoModule = require(parent.Cryo)
local chatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local chatBubbleGroupableModule = require(script.Parent.ChatBubbleGroupable)
local useStyle = UIBloxModule.Core.Style.useStyle
local useSelectedTheme = require(parent.RoactUtils).Hooks.useSelectedTheme
local repliedToMarkerModule = require(script.Parent.RepliedToMarker)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useCursor = foundationModule.Hooks.useCursor
local colorMode = foundationModule.Enums.ColorMode
local unfilteredMessageColorConfigModule = require(appChat.Flags.unfilteredMessageColorConfig)
local fFlagAppChatConsoleFocusFixesModule = require(appChat.Flags.FFlagAppChatConsoleFocusFixes)
local BUBBLE_VARIANTS = chatBubbleEnumModule.BUBBLE_VARIANTS
local t = {
	isIncoming = false,
	hasTail = false,
	padding = 12,
	LayoutOrder = 0,
	isPending = false,
	isUnfiltered = false,
	isAssetCard = false,
	isRepliedTo = false,
	isPressed = false,
	isLastMessageInMessageGroup = false,
	[reactModule.Change.AbsoluteSize] = function(_) end
}

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useCursor (ref), fFlagAppChatConsoleFocusFixesModule (ref), foundationModule (ref), useStyle (ref), useSelectedTheme (ref), reactModule (ref), colorMode (ref), colorSystem (ref), unfilteredMessageColorConfigModule (ref), BUBBLE_VARIANTS (ref), chatBubbleEnumModule (ref), chatBubbleGroupableModule (ref), repliedToMarkerModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useTokens()
	local var3 = useCursor(if fFlagAppChatConsoleFocusFixesModule then { radius = UDim.new(0, var2.Size.Size_500) } else foundationModule.Enums.CursorType.RoundedSlot)
	local var4 = useStyle()
	local children = var1.children or {}
	local isIncoming = var1.isIncoming
	local isPending = var1.isPending
	local isUnfiltered = var1.isUnfiltered
	local var5 = useSelectedTheme()
	local var6, var7 = reactModule.useState(var4.Theme.UIDefault)
	
	local function setBubbleStyle()
		-- upvalues: var1 (ref), var5 (ref), colorMode (copy), colorSystem (copy), var2 (ref), isIncoming (ref), isUnfiltered (ref), var7 (ref)
		var7(if var1.isRepliedTo then {
			Transparency = 0,
			Color = if var5 == string.lower(colorMode.Light) then colorSystem.Gray[30] else colorSystem.Gray[90]
		} elseif var1.isAssetCard then {
			Color = var2.Color.Shift.Shift_400.Color3,
			Transparency = var2.Color.Shift.Shift_400.Transparency
		} elseif isIncoming then {
			Color = var2.Color.Shift.Shift_400.Color3,
			Transparency = var2.Color.Shift.Shift_400.Transparency
		} elseif isUnfiltered then {
			Color = var2.Color.System.Emphasis.Color3,
			Transparency = var2.Color.System.Emphasis.Transparency
		} else {
			Color = var2.Color.Extended.Gray.Gray_600.Color3,
			Transparency = var2.Color.Extended.Gray.Gray_600.Transparency
		})
	end
	
	local function setPressedBubbleStyle()
		-- upvalues: var1 (ref), isIncoming (ref), var5 (ref), colorMode (copy), colorSystem (copy), isUnfiltered (ref), unfilteredMessageColorConfigModule (copy), var7 (ref)
		if var1.isRepliedTo or var1.isPending then return end
		local _ = nil
		var7(if isIncoming then {
			Transparency = 0.35,
			Color = if var5 == string.lower(colorMode.Light) then colorSystem.Gray[50] else colorSystem.Gray[70]
		} elseif isUnfiltered and not var1.isAssetCard then {
			Color = if var5 == colorMode.Light then unfilteredMessageColorConfigModule.UnfilteredMessagePressedLightColor3 else unfilteredMessageColorConfigModule.UnfilteredMessagePressedDarkColor3,
			Transparency = unfilteredMessageColorConfigModule.UnfilteredMessageTransparency
		} else {
			Transparency = 0.4,
			Color = if var5 == string.lower(colorMode.Light) then colorSystem.Gray[50] else colorSystem.Gray[70]
		})
	end
	
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), setPressedBubbleStyle (ref), setBubbleStyle (ref)
		if var1.isPressed then
			setPressedBubbleStyle()
			
			return
		end
		setBubbleStyle()
	end, {
		var1.isPressed, var1.isRepliedTo, var5, isIncoming, isPending, isUnfiltered,
		var1.isAssetCard
	})
	
	local function _(p2, p3, p4)
		-- upvalues: BUBBLE_VARIANTS (copy)
		return if p2 and p3 or p4 then BUBBLE_VARIANTS.SINGLE elseif p2 then BUBBLE_VARIANTS.TOP elseif p3 then BUBBLE_VARIANTS.BOTTOM else BUBBLE_VARIANTS.MIDDLE
	end
	
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t_1 = {
		tag = "size-0-0 auto-xy",
		BackgroundTransparency = 1,
		LayoutOrder = var1.LayoutOrder,
		selection = {
			Selectable = if fFlagAppChatConsoleFocusFixesModule then not var1.isRepliedTo else true,
			SelectionImageObject = var3
		},
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = if isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
			Padding = UDim.new(0, chatBubbleEnumModule.REPLIED_TO_MARKER_GAP)
		},
		ref = if fFlagAppChatConsoleFocusFixesModule then var1.bubbleRef else nil
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local t_3 = {
		layoutOrder = 1,
		alignment = if isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
		children = children,
		imageStyle = { Color3 = var6.Color, Transparency = var6.Transparency },
		padding = var1.padding
	}
	local hasTail = var1.hasTail
	local isLastMessageInMessageGroup = var1.isLastMessageInMessageGroup
	t_3.variant = if hasTail and isLastMessageInMessageGroup or var1.isRepliedTo then BUBBLE_VARIANTS.SINGLE elseif hasTail then BUBBLE_VARIANTS.TOP elseif isLastMessageInMessageGroup then BUBBLE_VARIANTS.BOTTOM else BUBBLE_VARIANTS.MIDDLE
	t_2.bubble = createElement_1(chatBubbleGroupableModule, t_3)
	t_2.repliedToMarker = if var1.isRepliedTo then reactModule.createElement(repliedToMarkerModule, {
		isIncoming = isIncoming,
		layoutOrder = if var1.isIncoming then 0 else 2
	}) else nil
	
	return createElement(view, t_1, t_2)
end)