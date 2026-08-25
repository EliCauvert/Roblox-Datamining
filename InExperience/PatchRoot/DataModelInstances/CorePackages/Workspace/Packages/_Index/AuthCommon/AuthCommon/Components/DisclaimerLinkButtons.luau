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

local var2 = function(p0, p1, p2)
	return if p0 == Enum.FillDirection.Horizontal then { CellSize = UDim2.new(0.5, -p2, 0, p1) } else { CellSize = UDim2.new(1, 0, 0, p1) }
end

local var3 = function(p3)
	-- upvalues: useStyle (ref), useDesignTokens (ref), useSelectionCursor (ref), cursorKind (ref), reactModule (ref), styledTextLabel (ref), imageSetLabel (ref), images (ref)
	local var4 = useStyle()
	local var5 = useDesignTokens()
	local var6 = useSelectionCursor(cursorKind.RoundedRect)
	local size1400 = var5.Size.Size_1400 or 80
	local size700 = var5.Size.Size_700 or 42
	
	return reactModule.createElement("ImageButton", {
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 0, size1400),
		BackgroundTransparency = 1,
		LayoutOrder = p3.layoutOrder,
		[reactModule.Event.Activated] = p3.activated,
		SelectionImageObject = var6
	}, {
		padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 36),
			PaddingRight = UDim.new(0, 36)
		}),
		ButtonText = reactModule.createElement(styledTextLabel, {
			layoutOrder = 1,
			text = p3.text,
			automaticSize = Enum.AutomaticSize.X,
			size = UDim2.new(1, 0, 0, size1400),
			textXAlignment = Enum.TextXAlignment.Left,
			fontStyle = var4.Font.Header1,
			colorStyle = var4.Theme.TextDefault
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
			ImageColor3 = var4.Theme.UIEmphasis.Color
		})
	})
end

return function(p4)
	-- upvalues: useDesignTokens (ref), var2 (ref), reactModule (ref), var3 (ref)
	local var9 = useDesignTokens()
	local size1400 = var9.Size.Size_1400 or 80
	local size300 = var9.Size.Size_300 or 18
	local fillDirection = p4.fillDirection or Enum.FillDirection.Vertical
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Selectable = false,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		LayoutOrder = p4.layoutOrder
	}, {
		gridlayout = reactModule.createElement("UIGridLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = fillDirection,
			CellPadding = UDim2.new(0, size300, 0, size300),
			CellSize = var2(fillDirection, size1400, size300).CellSize
		}),
		ButtonTos = reactModule.createElement(var3, {
			layoutOrder = 1,
			text = p4.textTos,
			activated = p4.activatedTos
		}),
		ButtonPrivacy = reactModule.createElement(var3, {
			layoutOrder = 2,
			text = p4.textPrivacy,
			activated = p4.activatedPrivacy
		})
	})
end