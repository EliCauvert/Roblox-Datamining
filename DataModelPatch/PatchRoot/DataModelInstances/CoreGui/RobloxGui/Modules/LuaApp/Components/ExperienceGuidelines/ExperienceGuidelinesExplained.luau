local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local ExperienceGuidelinesExplainedModalModule = require(script.Parent.ExperienceGuidelinesExplainedModal)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), ExperienceGuidelinesExplainedModalModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement(ExperienceGuidelinesExplainedModalModule, {
		universeId = p1.universeId,
		hideCloseButton = p1.hideCloseButton,
		closeModal = if p1.closeCentralOverlayThunk then function()
			-- upvalues: UseDispatchResult (copy), p1 (copy)
			UseDispatchResult(p1.closeCentralOverlayThunk())
		end else nil
	})
end