local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(BuildExperience.Chat.chatTypes)
local UserFeedbackModule = require(BuildExperience.Components.MessageUtilities.UserFeedback)
local FeedbackIconsModule = require(BuildExperience.Components.MessageUtilities.feedbackIcons)
local GetPlaytestLoadingStoreModule = require(BuildExperience.Stores.GetPlaytestLoadingStore)
local Snackbar = require(Parent.Foundation).Snackbar
local Signal, Signal2 = SignalsModule.createSignal(false)
local config = { get = Signal, set = Signal2 }
local t = {}

local function _(Key)
	-- upvalues: config (copy), t (copy), SignalsModule (copy)
	if Key == nil then
		return config
	end
	local Entry = t[Key]
	
	if Entry == nil then
		local Signal, Signal2 = SignalsModule.createSignal(false)
		Entry = { get = Signal, set = Signal2 }
		t[Key] = Entry
	end
	return Entry
end

return function(Frame: Frame)
	-- upvalues: ReactModule (copy), config (copy), t (copy), SignalsModule (copy), GetPlaytestLoadingStoreModule (copy), SignalsReactModule (copy), FeedbackIconsModule (copy), UserFeedbackModule (copy), Snackbar (copy)
	local TurnFeedbackIds = Frame.turnFeedbackIds
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local PlaceId = if TurnFeedbackIds == nil then nil else TurnFeedbackIds.placeId
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PlaceId (copy), config (upval), t (upval), SignalsModule (upval)
		if PlaceId == nil then
			return config
		end
		local Entry = t[PlaceId]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(false)
			Entry = { get = Signal, set = Signal2 }
			t[PlaceId] = Entry
		end
		return Entry
	end, { PlaceId })
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p1): boolean
		-- upvalues: GetPlaytestLoadingStoreModule (upval), PlaceId (copy)
		local PlaytestLoadingStoreModule = GetPlaytestLoadingStoreModule(p1)
		
		return PlaceId ~= nil and PlaytestLoadingStoreModule.getAgentStatusForPlaceId(PlaceId)(p1) == "Loading"
	end, { PlaceId })))
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.get)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2("")
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy)
		UseMemoResult.set(true)
	end, { UseMemoResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), UseStateResult2 (copy)
		UseMemoResult.set(false)
		UseStateResult2("Reverted agent publish.")
	end, { UseMemoResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), UseStateResult2 (copy)
		UseMemoResult.set(false)
		UseStateResult2("Couldn't revert agent publish. Try again.")
	end, { UseMemoResult })
	local UseResult4 = ReactModule.useCallback(function(p1)
		-- upvalues: TurnFeedbackIds (copy), FeedbackIconsModule (upval), UseResult1 (copy), UseResult2 (copy), UseResult3 (copy)
		if TurnFeedbackIds ~= nil then
			FeedbackIconsModule.createOnActivated(TurnFeedbackIds, {
				onRevertStart = UseResult1,
				onRevertSuccess = UseResult2,
				onRevertFailure = UseResult3
			})(p1)
			
			return
		end
	end, { UseResult3, UseResult1, UseResult2, TurnFeedbackIds })
	
	return if TurnFeedbackIds == nil or TurnFeedbackIds.sequenceId == nil then nil else ReactModule.createElement(ReactModule.Fragment, nil, {
		Feedback = ReactModule.createElement(UserFeedbackModule, {
			layoutOrder = Frame.LayoutOrder,
			icons = FeedbackIconsModule.getFeedbackIcons({
				includeRevert = FeedbackIconsModule.canRevert(TurnFeedbackIds),
				isRevertDisabled = UseSignalStateResult or UseSignalStateResult1
			}),
			onActivated = UseResult4,
			testId = Frame.testId
		}),
		RevertSnackbar = if UseStateResult == "" then nil else ReactModule.createElement(Snackbar, {
			LayoutOrder = (Frame.LayoutOrder or 0) + 1,
			title = UseStateResult,
			onClose = UseResult,
			testId = `{Frame.testId}.revert-snackbar`
		})
	})
end