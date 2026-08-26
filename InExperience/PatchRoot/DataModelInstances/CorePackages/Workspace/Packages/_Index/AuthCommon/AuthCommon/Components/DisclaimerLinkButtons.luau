local parent = script:FindFirstAncestor("AuthCommon").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useDesignTokens = require(parent.Style).useDesignTokens
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel

local var1 = function(p1, p2, p3)
	return if p1 == Enum.FillDirection.Horizontal then { CellSize = UDim2.new(0.5, -p3, 0, p2) } else { CellSize = UDim2.new(1, 0, 0, p2) }
end

local var2 = function(p1)
	-- upvalues: useStyle (ref), useDesignTokens (ref), useSelectionCursor (ref), cursorKind (ref), reactModule (ref), styledTextLabel (ref), imageSetLabel (ref), images (ref)
	local var3 = useStyle()
	local var4 = useDesignTokens()
	local var5 = useSelectionCursor(cursorKind.RoundedRect)
	local size1400 = var4.Size.Size_1400 or 80
	local size700 = var4.Size.Size_700 or 42
	
	return reactModule.createElement("ImageButton", {
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 0, size1400),
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		[reactModule.Event.Activated] = p1.activated,
		SelectionImageObject = var5
	}, {
		padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 36),
			PaddingRight = UDim.new(0, 36)
		}),
		ButtonText = reactModule.createElement(styledTextLabel, {
			layoutOrder = 1,
			text = p1.text,
			automaticSize = Enum.AutomaticSize.X,
			size = UDim2.new(1, 0, 0, size1400),
			textXAlignment = Enum.TextXAlignment.Left,
			fontStyle = var3.Font.Header1,
			colorStyle = var3.Theme.TextDefault
		}),
		LinkIconImage = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			ImageTransparency = 0,
			Size = UDim2.new(0, size700, 0, size700),
			Position = UDim2.new(1, 0, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			ScaleType = Enum.ScaleType.Fit,
			Image = images["icons/navigation/externallink_medium"],
			ImageColor3 = var3.Theme.UIEmphasis.Color
		})
	})
end

return function(p1)
	-- upvalues: useDesignTokens (ref), var1 (ref), reactModule (ref), var2 (ref)
	local var3 = useDesignTokens()
	local size1400 = var3.Size.Size_1400 or 80
	local size300 = var3.Size.Size_300 or 18
	local fillDirection = p1.fillDirection or Enum.FillDirection.Vertical
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Selectable = false,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		LayoutOrder = p1.layoutOrder
	}, {
		gridlayout = reactModule.createElement("UIGridLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = fillDirection,
			CellPadding = UDim2.new(0, size300, 0, size300),
			CellSize = var1(fillDirection, size1400, size300).CellSize
		}),
		ButtonTos = reactModule.createElement(var2, {
			layoutOrder = 1,
			text = p1.textTos,
			activated = p1.activatedTos
		}),
		ButtonPrivacy = reactModule.createElement(var2, {
			layoutOrder = 2,
			text = p1.textPrivacy,
			activated = p1.activatedPrivacy
		})
	})
end