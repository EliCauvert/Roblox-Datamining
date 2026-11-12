local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FoundationModule = require(Parent.Foundation)
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize
local _ = require(AmpV2Wizard.Types)
local FFlagAmpV2WizardRetryAmpModule = require(AmpV2Wizard.Flags.FFlagAmpV2WizardRetryAmp)

return function(Callback)
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), ReactModule (copy), FFlagAmpV2WizardRetryAmpModule (copy), Loading (copy), IconSize (copy)
	return function(p1)
		-- upvalues: UseNavigationFunction (upval), UseDispatchFunction (upval), ReactModule (upval), Callback (copy), FFlagAmpV2WizardRetryAmpModule (upval), Loading (upval), IconSize (upval)
		local Props = p1.props
		local Ctx = p1.ctx
		local Report = p1.report
		local UseNavigationResult = UseNavigationFunction()
		local UseDispatchResult = UseDispatchFunction()
		ReactModule.useEffect(function()
			-- upvalues: Callback (upval), UseNavigationResult (copy), UseDispatchResult (copy), Props (copy), Ctx (copy), Report (copy)
			Callback({
				navigation = UseNavigationResult,
				dispatch = UseDispatchResult
			}, Props, Ctx, Report)
		end, if FFlagAmpV2WizardRetryAmpModule then { Props } else {})
		
		return ReactModule.createElement(Loading, {
			size = IconSize.Medium,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		})
	end
end