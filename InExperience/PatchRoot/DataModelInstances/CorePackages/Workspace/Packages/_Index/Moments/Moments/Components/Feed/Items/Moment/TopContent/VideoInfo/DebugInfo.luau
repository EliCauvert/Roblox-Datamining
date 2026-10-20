local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local MomentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local TextInput = FoundationModule.TextInput
local View = FoundationModule.View
local InputSize = FoundationModule.Enums.InputSize
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

local function noop() end

return ReactModule.memo(function(Frame)
	-- upvalues: GetMomentsPreferencesStoreModule (copy), UseSignalStateFunction (copy), MomentContextModule (copy), ReactModule (copy), View (copy), TextInput (copy), noop (copy), InputSize (copy)
	local UseMomentResult = MomentContextModule.useMoment()
	
	return if UseSignalStateFunction(GetMomentsPreferencesStoreModule(false).getDebugModeEnabled) then ReactModule.createElement(View, {
		tag = "col align-x-left gap-small size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		DebugMomentId = ReactModule.createElement(TextInput, {
			label = "momentId",
			LayoutOrder = 1,
			onChanged = noop,
			size = InputSize.Medium,
			text = UseMomentResult.momentId,
			width = UDim.new(1, 0)
		}),
		DebugFeedItemId = ReactModule.createElement(TextInput, {
			label = "feedItemId",
			LayoutOrder = 2,
			onChanged = noop,
			size = InputSize.Medium,
			text = UseMomentResult.store.getData(false).feedItemId or "",
			width = UDim.new(1, 0)
		})
	}) else nil
end)