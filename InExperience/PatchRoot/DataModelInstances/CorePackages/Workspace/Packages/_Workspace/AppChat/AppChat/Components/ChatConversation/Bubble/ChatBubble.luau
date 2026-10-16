local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local Object = require(Parent.LuauPolyfill).Object
local CryoModule = require(Parent.Cryo)
local ChatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local FoundationModule = require(Parent.Foundation)
local UseCursorFunction = FoundationModule.Hooks.useCursor
local config = {
	contentWidth = 0,
	isIncoming = false,
	isRepliedTo = false,
	imageTransparency = 0,
	padding = 0,
	hasTail = false,
	imageColor = Color3.new(0, 0, 0),
	onAbsoluteSizeChanged = function(_) --[[ Line: 35 ]] end,
	setContentWidth = function(_) --[[ Line: 36 ]] end,
	handleEvent = function(_) --[[ Line: 37 ]] end,
	containerChildren = {}
}

function ChatBubble(p1) --[[ Line: 49 ]]
	-- upvalues: UseCursorFunction (copy), FoundationModule (copy), CryoModule (copy), config (copy), ChatBubbleEnumModule (copy), ReactModule (copy), Object (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local _UDim = UDim.new(0, UnionResult.padding or config.padding)
	local NewTAILWIDTH = ChatBubbleEnumModule.TAIL_WIDTH + (if UnionResult.isRepliedTo then ChatBubbleEnumModule.REPLIED_TO_MARKER_WIDTH + ChatBubbleEnumModule.REPLIED_TO_MARKER_GAP else 0)
	
	return ReactModule.createElement("ImageLabel", {
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(0, UnionResult.contentWidth, 0, 0),
		AnchorPoint = UnionResult.isIncoming and Vector2.new(0, 0) or Vector2.new(1, 0),
		BackgroundTransparency = 1,
		ImageColor3 = UnionResult.imageColor,
		Image = if UnionResult.hasTail then if UnionResult.isIncoming then ChatBubbleEnumModule.RECEIVED_BUBBLE_WITH_TAIL else ChatBubbleEnumModule.SENT_BUBBLE_WITH_TAIL else ChatBubbleEnumModule.BUBBLE,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = ChatBubbleEnumModule.SLIDE_CENTER,
		ImageTransparency = UnionResult.imageTransparency,
		Position = if UnionResult.isIncoming then UDim2.new(0, NewTAILWIDTH, 0, 0) else UDim2.new(1, -NewTAILWIDTH, 0, 0),
		Selectable = not UnionResult.hasTail,
		SelectionImageObject = UseCursorFunction(FoundationModule.Enums.CursorType.RoundedRect),
		[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(p2) --[[ Line: 70 ]]
			-- upvalues: UnionResult (copy)
			UnionResult.onAbsoluteSizeChanged(p2)
		end, { UnionResult.onAbsoluteSizeChanged })
	}, Object.assign(table.clone(UnionResult.containerChildren), {
		["$margin"] = ReactModule.createElement("UIPadding", {
			PaddingBottom = _UDim,
			PaddingTop = _UDim,
			PaddingRight = _UDim,
			PaddingLeft = _UDim
		}),
		["$layout"] = ReactModule.createElement("UIListLayout", {
			[ReactModule.Change.AbsoluteContentSize] = ReactModule.useCallback(function(p2) --[[ Line: 74 ]]
				-- upvalues: UnionResult (copy), _UDim (copy)
				UnionResult.setContentWidth(p2.AbsoluteContentSize.X + _UDim.Offset * 2)
			end, { UnionResult.setContentWidth })
		})
	}))
end

return ReactModule.memo(ChatBubble)