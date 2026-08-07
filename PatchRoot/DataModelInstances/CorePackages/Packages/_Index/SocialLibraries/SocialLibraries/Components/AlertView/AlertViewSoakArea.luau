-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:23 2026 Pacific Standard Time.

local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local socialLibrariesSelectableAlertViewShim = game:DefineFastFlag("SocialLibrariesSelectableAlertViewShim", false)
local alertViewSoakArea = roact.PureComponent:extend("AlertViewSoakArea")
alertViewSoakArea.defaultProps = {
	Visible = true,
	BackgroundTransparency = 0.75,
	BackgroundColor3 = Color3.fromRGB(255, 0, 255)
}

function alertViewSoakArea.render(p0) --[[ line: 14 ]]
	-- upvalues: roact (ref), socialLibrariesSelectableAlertViewShim (ref)
	return roact.createElement("ImageButton", {
		Active = true,
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = p0.props.BackgroundTransparency,
		BackgroundColor3 = p0.props.BackgroundColor3,
		Selectable = if socialLibrariesSelectableAlertViewShim then false else nil,
		Visible = p0.props.Visible
	}, p0.props[roact.Children])
end

return alertViewSoakArea