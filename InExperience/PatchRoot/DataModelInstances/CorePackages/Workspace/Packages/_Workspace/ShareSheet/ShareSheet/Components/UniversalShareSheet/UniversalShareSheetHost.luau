local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local fFlagShareSheetTelemetryRefactorModule = require(shareSheet.Flags.FFlagShareSheetTelemetryRefactor)
local shareSheetViewModule = require(script.Parent.Parent.ShareSheetView)
local useShareSheetViewModelModule = require(script.Parent.Parent.useShareSheetViewModel)
local useUniversalShareSheetViewModelModule = require(script.Parent.useUniversalShareSheetViewModel)
local shareSheetSnackbarAutoDismissSeconds = game:DefineFastInt("ShareSheetSnackbarAutoDismissSeconds", 5)
local useOverlay = foundationModule.Hooks.useOverlay
local useTokens = foundationModule.Hooks.useTokens

local function UniversalShareSheetContent(p0)
	-- upvalues: useShareSheetViewModelModule (ref), reactModule (ref), shareSheetViewModule (ref)
	return reactModule.createElement(shareSheetViewModule, useShareSheetViewModelModule(p0))
end

return reactModule.memo(function()
	-- upvalues: reactModule (ref), useOverlay (ref), useTokens (ref), useUniversalShareSheetViewModelModule (ref), shareSheetSnackbarAutoDismissSeconds (ref), UniversalShareSheetContent (ref), fFlagShareSheetTelemetryRefactorModule (ref), reactRobloxModule (ref), foundationModule (ref)
	local var10, var11 = reactModule.useState(nil)
	local var12 = useOverlay()
	local var13 = useTokens()
	local var14 = useUniversalShareSheetViewModelModule()
	local var15 = reactModule.useCallback(function()
		-- upvalues: var11 (ref)
		var11(nil)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), shareSheetSnackbarAutoDismissSeconds (copy), var15 (ref)
		if var10 == nil then
			return
		end
		local delayedThread = task.delay(shareSheetSnackbarAutoDismissSeconds, var15)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var10, var15 })
	local var16 = if var10 then var10.action else nil
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		ShareSheet = if var14 then reactModule.createElement(UniversalShareSheetContent, {
			context = var14.context,
			formatSuccessSnackbarText = var14.formatSuccessSnackbarText,
			isOpen = var14.isOpen,
			messagePlaceholder = var14.messagePlaceholder,
			onClose = var14.onClose,
			onCloseWithReason = if fFlagShareSheetTelemetryRefactorModule then var14.onCloseWithReason else nil,
			onShareSendResultSnackbar = var11,
			telemetryId = if fFlagShareSheetTelemetryRefactorModule then var14.telemetryId else nil,
			url = var14.url
		}) else nil,
		ShareSendResultSnackbar = if var10 and var12 then reactRobloxModule.createPortal(reactModule.createElement(foundationModule.Snackbar, {
			testId = "share-sheet-snackbar",
			ZIndex = 999,
			action = if var16 then {
				onActivated = function()
					-- upvalues: var15 (ref), var16 (ref)
					var15()
					var16.onActivated()
					
					return nil
				end,
				text = var16.text
			} else nil,
			AnchorPoint = Vector2.new(0.5, 1),
			onClose = var15,
			Position = UDim2.new(0.5, 0, 1, -var13.Padding.XLarge),
			title = var10.title
		}), var12) else nil
	})
end)