local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local Text = require(Parent1.Foundation).Text
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local PermissionPromptFinishedModule = require(Parent.Thunks.PermissionPromptFinished)

return function(p1) --[[ Line: 26 ]]
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), UseScreenSizeFunction (copy), ReactModule (copy), PermissionPromptFinishedModule (copy), ButtonType (copy), Text (copy), InteractiveAlert (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		allowAccessToCapturesTitle = "Feature.Captures.Title.AllowAccessToCaptures",
		allowAccessToCapturesBody = "Feature.Captures.Body.AllowAccessToCaptures",
		allow = "Feature.Captures.Action.Allow",
		dontAllow = "Feature.Captures.Action.DontAllow"
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 37 ]]
		-- upvalues: UseDispatchResult (copy), PermissionPromptFinishedModule (upval), p1 (copy)
		UseDispatchResult(PermissionPromptFinishedModule(p1.promptId, true))
	end, { p1.promptId })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 43 ]]
		-- upvalues: UseDispatchResult (copy), PermissionPromptFinishedModule (upval), p1 (copy)
		UseDispatchResult(PermissionPromptFinishedModule(p1.promptId, false))
	end, { p1.promptId })
	
	return ReactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = false,
		buttonStackInfo = ReactModule.useMemo(function() --[[ Line: 49 ]]
			-- upvalues: ButtonType (upval), UseResult (copy), UseLocalizationResult (copy), UseResult1 (copy)
			return {
				buttons = {
					{
						isDefaultChild = false,
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = UseResult,
							text = UseLocalizationResult.allow
						}
					},
					{
						isDefaultChild = true,
						props = {
							onActivated = UseResult1,
							text = UseLocalizationResult.dontAllow
						}
					}
				}
			}
		end, { UseResult, UseResult1 }),
		middleContent = ReactModule.useCallback(function() --[[ Line: 71 ]]
			-- upvalues: ReactModule (upval), Text (upval), UseLocalizationResult (copy)
			return ReactModule.createElement(Text, {
				tag = "size-full-1200 text-align-x-center text-body-large text-wrap",
				Text = UseLocalizationResult.allowAccessToCapturesBody
			})
		end, {}),
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = UseScreenSizeFunction(),
		title = UseLocalizationResult.allowAccessToCapturesTitle
	})
end