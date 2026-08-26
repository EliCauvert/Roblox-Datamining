local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local chatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local t = {
	isIncoming = false,
	imageTransparency = 0,
	imageColor = Color3.new(0, 0, 0)
}

function ChatBubbleTail(p1)
	-- upvalues: cryoModule (ref), t (ref), chatBubbleEnumModule (ref), reactModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	
	return reactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		AnchorPoint = if var1.isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0),
		Size = UDim2.new(0, chatBubbleEnumModule.TAIL_WIDTH, 0, chatBubbleEnumModule.TAIL_WIDTH),
		ImageColor3 = var1.imageColor,
		Position = if var1.isIncoming then UDim2.new(0, 0, 0, 0) else UDim2.new(1, 0, 0, 0),
		Image = if var1.isIncoming then chatBubbleEnumModule.RECEIVED_TAIL else chatBubbleEnumModule.SENT_TAIL,
		ImageTransparency = var1.imageTransparency
	})
end

return reactModule.memo(ChatBubbleTail)