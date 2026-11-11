local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local UIBloxModule = require(Parent1.UIBlox)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local CapturePromptItemModule = require(Parent.Components.CaptureService.CapturePromptItem)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectOnceFunction = RoactUtilsModule.Hooks.useEffectOnce
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UsePinInputStateWhileOpenModule = require(Parent.Hooks.usePinInputStateWhileOpen)
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local EventNamesModule = require(Parent.Analytics.EventNames)
local SaveCapturesPromptFinishedModule = require(Parent.Thunks.SaveCapturesPromptFinished)
local _ = require(Parent.Types)
local FFlagCapturePermissionsPromptFreeMouseModule = require(Parent.Flags.FFlagCapturePermissionsPromptFreeMouse)

local function _(p1)
	return typeof(p1) == "Content" and (p1.Object ~= nil and p1.Object:IsA("VideoCapture"))
end

local _ = function(List): boolean
	for _, value in List do
		if typeof(value) == "Content" and (value.Object ~= nil and value.Object:IsA("VideoCapture")) then
			return true
		end
	end
	return false
end

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseScreenSizeFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), UsePinInputStateWhileOpenModule (copy), FFlagCapturePermissionsPromptFreeMouseModule (copy), EventNamesModule (copy), UseEffectOnceFunction (copy), SaveCapturesPromptFinishedModule (copy), ButtonType (copy), View (copy), CapturePromptItemModule (copy), Text (copy), Icon (copy), InteractiveAlert (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(1)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState({})
	local Contents = p1.promptData.contents
	local NoEnableInputDelayed = p1.enableInputDelayed == nil or p1.enableInputDelayed
	local Flag = false
	
	for _, content in Contents do
		if typeof(content) == "Content" and (content.Object ~= nil and content.Object:IsA("VideoCapture")) then
			Flag = true
			break
		end
	end
	local UseLocalizationResult = UseLocalizationFunction({
		bodyText = "Feature.Captures.Body.SaveCapturesPrompt",
		no = "Feature.Captures.Action.NoThanks",
		title = "Feature.Captures.Title.SaveCapturesPrompt",
		yes = "Feature.Captures.Action.Save"
	})
	UsePinInputStateWhileOpenModule(FFlagCapturePermissionsPromptFreeMouseModule)
	ReactModule.useEffect(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.SaveCapturesPromptViewed)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: Flag (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		if Flag then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.SaveCapturesPromptVideoPrompted)
		end
	end, { Flag })
	UseEffectOnceFunction(function()
		-- upvalues: Contents (copy), UseStateResult2_3 (copy)
		local t = {}
		
		for i, _ in Contents do
			t[i] = true
		end
		UseStateResult2_3(t)
	end, { Contents })
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_3 (copy), UseStateResult3 (copy)
		UseStateResult2_3(function(Tbl)
			-- upvalues: UseStateResult3 (upval), p2 (copy)
			local Copy = table.clone(Tbl)
			Copy[UseStateResult3] = p2
			
			return Copy
		end)
	end, { UseStateResult3 })
	local UseResult1 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsoluteSize)
	end, { UseStateResult2_1 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult4 (copy), Contents (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), SaveCapturesPromptFinishedModule (upval), p1 (copy)
		local SavedCaptures = 0
		local TotalCaptures = 0
		local Flag = false
		local t = {}
		
		for i, value in UseStateResult4 do
			t[Contents[i]] = value
			
			if value then
				SavedCaptures += 1
				local Content = Contents[i]
				
				if typeof(Content) == "Content" and (Content.Object ~= nil and Content.Object:IsA("VideoCapture")) then
					Flag = true
				end
			end
			TotalCaptures += 1
		end
		if Flag then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.SaveCapturesPromptVideoAccepted)
		end
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.SaveCapturesPromptAccepted, {
			savedCaptures = SavedCaptures,
			totalCaptures = TotalCaptures
		})
		UseDispatchResult(SaveCapturesPromptFinishedModule(p1.promptId, t))
	end, { p1.promptData, p1.promptId, UseStateResult4 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), SaveCapturesPromptFinishedModule (upval)
		local Flag = false
		
		for _, content in p1.promptData.contents do
			if typeof(content) == "Content" and (content.Object ~= nil and content.Object:IsA("VideoCapture")) then
				Flag = true
				break
			end
		end
		if Flag then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.SaveCapturesPromptVideoRejected)
		end
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.SaveCapturesPromptRejected)
		local t = {}
		
		for _, content1 in p1.promptData.contents do
			t[content1] = false
		end
		UseDispatchResult(SaveCapturesPromptFinishedModule(p1.promptId, t))
	end, { p1.promptData, p1.promptId })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy), UseStateResult3 (copy)
		UseStateResult2_2((math.max(1, UseStateResult3 - 1)))
	end, { UseStateResult3 })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy), Contents (copy), UseStateResult3 (copy)
		UseStateResult2_2((math.min(#Contents, UseStateResult3 + 1)))
	end, { Contents, UseStateResult3 })
	
	return ReactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = false,
		bodyText = UseLocalizationResult.bodyText,
		buttonStackInfo = ReactModule.useMemo(function()
			-- upvalues: UseResult3 (copy), UseLocalizationResult (copy), ButtonType (upval), NoEnableInputDelayed (copy), UseResult2 (copy)
			return {
				buttons = {
					{
						isDefaultChild = true,
						props = {
							onActivated = UseResult3,
							text = UseLocalizationResult.no
						}
					},
					{
						isDefaultChild = false,
						buttonType = ButtonType.PrimarySystem,
						props = {
							delayInputSeconds = 2,
							enableInputDelayed = NoEnableInputDelayed,
							isDelayedInput = NoEnableInputDelayed,
							onActivated = UseResult2,
							text = UseLocalizationResult.yes
						}
					}
				}
			}
		end, { UseLocalizationResult, UseResult2, UseResult3 }),
		middleContent = ReactModule.useCallback(function()
			-- upvalues: UseStateResult (copy), UseStateResult1 (copy), UseScreenSizeResult (copy), ReactModule (upval), View (upval), UseResult1 (copy), CapturePromptItemModule (upval), Contents (copy), UseStateResult3 (copy), UseStateResult4 (copy), UseResult (copy), Text (upval), UseResult4 (copy), Icon (upval), UseResult5 (copy)
			return ReactModule.createElement(View, {
				Size = UDim2.new(1, 0, 0, 200),
				sizeConstraint = {
					MaxSize = Vector2.new(1e999, UseScreenSizeResult.Y - 80 - (UseStateResult.Y - UseStateResult1.Y))
				},
				onAbsoluteSizeChanged = UseResult1
			}, {
				CapturePromptItem = ReactModule.createElement(CapturePromptItemModule, {
					content = Contents[UseStateResult3],
					isSelected = UseStateResult4[UseStateResult3],
					showCheckbox = #Contents > 1,
					updateSelected = UseResult
				}),
				Overlay = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "padding-small size-full",
					ZIndex = 2
				}, {
					CountView = ReactModule.createElement(View, {
						tag = "bg-over-media-0 anchor-top-left auto-xy clip padding-x-small padding-y-xsmall position-top-left radius-circle",
						Visible = #Contents > 1
					}, {
						Count = ReactModule.createElement(Text, {
							tag = "auto-xy content-emphasis text-body-small",
							Text = `{UseStateResult3}/{#Contents}`
						})
					}),
					PrevCaptureButton = if UseStateResult3 > 1 then ReactModule.createElement(View, {
						tag = "bg-over-media-0 anchor-center-left auto-xy clip position-center-left radius-circle",
						onActivated = UseResult4
					}, {
						CycleLeftIcon = ReactModule.createElement(Icon, { name = "icons/actions/cycleLeft" })
					}) else nil,
					NextCaptureButton = if UseStateResult3 < #Contents then ReactModule.createElement(View, {
						tag = "bg-over-media-0 anchor-center-right auto-xy clip position-center-right radius-circle",
						onActivated = UseResult5
					}, {}, {
						CycleRightIcon = ReactModule.createElement(Icon, { name = "icons/actions/cycleRight" })
					}) else nil
				})
			})
		end, {
			UseStateResult, Contents, UseStateResult1, UseStateResult3, UseResult1,
			UseResult5, UseResult4, UseScreenSizeResult, UseStateResult4, UseResult
		}),
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize)
		end, { UseStateResult2 }),
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = UseScreenSizeResult,
		title = UseLocalizationResult.title
	})
end