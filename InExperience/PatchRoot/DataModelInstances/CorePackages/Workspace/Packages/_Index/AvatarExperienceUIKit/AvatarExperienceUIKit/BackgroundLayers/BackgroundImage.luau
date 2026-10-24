local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local ConnectImageLoadedModule = require(script.Parent.connectImageLoaded)
local FFlagAXBackgroundImageOnLoaded = require(Parent.AvatarExperienceFlags).FFlagAXBackgroundImageOnLoaded
local config = {
	resourceIdentifier = "",
	anchorPoint = Vector2.new(0.5, 0.5),
	color = Color3.fromRGB(255, 255, 255),
	position = UDim2.fromScale(0.5, 0.5),
	scaleType = Enum.ScaleType.Fit
}

return function(p1)
	-- upvalues: DashModule (copy), config (copy), FFlagAXBackgroundImageOnLoaded (copy), ReactModule (copy), ConnectImageLoadedModule (copy)
	local JoinResult = DashModule.join(config, p1)
	local UseResult = nil
	
	if FFlagAXBackgroundImageOnLoaded then
		local OnLoaded = JoinResult.onLoaded
		local ResourceIdentifier = JoinResult.resourceIdentifier
		local UseRefResult = ReactModule.useRef(nil)
		UseResult = ReactModule.useCallback(function(p2)
			-- upvalues: UseRefResult (copy), OnLoaded (copy), ResourceIdentifier (copy), ConnectImageLoadedModule (upval)
			if UseRefResult.current then
				UseRefResult.current:Disconnect()
				UseRefResult.current = nil
			end
			if p2 and OnLoaded and ResourceIdentifier ~= "" then
				UseRefResult.current = ConnectImageLoadedModule(p2, OnLoaded)
				
				return
			end
		end, { OnLoaded, ResourceIdentifier })
	end
	return ReactModule.createElement("ImageLabel", {
		AnchorPoint = JoinResult.anchorPoint,
		Position = JoinResult.position,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = JoinResult.resourceIdentifier,
		ImageColor3 = JoinResult.color,
		ImageTransparency = JoinResult.transparency,
		ScaleType = JoinResult.scaleType,
		Size = UDim2.fromScale(1, 1),
		ZIndex = JoinResult.ZIndex,
		[ReactModule.Tag] = JoinResult.tag,
		ref = if FFlagAXBackgroundImageOnLoaded and JoinResult.onLoaded then UseResult else nil
	}, {
		CornerRadius = ReactModule.createElement("UICorner", { CornerRadius = JoinResult.cornerRadius })
	})
end