local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local chatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local t = {
	isIncoming = false,
	imageTransparency = 0,
	imageColor = Color3.new(0, 0, 0)
}

function ChatBubbleTail(p0) --[[ line: 38 ]]
	-- upvalues: cryoModule (ref), t (ref), chatBubbleEnumModule (ref), reactModule (ref)
	local var4 = cryoModule.Dictionary.union(t, p0)
	
	return reactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		AnchorPoint = if var4.isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0),
		Size = UDim2.new(0, chatBubbleEnumModule.TAIL_WIDTH, 0, chatBubbleEnumModule.TAIL_WIDTH),
		ImageColor3 = var4.imageColor,
		Position = if var4.isIncoming then UDim2.new(0, 0, 0, 0) else UDim2.new(1, 0, 0, 0),
		Image = if var4.isIncoming then chatBubbleEnumModule.RECEIVED_TAIL else chatBubbleEnumModule.SENT_TAIL,
		ImageTransparency = var4.imageTransparency
	})
end

return reactModule.memo(ChatBubbleTail)