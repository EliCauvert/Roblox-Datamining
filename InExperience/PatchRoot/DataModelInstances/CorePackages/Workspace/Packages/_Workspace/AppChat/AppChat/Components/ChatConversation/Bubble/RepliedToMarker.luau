local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local chatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local foundationModule = require(parent.Foundation)
local t = { isIncoming = false }

function RepliedToMarker(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), foundationModule (ref), chatBubbleEnumModule (ref)
	local var5 = cryoModule.Dictionary.union(t, p0)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "bg-shift-400 self-stretch",
		BorderSizePixel = 0,
		Size = UDim2.new(0, chatBubbleEnumModule.REPLIED_TO_MARKER_WIDTH, 0, 0),
		AnchorPoint = if var5.isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0),
		LayoutOrder = var5.layoutOrder
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
	})
end

return reactModule.memo(RepliedToMarker)