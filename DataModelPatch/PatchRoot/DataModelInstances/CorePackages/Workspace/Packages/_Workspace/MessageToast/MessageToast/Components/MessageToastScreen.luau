local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Dash = DependenciesModule.Dash
local Toast = DependenciesModule.UIBlox.App.Dialog.Toast
local React = DependenciesModule.React
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UseNavigationFunction = DependenciesModule.Hooks.useNavigation
local UseDidUpdateFunction = DependenciesModule.Hooks.useDidUpdate
local GetTranslationKeysModule = require(script.Parent.getTranslationKeys)
local config = {
	duration = 2,
	messageType = require(Parent.Common.Types).DefaultError
}

return function(p1)
	-- upvalues: Dash (copy), config (copy), UseLocalizationFunction (copy), GetTranslationKeysModule (copy), UseNavigationFunction (copy), UseDidUpdateFunction (copy), React (copy), Toast (copy)
	local JoinResult = Dash.join(config, p1 or {})
	local UseLocalizationResult = UseLocalizationFunction(GetTranslationKeysModule(JoinResult.messageType, JoinResult.localizationOverrides))
	local UseNavigationResult = UseNavigationFunction()
	local UseDidUpdateResult = UseDidUpdateFunction()
	
	return React.createElement(Toast, {
		toastContent = React.useMemo(function()
			-- upvalues: UseLocalizationResult (copy), UseDidUpdateResult (copy), UseNavigationResult (copy)
			return {
				toastTitle = UseLocalizationResult.toastTitle,
				toastSubtitle = UseLocalizationResult.toastSubtitle,
				onDismissed = function()
					-- upvalues: UseDidUpdateResult (upval), UseNavigationResult (upval)
					if not UseDidUpdateResult.current then
						UseNavigationResult.goBack()
						
						return
					end
				end
			}
		end, {
			UseLocalizationResult.toastTitle,
			UseLocalizationResult.toastSubtitle
		}),
		duration = JoinResult.duration
	})
end