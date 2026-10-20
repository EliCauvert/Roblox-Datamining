local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ChatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local FoundationModule = require(Parent.Foundation)
local config = { isIncoming = false }

function RepliedToMarker(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), FoundationModule (copy), ChatBubbleEnumModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "bg-shift-400 self-stretch",
		BorderSizePixel = 0,
		Size = UDim2.new(0, ChatBubbleEnumModule.REPLIED_TO_MARKER_WIDTH, 0, 0),
		AnchorPoint = if UnionResult.isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0),
		LayoutOrder = UnionResult.layoutOrder
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
	})
end

return ReactModule.memo(RepliedToMarker)