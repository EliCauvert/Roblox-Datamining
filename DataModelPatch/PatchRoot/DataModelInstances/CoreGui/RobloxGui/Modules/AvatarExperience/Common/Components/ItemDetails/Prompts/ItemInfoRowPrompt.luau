local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local Common = game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common
local NavigationUtilsModule = require(Common.Components.RoactNavigation.NavigationUtils)
local WithMappedNavigationParamsModule = require(Common.Components.RoactNavigation.withMappedNavigationParams)
local ModalWindow = require(CorePackages.Packages.UIBlox).App.Dialog.Modal.ModalWindow
local FoundationModule = require(CorePackages.Packages.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local InputSize = FoundationModule.Enums.InputSize
local FillBehavior = FoundationModule.Enums.FillBehavior

function ItemInfoRowPrompt(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), NavigationUtilsModule (copy), View (copy), Text (copy), Button (copy), FillBehavior (copy), InputSize (copy), ModalWindow (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		message = p1.message,
		confirmButtonText = p1.confirmButtonText
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeFocusedScreen(p1.navigation)
	end, { p1.navigation })
	
	return ReactModule.createElement(ModalWindow, { isFullHeight = false, screenSize = p1.screenSize }, ((function()
		-- upvalues: ReactModule (upval), View (upval), Text (upval), UseLocalizationResult (copy), Button (upval), FillBehavior (upval), InputSize (upval), UseResult (copy)
		return {
			container = ReactModule.createElement(View, { tag = "size-full-0 auto-y padding-xlarge col gap-large" }, {
				Text = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-align-x-left text-body-large text-wrap",
					RichText = true,
					LayoutOrder = 2,
					Text = UseLocalizationResult.message
				}),
				Footer = ReactModule.createElement(View, { tag = "row size-full-0 auto-y", LayoutOrder = 3 }, {
					Button = ReactModule.createElement(Button, {
						tag = "size-full-0 auto-y",
						fillBehavior = FillBehavior.Fill,
						text = UseLocalizationResult.confirmButtonText,
						size = InputSize.Large,
						onActivated = UseResult
					})
				})
			})
		}
	end)()))
end

return WithMappedNavigationParamsModule(ItemInfoRowPrompt)