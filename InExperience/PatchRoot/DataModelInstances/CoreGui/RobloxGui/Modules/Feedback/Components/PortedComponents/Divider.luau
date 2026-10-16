local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local Cryo = InGameMenuDependenciesModule.Cryo
local T = InGameMenuDependenciesModule.t
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.withStyle
local GlobalConfigModule = require(script.Parent.Parent.Parent.GlobalConfig)
local StrictInterfaceResult = T.strictInterface({
	Size = T.optional(T.UDim2),
	Position = T.optional(T.UDim2),
	AnchorPoint = T.optional(T.Vector2),
	LayoutOrder = T.optional(T.integer),
	Visible = T.optional(T.boolean)
})

return function(p1) --[[ Line: 23 | Named "Divider" ]]
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithStyleFunction (copy), Roact (copy), Cryo (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(p1))
	end
	return WithStyleFunction(function(p2) --[[ Line: 28 ]]
		-- upvalues: Roact (upval), Cryo (upval), p1 (copy)
		return Roact.createElement("Frame", Cryo.Dictionary.join({ Size = UDim2.new(1, 0, 0, 1) }, p1, {
			BorderSizePixel = 0,
			BackgroundColor3 = p2.Theme.Divider.Color,
			BackgroundTransparency = p2.Theme.Divider.Transparency
		}))
	end)
end