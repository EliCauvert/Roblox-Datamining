local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local localizationService = game:GetService("LocalizationService")
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme
local localization = require(parent.RobloxAppLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local useLocalization = require(parent.Localization).Hooks.useLocalization
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local images = UIBloxModule.App.ImageSet.Images
local toast = UIBloxModule.App.Dialog.Toast
local getFFlagNotificationModalSetMenuIsOpen = require(parent.SharedFlags).GetFFlagNotificationModalSetMenuIsOpen
local openModal = require(parent.NotificationModalsManager).OpenModal
local closeModal = require(parent.NotificationModalsManager).CloseModal
local inExperienceProviderContainer = require(parent.InExperienceContainer).InExperienceProviderContainer
local inGameUpsellContainerModule = require(phoneUpsell.Components.InGame.InGameUpsellContainer)
local var1 = nil

local var2 = function(p1)
	-- upvalues: useLocalization (ref), useStyle (ref), reactModule (ref), toast (ref), images (ref)
	return reactModule.createElement(reactModule.Fragment, {}, {
		PhoneToast = reactModule.createElement(toast, {
			duration = 3,
			toastContent = {
				iconColorStyle = {
					Transparency = 0,
					Color = useStyle().Tokens.Color.System.Success.Color3
				},
				iconImage = images["icons/status/success_large"],
				toastTitle = useLocalization({
					titleKey = "Feature.VerificationUpsell.Heading.PhoneNumberVerified"
				}).titleKey,
				onDismissed = p1.onDismissed
			}
		})
	})
end

return {
	openPhoneUpsell = function(p1)
		-- upvalues: var1 (write), reactRobloxModule (ref), openModal (ref), inExperienceProviderContainer (ref), reactModule (ref), inGameUpsellContainerModule (ref), cryoModule (ref), closeModal (ref), localizationProvider (ref), localization (ref), localizationService (ref), styleProviderWithDefaultTheme (ref), var2 (ref), getFFlagNotificationModalSetMenuIsOpen (ref)
		if var1 == nil then
			local phoneUpsellToasts = Instance.new("Folder")
			phoneUpsellToasts.Name = "PhoneUpsellToasts"
			phoneUpsellToasts.Parent = game:GetService("CoreGui")
			var1 = reactRobloxModule.createRoot(phoneUpsellToasts)
		end
		openModal("PHONE_UPSELL_KEY", inExperienceProviderContainer, {
			DisableBackgroundDismiss = true,
			Props = {
				children = reactModule.createElement(inGameUpsellContainerModule, cryoModule.Dictionary.join(p1, {
					closeUpsell = function()
						-- upvalues: closeModal (copy), p1 (ref)
						closeModal("PHONE_UPSELL_KEY")
						
						if p1.closeUpsell then
							p1.closeUpsell()
						end
					end,
					onSuccess = function()
						-- upvalues: closeModal (copy), p1 (ref), var1 (copy), reactModule (copy), localizationProvider (copy), localization (copy), localizationService (copy), styleProviderWithDefaultTheme (copy), var2 (copy)
						closeModal("PHONE_UPSELL_KEY")
						
						if p1.onSuccessBeforeToast then
							p1.onSuccessBeforeToast()
						end
						var1:render(reactModule.createElement("ScreenGui", {
							IgnoreGuiInset = true,
							ResetOnSpawn = false,
							DisplayOrder = 0,
							Enabled = true,
							ZIndexBehavior = Enum.ZIndexBehavior.Sibling
						}, {
							ContainerFrame = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
								LocalizationProvider = reactModule.createElement(localizationProvider, {
									localization = localization.new(localizationService.RobloxLocaleId)
								}, {
									StyleProvider = reactModule.createElement(styleProviderWithDefaultTheme, {}, {
										Frame = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
											Toast = reactModule.createElement(var2, {
												onDismissed = function()
													-- upvalues: p1 (copy), var1 (copy)
													if p1.onSuccess then
														p1.onSuccess()
													end
													var1:unmount()
												end
											}, {})
										})
									})
								})
							})
						}))
					end
				}))
			},
			BlockNonCoreUserInput = getFFlagNotificationModalSetMenuIsOpen()
		})
	end
}