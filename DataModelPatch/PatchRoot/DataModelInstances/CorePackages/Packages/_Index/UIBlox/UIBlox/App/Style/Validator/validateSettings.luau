local Parent = script.Parent.Parent.Parent.Parent.Parent
local TModule = require(Parent.t)

return (TModule.strictInterface({
	PreferredTransparency = TModule.optional(TModule.number),
	ReducedMotion = TModule.optional(TModule.boolean),
	PreferredTextSize = if require(Parent.UIBlox.Core.Utility.GetEngineFeatureSafe)("EnablePreferredTextSizeSetting") then TModule.optional(TModule.enum(Enum.PreferredTextSize)) else nil,
	Scale = TModule.optional(TModule.number)
}))