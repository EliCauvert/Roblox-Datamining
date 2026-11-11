game:DefineFastFlag("UGCValidationAnimationPackSupport", false)
local Success = pcall(function()
	local _ = Enum.BundleType.Animations
	local _ = Enum.AssetType.ClimbAnimation
end)

return function()
	-- upvalues: Success (copy)
	return Success and game:GetFastFlag("UGCValidationAnimationPackSupport")
end