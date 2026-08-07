-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:01 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local useStyleModule = require(parent.Core.Style.useStyle)
local useTextSizeOffsetModule = require(parent.Core.Style.useTextSizeOffset)
local _ = require(parent.App.Style.Fonts)
local _ = require(parent.App.Style.StyleTypes)
local setDefaultModule = require(parent.Utility.setDefault)

return function(p0) --[[ line: 44 | named "TileContentPanel" ]]
	-- upvalues: useStyleModule (ref), useTextSizeOffsetModule (ref), setDefaultModule (ref), reactModule (ref)
	local var9, var10, var11, var12
	local var4 = useStyleModule()
	local var5 = useTextSizeOffsetModule()
	local var6 = if var4.Settings.ReducedMotion then 6 else 8
	local contentTitle = p0.contentTitle
	local contentFooter = p0.contentFooter
	local var7 = setDefaultModule(p0.textLineCount, 2)
	local var8 = setDefaultModule(p0.hasSidePadding, true)
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if p0.outerPadding == nil or type(p0.outerPadding) == "number" then
		local var13 = setDefaultModule(p0.outerPadding, var6)
		var9 = var13
		var10 = var13
		var11 = var13
		var12 = var13
	else
		var9 = setDefaultModule(p0.outerPadding.Left, var6)
		var10 = setDefaultModule(p0.outerPadding.Right, var6)
		var11 = setDefaultModule(p0.outerPadding.Top, var6)
		var12 = setDefaultModule(p0.outerPadding.Bottom, var6)
	end
	local var14 = setDefaultModule(p0.titlePadding, var6)
	local panelHeight = p0.panelHeight
	local footerHeight = p0.footerHeight
	local font = var4.Font
	local var15 = setDefaultModule(p0.titleFont, font.Header2)
	local textEmphasis = var4.Theme.TextEmphasis
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(UDim.new(1, 0), panelHeight)
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var14)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = if var8 then UDim.new(0, var9) else nil,
			PaddingRight = if var8 then UDim.new(0, var10) else nil,
			PaddingTop = UDim.new(0, var11),
			PaddingBottom = UDim.new(0, var12)
		}),
		TitleText = if var7 > 0 and contentTitle and string.len(contentTitle) > 0 then reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = contentTitle,
			Font = var15.Font,
			TextSize = font.BaseSize * var15.RelativeSize,
			TextTransparency = textEmphasis.Transparency,
			TextColor3 = textEmphasis.Color,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}, {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(1e999, (font.BaseSize + var5) * var15.RelativeSize * var7)
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