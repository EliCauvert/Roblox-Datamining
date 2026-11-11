local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local UseStyleModule = require(Parent.Core.Style.useStyle)
local UseTextSizeOffsetModule = require(Parent.Core.Style.useTextSizeOffset)
local _ = require(Parent.App.Style.Fonts)
local _ = require(Parent.App.Style.StyleTypes)
local SetDefaultModule = require(Parent.Utility.setDefault)

return function(p1)
	-- upvalues: UseStyleModule (copy), UseTextSizeOffsetModule (copy), SetDefaultModule (copy), ReactModule (copy)
	local UseStyleModuleResult = UseStyleModule()
	local Settings = UseStyleModuleResult.Settings
	local UseTextSizeOffsetModuleResult = UseTextSizeOffsetModule()
	local v1: number = if Settings.ReducedMotion then 6 else 8
	local ContentTitle: string = p1.contentTitle
	local ContentFooter = p1.contentFooter
	local SetDefaultModuleResult: number = SetDefaultModule(p1.textLineCount, 2)
	local SetDefaultModuleResult1 = SetDefaultModule(p1.hasSidePadding, true)
	local Offset1 = nil
	local Offset2 = nil
	local Offset = nil
	local Offset3 = nil
	
	if p1.outerPadding == nil or type(p1.outerPadding) == "number" then
		local SetDefaultModuleResult2 = SetDefaultModule(p1.outerPadding, v1)
		Offset1 = SetDefaultModuleResult2
		Offset2 = SetDefaultModuleResult2
		Offset = SetDefaultModuleResult2
		Offset3 = SetDefaultModuleResult2
	else
		Offset1 = SetDefaultModule(p1.outerPadding.Left, v1)
		Offset2 = SetDefaultModule(p1.outerPadding.Right, v1)
		Offset = SetDefaultModule(p1.outerPadding.Top, v1)
		Offset3 = SetDefaultModule(p1.outerPadding.Bottom, v1)
	end
	local SetDefaultModuleResult3 = SetDefaultModule(p1.titlePadding, v1)
	local PanelHeight = p1.panelHeight
	local FooterHeight = p1.footerHeight
	local UseStyleModuleResultFont = UseStyleModuleResult.Font
	local SetDefaultModuleResult4 = SetDefaultModule(p1.titleFont, UseStyleModuleResultFont.Header2)
	local ScaledBaseSize = (UseStyleModuleResultFont.BaseSize + UseTextSizeOffsetModuleResult) * SetDefaultModuleResult4.RelativeSize * SetDefaultModuleResult
	local TextEmphasis = UseStyleModuleResult.Theme.TextEmphasis
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(UDim.new(1, 0), PanelHeight)
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, SetDefaultModuleResult3)
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = if SetDefaultModuleResult1 then UDim.new(0, Offset1) else nil,
			PaddingRight = if SetDefaultModuleResult1 then UDim.new(0, Offset2) else nil,
			PaddingTop = UDim.new(0, Offset),
			PaddingBottom = UDim.new(0, Offset3)
		}),
		TitleText = if SetDefaultModuleResult > 0 and ContentTitle and string.len(ContentTitle) > 0 then ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = ContentTitle,
			Font = SetDefaultModuleResult4.Font,
			TextSize = UseStyleModuleResultFont.BaseSize * SetDefaultModuleResult4.RelativeSize,
			TextTransparency = TextEmphasis.Transparency,
			TextColor3 = TextEmphasis.Color,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}, {
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(1e999, ScaledBaseSize) })
		}) else nil,
		ContentFooter = if ContentFooter then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			Size = UDim2.new(UDim.new(1, 0), FooterHeight)
		}, { ContentFooter }) else nil
	})
end