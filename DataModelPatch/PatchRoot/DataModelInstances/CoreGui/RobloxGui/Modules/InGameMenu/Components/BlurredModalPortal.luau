local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local VRService = game:GetService("VRService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local ConstantsModule = require(script:FindFirstAncestor("InGameMenu").Resources.Constants)
local BlurredModalPortal = Roact.PureComponent:extend("BlurredModalPortal")
BlurredModalPortal.validateProps = T.strictInterface({
	Enabled = T.boolean,
	[Roact.Children] = T.optional(T.table)
})

function BlurredModalPortal.render(p1)
	-- upvalues: Roact (copy), CoreGui (copy), ConstantsModule (copy)
	return Roact.createElement(Roact.Portal, { target = CoreGui }, {
		InGameMenuModalBlur = Roact.createElement("ScreenGui", {
			OnTopOfCoreBlur = true,
			IgnoreGuiInset = true,
			Enabled = p1.props.Enabled,
			DisplayOrder = ConstantsModule.DisplayOrder.BlurredModalPortal
		}, p1.props[Roact.Children])
	})
end

function BlurredModalPortal.didUpdate(p1, p2)
	-- upvalues: VRService (copy), RunService (copy)
	if VRService.VREnabled then return end
	local Enabled = p1.props.Enabled
	
	if p2.Enabled ~= Enabled then
		RunService:SetRobloxGuiFocused(Enabled)
	end
end

return BlurredModalPortal