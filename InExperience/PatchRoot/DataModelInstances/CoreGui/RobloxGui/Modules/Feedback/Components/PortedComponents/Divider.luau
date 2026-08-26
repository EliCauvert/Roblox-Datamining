local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local withStyle = UIBloxModule.Core.Style.withStyle
local globalConfigModule = require(script.Parent.Parent.Parent.GlobalConfig)
local var1 = t.strictInterface({
	Size = t.optional(t.UDim2),
	Position = t.optional(t.UDim2),
	AnchorPoint = t.optional(t.Vector2),
	LayoutOrder = t.optional(t.integer),
	Visible = t.optional(t.boolean)
})

return function(p1)
	-- upvalues: globalConfigModule (ref), var1 (ref), withStyle (ref), roact (ref), cryo (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	return withStyle(function(p2)
		-- upvalues: roact (copy), cryo (copy), p1 (ref)
		return roact.createElement("Frame", cryo.Dictionary.join({ Size = UDim2.new(1, 0, 0, 1) }, p1, {
			BorderSizePixel = 0,
			BackgroundColor3 = p2.Theme.Divider.Color,
			BackgroundTransparency = p2.Theme.Divider.Transparency
		}))
	end)
end