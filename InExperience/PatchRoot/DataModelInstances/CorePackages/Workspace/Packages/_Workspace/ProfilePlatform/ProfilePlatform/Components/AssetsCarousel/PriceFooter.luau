local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local images = UIBloxModule.App.ImageSet.Images
local textKeysModule = require(profilePlatform.Common.TextKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagProfilePlatformFixResaleLimitedPriceModule = require(profilePlatform.Flags.FFlagProfilePlatformFixResaleLimitedPrice)
local robux = images["icons/common/robux"]

return function(p1)
	-- upvalues: useStyle (ref), useLocalization (ref), textKeysModule (ref), fFlagProfilePlatformFixResaleLimitedPriceModule (ref), reactModule (ref), imageSetLabel (ref), robux (ref)
	local var1 = useStyle()
	local font = var1.Font
	local theme = var1.Theme
	local var2 = font.BaseSize * font.SubHeader1.RelativeSize
	local vector2 = Vector2.new(var2, var2)
	local var3 = useLocalization({
		freeText = textKeysModule.CatalogLabelFree,
		offSaleText = textKeysModule.CatalogLabelOffSale
	})
	local var4 = nil
	local var5 = false
	
	if p1.isOffSale then
		if fFlagProfilePlatformFixResaleLimitedPriceModule and p1.lowestResalePrice and p1.lowestResalePrice > 0 then
			var4 = tostring(p1.lowestResalePrice)
			var5 = true
		else
			var4 = var3.offSaleText
		end
	elseif p1.price == 0 then
		var4 = var3.freeText
	elseif p1.price then
		var4 = tostring(p1.price)
		var5 = true
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 20),
		Position = UDim2.fromOffset(0, -4)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 4)
		}),
		Icon = if var5 then reactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Image = robux,
			ImageColor3 = theme.IconEmphasis.Color,
			ImageTransparency = theme.IconEmphasis.Transparency,
			Size = UDim2.fromOffset(vector2.X, vector2.Y)
		}) else nil,
		Text = reactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, if var5 then -(vector2.X + 4) else 0, 1, 0),
			Font = font.SubHeader1.Font,
			TextColor3 = theme.SecondaryContent.Color,
			TextTransparency = theme.SecondaryContent.Transparency,
			TextSize = var2,
			Text = var4,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end