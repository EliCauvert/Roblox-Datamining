local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local UIBloxModule = require(parent.UIBlox)
local reactModule = require(parent.React)
local colors = require(parent.Style).Colors
local functionalCountryCodeSelectorButtonModule = require(authCommon.Components.FunctionalCountryCodeSelectorButton)
local _ = require(authCommon.Common.Types)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local getImageData = require(parent.RobloxAppAssets).GetImageData
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local graphite = colors.Graphite

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), functionalCountryCodeSelectorButtonModule (ref), graphite (ref), imageSetLabel (ref), getImageData (ref)
	local dropdownVisible = p1.dropdownVisible
	local countryCodeList = p1.countryCodeList
	local onCountryCodeSelected = p1.onCountryCodeSelected
	local position = p1.position
	local maxHeight = p1.maxHeight
	local var1 = useStyle()
	
	return if dropdownVisible then reactModule.createElement(imageSetLabel, {
		ZIndex = 2,
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Size = p1.size or UDim2.new(1, 0, 0, maxHeight),
		Position = position,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(9, 9, 9, 9),
		Image = getImageData("LuaApp/buttons/buttonFill"),
		ImageColor3 = var1.Theme.BackgroundUIDefault.Color
	}, {
		Boundary = reactModule.createElement(imageSetLabel, {
			ZIndex = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(9, 9, 9, 9),
			Image = getImageData("LuaApp/buttons/buttonStroke"),
			ImageColor3 = var1.Theme.UIDefault.Color,
			ImageTransparency = var1.Theme.UIDefault.Transparency
		}),
		ScrollingFrame = reactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			ScrollBarImageColor3 = graphite,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			CanvasSize = UDim2.new(1, 0, 0, #countryCodeList * 49)
		}, {
			ListHolder = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -8, 1, maxHeight)
			}, (function(p2)
				-- upvalues: reactModule (copy), functionalCountryCodeSelectorButtonModule (copy), onCountryCodeSelected (ref), graphite (copy)
				local list = {
					reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
					reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) })
				}
				local var2 = 1
				
				for i, v in ipairs(p2) do
					table.insert(list, reactModule.createElement(functionalCountryCodeSelectorButtonModule, {
						BoldPrefixEnabled = true,
						CountryCode = v,
						Size = UDim2.new(1, 0, 0, 48),
						LayoutOrder = var2,
						ListButtonProps = { TextSize = 14, SelectionCallback = onCountryCodeSelected }
					}))
					var2 += 1
					table.insert(list, reactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, 1),
						BackgroundColor3 = graphite,
						LayoutOrder = var2
					}))
					var2 += 1
				end
				return list
			end)(countryCodeList))
		})
	}) else nil
end