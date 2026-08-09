local useAuthBackgroundContainerVariantModule = require(script:FindFirstAncestor("AuthCommon").Hooks.useAuthBackgroundContainerVariant)

return function(value) --[[ line: 28 | named "AuthBackgroundGate" ]]
	-- upvalues: useAuthBackgroundContainerVariantModule (ref)
	return if useAuthBackgroundContainerVariantModule() then value.renderTreatment() else value.renderLegacy()
end