local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local globalConfigModule = require(script.Parent.Parent.GlobalConfig)
local var3 = t.strictInterface({
	Size = t.optional(t.UDim2),
	Position = t.optional(t.UDim2),
	AnchorPoint = t.optional(t.Vector2),
	LayoutOrder = t.optional(t.integer),
	Visible = t.optional(t.boolean)
})

return function(p0) --[[ line: 22 | named "Divider" ]]
	-- upvalues: globalConfigModule (ref), var3 (ref), withFoundationOrUIBloxStyle (ref), roact (ref), cryo (ref)
	if globalConfigModule.propValidation then
		assert(var3(p0))
	end
	return withFoundationOrUIBloxStyle(function(p1) --[[ line: 27 ]]
		return {
			Theme = {
				Divider = {
					Color = p1.Color.Stroke.Emphasis.Color3,
					Transparency = p1.Color.Stroke.Emphasis.Transparency
				}
			}
		}
	end, function(p2) --[[ line: 33 ]]
		-- upvalues: roact (copy), cryo (copy), p0 (ref)
		return roact.createElement("Frame", cryo.Dictionary.join({ Size = UDim2.new(1, 0, 0, 1) }, p0, {
			BorderSizePixel = 0,
			BackgroundColor3 = p2.Theme.Divider.Color,
			BackgroundTransparency = p2.Theme.Divider.Transparency
		}))
	end)
end