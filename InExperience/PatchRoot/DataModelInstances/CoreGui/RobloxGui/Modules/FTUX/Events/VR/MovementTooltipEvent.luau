local coreGuiService = game:GetService("CoreGui")
local _ = require(script.Parent.Parent.EventType)
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local VRFTUXToolTipsModule = require(script.Parent.Parent.Parent.Components.Tooltips.VRFTUXToolTips)
local renderWithCoreScriptsStyleProviderModule = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local t = { Name = "MovementTooltipEvent" }
local var1 = nil

function t.StartEvent()
	-- upvalues: roactModule (ref), VRFTUXToolTipsModule (ref), renderWithCoreScriptsStyleProviderModule (ref), var1 (write), coreGuiService (ref)
	var1 = roactModule.mount(renderWithCoreScriptsStyleProviderModule({
		roactModule.createElement(VRFTUXToolTipsModule, {
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
		})
	}), coreGuiService:FindFirstChild("FTUXMenu"), "MovementTooltip")
end

function t.StopEvent()
	-- upvalues: var1 (write), roactModule (ref)
	if var1 then
		roactModule.unmount(var1)
	end
end

return t