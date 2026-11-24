local Parent = script:FindFirstAncestor("SocialCommon").Parent
local ReactModule = require(Parent.React)
local Image = require(Parent.Foundation).Image
local config = { LayoutOrder = 3, tag = "shrink-0" }

return function(Tbl, Image1, p1, YOffset, p2)
	-- upvalues: config (copy), ReactModule (copy), Image (copy)
	if Image1 == nil or p1 == nil then
		return Tbl
	else
		local P2 = p2 or config
		local Copy = table.clone(Tbl)
		Copy.IarcRatingIcon = ReactModule.createElement(Image, {
			Name = "IarcRatingIcon",
			BackgroundTransparency = 1,
			Image = Image1,
			Size = UDim2.fromOffset(YOffset * p1, YOffset),
			ScaleType = Enum.ScaleType.Fit,
			AnchorPoint = P2.AnchorPoint,
			Position = P2.Position,
			ZIndex = P2.ZIndex,
			LayoutOrder = P2.LayoutOrder,
			tag = P2.tag
		})
		
		return Copy
	end
end