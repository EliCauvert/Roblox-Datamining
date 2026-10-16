local ConfigModule = require(script:FindFirstAncestor("ExpChat").Config)

return function(Object) --[[ Line: 4 ]]
	-- upvalues: ConfigModule (copy)
	local t = {}
	
	for i, _ in pairs(ConfigModule.DefaultBubbleChatMessagePropertiesInstanceSettings) do
		t[i] = Object[i]
	end
	local ImageLabel = Object:FindFirstChildOfClass("ImageLabel")
	
	if ImageLabel then
		local ImageLabel1 = {}
		
		for i1, _ in pairs(ConfigModule.DefaultBubbleChatChildrenCustomizationProperties.ImageLabel) do
			ImageLabel1[i1] = ImageLabel[i1]
		end
		t.ImageLabel = ImageLabel1
	end
	local UIGradient = Object:FindFirstChildOfClass("UIGradient")
	
	if UIGradient then
		local UIGradient1 = {}
		
		for i2, _ in pairs(ConfigModule.DefaultBubbleChatChildrenCustomizationProperties.UIGradient) do
			UIGradient1[i2] = UIGradient[i2]
		end
		t.UIGradient = UIGradient1
	end
	local UICorner = Object:FindFirstChildOfClass("UICorner")
	
	if UICorner then
		local UICorner1 = {}
		
		for i3, _ in pairs(ConfigModule.DefaultBubbleChatChildrenCustomizationProperties.UICorner) do
			UICorner1[i3] = UICorner[i3]
		end
		t.UICorner = UICorner1
	end
	local UIPadding = Object:FindFirstChildOfClass("UIPadding")
	
	if UIPadding then
		local UIPadding1 = {}
		
		for i4, _ in pairs(ConfigModule.DefaultBubbleChatChildrenCustomizationProperties.UIPadding) do
			UIPadding1[i4] = UIPadding[i4]
		end
		t.UIPadding = UIPadding1
	end
	return t
end