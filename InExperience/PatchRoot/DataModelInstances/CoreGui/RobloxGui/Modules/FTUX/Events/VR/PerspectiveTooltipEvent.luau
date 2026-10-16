local CoreGui = game:GetService("CoreGui")
local _ = require(script.Parent.Parent.EventType)
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local VRFTUXToolTipsModule = require(script.Parent.Parent.Parent.Components.Tooltips.VRFTUXToolTips)
local RenderWithCoreScriptsStyleProviderModule = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local PerspectiveTooltip = nil

return {
	Name = "PerspectiveTooltipEvent",
	StartEvent = function() --[[ Line: 27 ]]
		-- upvalues: RoactModule (copy), VRFTUXToolTipsModule (copy), RenderWithCoreScriptsStyleProviderModule (copy), PerspectiveTooltip (ref), CoreGui (copy)
		PerspectiveTooltip = RoactModule.mount(RenderWithCoreScriptsStyleProviderModule({
			(RoactModule.createElement(VRFTUXToolTipsModule, {
				tooltipButtons = {
					{
						Text = "Press",
						Controller = Enum.UserCFrame.RightHand,
						ButtonKeycode = Enum.KeyCode.ButtonR3
					}
				}
			}))
		}), CoreGui:FindFirstChild("FTUXMenu"), "PerspectiveTooltip")
	end,
	StopEvent = function() --[[ Line: 48 ]]
		-- upvalues: PerspectiveTooltip (ref), RoactModule (copy)
		if PerspectiveTooltip then
			RoactModule.unmount(PerspectiveTooltip)
		end
	end
}