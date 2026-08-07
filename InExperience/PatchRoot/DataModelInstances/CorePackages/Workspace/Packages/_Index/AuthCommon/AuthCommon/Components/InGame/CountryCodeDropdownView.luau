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

return function(p0) --[[ line: 28 | named "CountryCodeDropdownView" ]]
	-- upvalues: useStyle (ref), reactModule (ref), functionalCountryCodeSelectorButtonModule (ref), graphite (ref), imageSetLabel (ref), getImageData (ref)
	local dropdownVisible = p0.dropdownVisible
	local countryCodeList = p0.countryCodeList
	local onCountryCodeSelected = p0.onCountryCodeSelected
	local position = p0.position
	local maxHeight = p0.maxHeight
	local var4 = useStyle()
	
	return if dropdownVisible then reactModule.createElement(imageSetLabel, {
		ZIndex = 2,
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Size = p0.size or UDim2.new(1, 0, 0, maxHeight),
		Position = position,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(9, 9, 9, 9),
		Image = getImageData("LuaApp/buttons/buttonFill"),
		ImageColor3 = var4.Theme.BackgroundUIDefault.Color
	}, {
		Boundary = reactModule.createElement(imageSetLabel, {
			ZIndex = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(9, 9, 9, 9),
			Image = getImageData("LuaApp/buttons/buttonStroke"),
			ImageColor3 = var4.Theme.UIDefault.Color,
			ImageTransparency = var4.Theme.UIDefault.Transparency
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
			}, (function(p1) --[[ line: 38 | named "getListButtons" ]]
				-- upvalues: reactModule (copy), functionalCountryCodeSelectorButtonModule (copy), onCountryCodeSelected (ref), graphite (copy)
				local list = {
					reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
					reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) })
				}
				local var6 = 1
				
				for i, v in ipairs(p1) do
					table.insert(list, reactModule.createElement(functionalCountryCodeSelectorButtonModule, {
						BoldPrefixEnabled = true,
						CountryCode = v,
						Size = UDim2.new(1, 0, 0, 48),
						LayoutOrder = var6,
						ListButtonProps = { TextSize = 14, SelectionCallback = onCountryCodeSelected }
					}))
					var6 += 1
					table.insert(list, reactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, 1),
						BackgroundColor3 = graphite,
						LayoutOrder = var6
					}))
					var6 += 1
				end
				return list
			end)(countryCodeList))
		})
	}) else nil
end