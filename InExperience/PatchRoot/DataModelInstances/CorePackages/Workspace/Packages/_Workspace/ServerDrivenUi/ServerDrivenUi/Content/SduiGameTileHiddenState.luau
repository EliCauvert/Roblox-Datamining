local GuiService = game:GetService("GuiService")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local DisplayModule = require(Parent.Display)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local View = require(Parent.Foundation).View
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
local FFlagLuaAppNotInterestedTileFeedbackButton = require(Parent.SharedFlags).FFlagLuaAppNotInterestedTileFeedbackButton
local FFlagLuaAppNotInterestedMobileSnackbar = require(Parent.SharedFlags).FFlagLuaAppNotInterestedMobileSnackbar

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UseFocusGuiObjectFunction (copy), FFlagLuaAppNotInterestedMobileSnackbar (copy), SignalsModule (copy), DisplayModule (copy), ResponsiveModule (copy), SignalsReactModule (copy), GuiService (copy), GetSduiComponentWrapperFunction (copy), FFlagLuaAppNotInterestedTileFeedbackButton (copy), View (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseSignalStateResult = if FFlagLuaAppNotInterestedMobileSnackbar then SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), DisplayModule (upval), ResponsiveModule (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: DisplayModule (upval), ResponsiveModule (upval)
			return ResponsiveModule.getIsCompactTouch(DisplayModule.GetDisplayStore(p2).getViewportSize(p2), (ResponsiveModule.GetInputModeStore(p2).getPreferredInputType(p2)))
		end)
	end, {}))) else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), GuiService (upval), UseRefResult (copy), UseFocusGuiObjectResult (copy)
		if not p1.onUndoActivated then return end
		local IsSelectedCoreObjectMatch = GuiService.SelectedCoreObject == UseRefResult.current
		p1.onUndoActivated()
		
		if IsSelectedCoreObjectMatch then
			task.defer(function()
				-- upvalues: p1 (upval), UseFocusGuiObjectResult (upval)
				local Current = if p1.parentRef then p1.parentRef.current else nil
				
				if Current then
					UseFocusGuiObjectResult(Current)
				end
			end)
		end
	end, {
		UseFocusGuiObjectResult,
		p1.onUndoActivated,
		p1.parentRef
	})
	local Element = if p1.undoButtonComponent and p1.onUndoActivated then ReactModule.createElement(GetSduiComponentWrapperFunction(p1.undoButtonComponent), {
		debugName = "SduiGameTileHiddenState.UndoButton",
		componentConfig = p1.undoButtonComponent,
		extraLocalProps = {
			testId = "--sdui-game-tile-undo",
			buttonRef = UseRefResult,
			onActivated = UseResult
		},
		sduiContext = p1.sduiContext
	}) else nil
	local Element1 = if FFlagLuaAppNotInterestedTileFeedbackButton and p1.canGiveFeedback and p1.feedbackButtonComponent and p1.onFeedbackActivated then ReactModule.createElement(GetSduiComponentWrapperFunction(p1.feedbackButtonComponent), {
		debugName = "SduiGameTileHiddenState.GiveFeedbackButton",
		componentConfig = p1.feedbackButtonComponent,
		extraLocalProps = {
			testId = "--sdui-game-tile-give-feedback",
			onActivated = p1.onFeedbackActivated
		},
		sduiContext = p1.sduiContext
	}) else nil
	
	return ReactModule.createElement(View, {
		tag = p1.containerTag or "col align-x-center align-y-center gap-small size-full padding-medium radius-medium bg-surface-100"
	}, {
		Message = if FFlagLuaAppNotInterestedMobileSnackbar and UseSignalStateResult then nil else p1.messageComponent,
		UndoButton = Element,
		GiveFeedbackButton = if FFlagLuaAppNotInterestedTileFeedbackButton then Element1 else nil
	})
end)