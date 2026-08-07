local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local UIBloxModule = require(parent_1.UIBlox)
local text = foundationModule.Text
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local useScreenSize = robloxAppHooksModule.useScreenSize
local permissionPromptFinishedModule = require(parent.Thunks.PermissionPromptFinished)

return function(p0) --[[ line: 26 ]]
	-- upvalues: useDispatch (ref), useLocalization (ref), useScreenSize (ref), reactModule (ref), permissionPromptFinishedModule (ref), buttonType (ref), text (ref), interactiveAlert (ref)
	local var7 = useDispatch()
	local var8 = useLocalization({
		allowAccessToCapturesTitle = "Feature.Captures.Title.AllowAccessToCaptures",
		allowAccessToCapturesBody = "Feature.Captures.Body.AllowAccessToCaptures",
		allow = "Feature.Captures.Action.Allow",
		dontAllow = "Feature.Captures.Action.DontAllow"
	})
	local var9 = useScreenSize()
	local var10 = reactModule.useCallback(function() --[[ line: 37 ]]
		-- upvalues: var7 (ref), permissionPromptFinishedModule (copy), p0 (ref)
		var7(permissionPromptFinishedModule(p0.promptId, true))
	end, { p0.promptId })
	local var11 = reactModule.useCallback(function() --[[ line: 43 ]]
		-- upvalues: var7 (ref), permissionPromptFinishedModule (copy), p0 (ref)
		var7(permissionPromptFinishedModule(p0.promptId, false))
	end, { p0.promptId })
	
	return reactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		buttonStackInfo = reactModule.useMemo(function() --[[ line: 49 ]]
			-- upvalues: buttonType (copy), var10 (ref), var8 (ref), var11 (ref)
			return {
				buttons = {
					{
						isDefaultChild = false,
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = var10, text = var8.allow }
					},
					{
						isDefaultChild = true,
						props = { onActivated = var11, text = var8.dontAllow }
					}
				}
			}
		end, { var10, var11 }),
		middleContent = reactModule.useCallback(function() --[[ line: 71 ]]
			-- upvalues: reactModule (copy), text (copy), var8 (ref)
			return reactModule.createElement(text, {
				tag = "size-full-1200 text-align-x-center text-body-large text-wrap",
				Text = var8.allowAccessToCapturesBody
			})
		end, {}),
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = var9,
		title = var8.allowAccessToCapturesTitle
	})
end