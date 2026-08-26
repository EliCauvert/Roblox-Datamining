local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local runService = game:GetService("RunService")
local VRService = game:GetService("VRService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local constantsModule = require(script:FindFirstAncestor("InGameMenu").Resources.Constants)
local blurredModalPortal = roact.PureComponent:extend("BlurredModalPortal")
blurredModalPortal.validateProps = t.strictInterface({
	Enabled = t.boolean,
	[roact.Children] = t.optional(t.table)
})

function blurredModalPortal.render(p1)
	-- upvalues: roact (ref), coreGuiService (ref), constantsModule (ref)
	return roact.createElement(roact.Portal, { target = coreGuiService }, {
		InGameMenuModalBlur = roact.createElement("ScreenGui", {
			OnTopOfCoreBlur = true,
			IgnoreGuiInset = true,
			Enabled = p1.props.Enabled,
			DisplayOrder = constantsModule.DisplayOrder.BlurredModalPortal
		}, p1.props[roact.Children])
	})
end

function blurredModalPortal.didUpdate(p1, p2)
	-- upvalues: VRService (ref), runService (ref)
	if VRService.VREnabled then return end
	local enabled = p1.props.Enabled
	
	if p2.Enabled ~= enabled then
		runService:SetRobloxGuiFocused(enabled)
	end
end

return blurredModalPortal