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

return function(p1)
	-- upvalues: useDispatch (ref), useLocalization (ref), useScreenSize (ref), reactModule (ref), permissionPromptFinishedModule (ref), buttonType (ref), text (ref), interactiveAlert (ref)
	local var1 = useDispatch()
	local var2 = useLocalization({
		allowAccessToCapturesTitle = "Feature.Captures.Title.AllowAccessToCaptures",
		allowAccessToCapturesBody = "Feature.Captures.Body.AllowAccessToCaptures",
		allow = "Feature.Captures.Action.Allow",
		dontAllow = "Feature.Captures.Action.DontAllow"
	})
	local var3 = useScreenSize()
	local var4 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), permissionPromptFinishedModule (copy), p1 (ref)
		var1(permissionPromptFinishedModule(p1.promptId, true))
	end, { p1.promptId })
	local var5 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), permissionPromptFinishedModule (copy), p1 (ref)
		var1(permissionPromptFinishedModule(p1.promptId, false))
	end, { p1.promptId })
	
	return reactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		buttonStackInfo = reactModule.useMemo(function()
			-- upvalues: buttonType (copy), var4 (ref), var2 (ref), var5 (ref)
			return {
				buttons = {
					{
						isDefaultChild = false,
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = var4, text = var2.allow }
					},
					{
						isDefaultChild = true,
						props = { onActivated = var5, text = var2.dontAllow }
					}
				}
			}
		end, { var4, var5 }),
		middleContent = reactModule.useCallback(function()
			-- upvalues: reactModule (copy), text (copy), var2 (ref)
			return reactModule.createElement(text, {
				tag = "size-full-1200 text-align-x-center text-body-large text-wrap",
				Text = var2.allowAccessToCapturesBody
			})
		end, {}),
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = var3,
		title = var2.allowAccessToCapturesTitle
	})
end