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

return function(p0) --[[ line: 27 | named "PriceFooter" ]]
	-- upvalues: useStyle (ref), useLocalization (ref), textKeysModule (ref), fFlagProfilePlatformFixResaleLimitedPriceModule (ref), reactModule (ref), imageSetLabel (ref), robux (ref)
	local var5 = useStyle()
	local font = var5.Font
	local theme = var5.Theme
	local var6 = font.BaseSize * font.SubHeader1.RelativeSize
	local vector2 = Vector2.new(var6, var6)
	local var8 = useLocalization({
		freeText = textKeysModule.CatalogLabelFree,
		offSaleText = textKeysModule.CatalogLabelOffSale
	})
	local var9 = nil
	local var10 = false
	
	if p0.isOffSale then
		if fFlagProfilePlatformFixResaleLimitedPriceModule and p0.lowestResalePrice and p0.lowestResalePrice > 0 then
			var9 = tostring(p0.lowestResalePrice)
			var10 = true
		else
			var9 = var8.offSaleText
		end
	elseif p0.price == 0 then
		var9 = var8.freeText
	elseif p0.price then
		var9 = tostring(p0.price)
		var10 = true
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
		Icon = if var10 then reactModule.createElement(imageSetLabel, {
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
			Size = UDim2.new(1, if var10 then -(vector2.X + 4) else 0, 1, 0),
			Font = font.SubHeader1.Font,
			TextColor3 = theme.SecondaryContent.Color,
			TextTransparency = theme.SecondaryContent.Transparency,
			TextSize = var6,
			Text = var9,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end