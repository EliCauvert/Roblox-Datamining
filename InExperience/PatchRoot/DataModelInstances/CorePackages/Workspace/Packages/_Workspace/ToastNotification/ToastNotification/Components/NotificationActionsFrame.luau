local Parent = script.Parent.Parent
local Context = Parent.context
local DependenciesModule = require(Parent.dependencies)
local UIBlox = DependenciesModule.UIBlox
local FoundationModule = require(Parent.Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local TypeModule = require(Parent.type)
local ButtonStack = UIBlox.App.Button.ButtonStack
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local ConstantsModule = require(Parent.constants)
local DefaultContentPadding = ConstantsModule.DefaultContentPadding
local DefaultButtonHeight = ConstantsModule.DefaultButtonHeight
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UseFocusGuiObjectFunction = require(Parent1.ReactFocusNavigation).useFocusGuiObject
local FocusNavigationUtilsModule = require(Parent1.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local GetTimerFromCardDataFunction = require(Parent.utils.toastNotificationHelper).getTimerFromCardData
local UseNotificationCardStateModule = require(Context.useNotificationCardState)
local UseNotificationCardDataModule = require(Context.useNotificationCardData)
local UseTimeRemainingMapModule = require(Parent.Hooks.useTimeRemainingMap)

local function _(Alert) --[[ Line: 35 ]]
	-- upvalues: TypeModule (copy), ButtonType (copy)
	return if Alert == TypeModule.SENDERButtonStyleEnum.Growth then ButtonType.PrimaryContextual elseif Alert == TypeModule.SENDERButtonStyleEnum.Primary then ButtonType.PrimarySystem elseif Alert == TypeModule.SENDERButtonStyleEnum.Secondary then ButtonType.Secondary elseif Alert == TypeModule.SENDERButtonStyleEnum.Alert then ButtonType.Alert else ButtonType.Secondary
end

local function v21(List, p1, Callback, UseRefResult) --[[ Line: 49 ]]
	-- upvalues: FoundationFontFaceMigration (copy), UseTokensFunction (copy), UseNotificationCardDataModule (copy), GetTimerFromCardDataFunction (copy), UseTimeRemainingMapModule (copy), TypeModule (copy), ButtonType (copy)
	local UseTokensResult = if FoundationFontFaceMigration then UseTokensFunction() else nil
	local UseNotificationCardDataModuleResult = UseNotificationCardDataModule()
	local t = {}
	
	for _, value in ipairs(List) do
		if value.timer and value.timer.showTimeOnElement then
			t[value.timer.showTimeOnElement] = GetTimerFromCardDataFunction(UseNotificationCardDataModuleResult, value.timer.showTimeOnElement)
		end
	end
	local UseTimeRemainingMapModuleResult = UseTimeRemainingMapModule(t, UseNotificationCardDataModuleResult)
	local List1 = {}
	
	if List then
		for _, value1 in ipairs(List) do
			local ButtonStyle = value1.buttonStyle
			local PrimaryContextual = if ButtonStyle == TypeModule.SENDERButtonStyleEnum.Growth then ButtonType.PrimaryContextual elseif ButtonStyle == TypeModule.SENDERButtonStyleEnum.Primary then ButtonType.PrimarySystem elseif ButtonStyle == TypeModule.SENDERButtonStyleEnum.Secondary then ButtonType.Secondary elseif ButtonStyle == TypeModule.SENDERButtonStyleEnum.Alert then ButtonType.Alert else ButtonType.Secondary
			table.insert(List1, {
				buttonType = PrimaryContextual,
				props = {
					text = if value1 and value1.timer and value1.timer.showTimeOnElement then `{value1.label.text} ({UseTimeRemainingMapModuleResult[value1.timer.showTimeOnElement]}{p1.secondsAbbreviated})` else value1 and value1.label and value1.label.text or "",
					fontStyle = if FoundationFontFaceMigration then UseTokensResult.Typography.TitleLarge else nil,
					onActivated = function() --[[ Line: 85 ]]
						-- upvalues: Callback (copy), value1 (copy)
						if Callback then
							Callback(value1)
						end
					end,
					buttonRef = if PrimaryContextual == ButtonType.PrimaryContextual then UseRefResult else nil
				}
			})
		end
	end
	return List1
end

return function(p2) --[[ Line: 103 ]]
	-- upvalues: UseNotificationCardStateModule (copy), UseNotificationCardDataModule (copy), UseLocalizationFunction (copy), ReactModule (copy), UseFocusGuiObjectFunction (copy), v21 (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), ButtonStack (copy), DefaultButtonHeight (copy), DefaultContentPadding (copy)
	local Button = UseNotificationCardStateModule("button")
	local HandleActions = UseNotificationCardDataModule().handleActions
	local UseLocalizationResult = UseLocalizationFunction({
		secondsAbbreviated = "Feature.Notifications.Label.SecondsAbbreviated"
	})
	local ShouldAutoFocus = p2.shouldAutoFocus
	local UseRefResult = ReactModule.useRef(nil)
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	ReactModule.useEffect(function() --[[ Line: 116 ]]
		-- upvalues: ShouldAutoFocus (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy)
		if not ShouldAutoFocus then return end
		local Current = UseRefResult.current
		
		if not Current then return end
		UseFocusGuiObjectResult(Current)
		
		return function() --[[ Line: 128 ]]
			-- upvalues: UseFocusGuiObjectResult (upval)
			UseFocusGuiObjectResult(nil)
		end
	end, { ShouldAutoFocus, UseFocusGuiObjectResult })
	local Buttons = v21(Button, UseLocalizationResult, HandleActions, UseRefResult)
	
	return if #Buttons > 0 then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		FocusRoot = ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			isFocusable = ShouldAutoFocus,
			isAutoFocusRoot = ShouldAutoFocus
		}, {
			ActionButtons = Buttons and ReactModule.createElement(ButtonStack, {
				buttonHeight = DefaultButtonHeight,
				buttons = Buttons,
				marginBetween = DefaultContentPadding
			})
		})
	}) else nil
end