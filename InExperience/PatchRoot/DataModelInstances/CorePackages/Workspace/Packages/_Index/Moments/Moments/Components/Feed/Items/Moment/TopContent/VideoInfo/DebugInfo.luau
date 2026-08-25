local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local momentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local textInput = foundationModule.TextInput
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize
local useSignalState = signalsReactModule.useSignalState

local function noop() end

return reactModule.memo(function(p0)
	-- upvalues: getMomentsPreferencesStoreModule (ref), useSignalState (ref), momentContextModule (ref), reactModule (ref), view (ref), textInput (ref), noop (ref), inputSize (ref)
	local var7 = momentContextModule.useMoment()
	
	return if useSignalState(getMomentsPreferencesStoreModule(false).getDebugModeEnabled) then reactModule.createElement(view, {
		tag = "col align-x-left gap-small size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, {
		DebugMomentId = reactModule.createElement(textInput, {
			label = "momentId",
			LayoutOrder = 1,
			onChanged = noop,
			size = inputSize.Medium,
			text = var7.momentId,
			width = UDim.new(1, 0)
		}),
		DebugFeedItemId = reactModule.createElement(textInput, {
			label = "feedItemId",
			LayoutOrder = 2,
			onChanged = noop,
			size = inputSize.Medium,
			text = var7.store.getData(false).feedItemId or "",
			width = UDim.new(1, 0)
		})
	}) else nil
end)