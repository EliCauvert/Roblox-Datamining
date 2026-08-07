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
local var7 = nil

local var8 = function(p0) --[[ line: 29 ]]
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
				onDismissed = p0.onDismissed
			}
		})
	})
end

return {
	openPhoneUpsell = function(p1) --[[ line: 54 ]]
		-- upvalues: var7 (write), reactRobloxModule (ref), openModal (ref), inExperienceProviderContainer (ref), reactModule (ref), inGameUpsellContainerModule (ref), cryoModule (ref), closeModal (ref), localizationProvider (ref), localization (ref), localizationService (ref), styleProviderWithDefaultTheme (ref), var8 (ref), getFFlagNotificationModalSetMenuIsOpen (ref)
		if var7 == nil then
			local phoneUpsellToasts = Instance.new("Folder")
			phoneUpsellToasts.Name = "PhoneUpsellToasts"
			phoneUpsellToasts.Parent = game:GetService("CoreGui")
			var7 = reactRobloxModule.createRoot(phoneUpsellToasts)
		end
		openModal("PHONE_UPSELL_KEY", inExperienceProviderContainer, {
			DisableBackgroundDismiss = true,
			Props = {
				children = reactModule.createElement(inGameUpsellContainerModule, cryoModule.Dictionary.join(p1, {
					closeUpsell = function() --[[ line: 66 ]]
						-- upvalues: closeModal (copy), p1 (ref)
						closeModal("PHONE_UPSELL_KEY")
						
						if p1.closeUpsell then
							p1.closeUpsell()
						end
					end,
					onSuccess = function() --[[ line: 72 ]]
						-- upvalues: closeModal (copy), p1 (ref), var7 (copy), reactModule (copy), localizationProvider (copy), localization (copy), localizationService (copy), styleProviderWithDefaultTheme (copy), var8 (copy)
						closeModal("PHONE_UPSELL_KEY")
						
						if p1.onSuccessBeforeToast then
							p1.onSuccessBeforeToast()
						end
						var7:render(reactModule.createElement("ScreenGui", {
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
											Toast = reactModule.createElement(var8, {
												onDismissed = function() --[[ line: 97 ]]
													-- upvalues: p1 (copy), var7 (copy)
													if p1.onSuccess then
														p1.onSuccess()
													end
													var7:unmount()
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