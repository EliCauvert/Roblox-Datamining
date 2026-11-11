local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local FoundationProvider = FoundationModule.FoundationProvider
local Theme = FoundationModule.Enums.Theme
local ConstantsModule = require(Moments.Constants)
local Feed = require(Moments.Components.Feed).Feed

return function(p1)
	-- upvalues: ReactModule (copy), Feed (copy), View (copy), FoundationProvider (copy), Theme (copy), ConstantsModule (copy)
	local BottomInset = p1.bottomInset or 0
	
	return ReactModule.createElement(View, { tag = "size-full bg-surface-0" }, {
		FoundationContainer = ReactModule.createElement(View, { tag = "size-full" }, {
			OnVideoUI = ReactModule.createElement(FoundationProvider, { theme = Theme.Dark }, {
				FeedContainer = ReactModule.createElement(View, {
					tag = "size-full",
					padding = if BottomInset > 0 then { bottom = UDim.new(0, BottomInset) } else nil,
					ZIndex = ConstantsModule.DisplayOrder.Feed
				}, {
					Feed = ReactModule.createElement(Feed, {
						source = p1.source,
						active = p1.active,
						playbackActive = p1.playbackActive,
						telemetry = p1.telemetry,
						controllerRef = p1.controllerRef,
						initialIndex = p1.initialIndex
					})
				}),
				Header = p1.header
			})
		})
	})
end