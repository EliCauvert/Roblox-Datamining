local Parent = script:FindFirstAncestor("AvatarExperienceSearch").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = UseDesignTokensResult.Color.Stroke.Emphasis.Color3,
		BackgroundTransparency = UseDesignTokensResult.Color.Stroke.Emphasis.Transparency,
		LayoutOrder = p1.layoutOrder,
		[ReactModule.Tag] = "data-testid=AvatarExperienceSearch_Divider"
	})
end