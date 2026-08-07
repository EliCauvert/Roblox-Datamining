local parent = script.Parent.Parent.Parent.Parent.Parent
local tModule = require(parent.t)

return tModule.strictInterface({
	PreferredTransparency = tModule.optional(tModule.number),
	ReducedMotion = tModule.optional(tModule.boolean),
	PreferredTextSize = if require(parent.UIBlox.Core.Utility.GetEngineFeatureSafe)("EnablePreferredTextSizeSetting") then tModule.optional(tModule.enum(Enum.PreferredTextSize)) else nil,
	Scale = tModule.optional(tModule.number)
})