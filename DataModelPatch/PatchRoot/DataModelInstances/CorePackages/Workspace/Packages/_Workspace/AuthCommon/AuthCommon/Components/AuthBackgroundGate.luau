local UseAuthBackgroundContainerVariantModule = require(script:FindFirstAncestor("AuthCommon").Hooks.useAuthBackgroundContainerVariant)

return function(p1)
	-- upvalues: UseAuthBackgroundContainerVariantModule (copy)
	return if UseAuthBackgroundContainerVariantModule() then p1.renderTreatment() else p1.renderLegacy()
end