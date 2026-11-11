local CoreGui = game:GetService("CoreGui")
local _ = require(script.Parent.Parent.EventType)
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local VRFTUXToolTipsModule = require(script.Parent.Parent.Parent.Components.Tooltips.VRFTUXToolTips)
local RenderWithCoreScriptsStyleProviderModule = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local MovementTooltip = nil

return {
	Name = "MovementTooltipEvent",
	StartEvent = function()
		-- upvalues: RoactModule (copy), VRFTUXToolTipsModule (copy), RenderWithCoreScriptsStyleProviderModule (copy), MovementTooltip (ref), CoreGui (copy)
		MovementTooltip = RoactModule.mount(RenderWithCoreScriptsStyleProviderModule({
			(RoactModule.createElement(VRFTUXToolTipsModule, {
				tooltipButtons = {
					{
						Text = "Turn",
						Controller = Enum.UserCFrame.RightHand,
						ButtonKeycode = Enum.KeyCode.ButtonR3
					},
					{
						Text = "Move",
						Controller = Enum.UserCFrame.LeftHand,
						ButtonKeycode = Enum.KeyCode.ButtonL3
					},
					{
						Text = "Jump",
						Controller = Enum.UserCFrame.RightHand,
						ButtonKeycode = Enum.KeyCode.ButtonA
					}
				}
			}))
		}), CoreGui:FindFirstChild("FTUXMenu"), "MovementTooltip")
	end,
	StopEvent = function()
		-- upvalues: MovementTooltip (ref), RoactModule (copy)
		if MovementTooltip then
			RoactModule.unmount(MovementTooltip)
		end
	end
}