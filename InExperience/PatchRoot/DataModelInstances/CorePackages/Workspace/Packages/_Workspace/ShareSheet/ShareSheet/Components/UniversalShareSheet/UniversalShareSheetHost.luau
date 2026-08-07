local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local shareSheetViewModule = require(script.Parent.Parent.ShareSheetView)
local useShareSheetViewModelModule = require(script.Parent.Parent.useShareSheetViewModel)
local useUniversalShareSheetViewModelModule = require(script.Parent.useUniversalShareSheetViewModel)
local shareSheetSnackbarAutoDismissSeconds = game:DefineFastInt("ShareSheetSnackbarAutoDismissSeconds", 5)
local useOverlay = foundationModule.Hooks.useOverlay
local useTokens = foundationModule.Hooks.useTokens

local function UniversalShareSheetContent(p0) --[[ line: 21 ]]
	-- upvalues: useShareSheetViewModelModule (ref), reactModule (ref), shareSheetViewModule (ref)
	return reactModule.createElement(shareSheetViewModule, useShareSheetViewModelModule(p0))
end

return reactModule.memo(function() --[[ line: 26 | named "UniversalShareSheetHost" ]]
	-- upvalues: reactModule (ref), useOverlay (ref), useTokens (ref), useUniversalShareSheetViewModelModule (ref), shareSheetSnackbarAutoDismissSeconds (ref), UniversalShareSheetContent (ref), reactRobloxModule (ref), foundationModule (ref)
	local var8, var9 = reactModule.useState(nil)
	local var10 = useOverlay()
	local var11 = useTokens()
	local var12 = useUniversalShareSheetViewModelModule()
	local var13 = reactModule.useCallback(function() --[[ line: 32 ]]
		-- upvalues: var9 (ref)
		var9(nil)
	end, {})
	reactModule.useEffect(function() --[[ line: 35 ]]
		-- upvalues: var8 (ref), shareSheetSnackbarAutoDismissSeconds (copy), var13 (ref)
		if var8 == nil then
			return
		end
		local delayedThread = task.delay(shareSheetSnackbarAutoDismissSeconds, var13)
		
		return function() --[[ line: 41 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var8, var13 })
	local var14 = if var8 then var8.action else nil
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		ShareSheet = if var12 then reactModule.createElement(UniversalShareSheetContent, {
			context = var12.context,
			formatSuccessSnackbarText = var12.formatSuccessSnackbarText,
			isOpen = var12.isOpen,
			messagePlaceholder = var12.messagePlaceholder,
			onClose = var12.onClose,
			onShareSendResultSnackbar = var9,
			url = var12.url
		}) else nil,
		ShareSendResultSnackbar = if var8 and var10 then reactRobloxModule.createPortal(reactModule.createElement(foundationModule.Snackbar, {
			testId = "share-sheet-snackbar",
			ZIndex = 999,
			action = if var14 then {
				onActivated = function() --[[ line: 48 ]]
					-- upvalues: var13 (ref), var14 (ref)
					var13()
					var14.onActivated()
					
					return nil
				end,
				text = var14.text
			} else nil,
			AnchorPoint = Vector2.new(0.5, 1),
			onClose = var13,
			Position = UDim2.new(0.5, 0, 1, -var11.Padding.XLarge),
			title = var8.title
		}), var10) else nil
	})
end)