local parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local reactModule = require(parent.React)
local localizationService = game:GetService("LocalizationService")
local localization = require(parent.AppLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider

return {
	makeTestRoot = function(p0) --[[ line: 14 ]]
		-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref)
		return reactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, { Child = p0 })
	end,
	NativePurchaseFinishedWithLocalPlayer = {
		new = function() --[[ line: 33 ]]
			local bindableEvent = Instance.new("BindableEvent")
			
			return {
				getSignal = function() --[[ line: 36 ]]
					-- upvalues: bindableEvent (ref)
					return bindableEvent.Event
				end,
				fire = function(p1, p2) --[[ line: 39 ]]
					-- upvalues: bindableEvent (ref)
					bindableEvent:Fire(p1, p2)
				end
			}
		end
	},
	NativePurchaseFinished = {
		new = function() --[[ line: 45 ]]
			local bindableEvent = Instance.new("BindableEvent")
			
			return {
				getSignal = function() --[[ line: 48 ]]
					-- upvalues: bindableEvent (ref)
					return bindableEvent.Event
				end,
				fire = function(p3, p4, p5) --[[ line: 51 ]]
					-- upvalues: bindableEvent (ref)
					bindableEvent:Fire(p3, p4, p5)
				end
			}
		end
	},
	LocalPlayerHasRobloxSubscription = {
		new = function() --[[ line: 63 ]]
			local bindableEvent = Instance.new("BindableEvent")
			
			return {
				HasRobloxSubscription = false,
				GetPropertyChangedSignal = function(_, p6) --[[ line: 67 ]]
					-- upvalues: bindableEvent (ref)
					assert(p6 == "HasRobloxSubscription", "Invalid property name")
					
					return bindableEvent.Event
				end,
				setHasRobloxSubscription = function(value, p7) --[[ line: 71 ]]
					-- upvalues: bindableEvent (ref)
					value.HasRobloxSubscription = p7
					bindableEvent:Fire()
				end
			}
		end
	}
}