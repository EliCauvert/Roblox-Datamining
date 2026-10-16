local Parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local ReactModule = require(Parent.React)
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent.AppLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider

return {
	makeTestRoot = function(Child) --[[ Line: 14 ]]
		-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy)
		return ReactModule.createElement(LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, { Child = Child })
	end,
	NativePurchaseFinishedWithLocalPlayer = {
		new = function() --[[ Line: 39 ]]
			local BindableEvent = Instance.new("BindableEvent")
			
			return {
				getSignal = function() --[[ Line: 42 ]]
					-- upvalues: BindableEvent (copy)
					return BindableEvent.Event
				end,
				fire = function(p1, p2) --[[ Line: 45 ]]
					-- upvalues: BindableEvent (copy)
					BindableEvent:Fire(p1, p2)
				end
			}
		end
	},
	NativePurchaseFinishedWithLocalPlayerV2 = {
		new = function() --[[ Line: 51 ]]
			local BindableEvent = Instance.new("BindableEvent")
			
			return {
				getSignal = function() --[[ Line: 54 ]]
					-- upvalues: BindableEvent (copy)
					return BindableEvent.Event
				end,
				fire = function(p1, p2, p3) --[[ Line: 57 ]]
					-- upvalues: BindableEvent (copy)
					BindableEvent:Fire(p1, p2, p3)
				end
			}
		end
	},
	NativePurchaseFinished = {
		new = function() --[[ Line: 63 ]]
			local BindableEvent = Instance.new("BindableEvent")
			
			return {
				getSignal = function() --[[ Line: 66 ]]
					-- upvalues: BindableEvent (copy)
					return BindableEvent.Event
				end,
				fire = function(p1, p2, p3) --[[ Line: 69 ]]
					-- upvalues: BindableEvent (copy)
					BindableEvent:Fire(p1, p2, p3)
				end
			}
		end
	},
	NativePurchaseFinishedV2 = {
		new = function() --[[ Line: 81 ]]
			local BindableEvent = Instance.new("BindableEvent")
			
			return {
				getSignal = function() --[[ Line: 84 ]]
					-- upvalues: BindableEvent (copy)
					return BindableEvent.Event
				end,
				fire = function(p1, p2, p3, p4) --[[ Line: 87 ]]
					-- upvalues: BindableEvent (copy)
					BindableEvent:Fire(p1, p2, p3, p4)
				end
			}
		end
	},
	LocalPlayerHasRobloxSubscription = {
		new = function() --[[ Line: 99 ]]
			local BindableEvent = Instance.new("BindableEvent")
			
			return {
				HasRobloxSubscription = false,
				GetPropertyChangedSignal = function(_, p1) --[[ Line: 103 ]]
					-- upvalues: BindableEvent (copy)
					assert(p1 == "HasRobloxSubscription", "Invalid property name")
					
					return BindableEvent.Event
				end,
				setHasRobloxSubscription = function(p1, HasRobloxSubscription) --[[ Line: 107 ]]
					-- upvalues: BindableEvent (copy)
					p1.HasRobloxSubscription = HasRobloxSubscription
					BindableEvent:Fire()
				end
			}
		end
	}
}