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

local function UniversalShareSheetContent(p1)
	-- upvalues: useShareSheetViewModelModule (ref), reactModule (ref), shareSheetViewModule (ref)
	return reactModule.createElement(shareSheetViewModule, useShareSheetViewModelModule(p1))
end

return reactModule.memo(function()
	-- upvalues: reactModule (ref), useOverlay (ref), useTokens (ref), useUniversalShareSheetViewModelModule (ref), shareSheetSnackbarAutoDismissSeconds (ref), UniversalShareSheetContent (ref), fFlagShareSheetTelemetryRefactorModule (ref), reactRobloxModule (ref), foundationModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = useOverlay()
	local var4 = useTokens()
	local var5 = useUniversalShareSheetViewModelModule()
	local var6 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(nil)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), shareSheetSnackbarAutoDismissSeconds (copy), var6 (ref)
		if var1 == nil then
			return
		end
		local delayedThread = task.delay(shareSheetSnackbarAutoDismissSeconds, var6)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var1, var6 })
	local var7 = if var1 then var1.action else nil
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		ShareSheet = if var5 then reactModule.createElement(UniversalShareSheetContent, {
			context = var5.context,
			formatSuccessSnackbarText = var5.formatSuccessSnackbarText,
			isOpen = var5.isOpen,
			messagePlaceholder = var5.messagePlaceholder,
			onClose = var5.onClose,
			onCloseWithReason = if fFlagShareSheetTelemetryRefactorModule then var5.onCloseWithReason else nil,
			onShareSendResultSnackbar = var2,
			telemetryId = if fFlagShareSheetTelemetryRefactorModule then var5.telemetryId else nil,
			url = var5.url
		}) else nil,
		ShareSendResultSnackbar = if var1 and var3 then reactRobloxModule.createPortal(reactModule.createElement(foundationModule.Snackbar, {
			testId = "share-sheet-snackbar",
			ZIndex = 999,
			action = if var7 then {
				onActivated = function()
					-- upvalues: var6 (ref), var7 (ref)
					var6()
					var7.onActivated()
					
					return nil
				end,
				text = var7.text
			} else nil,
			AnchorPoint = Vector2.new(0.5, 1),
			onClose = var6,
			Position = UDim2.new(0.5, 0, 1, -var4.Padding.XLarge),
			title = var1.title
		}), var3) else nil
	})
end)