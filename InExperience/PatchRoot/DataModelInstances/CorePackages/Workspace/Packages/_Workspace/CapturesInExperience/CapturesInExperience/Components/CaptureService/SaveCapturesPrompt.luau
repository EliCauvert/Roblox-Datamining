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

local _ = function(p1)
	return typeof(p1) == "Content" and (p1.Object ~= nil and p1.Object:IsA("VideoCapture"))
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
	local var1, var2
	local var3 = useAnalyticsModule()
	local var4 = useDispatch()
	local var5 = useScreenSize()
	local var6, var7 = reactModule.useState(Vector2.new(0, 0))
	local var8, var9 = reactModule.useState(Vector2.new(0, 0))
	local var10, var11 = reactModule.useState(1)
	local var12, var13 = reactModule.useState({})
	local contents = p2.promptData.contents
	local var14 = p2.enableInputDelayed ~= nil or p2.enableInputDelayed
	
	for i, v in contents do
		var1 = typeof(v) == "Content" and (v.Object ~= nil and v.Object:IsA("VideoCapture"))
		
		if var1 then
			var2 = true
			local var15 = useLocalization({
				bodyText = "Feature.Captures.Body.SaveCapturesPrompt",
				no = "Feature.Captures.Action.NoThanks",
				title = "Feature.Captures.Title.SaveCapturesPrompt",
				yes = "Feature.Captures.Action.Save"
			})
			usePinInputStateWhileOpenModule(fFlagCapturePermissionsPromptFreeMouseModule)
			reactModule.useEffect(function()
				-- upvalues: var3 (ref), eventNamesModule (copy)
				var3.fireEvent(eventNamesModule.SaveCapturesPromptViewed)
			end, {})
			reactModule.useEffect(function()
				-- upvalues: var2 (ref), var3 (ref), eventNamesModule (copy)
				if var2 then
					var3.fireEvent(eventNamesModule.SaveCapturesPromptVideoPrompted)
				end
			end, { var2 })
			useEffectOnce(function()
				-- upvalues: contents (ref), var13 (ref)
				local t = {}
				
				for i, v in contents do
					t[i] = true
				end
				var13(t)
			end, { contents })
			local var16 = reactModule.useCallback(function(p3)
				-- upvalues: var13 (ref), var10 (ref)
				var13(function(p4)
					-- upvalues: var10 (copy), p3 (ref)
					local cloned = table.clone(p4)
					cloned[var10] = p3
					
					return cloned
				end)
			end, { var10 })
			local var17 = reactModule.useCallback(function(p3)
				-- upvalues: var7 (ref)
				var7(p3.AbsoluteSize)
			end, { var7 })
			local var18 = reactModule.useCallback(function(p3)
				-- upvalues: var9 (ref)
				var9(p3.AbsoluteSize)
			end, { var9 })
			local var19 = reactModule.useCallback(function()
				-- upvalues: var12 (ref), contents (ref), var3 (ref), eventNamesModule (copy), var4 (ref), saveCapturesPromptFinishedModule (copy), p2 (ref)
				local var20 = 0
				local var21 = 0
				local var22 = false
				local t = {}
				
				for i, v in var12 do
					t[contents[i]] = v
					
					if v then
						var20 += 1
						local var23 = contents[i]
						
						if typeof(var23) == "Content" and (var23.Object ~= nil and var23.Object:IsA("VideoCapture")) then
							var22 = true
						end
					end
					var21 += 1
				end
				if var22 then
					var3.fireEvent(eventNamesModule.SaveCapturesPromptVideoAccepted)
				end
				var3.fireEvent(eventNamesModule.SaveCapturesPromptAccepted, { savedCaptures = var20, totalCaptures = var21 })
				var4(saveCapturesPromptFinishedModule(p2.promptId, t))
			end, { p2.promptData, p2.promptId, var12 })
			var1 = reactModule.useCallback(function()
				-- upvalues: p2 (ref), var3 (ref), eventNamesModule (copy), var4 (ref), saveCapturesPromptFinishedModule (copy)
				local var24
				for i, v in p2.promptData.contents do
					if typeof(v) == "Content" and (v.Object ~= nil and v.Object:IsA("VideoCapture")) then
						var24 = true
						if var24 then
							var3.fireEvent(eventNamesModule.SaveCapturesPromptVideoRejected)
						end
						var3.fireEvent(eventNamesModule.SaveCapturesPromptRejected)
						local t = {}
						
						for i, v_1 in p2.promptData.contents do
							t[v_1] = false
						end
						var4(saveCapturesPromptFinishedModule(p2.promptId, t))
						
						return
					end
				end
				var24 = false
			end, { p2.promptData, p2.promptId })
			local var25 = reactModule.useCallback(function()
				-- upvalues: var11 (ref), var10 (ref)
				var11(math.max(1, var10 - 1))
			end, { var10 })
			local var26 = reactModule.useCallback(function()
				-- upvalues: var11 (ref), contents (ref), var10 (ref)
				var11(math.min(#contents, var10 + 1))
			end, { contents, var10 })
			
			return reactModule.createElement(interactiveAlert, {
				isMiddleContentFocusable = false,
				bodyText = var15.bodyText,
				buttonStackInfo = reactModule.useMemo(function()
					-- upvalues: var1 (ref), var15 (ref), buttonType (copy), var14 (ref), var19 (ref)
					return {
						buttons = {
							{
								isDefaultChild = true,
								props = { onActivated = var1, text = var15.no }
							},
							{
								isDefaultChild = false,
								buttonType = buttonType.PrimarySystem,
								props = {
									delayInputSeconds = 2,
									enableInputDelayed = var14,
									isDelayedInput = var14,
									onActivated = var19,
									text = var15.yes
								}
							}
						}
					}
				end, { var15, var19, var1 }),
				middleContent = reactModule.useCallback(function()
					-- upvalues: var6 (ref), var8 (ref), var5 (ref), reactModule (copy), view (copy), var18 (ref), capturePromptItemModule (copy), contents (ref), var10 (ref), var12 (ref), var16 (ref), text (copy), var25 (ref), icon (copy), var26 (ref)
					return reactModule.createElement(view, {
						Size = UDim2.new(1, 0, 0, 200),
						sizeConstraint = {
							MaxSize = Vector2.new(1e999, var5.Y - 80 - (var6.Y - var8.Y))
						},
						onAbsoluteSizeChanged = var18
					}, {
						CapturePromptItem = reactModule.createElement(capturePromptItemModule, {
							content = contents[var10],
							isSelected = var12[var10],
							showCheckbox = #contents > 1,
							updateSelected = var16
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
									Text = `{var10}/{#contents}`
								})
							}),
							PrevCaptureButton = if var10 > 1 then reactModule.createElement(view, {
								tag = "bg-over-media-0 anchor-center-left auto-xy clip position-center-left radius-circle",
								onActivated = var25
							}, {
								CycleLeftIcon = reactModule.createElement(icon, { name = "icons/actions/cycleLeft" })
							}) else nil,
							NextCaptureButton = if var10 < #contents then reactModule.createElement(view, {
								tag = "bg-over-media-0 anchor-center-right auto-xy clip position-center-right radius-circle",
								onActivated = var26
							}, {}, {
								CycleRightIcon = reactModule.createElement(icon, { name = "icons/actions/cycleRight" })
							}) else nil
						})
					})
				end, {
					var6, contents, var8, var10, var18, var26, var25, var5, var12, var16
				}),
				onAbsoluteSizeChanged = var17,
				position = UDim2.fromScale(0.5, 0.5),
				screenSize = var5,
				title = var15.title
			})
		end
	end
	var2 = false
end