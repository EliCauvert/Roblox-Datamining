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

return function(p0)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useScreenSize (ref), reactModule (ref), useLocalization (ref), usePinInputStateWhileOpenModule (ref), fFlagCapturePermissionsPromptFreeMouseModule (ref), eventNamesModule (ref), shareCapturePromptFinishedModule (ref), buttonType (ref), view (ref), capturePromptItemModule (ref), interactiveAlert (ref)
	local var12 = useAnalyticsModule()
	local var13 = useDispatch()
	local var14 = useScreenSize()
	local var15, var16 = reactModule.useState(Vector2.new(0, 0))
	local var17, var18 = reactModule.useState(Vector2.new(0, 0))
	local var19, var20 = reactModule.useState(Vector2.new(0, 0))
	local content = p0.promptData.content
	local isU13LocalSavePrompt = p0.promptData.isU13LocalSavePrompt
	local var21 = p0.enableInputDelayed ~= nil or p0.enableInputDelayed
	local var22 = typeof(content) == "Content" and (content.Object ~= nil and content.Object:IsA("VideoCapture"))
	local var23 = useLocalization({
		no = "Feature.Captures.Action.NoThanks",
		saveBodyText = "Feature.Captures.Body.SaveCapturesPrompt",
		saveTitle = "Feature.Captures.Title.SaveCapturesPrompt",
		saveYes = "Feature.Captures.Action.Save",
		shareBodyText = "Feature.Captures.Body.ShareCapturePrompt",
		shareTitle = "Feature.Captures.Title.ShareCapturePrompt",
		shareYes = "Feature.Captures.Action.Share"
	})
	local var24 = if isU13LocalSavePrompt then var23.saveBodyText else var23.shareBodyText
	local var25 = if isU13LocalSavePrompt then var23.saveTitle else var23.shareTitle
	local var26 = if isU13LocalSavePrompt then var23.saveYes else var23.shareYes
	usePinInputStateWhileOpenModule(fFlagCapturePermissionsPromptFreeMouseModule)
	reactModule.useEffect(function()
		-- upvalues: isU13LocalSavePrompt (ref), var12 (ref), eventNamesModule (copy), var22 (ref)
		if not isU13LocalSavePrompt then
			var12.fireEvent(eventNamesModule.ShareCapturePromptViewed)
			
			if var22 then
				var12.fireEvent(eventNamesModule.ShareCapturePromptVideoPrompted)
			end
		end
	end, { var12.fireEvent, isU13LocalSavePrompt, var22 })
	local var27 = reactModule.useCallback(function(p1)
		-- upvalues: var16 (ref)
		var16(p1.AbsoluteSize)
	end, { var16 })
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: var18 (ref)
		var18(p2.AbsoluteSize)
	end, { var18 })
	local var29 = reactModule.useCallback(function()
		-- upvalues: isU13LocalSavePrompt (ref), var12 (ref), eventNamesModule (copy), var22 (ref), var13 (ref), shareCapturePromptFinishedModule (copy), p0 (ref)
		if not isU13LocalSavePrompt then
			var12.fireEvent(eventNamesModule.ShareCapturePromptAccepted)
			
			if var22 then
				var12.fireEvent(eventNamesModule.ShareCapturePromptVideoAccepted)
			end
		end
		var13(shareCapturePromptFinishedModule(p0.promptId, p0.promptData, true))
	end, {
		var12.fireEvent, var13, isU13LocalSavePrompt, var22, p0.promptData, p0.promptId
	})
	local var30 = reactModule.useCallback(function()
		-- upvalues: isU13LocalSavePrompt (ref), var12 (ref), eventNamesModule (copy), var22 (ref), var13 (ref), shareCapturePromptFinishedModule (copy), p0 (ref)
		if not isU13LocalSavePrompt then
			var12.fireEvent(eventNamesModule.ShareCapturePromptRejected)
			
			if var22 then
				var12.fireEvent(eventNamesModule.ShareCapturePromptVideoRejected)
			end
		end
		var13(shareCapturePromptFinishedModule(p0.promptId, p0.promptData, false))
	end, {
		var12.fireEvent, var13, isU13LocalSavePrompt, var22, p0.promptData, p0.promptId
	})
	
	return reactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		bodyText = var24,
		buttonStackInfo = reactModule.useMemo(function()
			-- upvalues: var30 (ref), var23 (ref), buttonType (copy), var21 (ref), var29 (ref), var26 (ref)
			return {
				buttons = {
					{
						isDefaultChild = true,
						props = { onActivated = var30, text = var23.no }
					},
					{
						isDefaultChild = false,
						buttonType = buttonType.PrimarySystem,
						props = {
							delayInputSeconds = 2,
							enableInputDelayed = var21,
							isDelayedInput = var21,
							onActivated = var29,
							text = var26
						}
					}
				}
			}
		end, {
			var21,
			var23,
			var29,
			var30,
			var26
		}),
		middleContent = reactModule.useCallback(function()
			-- upvalues: var15 (ref), var17 (ref), var14 (ref), reactModule (copy), view (copy), var28 (ref), capturePromptItemModule (copy), content (ref)
			return reactModule.createElement(view, {
				Size = UDim2.new(1, 0, 0, 200),
				sizeConstraint = {
					MaxSize = Vector2.new(1e999, var14.Y - 80 - (var15.Y - var17.Y))
				},
				onAbsoluteSizeChanged = var28
			}, {
				CapturePromptItem = reactModule.createElement(capturePromptItemModule, {
					isSelected = true,
					showCheckbox = false,
					content = content,
					updateSelected = function() end
				})
			})
		end, {
			var15,
			content,
			var17,
			reactModule.useCallback(function(p3)
				-- upvalues: var20 (ref)
				var20(p3.Resolution)
			end, { var20 }),
			var19
		}),
		onAbsoluteSizeChanged = var27,
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = var14,
		title = var25
	})
end