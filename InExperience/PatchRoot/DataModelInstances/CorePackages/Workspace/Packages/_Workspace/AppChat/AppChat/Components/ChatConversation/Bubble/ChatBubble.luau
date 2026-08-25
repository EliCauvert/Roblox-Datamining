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

function ChatBubble(p0)
	-- upvalues: useCursor (ref), foundationModule (ref), cryoModule (ref), t (ref), chatBubbleEnumModule (ref), reactModule (ref), object (ref)
	local var5 = useCursor(foundationModule.Enums.CursorType.RoundedRect)
	local var6 = cryoModule.Dictionary.union(t, p0)
	local uDim = UDim.new(0, var6.padding or t.padding)
	local var8 = chatBubbleEnumModule.TAIL_WIDTH + (if var6.isRepliedTo then chatBubbleEnumModule.REPLIED_TO_MARKER_WIDTH + chatBubbleEnumModule.REPLIED_TO_MARKER_GAP else 0)
	
	return reactModule.createElement("ImageLabel", {
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(0, var6.contentWidth, 0, 0),
		AnchorPoint = var6.isIncoming and Vector2.new(0, 0) or Vector2.new(1, 0),
		BackgroundTransparency = 1,
		ImageColor3 = var6.imageColor,
		Image = if var6.hasTail then if var6.isIncoming then chatBubbleEnumModule.RECEIVED_BUBBLE_WITH_TAIL else chatBubbleEnumModule.SENT_BUBBLE_WITH_TAIL else chatBubbleEnumModule.BUBBLE,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = chatBubbleEnumModule.SLIDE_CENTER,
		ImageTransparency = var6.imageTransparency,
		Position = if var6.isIncoming then UDim2.new(0, var8, 0, 0) else UDim2.new(1, -var8, 0, 0),
		Selectable = not var6.hasTail,
		SelectionImageObject = var5,
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p1)
			-- upvalues: var6 (ref)
			var6.onAbsoluteSizeChanged(p1)
		end, { var6.onAbsoluteSizeChanged })
	}, object.assign(table.clone(var6.containerChildren), {
		["$margin"] = reactModule.createElement("UIPadding", {
			PaddingBottom = uDim,
			PaddingTop = uDim,
			PaddingRight = uDim,
			PaddingLeft = uDim
		}),
		["$layout"] = reactModule.createElement("UIListLayout", {
			[reactModule.Change.AbsoluteContentSize] = reactModule.useCallback(function(p2)
				-- upvalues: var6 (ref), uDim (ref)
				var6.setContentWidth(p2.AbsoluteContentSize.X + uDim.Offset * 2)
			end, { var6.setContentWidth })
		})
	}))
end

return reactModule.memo(ChatBubble)