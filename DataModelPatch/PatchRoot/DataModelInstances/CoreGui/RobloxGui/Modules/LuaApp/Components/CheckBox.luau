local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local CheckBox = RoactModule.PureComponent:extend("CheckBox")

function CheckBox.init(p1)
	p1.state = { hovering = false }
	
	function p1.onActivated()
		-- upvalues: p1 (copy)
		if p1.props.Enabled and p1.props.OnActivated then
			p1.props.OnActivated()
		end
	end
	
	function p1:onMouseEnter()
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval)
			p1:setState({ hovering = true })
		end)
	end
	
	function p1:onMouseLeave()
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval)
			p1:setState({ hovering = false })
		end)
	end
end

function CheckBox.render(p1)
	-- upvalues: RoactModule (copy), DEPRECATEDImageSetButtonModule (copy), DEPRECATEDImageSetLabelModule (copy)
	local Enabled = p1.props.Enabled
	local Height = p1.props.Height
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(0, Height, 0, Height)
	}, {
		Background = RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			ImageTransparency = if Enabled then 0 else 0.4,
			Image = if p1.state.hovering then "LuaApp/graphic/checkbox_unchecked_hover" elseif Enabled or p1.state.hovering then if Enabled then "LuaApp/graphic/checkbox_unchecked" else nil else "LuaApp/graphic/checkbox_unchecked_disabled",
			LayoutOrder = p1.props.LayoutOrder or 1,
			AutoButtonColor = false,
			[RoactModule.Event.Activated] = p1.onActivated,
			[RoactModule.Event.MouseEnter] = p1.onMouseEnter,
			[RoactModule.Event.MouseLeave] = p1.onMouseLeave
		}, {
			Selection = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Visible = p1.props.Selected,
				Image = if Enabled then "LuaApp/graphic/checkbox_checked" else "LuaApp/graphic/checkbox_checked_disabled"
			})
		})
	})
end

return CheckBox