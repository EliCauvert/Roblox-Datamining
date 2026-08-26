local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local socialContextToasts = script:FindFirstAncestor("SocialContextToasts")
local parent = socialContextToasts.Parent
local localization = require(parent.RobloxAppLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local socialContextToastDispatcherModule = require(socialContextToasts.SocialContextToastDispatcher)
local toastRootModule = require(socialContextToasts.ToastRoot)
local toastTypesModule = require(socialContextToasts.Enums.ToastTypes)
local confirmationModalRootModule = require(socialContextToasts.ConfirmationModalRoot)
local displayOrderModule = require(parent.DisplayOrder)
local reactRobloxModule = require(parent.ReactRoblox)
local reactModule = require(parent.React)
local roduxModule = require(parent.Rodux)
local roactRoduxModule = require(parent.RoactRodux)
local cryoModule = require(parent.Cryo)
local displayOrderEnum = displayOrderModule.DisplayOrderEnum
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme
local getFFlagSocialContextToastEventStream = require(parent.SharedFlags).GetFFlagSocialContextToastEventStream

local function _(p1)
	-- upvalues: reactModule (ref), styleProviderWithDefaultTheme (ref)
	return reactModule.createElement(styleProviderWithDefaultTheme, {}, p1)
end

return function(p1, p2, p3)
	-- upvalues: coreGuiService (ref), toastTypesModule (ref), roduxModule (ref), cryoModule (ref), reactModule (ref), roactRoduxModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), displayOrderEnum (ref), socialContextToastDispatcherModule (ref), toastRootModule (ref), getFFlagSocialContextToastEventStream (ref), confirmationModalRootModule (ref), styleProviderWithDefaultTheme (ref), reactRobloxModule (ref)
	local socialContextToast = Instance.new("Folder")
	socialContextToast.Name = "SocialContextToast"
	socialContextToast.Parent = coreGuiService
	local var1 = reactModule.createElement(roactRoduxModule.StoreProvider, {
		store = roduxModule.Store.new(roduxModule.createReducer({}, {
			SetToastContent = function(value, p4)
				-- upvalues: cryoModule (copy)
				return cryoModule.Dictionary.join(value, { ToastContent = p4.toastContent })
			end,
			SetConfirmationModal = function(value, p4)
				-- upvalues: cryoModule (copy)
				return cryoModule.Dictionary.join(value, {
					ConfirmationModal = {
						isOpen = p4.isConfirmationModalOpen,
						closeCallback = p4.closeCallback
					}
				})
			end
		}), { ToastContent = { toastType = toastTypesModule.None } }, { roduxModule.thunkMiddleware })
	}, {
		StyleProvider = reactModule.createElement(styleProviderWithDefaultTheme, {}, {
			LocalizationProvider = reactModule.createElement(localizationProvider, {
				localization = localization.new(localizationService.RobloxLocaleId)
			}, {
				SocialContextToastGUI = reactModule.createElement("ScreenGui", {
					DisplayOrder = displayOrderEnum.SocialContextToastContainer,
					ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
				}, {
					ToastDispatcher = reactModule.createElement(socialContextToastDispatcherModule, { services = p1, gameId = p2, placeId = p3 }),
					ToastRoot = reactModule.createElement(toastRootModule, {
						analyticsProps = if getFFlagSocialContextToastEventStream() then { eventIngest = p1.eventIngest, gameId = p2, placeId = p3 } else nil
					}),
					ConfirmationModalRoot = reactModule.createElement(confirmationModalRootModule)
				})
			})
		})
	})
	reactRobloxModule.createRoot(socialContextToast):render(var1)
	
	return var1
end