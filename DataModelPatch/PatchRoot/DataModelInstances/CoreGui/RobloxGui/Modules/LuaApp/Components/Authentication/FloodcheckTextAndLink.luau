local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.withStyle
local AdjacentTextAndLinkModule = require(Modules.LuaApp.Components.AdjacentTextAndLink)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FloodcheckTextAndLink = RoactModule.PureComponent:extend("FloodcheckTextAndLink")
game:DefineFastInt("LuaSignupCooldownTimerSeconds", 15)
FloodcheckTextAndLink.defaultProps = {
	fontStyle = "CaptionBody",
	textLabelText = "",
	textButtonText = "",
	textButtonEnabled = true
}

function FloodcheckTextAndLink.init(p1)
	p1.state = { timer = 0 }
	p1.mounted = false
	local Flag = false
	
	function p1.onActivated(p2)
		-- upvalues: p1 (copy), Flag (ref)
		local TextButtonEnabled = p1.props.textButtonEnabled
		
		if not Flag and p1.state.timer == 0 and p1.mounted and TextButtonEnabled then
			Flag = true
			spawn(function()
				-- upvalues: p1 (upval), Flag (upval)
				Flag = false
				
				for i = p1.props.cooldownTime or game:GetFastInt("LuaSignupCooldownTimerSeconds"), 0, -1 do
					if not p1.mounted then break end
					p1:setState({ timer = i })
					wait(1)
				end
			end)
			
			if p1.props.onActivated then
				p1.props.onActivated(p2)
			end
		end
	end
end

function FloodcheckTextAndLink.didMount(p2)
	p2.mounted = true
end

function FloodcheckTextAndLink.willUnmount(p2)
	p2.mounted = false
end

function FloodcheckTextAndLink.render(p2)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), FitChildrenModule (copy), AdjacentTextAndLinkModule (copy), CryoModule (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: p2 (copy), RoactModule (upval), FitChildrenModule (upval), AdjacentTextAndLinkModule (upval), CryoModule (upval)
		local v1 = p3.Font[p2.props.fontStyle]
		local ScaledRelativeSize = v1.RelativeSize * p3.Font.BaseSize
		
		return RoactModule.createElement(FitChildrenModule.FitFrame, {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, ScaledRelativeSize),
			LayoutOrder = p2.props.LayoutOrder,
			fitAxis = FitChildrenModule.FitAxis.Width
		}, {
			TextAndLink = RoactModule.createElement(AdjacentTextAndLinkModule, CryoModule.Dictionary.join(p2.props, {
				textButtonEnabled = p2.state.timer == 0,
				onActivated = p2.onActivated
			})),
			Timer = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Font = v1.Font,
				TextSize = ScaledRelativeSize,
				Size = UDim2.fromOffset(0, ScaledRelativeSize),
				Position = UDim2.fromScale(1, 0),
				TextColor3 = p3.Theme.TextEmphasis.Color,
				Text = p2.state.timer > 0 and " " .. p2.state.timer or "",
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTransparency = p2.props.TextTransparency
			})
		})
	end)
end

return FloodcheckTextAndLink