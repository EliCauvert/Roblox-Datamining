local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local ExtendResult = RoactModule.PureComponent:extend(script.Name)
ExtendResult.defaultProps = { contentWidth = 0 }

function ExtendResult.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), FitTextLabelModule (copy), FitChildrenModule (copy)
	local ContentWidth = p1.props.contentWidth
	local LayoutOrder = p1.props.layoutOrder
	local RichText = p1.props.richText
	local Text = p1.props.text
	
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), ContentWidth (copy), RoactModule (upval), FitTextLabelModule (upval), FitChildrenModule (upval), LayoutOrder (copy), RichText (copy), Text (copy)
		return RoactModule.createElement(FitTextLabelModule, {
			BackgroundTransparency = 1,
			TextWrapped = true,
			fitAxis = FitChildrenModule.FitAxis.Height,
			Font = if p1.props.useBold == true then p2.Font.Header1.Font else p2.Font.Body.Font,
			LayoutOrder = LayoutOrder or nil,
			RichText = RichText,
			Size = UDim2.new(0, ContentWidth, 0, 0),
			AutomaticSize = if ContentWidth == 0 then Enum.AutomaticSize.X else nil,
			Text = Text,
			TextColor3 = p2.Theme.TextDefault.Color,
			TextSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize,
			TextTransparency = p2.Theme.TextDefault.Transparency,
			TextXAlignment = if p1.props.alignLeft == true then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center
		})
	end)
end

return ExtendResult