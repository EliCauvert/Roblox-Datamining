local parent = script.Parent.Parent
local context = parent.context
local hooks = parent.Hooks
local utils = parent.utils
local dependenciesModule = require(parent.dependencies)
local UIBlox = dependenciesModule.UIBlox
local useLocalization = dependenciesModule.Localization.Hooks.useLocalization
local typeModule = require(parent.type)
local buttonStack = UIBlox.App.Button.ButtonStack
local buttonType = UIBlox.App.Button.Enum.ButtonType
local constantsModule = require(parent.constants)
local defaultContentPadding = constantsModule.DefaultContentPadding
local defaultButtonHeight = constantsModule.DefaultButtonHeight
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local useFocusGuiObject = require(parent_1.ReactFocusNavigation).useFocusGuiObject
local focusNavigationUtilsModule = require(parent_1.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local getTimerFromCardData = require(utils.toastNotificationHelper).getTimerFromCardData
local useNotificationCardStateModule = require(context.useNotificationCardState)
local useNotificationCardDataModule = require(context.useNotificationCardData)
local useTimeRemainingMapModule = require(hooks.useTimeRemainingMap)

local _ = function(p0) --[[ line: 32 ]]
	-- upvalues: typeModule (ref), buttonType (ref)
	return if p0 == typeModule.SENDERButtonStyleEnum.Growth then buttonType.PrimaryContextual elseif p0 == typeModule.SENDERButtonStyleEnum.Primary then buttonType.PrimarySystem elseif p0 == typeModule.SENDERButtonStyleEnum.Secondary then buttonType.Secondary elseif p0 == typeModule.SENDERButtonStyleEnum.Alert then buttonType.Alert else buttonType.Secondary
end

local var8 = function(p1, p2, p3, p4) --[[ line: 46 ]]
	-- upvalues: useNotificationCardDataModule (ref), getTimerFromCardData (ref), useTimeRemainingMapModule (ref), typeModule (ref), buttonType (ref)
	local var9 = useNotificationCardDataModule()
	local _ = nil
	local t = {}
	
	for i, v in ipairs(p1) do
		if v.timer and v.timer.showTimeOnElement then
			t[v.timer.showTimeOnElement] = getTimerFromCardData(var9, v.timer.showTimeOnElement)
		end
	end
	local var11 = useTimeRemainingMapModule(t, var9)
	local t_1 = {}
	
	if p1 then
		for i_1, v_1 in ipairs(p1) do
			local var13, text
			local _ = nil
			
			if v_1 and v_1.timer and v_1.timer.showTimeOnElement then
				var13 = `{v_1.label.text} ({var11[v_1.timer.showTimeOnElement]}{p2.secondsAbbreviated})`
				local buttonStyle = v_1.buttonStyle
				local var14 = if buttonStyle == typeModule.SENDERButtonStyleEnum.Growth then buttonType.PrimaryContextual elseif buttonStyle == typeModule.SENDERButtonStyleEnum.Primary then buttonType.PrimarySystem elseif buttonStyle == typeModule.SENDERButtonStyleEnum.Secondary then buttonType.Secondary elseif buttonStyle == typeModule.SENDERButtonStyleEnum.Alert then buttonType.Alert else buttonType.Secondary
				table.insert(t_1, {
					buttonType = var14,
					props = {
						text = var13,
						onActivated = function() --[[ line: 80 ]]
							-- upvalues: p3 (ref), v_1 (ref)
							if p3 then
								p3(v_1)
							end
						end,
						buttonRef = if var14 == buttonType.PrimaryContextual then p4 else nil
					}
				})
			end
			if v_1 and v_1.label then
				text = v_1.label.text
				
				if not text then
					text = ""
				end
				var13 = text
			end
		end
	end
	return t_1
end

return function(p5) --[[ line: 98 ]]
	-- upvalues: useNotificationCardStateModule (ref), useNotificationCardDataModule (ref), useLocalization (ref), reactModule (ref), useFocusGuiObject (ref), var8 (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), buttonStack (ref), defaultButtonHeight (ref), defaultContentPadding (ref)
	local var15 = useNotificationCardStateModule("button")
	local handleActions = useNotificationCardDataModule().handleActions
	local var16 = useLocalization({
		secondsAbbreviated = "Feature.Notifications.Label.SecondsAbbreviated"
	})
	local shouldAutoFocus = p5.shouldAutoFocus
	local var17 = reactModule.useRef(nil)
	local var18 = useFocusGuiObject()
	reactModule.useEffect(function() --[[ line: 111 ]]
		-- upvalues: shouldAutoFocus (ref), var17 (ref), var18 (ref)
		if not shouldAutoFocus then return end
		local current = var17.current
		
		if current then
			var18(current)
			
			return function() --[[ line: 123 ]]
				-- upvalues: var18 (copy)
				var18(nil)
			end
		end
	end, { shouldAutoFocus, var18 })
	local var19 = var8(var15, var16, handleActions, var17)
	
	return if #var19 > 0 then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		FocusRoot = reactModule.createElement(focusRoot, {
			isIsolated = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
			isFocusable = shouldAutoFocus,
			isAutoFocusRoot = shouldAutoFocus
		}, {
			ActionButtons = var19 and reactModule.createElement(buttonStack, {
				buttonHeight = defaultButtonHeight,
				buttons = var19,
				marginBetween = defaultContentPadding
			})
		})
	}) else nil
end