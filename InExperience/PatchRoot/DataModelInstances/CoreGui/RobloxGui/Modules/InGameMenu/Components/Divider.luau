local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local globalConfigModule = require(script.Parent.Parent.GlobalConfig)
local var1 = t.strictInterface({
	Size = t.optional(t.UDim2),
	Position = t.optional(t.UDim2),
	AnchorPoint = t.optional(t.Vector2),
	LayoutOrder = t.optional(t.integer),
	Visible = t.optional(t.boolean)
})

return function(p1)
	-- upvalues: globalConfigModule (ref), var1 (ref), withFoundationOrUIBloxStyle (ref), roact (ref), cryo (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	return withFoundationOrUIBloxStyle(function(p2)
		return {
			Theme = {
				Divider = {
					Color = p2.Color.Stroke.Emphasis.Color3,
					Transparency = p2.Color.Stroke.Emphasis.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: roact (copy), cryo (copy), p1 (ref)
		return roact.createElement("Frame", cryo.Dictionary.join({ Size = UDim2.new(1, 0, 0, 1) }, p1, {
			BorderSizePixel = 0,
			BackgroundColor3 = p2.Theme.Divider.Color,
			BackgroundTransparency = p2.Theme.Divider.Transparency
		}))
	end)
end