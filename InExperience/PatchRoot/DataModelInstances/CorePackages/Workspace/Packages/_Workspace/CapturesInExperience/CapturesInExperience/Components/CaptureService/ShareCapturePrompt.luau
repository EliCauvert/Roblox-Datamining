local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local UIBloxModule = require(parent_1.UIBlox)
local view = foundationModule.View
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local usePinInputStateWhileOpenModule = require(parent.Hooks.usePinInputStateWhileOpen)
local useScreenSize = robloxAppHooksModule.useScreenSize
local capturePromptItemModule = require(parent.Components.CaptureService.CapturePromptItem)
local eventNamesModule = require(parent.Analytics.EventNames)
local shareCapturePromptFinishedModule = require(parent.Thunks.ShareCapturePromptFinished)
local _ = require(parent.Types)
local fFlagCapturePermissionsPromptFreeMouseModule = require(parent.Flags.FFlagCapturePermissionsPromptFreeMouse)

return function(p1)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useScreenSize (ref), reactModule (ref), useLocalization (ref), usePinInputStateWhileOpenModule (ref), fFlagCapturePermissionsPromptFreeMouseModule (ref), eventNamesModule (ref), shareCapturePromptFinishedModule (ref), buttonType (ref), view (ref), capturePromptItemModule (ref), interactiveAlert (ref)
	local var1 = useAnalyticsModule()
	local var2 = useDispatch()
	local var3 = useScreenSize()
	local var4, var5 = reactModule.useState(Vector2.new(0, 0))
	local var6, var7 = reactModule.useState(Vector2.new(0, 0))
	local var8, var9 = reactModule.useState(Vector2.new(0, 0))
	local content = p1.promptData.content
	local isU13LocalSavePrompt = p1.promptData.isU13LocalSavePrompt
	local var10 = p1.enableInputDelayed ~= nil or p1.enableInputDelayed
	local var11 = typeof(content) == "Content" and (content.Object ~= nil and content.Object:IsA("VideoCapture"))
	local var12 = useLocalization({
		no = "Feature.Captures.Action.NoThanks",
		saveBodyText = "Feature.Captures.Body.SaveCapturesPrompt",
		saveTitle = "Feature.Captures.Title.SaveCapturesPrompt",
		saveYes = "Feature.Captures.Action.Save",
		shareBodyText = "Feature.Captures.Body.ShareCapturePrompt",
		shareTitle = "Feature.Captures.Title.ShareCapturePrompt",
		shareYes = "Feature.Captures.Action.Share"
	})
	local var13 = if isU13LocalSavePrompt then var12.saveBodyText else var12.shareBodyText
	local var14 = if isU13LocalSavePrompt then var12.saveTitle else var12.shareTitle
	local var15 = if isU13LocalSavePrompt then var12.saveYes else var12.shareYes
	usePinInputStateWhileOpenModule(fFlagCapturePermissionsPromptFreeMouseModule)
	reactModule.useEffect(function()
		-- upvalues: isU13LocalSavePrompt (ref), var1 (ref), eventNamesModule (copy), var11 (ref)
		if not isU13LocalSavePrompt then
			var1.fireEvent(eventNamesModule.ShareCapturePromptViewed)
			
			if var11 then
				var1.fireEvent(eventNamesModule.ShareCapturePromptVideoPrompted)
			end
		end
	end, { var1.fireEvent, isU13LocalSavePrompt, var11 })
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref)
		var5(p2.AbsoluteSize)
	end, { var5 })
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		var7(p2.AbsoluteSize)
	end, { var7 })
	local var18 = reactModule.useCallback(function()
		-- upvalues: isU13LocalSavePrompt (ref), var1 (ref), eventNamesModule (copy), var11 (ref), var2 (ref), shareCapturePromptFinishedModule (copy), p1 (ref)
		if not isU13LocalSavePrompt then
			var1.fireEvent(eventNamesModule.ShareCapturePromptAccepted)
			
			if var11 then
				var1.fireEvent(eventNamesModule.ShareCapturePromptVideoAccepted)
			end
		end
		var2(shareCapturePromptFinishedModule(p1.promptId, p1.promptData, true))
	end, {
		var1.fireEvent, var2, isU13LocalSavePrompt, var11, p1.promptData, p1.promptId
	})
	local var19 = reactModule.useCallback(function()
		-- upvalues: isU13LocalSavePrompt (ref), var1 (ref), eventNamesModule (copy), var11 (ref), var2 (ref), shareCapturePromptFinishedModule (copy), p1 (ref)
		if not isU13LocalSavePrompt then
			var1.fireEvent(eventNamesModule.ShareCapturePromptRejected)
			
			if var11 then
				var1.fireEvent(eventNamesModule.ShareCapturePromptVideoRejected)
			end
		end
		var2(shareCapturePromptFinishedModule(p1.promptId, p1.promptData, false))
	end, {
		var1.fireEvent, var2, isU13LocalSavePrompt, var11, p1.promptData, p1.promptId
	})
	
	return reactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		bodyText = var13,
		buttonStackInfo = reactModule.useMemo(function()
			-- upvalues: var19 (ref), var12 (ref), buttonType (copy), var10 (ref), var18 (ref), var15 (ref)
			return {
				buttons = {
					{
						isDefaultChild = true,
						props = { onActivated = var19, text = var12.no }
					},
					{
						isDefaultChild = false,
						buttonType = buttonType.PrimarySystem,
						props = {
							delayInputSeconds = 2,
							enableInputDelayed = var10,
							isDelayedInput = var10,
							onActivated = var18,
							text = var15
						}
					}
				}
			}
		end, {
			var10,
			var12,
			var18,
			var19,
			var15
		}),
		middleContent = reactModule.useCallback(function()
			-- upvalues: var4 (ref), var6 (ref), var3 (ref), reactModule (copy), view (copy), var17 (ref), capturePromptItemModule (copy), content (ref)
			return reactModule.createElement(view, {
				Size = UDim2.new(1, 0, 0, 200),
				sizeConstraint = {
					MaxSize = Vector2.new(1e999, var3.Y - 80 - (var4.Y - var6.Y))
				},
				onAbsoluteSizeChanged = var17
			}, {
				CapturePromptItem = reactModule.createElement(capturePromptItemModule, {
					isSelected = true,
					showCheckbox = false,
					content = content,
					updateSelected = function() end
				})
			})
		end, {
			var4,
			content,
			var6,
			reactModule.useCallback(function(p2)
				-- upvalues: var9 (ref)
				var9(p2.Resolution)
			end, { var9 }),
			var8
		}),
		onAbsoluteSizeChanged = var16,
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = var3,
		title = var14
	})
end