local parent = script:FindFirstAncestor("AuthCommon").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local useDesignTokens = require(parent.Style).useDesignTokens
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel

local var2 = function(p0, p1, p2) --[[ line: 42 ]]
	return if p0 == Enum.FillDirection.Horizontal then { CellSize = UDim2.new(0.5, -p2, 0, p1) } else { CellSize = UDim2.new(1, 0, 0, p1) }
end

local var3 = function(p3) --[[ line: 54 ]]
	-- upvalues: useStyle (ref), useDesignTokens (ref), useSelectionCursor (ref), cursorKind (ref), fFlagRenameDeprecatedUIBloxTokens (ref), reactModule (ref), styledTextLabel (ref), imageSetLabel (ref), images (ref)
	local var4 = useStyle()
	local var5 = useDesignTokens()
	local var6 = useSelectionCursor(cursorKind.RoundedRect)
	local var7 = (if fFlagRenameDeprecatedUIBloxTokens then var5.Size.Size_1400 else var5.Global.Size_700) or 80
	local var8 = (if fFlagRenameDeprecatedUIBloxTokens then var5.Size.Size_700 else var5.Global.Size_350) or 42
	
	return reactModule.createElement("ImageButton", {
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 0, var7),
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
			size = UDim2.new(1, 0, 0, var7),
			textXAlignment = Enum.TextXAlignment.Left,
			fontStyle = var4.Font.Header1,
			colorStyle = var4.Theme.TextDefault
		}),
		LinkIconImage = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			ImageTransparency = 0,
			Size = UDim2.new(0, var8, 0, var8),
			Position = UDim2.new(1, 0, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			ScaleType = Enum.ScaleType.Fit,
			Image = images["icons/navigation/externallink_medium"],
			ImageColor3 = var4.Theme.UIEmphasis.Color
		})
	})
end

return function(p4) --[[ line: 101 ]]
	-- upvalues: useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), var2 (ref), reactModule (ref), var3 (ref)
	local var9 = useDesignTokens()
	local var10 = (if fFlagRenameDeprecatedUIBloxTokens then var9.Size.Size_1400 else var9.Global.Size_700) or 80
	local var11 = (if fFlagRenameDeprecatedUIBloxTokens then var9.Size.Size_300 else var9.Global.Space_150) or 18
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
			CellPadding = UDim2.new(0, var11, 0, var11),
			CellSize = var2(fillDirection, var10, var11).CellSize
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