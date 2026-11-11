local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ChatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local config = {
	isIncoming = false,
	imageTransparency = 0,
	imageColor = Color3.new(0, 0, 0)
}

function ChatBubbleTail(p1)
	-- upvalues: CryoModule (copy), config (copy), ChatBubbleEnumModule (copy), ReactModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	
	return ReactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		AnchorPoint = if UnionResult.isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0),
		Size = UDim2.new(0, ChatBubbleEnumModule.TAIL_WIDTH, 0, ChatBubbleEnumModule.TAIL_WIDTH),
		ImageColor3 = UnionResult.imageColor,
		Position = if UnionResult.isIncoming then UDim2.new(0, 0, 0, 0) else UDim2.new(1, 0, 0, 0),
		Image = if UnionResult.isIncoming then ChatBubbleEnumModule.RECEIVED_TAIL else ChatBubbleEnumModule.SENT_TAIL,
		ImageTransparency = UnionResult.imageTransparency
	})
end

return ReactModule.memo(ChatBubbleTail)