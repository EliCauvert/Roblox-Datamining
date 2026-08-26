local configModule = require(script:FindFirstAncestor("ExpChat").Config)

return function(p1)
	-- upvalues: configModule (ref)
	local t = {}
	
	for i, v in pairs(configModule.DefaultBubbleChatMessagePropertiesInstanceSettings) do
		t[i] = p1[i]
	end
	local imageLabel = p1:FindFirstChildOfClass("ImageLabel")
	
	if imageLabel then
		local t_1 = {}
		
		for i_1, v_1 in pairs(configModule.DefaultBubbleChatChildrenCustomizationProperties.ImageLabel) do
			t_1[i_1] = imageLabel[i_1]
		end
		t.ImageLabel = t_1
	end
	local UIGradient = p1:FindFirstChildOfClass("UIGradient")
	
	if UIGradient then
		local t_1 = {}
		
		for i_1, v_1 in pairs(configModule.DefaultBubbleChatChildrenCustomizationProperties.UIGradient) do
			t_1[i_1] = UIGradient[i_1]
		end
		t.UIGradient = t_1
	end
	local UICorner = p1:FindFirstChildOfClass("UICorner")
	
	if UICorner then
		local t_1 = {}
		
		for i_1, v_1 in pairs(configModule.DefaultBubbleChatChildrenCustomizationProperties.UICorner) do
			t_1[i_1] = UICorner[i_1]
		end
		t.UICorner = t_1
	end
	local UIPadding = p1:FindFirstChildOfClass("UIPadding")
	
	if UIPadding then
		local t_1 = {}
		
		for i_1, v_1 in pairs(configModule.DefaultBubbleChatChildrenCustomizationProperties.UIPadding) do
			t_1[i_1] = UIPadding[i_1]
		end
		t.UIPadding = t_1
	end
	return t
end