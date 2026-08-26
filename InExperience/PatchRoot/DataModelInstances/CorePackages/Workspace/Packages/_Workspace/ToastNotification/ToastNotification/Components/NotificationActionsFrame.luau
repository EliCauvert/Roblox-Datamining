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

local _ = function(p1)
	-- upvalues: typeModule (ref), buttonType (ref)
	return if p1 == typeModule.SENDERButtonStyleEnum.Growth then buttonType.PrimaryContextual elseif p1 == typeModule.SENDERButtonStyleEnum.Primary then buttonType.PrimarySystem elseif p1 == typeModule.SENDERButtonStyleEnum.Secondary then buttonType.Secondary elseif p1 == typeModule.SENDERButtonStyleEnum.Alert then buttonType.Alert else buttonType.Secondary
end

local var1 = function(p1, p2, p3, p4)
	-- upvalues: useNotificationCardDataModule (ref), getTimerFromCardData (ref), useTimeRemainingMapModule (ref), typeModule (ref), buttonType (ref)
	local var2 = useNotificationCardDataModule()
	local _ = nil
	local t = {}
	
	for i, v in ipairs(p1) do
		if v.timer and v.timer.showTimeOnElement then
			t[v.timer.showTimeOnElement] = getTimerFromCardData(var2, v.timer.showTimeOnElement)
		end
	end
	local var3 = useTimeRemainingMapModule(t, var2)
	local t_1 = {}
	
	if p1 then
		for i_1, v_1 in ipairs(p1) do
			local var4, text
			local _ = nil
			
			if v_1 and v_1.timer and v_1.timer.showTimeOnElement then
				var4 = `{v_1.label.text} ({var3[v_1.timer.showTimeOnElement]}{p2.secondsAbbreviated})`
				local buttonStyle = v_1.buttonStyle
				local var5 = if buttonStyle == typeModule.SENDERButtonStyleEnum.Growth then buttonType.PrimaryContextual elseif buttonStyle == typeModule.SENDERButtonStyleEnum.Primary then buttonType.PrimarySystem elseif buttonStyle == typeModule.SENDERButtonStyleEnum.Secondary then buttonType.Secondary elseif buttonStyle == typeModule.SENDERButtonStyleEnum.Alert then buttonType.Alert else buttonType.Secondary
				table.insert(t_1, {
					buttonType = var5,
					props = {
						text = var4,
						onActivated = function()
							-- upvalues: p3 (ref), v_1 (ref)
							if p3 then
								p3(v_1)
							end
						end,
						buttonRef = if var5 == buttonType.PrimaryContextual then p4 else nil
					}
				})
			end
			if v_1 and v_1.label then
				text = v_1.label.text
				
				if not text then
					text = ""
				end
				var4 = text
			end
		end
	end
	return t_1
end

return function(p5)
	-- upvalues: useNotificationCardStateModule (ref), useNotificationCardDataModule (ref), useLocalization (ref), reactModule (ref), useFocusGuiObject (ref), var1 (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), buttonStack (ref), defaultButtonHeight (ref), defaultContentPadding (ref)
	local var6 = useNotificationCardStateModule("button")
	local handleActions = useNotificationCardDataModule().handleActions
	local var7 = useLocalization({
		secondsAbbreviated = "Feature.Notifications.Label.SecondsAbbreviated"
	})
	local shouldAutoFocus = p5.shouldAutoFocus
	local var8 = reactModule.useRef(nil)
	local var9 = useFocusGuiObject()
	reactModule.useEffect(function()
		-- upvalues: shouldAutoFocus (ref), var8 (ref), var9 (ref)
		if not shouldAutoFocus then return end
		local current = var8.current
		
		if current then
			var9(current)
			
			return function()
				-- upvalues: var9 (copy)
				var9(nil)
			end
		end
	end, { shouldAutoFocus, var9 })
	local var10 = var1(var6, var7, handleActions, var8)
	
	return if #var10 > 0 then reactModule.createElement("Frame", {
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
			ActionButtons = var10 and reactModule.createElement(buttonStack, {
				buttonHeight = defaultButtonHeight,
				buttons = var10,
				marginBetween = defaultContentPadding
			})
		})
	}) else nil
end