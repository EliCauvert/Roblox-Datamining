local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local ReactModule = require(Parent.React)
local FunctionalCountryCodeSelectorButtonModule = require(AuthCommon.Components.FunctionalCountryCodeSelectorButton)
local _ = require(AuthCommon.Common.Types)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local ImageSetLabel = require(Parent.UIBlox).Core.ImageSet.ImageSetLabel
local Graphite = require(Parent.Style).Colors.Graphite

return function(p1) --[[ Line: 28 | Named "CountryCodeDropdownView" ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), FunctionalCountryCodeSelectorButtonModule (copy), Graphite (copy), ImageSetLabel (copy), GetImageDataFunction (copy)
	local DropdownVisible = p1.dropdownVisible
	local CountryCodeList = p1.countryCodeList
	local OnCountryCodeSelected = p1.onCountryCodeSelected
	local Position = p1.position
	local MaxHeight = p1.maxHeight
	local UseStyleResult = UseStyleFunction()
	local Color = UseStyleResult.Theme.UIDefault.Color
	local Transparency = UseStyleResult.Theme.UIDefault.Transparency
	local v1 = (function(List) --[[ Line: 38 | Named "getListButtons" ]]
		-- upvalues: ReactModule (upval), FunctionalCountryCodeSelectorButtonModule (upval), OnCountryCodeSelected (copy), Graphite (upval)
		local List1 = {
			ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			ReactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) })
		}
		local LayoutOrder = 1
		
		for _, CountryCode in ipairs(List) do
			table.insert(List1, ReactModule.createElement(FunctionalCountryCodeSelectorButtonModule, {
				BoldPrefixEnabled = true,
				CountryCode = CountryCode,
				Size = UDim2.new(1, 0, 0, 48),
				LayoutOrder = LayoutOrder,
				ListButtonProps = { TextSize = 14, SelectionCallback = OnCountryCodeSelected }
			}))
			local NewLayoutOrder = LayoutOrder + 1
			table.insert(List1, ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = Graphite,
				LayoutOrder = NewLayoutOrder
			}))
			LayoutOrder = NewLayoutOrder + 1
		end
		return List1
	end)(CountryCodeList)
	local CountCountryCodeList = #CountryCodeList
	
	return if DropdownVisible then ReactModule.createElement(ImageSetLabel, {
		ZIndex = 2,
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Size = p1.size or UDim2.new(1, 0, 0, MaxHeight),
		Position = Position,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(9, 9, 9, 9),
		Image = GetImageDataFunction("LuaApp/buttons/buttonFill"),
		ImageColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color
	}, {
		Boundary = ReactModule.createElement(ImageSetLabel, {
			ZIndex = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(9, 9, 9, 9),
			Image = GetImageDataFunction("LuaApp/buttons/buttonStroke"),
			ImageColor3 = Color,
			ImageTransparency = Transparency
		}),
		ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			ScrollBarImageColor3 = Graphite,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			CanvasSize = UDim2.new(1, 0, 0, CountCountryCodeList * 49)
		}, {
			ListHolder = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -8, 1, MaxHeight)
			}, v1)
		})
	}) else nil
end