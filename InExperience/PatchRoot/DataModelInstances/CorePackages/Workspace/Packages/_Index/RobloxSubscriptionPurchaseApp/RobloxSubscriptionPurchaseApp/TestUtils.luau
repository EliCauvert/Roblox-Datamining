local parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local reactModule = require(parent.React)
local localizationService = game:GetService("LocalizationService")
local localization = require(parent.AppLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider

return {
	makeTestRoot = function(p1)
		-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref)
		return reactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, { Child = p1 })
	end,
	NativePurchaseFinishedWithLocalPlayer = {
		new = function()
			local bindableEvent = Instance.new("BindableEvent")
			
			return {
				getSignal = function()
					-- upvalues: bindableEvent (ref)
					return bindableEvent.Event
				end,
				fire = function(p1, p2)
					-- upvalues: bindableEvent (ref)
					bindableEvent:Fire(p1, p2)
				end
			}
		end
	},
	NativePurchaseFinishedWithLocalPlayerV2 = {
		new = function()
			local bindableEvent = Instance.new("BindableEvent")
			
			return {
				getSignal = function()
					-- upvalues: bindableEvent (ref)
					return bindableEvent.Event
				end,
				fire = function(p1, p2, p3)
					-- upvalues: bindableEvent (ref)
					bindableEvent:Fire(p1, p2, p3)
				end
			}
		end
	},
	NativePurchaseFinished = {
		new = function()
			local bindableEvent = Instance.new("BindableEvent")
			
			return {
				getSignal = function()
					-- upvalues: bindableEvent (ref)
					return bindableEvent.Event
				end,
				fire = function(p1, p2, p3)
					-- upvalues: bindableEvent (ref)
					bindableEvent:Fire(p1, p2, p3)
				end
			}
		end
	},
	NativePurchaseFinishedV2 = {
		new = function()
			local bindableEvent = Instance.new("BindableEvent")
			
			return {
				getSignal = function()
					-- upvalues: bindableEvent (ref)
					return bindableEvent.Event
				end,
				fire = function(p1, p2, p3, p4)
					-- upvalues: bindableEvent (ref)
					bindableEvent:Fire(p1, p2, p3, p4)
				end
			}
		end
	},
	LocalPlayerHasRobloxSubscription = {
		new = function()
			local bindableEvent = Instance.new("BindableEvent")
			
			return {
				HasRobloxSubscription = false,
				GetPropertyChangedSignal = function(_, p1)
					-- upvalues: bindableEvent (ref)
					assert(p1 == "HasRobloxSubscription", "Invalid property name")
					
					return bindableEvent.Event
				end,
				setHasRobloxSubscription = function(value, p1)
					-- upvalues: bindableEvent (ref)
					value.HasRobloxSubscription = p1
					bindableEvent:Fire()
				end
			}
		end
	}
}