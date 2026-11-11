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
	local ErrorText = p1.props.errorText
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), FitTextLabelModule (upval), FitChildrenModule (upval), LayoutOrder (copy), ContentWidth (copy), ErrorText (copy)
		return RoactModule.createElement(FitTextLabelModule, {
			BackgroundTransparency = 1,
			TextWrapped = true,
			fitAxis = FitChildrenModule.FitAxis.Height,
			Font = p2.Font.Footer.Font,
			LayoutOrder = LayoutOrder or nil,
			Size = UDim2.new(0, ContentWidth, 0, 0),
			Text = ErrorText,
			TextColor3 = p2.Theme.Alert.Color,
			TextSize = p2.Font.BaseSize * p2.Font.Footer.RelativeSize,
			TextTransparency = p2.Theme.TextDefault.Transparency,
			TextXAlignment = Enum.TextXAlignment.Center
		})
	end)
end

return ExtendResult