local parent = script.Parent.Parent
local context = parent.context
local hooks = parent.Hooks
local utils = parent.utils
local dependenciesModule = require(parent.dependencies)
local UIBlox = dependenciesModule.UIBlox
local foundationModule = require(parent.Parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
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
	-- upvalues: foundationFontFaceMigration (ref), useTokens (ref), useNotificationCardDataModule (ref), getTimerFromCardData (ref), useTimeRemainingMapModule (ref), typeModule (ref), buttonType (ref)
	local var2 = if foundationFontFaceMigration then useTokens() else nil
	local var3 = useNotificationCardDataModule()
	local _ = nil
	local t = {}
	
	for i, v in ipairs(p1) do
		if v.timer and v.timer.showTimeOnElement then
			t[v.timer.showTimeOnElement] = getTimerFromCardData(var3, v.timer.showTimeOnElement)
		end
	end
	local var4 = useTimeRemainingMapModule(t, var3)
	local t_1 = {}
	
	if p1 then
		for i_1, v_1 in ipairs(p1) do
			local var5, text
			local _ = nil
			
			if v_1 and v_1.timer and v_1.timer.showTimeOnElement then
				var5 = `{v_1.label.text} ({var4[v_1.timer.showTimeOnElement]}{p2.secondsAbbreviated})`
				local buttonStyle = v_1.buttonStyle
				local var6 = if buttonStyle == typeModule.SENDERButtonStyleEnum.Growth then buttonType.PrimaryContextual elseif buttonStyle == typeModule.SENDERButtonStyleEnum.Primary then buttonType.PrimarySystem elseif buttonStyle == typeModule.SENDERButtonStyleEnum.Secondary then buttonType.Secondary elseif buttonStyle == typeModule.SENDERButtonStyleEnum.Alert then buttonType.Alert else buttonType.Secondary
				table.insert(t_1, {
					buttonType = var6,
					props = {
						text = var5,
						fontStyle = if foundationFontFaceMigration then var2.Typography.TitleLarge else nil,
						onActivated = function()
							-- upvalues: p3 (ref), v_1 (ref)
							if p3 then
								p3(v_1)
							end
						end,
						buttonRef = if var6 == buttonType.PrimaryContextual then p4 else nil
					}
				})
			end
			if v_1 and v_1.label then
				text = v_1.label.text
				
				if not text then
					text = ""
				end
				var5 = text
			end
		end
	end
	return t_1
end

return function(p5)
	-- upvalues: useNotificationCardStateModule (ref), useNotificationCardDataModule (ref), useLocalization (ref), reactModule (ref), useFocusGuiObject (ref), var1 (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), buttonStack (ref), defaultButtonHeight (ref), defaultContentPadding (ref)
	local var7 = useNotificationCardStateModule("button")
	local handleActions = useNotificationCardDataModule().handleActions
	local var8 = useLocalization({
		secondsAbbreviated = "Feature.Notifications.Label.SecondsAbbreviated"
	})
	local shouldAutoFocus = p5.shouldAutoFocus
	local var9 = reactModule.useRef(nil)
	local var10 = useFocusGuiObject()
	reactModule.useEffect(function()
		-- upvalues: shouldAutoFocus (ref), var9 (ref), var10 (ref)
		if not shouldAutoFocus then return end
		local current = var9.current
		
		if current then
			var10(current)
			
			return function()
				-- upvalues: var10 (copy)
				var10(nil)
			end
		end
	end, { shouldAutoFocus, var10 })
	local var11 = var1(var7, var8, handleActions, var9)
	
	return if #var11 > 0 then reactModule.createElement("Frame", {
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
			ActionButtons = var11 and reactModule.createElement(buttonStack, {
				buttonHeight = defaultButtonHeight,
				buttons = var11,
				marginBetween = defaultContentPadding
			})
		})
	}) else nil
end