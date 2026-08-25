local parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local reactModule = require(parent.React)
local localizationService = game:GetService("LocalizationService")
local localization = require(parent.AppLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider

return {
	makeTestRoot = function(p0)
		-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref)
		return reactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, { Child = p0 })
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
				fire = function(p3, p4, p5)
					-- upvalues: bindableEvent (ref)
					bindableEvent:Fire(p3, p4, p5)
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
				fire = function(p6, p7, p8)
					-- upvalues: bindableEvent (ref)
					bindableEvent:Fire(p6, p7, p8)
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
				fire = function(p9, p10, p11, p12)
					-- upvalues: bindableEvent (ref)
					bindableEvent:Fire(p9, p10, p11, p12)
				end
			}
		end
	},
	LocalPlayerHasRobloxSubscription = {
		new = function()
			local bindableEvent = Instance.new("BindableEvent")
			
			return {
				HasRobloxSubscription = false,
				GetPropertyChangedSignal = function(_, p13)
					-- upvalues: bindableEvent (ref)
					assert(p13 == "HasRobloxSubscription", "Invalid property name")
					
					return bindableEvent.Event
				end,
				setHasRobloxSubscription = function(value, p14)
					-- upvalues: bindableEvent (ref)
					value.HasRobloxSubscription = p14
					bindableEvent:Fire()
				end
			}
		end
	}
}