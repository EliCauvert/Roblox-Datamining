local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local useStyleModule = require(parent.Core.Style.useStyle)
local useTextSizeOffsetModule = require(parent.Core.Style.useTextSizeOffset)
local _ = require(parent.App.Style.Fonts)
local _ = require(parent.App.Style.StyleTypes)
local setDefaultModule = require(parent.Utility.setDefault)

return function(p1)
	-- upvalues: useStyleModule (ref), useTextSizeOffsetModule (ref), setDefaultModule (ref), reactModule (ref)
	local var1, var2, var3, var4
	local var5 = useStyleModule()
	local var6 = useTextSizeOffsetModule()
	local var7 = if var5.Settings.ReducedMotion then 6 else 8
	local contentTitle = p1.contentTitle
	local contentFooter = p1.contentFooter
	local var8 = setDefaultModule(p1.textLineCount, 2)
	local var9 = setDefaultModule(p1.hasSidePadding, true)
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if p1.outerPadding == nil or type(p1.outerPadding) == "number" then
		local var10 = setDefaultModule(p1.outerPadding, var7)
		var1 = var10
		var2 = var10
		var3 = var10
		var4 = var10
	else
		var1 = setDefaultModule(p1.outerPadding.Left, var7)
		var2 = setDefaultModule(p1.outerPadding.Right, var7)
		var3 = setDefaultModule(p1.outerPadding.Top, var7)
		var4 = setDefaultModule(p1.outerPadding.Bottom, var7)
	end
	local var11 = setDefaultModule(p1.titlePadding, var7)
	local panelHeight = p1.panelHeight
	local footerHeight = p1.footerHeight
	local font = var5.Font
	local var12 = setDefaultModule(p1.titleFont, font.Header2)
	local textEmphasis = var5.Theme.TextEmphasis
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(UDim.new(1, 0), panelHeight)
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var11)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = if var9 then UDim.new(0, var1) else nil,
			PaddingRight = if var9 then UDim.new(0, var2) else nil,
			PaddingTop = UDim.new(0, var3),
			PaddingBottom = UDim.new(0, var4)
		}),
		TitleText = if var8 > 0 and contentTitle and string.len(contentTitle) > 0 then reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = contentTitle,
			Font = var12.Font,
			TextSize = font.BaseSize * var12.RelativeSize,
			TextTransparency = textEmphasis.Transparency,
			TextColor3 = textEmphasis.Color,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}, {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(1e999, (font.BaseSize + var6) * var12.RelativeSize * var8)
			})
		}) else nil,
		ContentFooter = if contentFooter then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			Size = UDim2.new(UDim.new(1, 0), footerHeight)
		}, { contentFooter }) else nil
	})
end