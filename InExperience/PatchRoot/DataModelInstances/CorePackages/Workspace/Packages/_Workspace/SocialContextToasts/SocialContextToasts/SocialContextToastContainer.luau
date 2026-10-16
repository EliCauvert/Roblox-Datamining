local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local SocialContextToasts = script:FindFirstAncestor("SocialContextToasts")
local Parent = SocialContextToasts.Parent
local Localization = require(Parent.RobloxAppLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local SocialContextToastDispatcherModule = require(SocialContextToasts.SocialContextToastDispatcher)
local ToastRootModule = require(SocialContextToasts.ToastRoot)
local ToastTypesModule = require(SocialContextToasts.Enums.ToastTypes)
local ConfirmationModalRootModule = require(SocialContextToasts.ConfirmationModalRoot)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ReactModule = require(Parent.React)
local RoduxModule = require(Parent.Rodux)
local RoactRoduxModule = require(Parent.RoactRodux)
local CryoModule = require(Parent.Cryo)
local DisplayOrderEnum = require(Parent.DisplayOrder).DisplayOrderEnum
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local GetFFlagSocialContextToastEventStreamFunction = require(Parent.SharedFlags).GetFFlagSocialContextToastEventStream

local function _(p1) --[[ Line: 29 | Named "renderWithStyleProvider" ]]
	-- upvalues: ReactModule (copy), StyleProviderWithDefaultTheme (copy)
	return ReactModule.createElement(StyleProviderWithDefaultTheme, {}, p1)
end

return function(Services, GameId, PlaceId) --[[ Line: 33 | Named "SocialContextToastContainer" ]]
	-- upvalues: CoreGui (copy), ToastTypesModule (copy), RoduxModule (copy), CryoModule (copy), ReactModule (copy), RoactRoduxModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), DisplayOrderEnum (copy), SocialContextToastDispatcherModule (copy), ToastRootModule (copy), GetFFlagSocialContextToastEventStreamFunction (copy), ConfirmationModalRootModule (copy), StyleProviderWithDefaultTheme (copy), ReactRobloxModule (copy)
	local SocialContextToast = Instance.new("Folder")
	SocialContextToast.Name = "SocialContextToast"
	SocialContextToast.Parent = CoreGui
	local Element = ReactModule.createElement(RoactRoduxModule.StoreProvider, {
		store = RoduxModule.Store.new(RoduxModule.createReducer({}, {
			SetToastContent = function(p1, p2) --[[ Line: 50 ]]
				-- upvalues: CryoModule (upval)
				return (CryoModule.Dictionary.join(p1, { ToastContent = p2.toastContent }))
			end,
			SetConfirmationModal = function(p1, p2) --[[ Line: 56 ]]
				-- upvalues: CryoModule (upval)
				return (CryoModule.Dictionary.join(p1, {
					ConfirmationModal = {
						isOpen = p2.isConfirmationModalOpen,
						closeCallback = p2.closeCallback
					}
				}))
			end
		}), { ToastContent = { toastType = ToastTypesModule.None } }, { RoduxModule.thunkMiddleware })
	}, {
		StyleProvider = ReactModule.createElement(StyleProviderWithDefaultTheme, {}, {
			LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
				localization = Localization.new(LocalizationService.RobloxLocaleId)
			}, {
				SocialContextToastGUI = ReactModule.createElement("ScreenGui", {
					DisplayOrder = DisplayOrderEnum.SocialContextToastContainer,
					ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
				}, {
					ToastDispatcher = ReactModule.createElement(SocialContextToastDispatcherModule, { services = Services, gameId = GameId, placeId = PlaceId }),
					ToastRoot = ReactModule.createElement(ToastRootModule, {
						analyticsProps = if GetFFlagSocialContextToastEventStreamFunction() then {
							eventIngest = Services.eventIngest,
							gameId = GameId,
							placeId = PlaceId
						} else nil
					}),
					ConfirmationModalRoot = ReactModule.createElement(ConfirmationModalRootModule)
				})
			})
		})
	})
	ReactRobloxModule.createRoot(SocialContextToast):render(Element)
	
	return Element
end