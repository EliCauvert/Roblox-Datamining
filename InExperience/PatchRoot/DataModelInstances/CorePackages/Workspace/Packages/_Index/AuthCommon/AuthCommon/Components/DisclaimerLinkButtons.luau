local Parent = script:FindFirstAncestor("AuthCommon").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel

local function v7(FillDirection, YOffset, Size) --[[ Line: 40 ]]
	return if FillDirection == Enum.FillDirection.Horizontal then { CellSize = UDim2.new(0.5, -Size, 0, YOffset) } else { CellSize = UDim2.new(1, 0, 0, YOffset) }
end

local function v8(p1) --[[ Line: 52 ]]
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), ReactModule (copy), StyledTextLabel (copy), ImageSetLabel (copy), Images (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Size1400 = UseDesignTokensResult.Size.Size_1400 or 80
	local Size700 = UseDesignTokensResult.Size.Size_700 or 42
	
	return ReactModule.createElement("ImageButton", {
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 0, Size1400),
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		[ReactModule.Event.Activated] = p1.activated,
		SelectionImageObject = UseSelectionCursorFunction(CursorKind.RoundedRect)
	}, {
		padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 36),
			PaddingRight = UDim.new(0, 36)
		}),
		ButtonText = ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 1,
			text = p1.text,
			automaticSize = Enum.AutomaticSize.X,
			size = UDim2.new(1, 0, 0, Size1400),
			textXAlignment = Enum.TextXAlignment.Left,
			fontStyle = UseStyleResult.Font.Header1,
			colorStyle = UseStyleResult.Theme.TextDefault
		}),
		LinkIconImage = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			ImageTransparency = 0,
			Size = UDim2.new(0, Size700, 0, Size700),
			Position = UDim2.new(1, 0, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			ScaleType = Enum.ScaleType.Fit,
			Image = Images["icons/navigation/externallink_medium"],
			ImageColor3 = UseStyleResult.Theme.UIEmphasis.Color
		})
	})
end

return function(p1) --[[ Line: 95 ]]
	-- upvalues: UseDesignTokensFunction (copy), v7 (copy), ReactModule (copy), v8 (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Size300 = UseDesignTokensResult.Size.Size_300 or 18
	local FillDirection = p1.fillDirection or Enum.FillDirection.Vertical
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Selectable = false,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		LayoutOrder = p1.layoutOrder
	}, {
		gridlayout = ReactModule.createElement("UIGridLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = FillDirection,
			CellPadding = UDim2.new(0, Size300, 0, Size300),
			CellSize = v7(FillDirection, UseDesignTokensResult.Size.Size_1400 or 80, Size300).CellSize
		}),
		ButtonTos = ReactModule.createElement(v8, {
			layoutOrder = 1,
			text = p1.textTos,
			activated = p1.activatedTos
		}),
		ButtonPrivacy = ReactModule.createElement(v8, {
			layoutOrder = 2,
			text = p1.textPrivacy,
			activated = p1.activatedPrivacy
		})
	})
end