local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ColorSystem = UIBloxModule.Common.Style.ColorSystem
local CryoModule = require(Parent.Cryo)
local Constants = UIBloxModule.App.Style.Constants
local ChatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local ChatBubbleGroupableModule = require(script.Parent.ChatBubbleGroupable)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectedThemeFunction = require(Parent.RoactUtils).Hooks.useSelectedTheme
local RepliedToMarkerModule = require(script.Parent.RepliedToMarker)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCursorFunction = FoundationModule.Hooks.useCursor
local UnfilteredMessageColorConfigModule = require(AppChat.Flags.unfilteredMessageColorConfig)
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
	[ReactModule.Change.AbsoluteSize] = function(_) end
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseCursorFunction (copy), FoundationModule (copy), UseTokensFunction (copy), UseStyleFunction (copy), UseSelectedThemeFunction (copy), ReactModule (copy), Constants (copy), ColorSystem (copy), UnfilteredMessageColorConfigModule (copy), BUBBLEVARIANTS (copy), ChatBubbleEnumModule (copy), ChatBubbleGroupableModule (copy), RepliedToMarkerModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseCursorResult = UseCursorFunction(FoundationModule.Enums.CursorType.RoundedSlot)
	local UseTokensResult = UseTokensFunction()
	local UseStyleResult = UseStyleFunction()
	local Children = JoinResult.children or {}
	local IsIncoming = JoinResult.isIncoming
	local IsPending = JoinResult.isPending
	local IsUnfiltered = JoinResult.isUnfiltered
	local UseSelectedThemeResult = UseSelectedThemeFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseStyleResult.Theme.UIDefault)
	
	local function setBubbleStyle()
		-- upvalues: JoinResult (copy), UseSelectedThemeResult (copy), Constants (upval), ColorSystem (upval), UseTokensResult (copy), IsIncoming (copy), IsUnfiltered (copy), UseStateResult2 (copy)
		UseStateResult2(if JoinResult.isRepliedTo then {
			Transparency = 0,
			Color = if UseSelectedThemeResult == string.lower(Constants.ThemeName.Light) then ColorSystem.Gray[30] else ColorSystem.Gray[90]
		} elseif JoinResult.isAssetCard then {
			Color = UseTokensResult.Color.Shift.Shift_400.Color3,
			Transparency = UseTokensResult.Color.Shift.Shift_400.Transparency
		} elseif IsIncoming then {
			Color = UseTokensResult.Color.Shift.Shift_400.Color3,
			Transparency = UseTokensResult.Color.Shift.Shift_400.Transparency
		} elseif IsUnfiltered then {
			Color = UseTokensResult.Color.System.Emphasis.Color3,
			Transparency = UseTokensResult.Color.System.Emphasis.Transparency
		} else {
			Color = UseTokensResult.Color.Extended.Gray.Gray_600.Color3,
			Transparency = UseTokensResult.Color.Extended.Gray.Gray_600.Transparency
		})
	end
	
	local function setPressedBubbleStyle()
		-- upvalues: JoinResult (copy), IsIncoming (copy), UseSelectedThemeResult (copy), Constants (upval), ColorSystem (upval), IsUnfiltered (copy), UnfilteredMessageColorConfigModule (upval), UseStateResult2 (copy)
		if not JoinResult.isRepliedTo and not JoinResult.isPending then
			UseStateResult2(if IsIncoming then {
				Transparency = 0.35,
				Color = if UseSelectedThemeResult == string.lower(Constants.ThemeName.Light) then ColorSystem.Gray[50] else ColorSystem.Gray[70]
			} elseif IsUnfiltered and not JoinResult.isAssetCard then {
				Color = if UseSelectedThemeResult == Constants.ThemeName.Light then UnfilteredMessageColorConfigModule.UnfilteredMessagePressedLightColor3 else UnfilteredMessageColorConfigModule.UnfilteredMessagePressedDarkColor3,
				Transparency = UnfilteredMessageColorConfigModule.UnfilteredMessageTransparency
			} else {
				Transparency = 0.4,
				Color = if UseSelectedThemeResult == string.lower(Constants.ThemeName.Light) then ColorSystem.Gray[50] else ColorSystem.Gray[70]
			})
			
			return
		end
	end
	
	ReactModule.useLayoutEffect(function()
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
	
	local function _(p2, p3, p4)
		-- upvalues: BUBBLEVARIANTS (upval)
		return if p2 and p3 or p4 then BUBBLEVARIANTS.SINGLE elseif p2 then BUBBLEVARIANTS.TOP elseif p3 then BUBBLEVARIANTS.BOTTOM else BUBBLEVARIANTS.MIDDLE
	end
	
	return (function()
		-- upvalues: ReactModule (upval), FoundationModule (upval), JoinResult (copy), UseCursorResult (copy), IsIncoming (copy), ChatBubbleEnumModule (upval), ChatBubbleGroupableModule (upval), Children (copy), UseStateResult (copy), BUBBLEVARIANTS (upval), RepliedToMarkerModule (upval)
		local HasTail = JoinResult.hasTail
		local IsLastMessageInMessageGroup = JoinResult.isLastMessageInMessageGroup
		local IsRepliedTo = JoinResult.isRepliedTo
		
		return ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy size-0-0",
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			LayoutOrder = JoinResult.LayoutOrder,
			selection = {
				Selectable = true,
				SelectionImageObject = UseCursorResult
			},
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = IsIncoming and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right,
				Padding = UDim.new(0, ChatBubbleEnumModule.REPLIED_TO_MARKER_GAP)
			}
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
	end)()
end)