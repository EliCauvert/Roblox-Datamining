local Parent = script:FindFirstAncestor("LandingPage").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function(Frame: Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	if Frame.totalAvatars == 0 then
		return ReactModule.createElement(FoundationModule.View, {
			tag = "row gap-small align-x-center auto-xy padding-y-small",
			LayoutOrder = Frame.LayoutOrder or 0
		})
	end
	local Frames = {}
	
	for i = 1, Frame.totalAvatars do
		Frames[i] = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, 8, 0, 8),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			Transparency = if i == Frame.highlightedIndex then 0 else 0.6
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		})
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row gap-small align-x-center size-full-0 padding-bottom-large",
		LayoutOrder = Frame.LayoutOrder or 0
	}, Frames)
end