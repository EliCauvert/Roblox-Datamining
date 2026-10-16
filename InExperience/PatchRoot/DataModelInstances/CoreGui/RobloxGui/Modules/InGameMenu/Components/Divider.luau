local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local Cryo = InGameMenuDependenciesModule.Cryo
local T = InGameMenuDependenciesModule.t
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local GlobalConfigModule = require(script.Parent.Parent.GlobalConfig)
local StrictInterfaceResult = T.strictInterface({
	Size = T.optional(T.UDim2),
	Position = T.optional(T.UDim2),
	AnchorPoint = T.optional(T.Vector2),
	LayoutOrder = T.optional(T.integer),
	Visible = T.optional(T.boolean)
})

return function(p1) --[[ Line: 22 | Named "Divider" ]]
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), Cryo (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(p1))
	end
	return WithFoundationOrUIBloxStyleFunction(function(p2) --[[ Line: 27 ]]
		return {
			Theme = {
				Divider = {
					Color = p2.Color.Stroke.Emphasis.Color3,
					Transparency = p2.Color.Stroke.Emphasis.Transparency
				}
			}
		}
	end, function(p2) --[[ Line: 33 ]]
		-- upvalues: Roact (upval), Cryo (upval), p1 (copy)
		return Roact.createElement("Frame", Cryo.Dictionary.join({ Size = UDim2.new(1, 0, 0, 1) }, p1, {
			BorderSizePixel = 0,
			BackgroundColor3 = p2.Theme.Divider.Color,
			BackgroundTransparency = p2.Theme.Divider.Transparency
		}))
	end)
end