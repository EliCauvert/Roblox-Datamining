local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ColorSystem = UIBloxModule.Common.Style.ColorSystem
local CryoModule = require(Parent.Cryo)
local ChatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local ChatBubbleGroupableModule = require(script.Parent.ChatBubbleGroupable)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectedThemeFunction = require(Parent.RoactUtils).Hooks.useSelectedTheme
local RepliedToMarkerModule = require(script.Parent.RepliedToMarker)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCursorFunction = FoundationModule.Hooks.useCursor
local ColorMode = FoundationModule.Enums.ColorMode
local UnfilteredMessageColorConfigModule = require(AppChat.Flags.unfilteredMessageColorConfig)
local FFlagAppChatConsoleFocusFixesModule = require(AppChat.Flags.FFlagAppChatConsoleFocusFixes)
local FFlagAppChatBlueSentBubblesModule = require(AppChat.Flags.FFlagAppChatBlueSentBubbles)
local FFlagAppChatBubbleThemeTokensModule = require(AppChat.Flags.FFlagAppChatBubbleThemeTokens)
local BUBBLEVARIANTS = ChatBubbleEnumModule.BUBBLE_VARIANTS
local config = {
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
	[ReactModule.Change.AbsoluteSize] = function(_) --[[ Line: 52 ]] end
}

return ReactModule.memo(function(p1) --[[ Line: 55 | Named "ChatBubbleContainer" ]]
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), UseCursorFunction (copy), FFlagAppChatConsoleFocusFixesModule (copy), FoundationModule (copy), UseStyleFunction (copy), UseSelectedThemeFunction (copy), ReactModule (copy), FFlagAppChatBubbleThemeTokensModule (copy), ColorMode (copy), ColorSystem (copy), FFlagAppChatBlueSentBubblesModule (copy), UnfilteredMessageColorConfigModule (copy), BUBBLEVARIANTS (copy), ChatBubbleEnumModule (copy), ChatBubbleGroupableModule (copy), RepliedToMarkerModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseTokensResult = UseTokensFunction()
	local UseCursorResult = UseCursorFunction(if FFlagAppChatConsoleFocusFixesModule then { radius = UDim.new(0, UseTokensResult.Size.Size_500) } else FoundationModule.Enums.CursorType.RoundedSlot)
	local UseStyleResult = UseStyleFunction()
	local Children = JoinResult.children or {}
	local IsIncoming = JoinResult.isIncoming
	local IsPending = JoinResult.isPending
	local IsUnfiltered = JoinResult.isUnfiltered
	local UseSelectedThemeResult = UseSelectedThemeFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseStyleResult.Theme.UIDefault)
	
	local function setBubbleStyle() --[[ Line: 74 ]]
		-- upvalues: JoinResult (copy), FFlagAppChatBubbleThemeTokensModule (upval), UseTokensResult (copy), UseSelectedThemeResult (copy), ColorMode (upval), ColorSystem (upval), IsIncoming (copy), IsUnfiltered (copy), FFlagAppChatBlueSentBubblesModule (upval), UseStateResult2 (copy)
		UseStateResult2(if JoinResult.isRepliedTo and FFlagAppChatBubbleThemeTokensModule then {
			Color = UseTokensResult.Color.Shift.Shift_200.Color3,
			Transparency = UseTokensResult.Color.Shift.Shift_200.Transparency
		} elseif JoinResult.isRepliedTo then {
			Transparency = 0,
			Color = if UseSelectedThemeResult == string.lower(ColorMode.Light) then ColorSystem.Gray[30] else ColorSystem.Gray[90]
		} elseif JoinResult.isAssetCard then {
			Color = UseTokensResult.Color.Shift.Shift_400.Color3,
			Transparency = UseTokensResult.Color.Shift.Shift_400.Transparency
		} elseif IsIncoming then {
			Color = UseTokensResult.Color.Shift.Shift_400.Color3,
			Transparency = UseTokensResult.Color.Shift.Shift_400.Transparency
		} elseif IsUnfiltered or FFlagAppChatBlueSentBubblesModule then {
			Color = UseTokensResult.Color.System.Emphasis.Color3,
			Transparency = UseTokensResult.Color.System.Emphasis.Transparency
		} else {
			Color = UseTokensResult.Color.Extended.Gray.Gray_600.Color3,
			Transparency = UseTokensResult.Color.Extended.Gray.Gray_600.Transparency
		})
	end
	
	local function setPressedBubbleStyle() --[[ Line: 118 ]]
		-- upvalues: JoinResult (copy), FFlagAppChatBubbleThemeTokensModule (upval), IsIncoming (copy), UseTokensResult (copy), IsUnfiltered (copy), FFlagAppChatBlueSentBubblesModule (upval), UseStateResult2 (copy), UseSelectedThemeResult (copy), ColorMode (upval), ColorSystem (upval), UnfilteredMessageColorConfigModule (upval)
		if JoinResult.isRepliedTo or JoinResult.isPending then return end
		if not FFlagAppChatBubbleThemeTokensModule then
			UseStateResult2(if IsIncoming then {
				Transparency = 0.35,
				Color = if UseSelectedThemeResult == string.lower(ColorMode.Light) then ColorSystem.Gray[50] else ColorSystem.Gray[70]
			} elseif IsUnfiltered or FFlagAppChatBlueSentBubblesModule then if JoinResult.isAssetCard then {
				Transparency = 0.4,
				Color = if UseSelectedThemeResult == string.lower(ColorMode.Light) then ColorSystem.Gray[50] else ColorSystem.Gray[70]
			} else {
				Color = if UseSelectedThemeResult == ColorMode.Light then UnfilteredMessageColorConfigModule.UnfilteredMessagePressedLightColor3 else UnfilteredMessageColorConfigModule.UnfilteredMessagePressedDarkColor3,
				Transparency = UnfilteredMessageColorConfigModule.UnfilteredMessageTransparency
			} else {
				Transparency = 0.4,
				Color = if UseSelectedThemeResult == string.lower(ColorMode.Light) then ColorSystem.Gray[50] else ColorSystem.Gray[70]
			})
			
			return
		end
		local config = nil
		if IsIncoming or JoinResult.isAssetCard then
			local Press = UseTokensResult.Color.State.Press
			config = { Color = Press.Color3, Transparency = Press.Transparency }
		else
			config = if IsUnfiltered or FFlagAppChatBlueSentBubblesModule then {
				Color = UseTokensResult.Color.Extended.Blue.Blue_1000.Color3,
				Transparency = UseTokensResult.Color.Extended.Blue.Blue_1000.Transparency
			} else {
				Color = UseTokensResult.Color.Extended.Gray.Gray_700.Color3,
				Transparency = UseTokensResult.Color.Extended.Gray.Gray_700.Transparency
			}
		end
		UseStateResult2(config)
	end
	
	ReactModule.useLayoutEffect(function() --[[ Line: 183 ]]
		-- upvalues: JoinResult (copy), setPressedBubbleStyle (copy), setBubbleStyle (copy)
		if JoinResult.isPressed then
			setPressedBubbleStyle()
			
			return
		else
			setBubbleStyle()
		end
	end, {
		JoinResult.isPressed, JoinResult.isRepliedTo, UseSelectedThemeResult,
		IsIncoming, IsPending, IsUnfiltered, JoinResult.isAssetCard
	})
	
	local function _(p2, p3, p4) --[[ Line: 201 | Named "getBubbleVariant" ]]
		-- upvalues: BUBBLEVARIANTS (upval)
		return if p2 and p3 or p4 then BUBBLEVARIANTS.SINGLE elseif p2 then BUBBLEVARIANTS.TOP elseif p3 then BUBBLEVARIANTS.BOTTOM else BUBBLEVARIANTS.MIDDLE
	end
	
	local HasTail = JoinResult.hasTail
	local IsLastMessageInMessageGroup = JoinResult.isLastMessageInMessageGroup
	local IsRepliedTo = JoinResult.isRepliedTo
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-0-0 auto-xy",
		BackgroundTransparency = 1,
		LayoutOrder = JoinResult.LayoutOrder,
		selection = {
			Selectable = not FFlagAppChatConsoleFocusFixesModule or not JoinResult.isRepliedTo,
			SelectionImageObject = UseCursorResult
		},
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = IsIncoming and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right,
			Padding = UDim.new(0, ChatBubbleEnumModule.REPLIED_TO_MARKER_GAP)
		},
		ref = if FFlagAppChatConsoleFocusFixesModule then JoinResult.bubbleRef else nil
	}, {
		bubble = ReactModule.createElement(ChatBubbleGroupableModule, {
			layoutOrder = 1,
			alignment = IsIncoming and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right,
			children = Children,
			imageStyle = {
				Color3 = UseStateResult.Color,
				Transparency = UseStateResult.Transparency
			},
			padding = JoinResult.padding,
			variant = if HasTail and IsLastMessageInMessageGroup then BUBBLEVARIANTS.SINGLE elseif IsRepliedTo then BUBBLEVARIANTS.SINGLE elseif HasTail then BUBBLEVARIANTS.TOP elseif IsLastMessageInMessageGroup then BUBBLEVARIANTS.BOTTOM else BUBBLEVARIANTS.MIDDLE
		}),
		repliedToMarker = if JoinResult.isRepliedTo then ReactModule.createElement(RepliedToMarkerModule, {
			isIncoming = IsIncoming,
			layoutOrder = if JoinResult.isIncoming then 0 else 2
		}) else nil
	})
end)