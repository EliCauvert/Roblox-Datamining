local Parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local ReactModule = require(Parent.React)
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent.AppLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider

return {
	makeTestRoot = function(Child)
		-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy)
		return ReactModule.createElement(LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, { Child = Child })
	end,
	NativePurchaseFinishedWithLocalPlayer = {
		new = function()
			local BindableEvent = Instance.new("BindableEvent")
			
			return {
				getSignal = function()
					-- upvalues: BindableEvent (copy)
					return BindableEvent.Event
				end,
				fire = function(p1, p2)
					-- upvalues: BindableEvent (copy)
					BindableEvent:Fire(p1, p2)
				end
			}
		end
	},
	NativePurchaseFinished = {
		new = function()
			local BindableEvent = Instance.new("BindableEvent")
			
			return {
				getSignal = function()
					-- upvalues: BindableEvent (copy)
					return BindableEvent.Event
				end,
				fire = function(p1, p2, p3)
					-- upvalues: BindableEvent (copy)
					BindableEvent:Fire(p1, p2, p3)
				end
			}
		end
	},
	LocalPlayerHasRobloxSubscription = {
		new = function()
			local BindableEvent = Instance.new("BindableEvent")
			
			return {
				HasRobloxSubscription = false,
				GetPropertyChangedSignal = function(_, p1)
					-- upvalues: BindableEvent (copy)
					assert(p1 == "HasRobloxSubscription", "Invalid property name")
					
					return BindableEvent.Event
				end,
				setHasRobloxSubscription = function(p1, HasRobloxSubscription)
					-- upvalues: BindableEvent (copy)
					p1.HasRobloxSubscription = HasRobloxSubscription
					BindableEvent:Fire()
				end
			}
		end
	}
}