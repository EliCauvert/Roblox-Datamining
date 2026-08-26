local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local object = require(parent.LuauPolyfill).Object
local cryoModule = require(parent.Cryo)
local chatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local foundationModule = require(parent.Foundation)
local useCursor = foundationModule.Hooks.useCursor
local t = {
	contentWidth = 0,
	isIncoming = false,
	isRepliedTo = false,
	imageTransparency = 0,
	padding = 0,
	hasTail = false,
	imageColor = Color3.new(0, 0, 0),
	onAbsoluteSizeChanged = function(_) end,
	setContentWidth = function(_) end,
	handleEvent = function(_) end,
	containerChildren = {}
}

function ChatBubble(p1)
	-- upvalues: useCursor (ref), foundationModule (ref), cryoModule (ref), t (ref), chatBubbleEnumModule (ref), reactModule (ref), object (ref)
	local var1 = useCursor(foundationModule.Enums.CursorType.RoundedRect)
	local var2 = cryoModule.Dictionary.union(t, p1)
	local uDim = UDim.new(0, var2.padding or t.padding)
	local var3 = chatBubbleEnumModule.TAIL_WIDTH + (if var2.isRepliedTo then chatBubbleEnumModule.REPLIED_TO_MARKER_WIDTH + chatBubbleEnumModule.REPLIED_TO_MARKER_GAP else 0)
	
	return reactModule.createElement("ImageLabel", {
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(0, var2.contentWidth, 0, 0),
		AnchorPoint = var2.isIncoming and Vector2.new(0, 0) or Vector2.new(1, 0),
		BackgroundTransparency = 1,
		ImageColor3 = var2.imageColor,
		Image = if var2.hasTail then if var2.isIncoming then chatBubbleEnumModule.RECEIVED_BUBBLE_WITH_TAIL else chatBubbleEnumModule.SENT_BUBBLE_WITH_TAIL else chatBubbleEnumModule.BUBBLE,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = chatBubbleEnumModule.SLIDE_CENTER,
		ImageTransparency = var2.imageTransparency,
		Position = if var2.isIncoming then UDim2.new(0, var3, 0, 0) else UDim2.new(1, -var3, 0, 0),
		Selectable = not var2.hasTail,
		SelectionImageObject = var1,
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref)
			var2.onAbsoluteSizeChanged(p2)
		end, { var2.onAbsoluteSizeChanged })
	}, object.assign(table.clone(var2.containerChildren), {
		["$margin"] = reactModule.createElement("UIPadding", {
			PaddingBottom = uDim,
			PaddingTop = uDim,
			PaddingRight = uDim,
			PaddingLeft = uDim
		}),
		["$layout"] = reactModule.createElement("UIListLayout", {
			[reactModule.Change.AbsoluteContentSize] = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref), uDim (ref)
				var2.setContentWidth(p2.AbsoluteContentSize.X + uDim.Offset * 2)
			end, { var2.setContentWidth })
		})
	}))
end

return reactModule.memo(ChatBubble)