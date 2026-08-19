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
	[reactModule.Change.AbsoluteSize] = function(_) --[[ line: 48 ]] end
}

return reactModule.memo(function(p0) --[[ line: 51 | named "ChatBubbleContainer" ]]
	-- upvalues: cryoModule (ref), t (ref), useCursor (ref), foundationModule (ref), useTokens (ref), useStyle (ref), useSelectedTheme (ref), reactModule (ref), colorMode (ref), colorSystem (ref), unfilteredMessageColorConfigModule (ref), BUBBLE_VARIANTS (ref), chatBubbleEnumModule (ref), chatBubbleGroupableModule (ref), repliedToMarkerModule (ref)
	local var10 = cryoModule.Dictionary.join(t, p0)
	local var11 = useCursor(foundationModule.Enums.CursorType.RoundedSlot)
	local var12 = useTokens()
	local var13 = useStyle()
	local children = var10.children or {}
	local isIncoming = var10.isIncoming
	local isPending = var10.isPending
	local isUnfiltered = var10.isUnfiltered
	local var15 = useSelectedTheme()
	local var16, var17 = reactModule.useState(var13.Theme.UIDefault)
	
	local function setBubbleStyle() --[[ line: 66 ]]
		-- upvalues: var10 (ref), var15 (ref), colorMode (copy), colorSystem (copy), var12 (ref), isIncoming (ref), isUnfiltered (ref), var17 (ref)
		var17(if var10.isRepliedTo then {
			Transparency = 0,
			Color = if var15 == string.lower(colorMode.Light) then colorSystem.Gray[30] else colorSystem.Gray[90]
		} elseif var10.isAssetCard then {
			Color = var12.Color.Shift.Shift_400.Color3,
			Transparency = var12.Color.Shift.Shift_400.Transparency
		} elseif isIncoming then {
			Color = var12.Color.Shift.Shift_400.Color3,
			Transparency = var12.Color.Shift.Shift_400.Transparency
		} elseif isUnfiltered then {
			Color = var12.Color.System.Emphasis.Color3,
			Transparency = var12.Color.System.Emphasis.Transparency
		} else {
			Color = var12.Color.Extended.Gray.Gray_600.Color3,
			Transparency = var12.Color.Extended.Gray.Gray_600.Transparency
		})
	end
	
	local function setPressedBubbleStyle() --[[ line: 104 ]]
		-- upvalues: var10 (ref), isIncoming (ref), var15 (ref), colorMode (copy), colorSystem (copy), isUnfiltered (ref), unfilteredMessageColorConfigModule (copy), var17 (ref)
		if var10.isRepliedTo or var10.isPending then return end
		local _ = nil
		var17(if isIncoming then {
			Transparency = 0.35,
			Color = if var15 == string.lower(colorMode.Light) then colorSystem.Gray[50] else colorSystem.Gray[70]
		} elseif isUnfiltered and not var10.isAssetCard then {
			Color = if var15 == colorMode.Light then unfilteredMessageColorConfigModule.UnfilteredMessagePressedLightColor3 else unfilteredMessageColorConfigModule.UnfilteredMessagePressedDarkColor3,
			Transparency = unfilteredMessageColorConfigModule.UnfilteredMessageTransparency
		} else {
			Transparency = 0.4,
			Color = if var15 == string.lower(colorMode.Light) then colorSystem.Gray[50] else colorSystem.Gray[70]
		})
	end
	
	reactModule.useLayoutEffect(function() --[[ line: 139 ]]
		-- upvalues: var10 (ref), setPressedBubbleStyle (ref), setBubbleStyle (ref)
		if var10.isPressed then
			setPressedBubbleStyle()
			
			return
		end
		setBubbleStyle()
	end, {
		var10.isPressed, var10.isRepliedTo, var15, isIncoming, isPending, isUnfiltered,
		var10.isAssetCard
	})
	
	local function _(p1, p2, p3) --[[ line: 157 | named "getBubbleVariant" ]]
		-- upvalues: BUBBLE_VARIANTS (copy)
		return if p1 and p2 or p3 then BUBBLE_VARIANTS.SINGLE elseif p1 then BUBBLE_VARIANTS.TOP elseif p2 then BUBBLE_VARIANTS.BOTTOM else BUBBLE_VARIANTS.MIDDLE
	end
	
	return (function() --[[ line: 173 | named "renderGroupedBubbleUI" ]]
		-- upvalues: reactModule (copy), foundationModule (copy), var10 (ref), var11 (ref), isIncoming (ref), chatBubbleEnumModule (copy), chatBubbleGroupableModule (copy), children (ref), var16 (ref), BUBBLE_VARIANTS (copy), repliedToMarkerModule (copy)
		local createElement = reactModule.createElement
		local view = foundationModule.View
		local t = {
			tag = "auto-xy size-0-0",
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			LayoutOrder = var10.LayoutOrder,
			selection = { Selectable = true, SelectionImageObject = var11 },
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = if isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
				Padding = UDim.new(0, chatBubbleEnumModule.REPLIED_TO_MARKER_GAP)
			}
		}
		local t_1 = {}
		local createElement_1 = reactModule.createElement
		local t_2 = {
			layoutOrder = 1,
			alignment = if isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
			children = children,
			imageStyle = { Color3 = var16.Color, Transparency = var16.Transparency },
			padding = var10.padding
		}
		local hasTail = var10.hasTail
		local isLastMessageInMessageGroup = var10.isLastMessageInMessageGroup
		t_2.variant = if hasTail and isLastMessageInMessageGroup or var10.isRepliedTo then BUBBLE_VARIANTS.SINGLE elseif hasTail then BUBBLE_VARIANTS.TOP elseif isLastMessageInMessageGroup then BUBBLE_VARIANTS.BOTTOM else BUBBLE_VARIANTS.MIDDLE
		t_1.bubble = createElement_1(chatBubbleGroupableModule, t_2)
		t_1.repliedToMarker = if var10.isRepliedTo then reactModule.createElement(repliedToMarkerModule, {
			isIncoming = isIncoming,
			layoutOrder = if var10.isIncoming then 0 else 2
		}) else nil
		
		return createElement(view, t, t_1)
	end)()
end)