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
	[reactModule.Change.AbsoluteSize] = function(_) end
}

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useCursor (ref), foundationModule (ref), useTokens (ref), useStyle (ref), useSelectedTheme (ref), reactModule (ref), colorMode (ref), colorSystem (ref), unfilteredMessageColorConfigModule (ref), BUBBLE_VARIANTS (ref), chatBubbleEnumModule (ref), chatBubbleGroupableModule (ref), repliedToMarkerModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useCursor(foundationModule.Enums.CursorType.RoundedSlot)
	local var3 = useTokens()
	local var4 = useStyle()
	local children = var1.children or {}
	local isIncoming = var1.isIncoming
	local isPending = var1.isPending
	local isUnfiltered = var1.isUnfiltered
	local var5 = useSelectedTheme()
	local var6, var7 = reactModule.useState(var4.Theme.UIDefault)
	
	local function setBubbleStyle()
		-- upvalues: var1 (ref), var5 (ref), colorMode (copy), colorSystem (copy), var3 (ref), isIncoming (ref), isUnfiltered (ref), var7 (ref)
		var7(if var1.isRepliedTo then {
			Transparency = 0,
			Color = if var5 == string.lower(colorMode.Light) then colorSystem.Gray[30] else colorSystem.Gray[90]
		} elseif var1.isAssetCard then {
			Color = var3.Color.Shift.Shift_400.Color3,
			Transparency = var3.Color.Shift.Shift_400.Transparency
		} elseif isIncoming then {
			Color = var3.Color.Shift.Shift_400.Color3,
			Transparency = var3.Color.Shift.Shift_400.Transparency
		} elseif isUnfiltered then {
			Color = var3.Color.System.Emphasis.Color3,
			Transparency = var3.Color.System.Emphasis.Transparency
		} else {
			Color = var3.Color.Extended.Gray.Gray_600.Color3,
			Transparency = var3.Color.Extended.Gray.Gray_600.Transparency
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
	
	return (function()
		-- upvalues: reactModule (copy), foundationModule (copy), var1 (ref), var2 (ref), isIncoming (ref), chatBubbleEnumModule (copy), chatBubbleGroupableModule (copy), children (ref), var6 (ref), BUBBLE_VARIANTS (copy), repliedToMarkerModule (copy)
		local createElement = reactModule.createElement
		local view = foundationModule.View
		local t = {
			tag = "auto-xy size-0-0",
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			LayoutOrder = var1.LayoutOrder,
			selection = { Selectable = true, SelectionImageObject = var2 },
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
			imageStyle = { Color3 = var6.Color, Transparency = var6.Transparency },
			padding = var1.padding
		}
		local hasTail = var1.hasTail
		local isLastMessageInMessageGroup = var1.isLastMessageInMessageGroup
		t_2.variant = if hasTail and isLastMessageInMessageGroup or var1.isRepliedTo then BUBBLE_VARIANTS.SINGLE elseif hasTail then BUBBLE_VARIANTS.TOP elseif isLastMessageInMessageGroup then BUBBLE_VARIANTS.BOTTOM else BUBBLE_VARIANTS.MIDDLE
		t_1.bubble = createElement_1(chatBubbleGroupableModule, t_2)
		t_1.repliedToMarker = if var1.isRepliedTo then reactModule.createElement(repliedToMarkerModule, {
			isIncoming = isIncoming,
			layoutOrder = if var1.isIncoming then 0 else 2
		}) else nil
		
		return createElement(view, t, t_1)
	end)()
end)