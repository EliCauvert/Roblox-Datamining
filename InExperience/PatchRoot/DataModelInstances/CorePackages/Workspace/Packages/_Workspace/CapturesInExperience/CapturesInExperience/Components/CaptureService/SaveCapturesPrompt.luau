local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local UIBloxModule = require(parent_1.UIBlox)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local capturePromptItemModule = require(parent.Components.CaptureService.CapturePromptItem)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local useLocalization = localizationModule.Hooks.useLocalization
local usePinInputStateWhileOpenModule = require(parent.Hooks.usePinInputStateWhileOpen)
local useScreenSize = robloxAppHooksModule.useScreenSize
local eventNamesModule = require(parent.Analytics.EventNames)
local saveCapturesPromptFinishedModule = require(parent.Thunks.SaveCapturesPromptFinished)
local _ = require(parent.Types)
local fFlagCapturePermissionsPromptFreeMouseModule = require(parent.Flags.FFlagCapturePermissionsPromptFreeMouse)

local _ = function(p0)
	return typeof(p0) == "Content" and (p0.Object ~= nil and p0.Object:IsA("VideoCapture"))
end

local _ = function(p1)
	for i, v in p1 do
		if typeof(v) == "Content" and (v.Object ~= nil and v.Object:IsA("VideoCapture")) then
			return true
		end
	end
	return false
end

return function(p2)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useScreenSize (ref), reactModule (ref), useLocalization (ref), usePinInputStateWhileOpenModule (ref), fFlagCapturePermissionsPromptFreeMouseModule (ref), eventNamesModule (ref), useEffectOnce (ref), saveCapturesPromptFinishedModule (ref), buttonType (ref), view (ref), capturePromptItemModule (ref), text (ref), icon (ref), interactiveAlert (ref)
	local var25, var24
	local var12 = useAnalyticsModule()
	local var13 = useDispatch()
	local var14 = useScreenSize()
	local var15, var16 = reactModule.useState(Vector2.new(0, 0))
	local var17, var18 = reactModule.useState(Vector2.new(0, 0))
	local var19, var20 = reactModule.useState(1)
	local var21, var22 = reactModule.useState({})
	local contents = p2.promptData.contents
	local var23 = p2.enableInputDelayed ~= nil or p2.enableInputDelayed
	
	for i, v in contents do
		var25 = typeof(v) == "Content" and (v.Object ~= nil and v.Object:IsA("VideoCapture"))
		
		if var25 then
			var24 = true
			local var26 = useLocalization({
				bodyText = "Feature.Captures.Body.SaveCapturesPrompt",
				no = "Feature.Captures.Action.NoThanks",
				title = "Feature.Captures.Title.SaveCapturesPrompt",
				yes = "Feature.Captures.Action.Save"
			})
			usePinInputStateWhileOpenModule(fFlagCapturePermissionsPromptFreeMouseModule)
			reactModule.useEffect(function()
				-- upvalues: var12 (ref), eventNamesModule (copy)
				var12.fireEvent(eventNamesModule.SaveCapturesPromptViewed)
			end, {})
			reactModule.useEffect(function()
				-- upvalues: var24 (ref), var12 (ref), eventNamesModule (copy)
				if var24 then
					var12.fireEvent(eventNamesModule.SaveCapturesPromptVideoPrompted)
				end
			end, { var24 })
			useEffectOnce(function()
				-- upvalues: contents (ref), var22 (ref)
				local t = {}
				
				for i, v in contents do
					t[i] = true
				end
				var22(t)
			end, { contents })
			local var27 = reactModule.useCallback(function(p3)
				-- upvalues: var22 (ref), var19 (ref)
				var22(function(p4)
					-- upvalues: var19 (copy), p3 (ref)
					local cloned = table.clone(p4)
					cloned[var19] = p3
					
					return cloned
				end)
			end, { var19 })
			local var28 = reactModule.useCallback(function(p5)
				-- upvalues: var16 (ref)
				var16(p5.AbsoluteSize)
			end, { var16 })
			local var29 = reactModule.useCallback(function(p6)
				-- upvalues: var18 (ref)
				var18(p6.AbsoluteSize)
			end, { var18 })
			local var30 = reactModule.useCallback(function()
				-- upvalues: var21 (ref), contents (ref), var12 (ref), eventNamesModule (copy), var13 (ref), saveCapturesPromptFinishedModule (copy), p2 (ref)
				local var35 = 0
				local var36 = 0
				local var37 = false
				local t = {}
				
				for i, v in var21 do
					t[contents[i]] = v
					
					if v then
						var35 += 1
						local var39 = contents[i]
						
						if typeof(var39) == "Content" and (var39.Object ~= nil and var39.Object:IsA("VideoCapture")) then
							var37 = true
						end
					end
					var36 += 1
				end
				if var37 then
					var12.fireEvent(eventNamesModule.SaveCapturesPromptVideoAccepted)
				end
				var12.fireEvent(eventNamesModule.SaveCapturesPromptAccepted, { savedCaptures = var35, totalCaptures = var36 })
				var13(saveCapturesPromptFinishedModule(p2.promptId, t))
			end, { p2.promptData, p2.promptId, var21 })
			var25 = reactModule.useCallback(function()
				-- upvalues: p2 (ref), var12 (ref), eventNamesModule (copy), var13 (ref), saveCapturesPromptFinishedModule (copy)
				local var40
				for i, v in p2.promptData.contents do
					if typeof(v) == "Content" and (v.Object ~= nil and v.Object:IsA("VideoCapture")) then
						var40 = true
						if var40 then
							var12.fireEvent(eventNamesModule.SaveCapturesPromptVideoRejected)
						end
						var12.fireEvent(eventNamesModule.SaveCapturesPromptRejected)
						local t = {}
						
						for i, v_1 in p2.promptData.contents do
							t[v_1] = false
						end
						var13(saveCapturesPromptFinishedModule(p2.promptId, t))
						
						return
					end
				end
				var40 = false
			end, { p2.promptData, p2.promptId })
			local var31 = reactModule.useCallback(function()
				-- upvalues: var20 (ref), var19 (ref)
				var20(math.max(1, var19 - 1))
			end, { var19 })
			local var32 = reactModule.useCallback(function()
				-- upvalues: var20 (ref), contents (ref), var19 (ref)
				var20(math.min(#contents, var19 + 1))
			end, { contents, var19 })
			
			return reactModule.createElement(interactiveAlert, {
				isMiddleContentFocusable = false,
				bodyText = var26.bodyText,
				buttonStackInfo = reactModule.useMemo(function()
					-- upvalues: var25 (ref), var26 (ref), buttonType (copy), var23 (ref), var30 (ref)
					return {
						buttons = {
							{
								isDefaultChild = true,
								props = { onActivated = var25, text = var26.no }
							},
							{
								isDefaultChild = false,
								buttonType = buttonType.PrimarySystem,
								props = {
									delayInputSeconds = 2,
									enableInputDelayed = var23,
									isDelayedInput = var23,
									onActivated = var30,
									text = var26.yes
								}
							}
						}
					}
				end, { var26, var30, var25 }),
				middleContent = reactModule.useCallback(function()
					-- upvalues: var15 (ref), var17 (ref), var14 (ref), reactModule (copy), view (copy), var29 (ref), capturePromptItemModule (copy), contents (ref), var19 (ref), var21 (ref), var27 (ref), text (copy), var31 (ref), icon (copy), var32 (ref)
					return reactModule.createElement(view, {
						Size = UDim2.new(1, 0, 0, 200),
						sizeConstraint = {
							MaxSize = Vector2.new(1e999, var14.Y - 80 - (var15.Y - var17.Y))
						},
						onAbsoluteSizeChanged = var29
					}, {
						CapturePromptItem = reactModule.createElement(capturePromptItemModule, {
							content = contents[var19],
							isSelected = var21[var19],
							showCheckbox = #contents > 1,
							updateSelected = var27
						}),
						Overlay = reactModule.createElement(view, {
							LayoutOrder = 2,
							tag = "padding-small size-full",
							ZIndex = 2
						}, {
							CountView = reactModule.createElement(view, {
								tag = "bg-over-media-0 anchor-top-left auto-xy clip padding-x-small padding-y-xsmall position-top-left radius-circle",
								Visible = #contents > 1
							}, {
								Count = reactModule.createElement(text, {
									tag = "auto-xy content-emphasis text-body-small",
									Text = `{var19}/{#contents}`
								})
							}),
							PrevCaptureButton = if var19 > 1 then reactModule.createElement(view, {
								tag = "bg-over-media-0 anchor-center-left auto-xy clip position-center-left radius-circle",
								onActivated = var31
							}, {
								CycleLeftIcon = reactModule.createElement(icon, { name = "icons/actions/cycleLeft" })
							}) else nil,
							NextCaptureButton = if var19 < #contents then reactModule.createElement(view, {
								tag = "bg-over-media-0 anchor-center-right auto-xy clip position-center-right radius-circle",
								onActivated = var32
							}, {}, {
								CycleRightIcon = reactModule.createElement(icon, { name = "icons/actions/cycleRight" })
							}) else nil
						})
					})
				end, {
					var15, contents, var17, var19, var29, var32, var31, var14, var21, var27
				}),
				onAbsoluteSizeChanged = var28,
				position = UDim2.fromScale(0.5, 0.5),
				screenSize = var14,
				title = var26.title
			})
		end
	end
	var24 = false
end