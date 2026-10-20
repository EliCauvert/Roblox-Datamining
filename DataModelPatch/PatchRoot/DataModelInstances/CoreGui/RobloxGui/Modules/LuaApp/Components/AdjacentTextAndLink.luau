local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local RoactModule = require(Modules.Common.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local LinkButton = UIBloxModule.App.Button.LinkButton
local FitChildrenModule = require(Modules.LuaApp.FitChildren)

return function(Frame: Frame)
	-- upvalues: WithStyleFunction (copy), Text (copy), RoactModule (copy), FitChildrenModule (copy), LinkButton (copy)
	return WithStyleFunction(function(p1)
		-- upvalues: Frame (copy), Text (upval), RoactModule (upval), FitChildrenModule (upval), LinkButton (upval)
		local Spacing = Frame.spacing
		local LayoutOrder = Frame.LayoutOrder or 1
		local AnchorPoint = Frame.AnchorPoint
		local TextLabelText = Frame.textLabelText
		local TextLabelColor = Frame.textLabelColor
		local TextTransparency = Frame.TextTransparency
		local FontStyle = Frame.fontStyle or "CaptionBody"
		local v1 = p1.Font[FontStyle]
		local ButtonSize = Frame.buttonSize or UDim2.fromScale(0, 1)
		local LinkColorStyle = Frame.linkColorStyle
		local LinkText = Frame.linkText
		local OnActivated = Frame.onActivated
		local TextButtonEnabled = Frame.textButtonEnabled
		
		if TextButtonEnabled == nil then
			TextButtonEnabled = true
		end
		local ScaledRelativeSize = v1.RelativeSize * p1.Font.BaseSize
		
		return RoactModule.createElement(FitChildrenModule.FitFrame, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(0, ScaledRelativeSize),
			AnchorPoint = AnchorPoint,
			LayoutOrder = LayoutOrder,
			fitAxis = FitChildrenModule.FitAxis.Width
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, Spacing or Text.GetTextWidth(" ", v1.Font, ScaledRelativeSize)),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			TextLabel = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				TextSize = ScaledRelativeSize,
				Font = v1.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(0, Text.GetTextWidth(TextLabelText or "", v1.Font, ScaledRelativeSize), 1, 0),
				Text = TextLabelText,
				TextTransparency = TextTransparency,
				TextColor3 = TextLabelColor
			}),
			LinkButton = RoactModule.createElement(LinkButton, {
				layoutOrder = 2,
				fontStyle = FontStyle,
				size = ButtonSize,
				text = LinkText,
				colorStyleDefault = LinkColorStyle,
				colorStyleHover = LinkColorStyle,
				isDisabled = not TextButtonEnabled,
				onActivated = OnActivated
			})
		})
	end)
end