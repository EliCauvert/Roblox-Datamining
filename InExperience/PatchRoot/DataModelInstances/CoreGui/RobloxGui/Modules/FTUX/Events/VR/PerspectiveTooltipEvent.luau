local coreGuiService = game:GetService("CoreGui")
local _ = require(script.Parent.Parent.EventType)
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local VRFTUXToolTipsModule = require(script.Parent.Parent.Parent.Components.Tooltips.VRFTUXToolTips)
local renderWithCoreScriptsStyleProviderModule = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local t = { Name = "PerspectiveTooltipEvent" }
local var5 = nil

function t.StartEvent()
	-- upvalues: roactModule (ref), VRFTUXToolTipsModule (ref), renderWithCoreScriptsStyleProviderModule (ref), var5 (write), coreGuiService (ref)
	var5 = roactModule.mount(renderWithCoreScriptsStyleProviderModule({
		roactModule.createElement(VRFTUXToolTipsModule, {
			tooltipButtons = {
				{
					Text = "Press",
					Controller = Enum.UserCFrame.RightHand,
					ButtonKeycode = Enum.KeyCode.ButtonR3
				}
			}
		})
	}), coreGuiService:FindFirstChild("FTUXMenu"), "PerspectiveTooltip")
end

function t.StopEvent()
	-- upvalues: var5 (write), roactModule (ref)
	if var5 then
		roactModule.unmount(var5)
	end
end

return t