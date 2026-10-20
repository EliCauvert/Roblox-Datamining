local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local Parent = PhoneUpsell.Parent
local LocalizationService = game:GetService("LocalizationService")
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local Localization = require(Parent.RobloxAppLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Images = UIBloxModule.App.ImageSet.Images
local Toast = UIBloxModule.App.Dialog.Toast
local GetFFlagNotificationModalSetMenuIsOpenFunction = require(Parent.SharedFlags).GetFFlagNotificationModalSetMenuIsOpen
local OpenModalFunction = require(Parent.NotificationModalsManager).OpenModal
local CloseModalFunction = require(Parent.NotificationModalsManager).CloseModal
local InExperienceProviderContainer = require(Parent.InExperienceContainer).InExperienceProviderContainer
local InGameUpsellContainerModule = require(PhoneUpsell.Components.InGame.InGameUpsellContainer)
local Root = nil

local function v15(p1)
	-- upvalues: UseLocalizationFunction (copy), UseStyleFunction (copy), ReactModule (copy), Toast (copy), Images (copy)
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		PhoneToast = ReactModule.createElement(Toast, {
			duration = 3,
			toastContent = {
				iconColorStyle = {
					Transparency = 0,
					Color = UseStyleFunction().Tokens.Color.System.Success.Color3
				},
				iconImage = Images["icons/status/success_large"],
				toastTitle = UseLocalizationFunction({
					titleKey = "Feature.VerificationUpsell.Heading.PhoneNumberVerified"
				}).titleKey,
				onDismissed = p1.onDismissed
			}
		})
	})
end

return {
	openPhoneUpsell = function(p1)
		-- upvalues: Root (ref), ReactRobloxModule (copy), OpenModalFunction (copy), InExperienceProviderContainer (copy), ReactModule (copy), InGameUpsellContainerModule (copy), CryoModule (copy), CloseModalFunction (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), StyleProviderWithDefaultTheme (copy), v15 (copy), GetFFlagNotificationModalSetMenuIsOpenFunction (copy)
		if Root == nil then
			local PhoneUpsellToasts = Instance.new("Folder")
			PhoneUpsellToasts.Name = "PhoneUpsellToasts"
			PhoneUpsellToasts.Parent = game:GetService("CoreGui")
			Root = ReactRobloxModule.createRoot(PhoneUpsellToasts)
		end
		OpenModalFunction("PHONE_UPSELL_KEY", InExperienceProviderContainer, {
			DisableBackgroundDismiss = true,
			Props = {
				children = ReactModule.createElement(InGameUpsellContainerModule, CryoModule.Dictionary.join(p1, {
					closeUpsell = function()
						-- upvalues: CloseModalFunction (upval), p1 (copy)
						CloseModalFunction("PHONE_UPSELL_KEY")
						
						if p1.closeUpsell then
							p1.closeUpsell()
						end
					end,
					onSuccess = function()
						-- upvalues: CloseModalFunction (upval), p1 (copy), Root (upval), ReactModule (upval), LocalizationProvider (upval), Localization (upval), LocalizationService (upval), StyleProviderWithDefaultTheme (upval), v15 (upval)
						CloseModalFunction("PHONE_UPSELL_KEY")
						
						if p1.onSuccessBeforeToast then
							p1.onSuccessBeforeToast()
						end
						Root:render(ReactModule.createElement("ScreenGui", {
							IgnoreGuiInset = true,
							ResetOnSpawn = false,
							DisplayOrder = 0,
							Enabled = true,
							ZIndexBehavior = Enum.ZIndexBehavior.Sibling
						}, {
							ContainerFrame = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
								LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
									localization = Localization.new(LocalizationService.RobloxLocaleId)
								}, {
									StyleProvider = ReactModule.createElement(StyleProviderWithDefaultTheme, {}, {
										Frame = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
											Toast = ReactModule.createElement(v15, {
												onDismissed = function()
													-- upvalues: p1 (upval), Root (upval)
													if p1.onSuccess then
														p1.onSuccess()
													end
													Root:unmount()
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
			BlockNonCoreUserInput = GetFFlagNotificationModalSetMenuIsOpenFunction()
		})
	end
}