local Parent = script:FindFirstAncestor("ShareSheet").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ShareSheetViewModule = require(script.Parent.Parent.ShareSheetView)
local UseShareSheetViewModelModule = require(script.Parent.Parent.useShareSheetViewModel)
local UseUniversalShareSheetViewModelModule = require(script.Parent.useUniversalShareSheetViewModel)
local ShareSheetSnackbarAutoDismissSeconds = game:DefineFastInt("ShareSheetSnackbarAutoDismissSeconds", 5)
local UseOverlayFunction = FoundationModule.Hooks.useOverlay
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function UniversalShareSheetContent(p1) --[[ Line: 20 ]]
	-- upvalues: UseShareSheetViewModelModule (copy), ReactModule (copy), ShareSheetViewModule (copy)
	return ReactModule.createElement(ShareSheetViewModule, (UseShareSheetViewModelModule(p1)))
end

return ReactModule.memo(function() --[[ Line: 25 | Named "UniversalShareSheetHost" ]]
	-- upvalues: ReactModule (copy), UseOverlayFunction (copy), UseTokensFunction (copy), UseUniversalShareSheetViewModelModule (copy), ShareSheetSnackbarAutoDismissSeconds (copy), UniversalShareSheetContent (copy), ReactRobloxModule (copy), FoundationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseOverlayResult = UseOverlayFunction()
	local UseTokensResult = UseTokensFunction()
	local UseUniversalShareSheetViewModelModuleResult = UseUniversalShareSheetViewModelModule()
	local UseResult = ReactModule.useCallback(function() --[[ Line: 31 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(nil)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 34 ]]
		-- upvalues: UseStateResult (copy), ShareSheetSnackbarAutoDismissSeconds (upval), UseResult (copy)
		if UseStateResult == nil then return end
		local DelayedThread = task.delay(ShareSheetSnackbarAutoDismissSeconds, UseResult)
		
		return function() --[[ Line: 40 ]]
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { UseStateResult, UseResult })
	local Action = if UseStateResult then UseStateResult.action else nil
	local Config = if Action then {
		onActivated = function() --[[ Line: 47 ]]
			-- upvalues: UseResult (copy), Action (copy)
			UseResult()
			Action.onActivated()
			
			return nil
		end,
		text = Action.text
	} else nil
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		ShareSheet = if UseUniversalShareSheetViewModelModuleResult then ReactModule.createElement(UniversalShareSheetContent, {
			context = UseUniversalShareSheetViewModelModuleResult.context,
			formatSuccessSnackbarText = UseUniversalShareSheetViewModelModuleResult.formatSuccessSnackbarText,
			isOpen = UseUniversalShareSheetViewModelModuleResult.isOpen,
			messagePlaceholder = UseUniversalShareSheetViewModelModuleResult.messagePlaceholder,
			onCloseWithReason = UseUniversalShareSheetViewModelModuleResult.onCloseWithReason,
			onShareSendResultSnackbar = UseStateResult2,
			recipientSource = UseUniversalShareSheetViewModelModuleResult.recipientSource,
			telemetryId = UseUniversalShareSheetViewModelModuleResult.telemetryId,
			url = UseUniversalShareSheetViewModelModuleResult.url
		}) else nil,
		ShareSendResultSnackbar = if UseStateResult and UseOverlayResult then ReactRobloxModule.createPortal(ReactModule.createElement(FoundationModule.Snackbar, {
			testId = "share-sheet-snackbar",
			ZIndex = 999,
			action = Config,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, -UseTokensResult.Padding.XLarge),
			title = UseStateResult.title
		}), UseOverlayResult) else nil
	})
end)