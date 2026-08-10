local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local button = foundationModule.Button
local knob = foundationModule.Knob
local scrollView = foundationModule.ScrollView
local slider = foundationModule.Slider
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = signalsReactModule.useSignalState
local formFactor = momentsCommonModule.Enums.FormFactor
local reactionType = momentsCommonModule.Enums.ReactionType
local reactionAssets = momentsCommonModule.Components.ReactionAssets
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames
local constantsModule = require(momentsCreation.Constants)
local stickerPickerItemModule = require(momentsCreation.Components.StickerOverlay.StickerPickerItem)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local makeDefaultStickerOverlayEditModule = require(momentsCreation.Utils.makeDefaultStickerOverlayEdit)
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)

return function(p0) --[[ line: 57 | named "StickerOverlayControls" ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), useMemo (ref), signalsModule (ref), constantsModule (ref), useSignalState (ref), useCallback (ref), dashModule (ref), makeDefaultStickerOverlayEditModule (ref), makeCreationEventFieldsModule (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), eventNames (ref), useFormFactor (ref), formFactor (ref), reactionType (ref), reactionAssets (ref), reactModule (ref), stickerPickerItemModule (ref), view (ref), slider (ref), knob (ref), foundationModule (ref), button (ref), scrollView (ref)
	local controller = p0.controller
	local var13 = useDeviceInsets()
	local var14 = useTokens()
	local var15 = useCreationFlowStringsModule()
	local var16 = useSignalState(useMemo(function() --[[ line: 64 ]]
		-- upvalues: signalsModule (copy), controller (ref), constantsModule (copy)
		return signalsModule.createComputed(function(p1) --[[ line: 65 ]]
			-- upvalues: controller (copy), constantsModule (copy)
			local activeSession = controller.getActiveSession(p1)
			local var23 = if activeSession ~= nil then nil else activeSession.getDraft(p1)
			local var24 = var23 and var23[1]
			
			return if var24 == nil then constantsModule.StickerOverlay.DefaultStickerSize else var24.stickerSize
		end)
	end, { controller }))
	local var17 = useCallback(function(p2) --[[ line: 74 ]]
		-- upvalues: controller (ref), dashModule (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var27 = draft and draft[1]
		
		if var27 == nil then
			return
		end
		activeSession.update({ dashModule.joinDeep(var27, { stickerSize = p2 }) })
	end, { controller })
	local var18 = useCallback(function() --[[ line: 87 ]]
		-- upvalues: controller (ref)
		controller.discardActiveTool()
	end, { controller })
	local var19 = useCallback(function() --[[ line: 91 ]]
		-- upvalues: controller (ref)
		controller.commitActiveTool()
	end, { controller })
	local var20 = useCallback(function(p3) --[[ line: 95 ]]
		-- upvalues: controller (ref), dashModule (copy), makeDefaultStickerOverlayEditModule (copy), makeCreationEventFieldsModule (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), eventNames (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var30 = draft and draft[1]
		
		if var30 ~= nil and var30.stickerURI == p3 then
			activeSession.update({ dashModule.join(var30, { stickerURI = dashModule.None }) })
			
			return
		end
		activeSession.update({
			dashModule.join(var30 or makeDefaultStickerOverlayEditModule(), { stickerURI = p3 })
		})
		local t = { stickerURI = p3 }
		
		for i, v in makeCreationEventFieldsModule.makeToolFieldFromKind("sticker") do
			t[i] = v
		end
		for i_1, v_1 in makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)) do
			t[i_1] = v_1
		end
		fireAnalyticsEventModule(eventNames.EditingFlowStickerSelected, t)
	end, { controller })
	local var21 = useFormFactor() == formFactor.Wide
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		padding = {
			top = UDim.new(0, var14.Padding.Small),
			bottom = UDim.new(0, math.max(var13.bottom, var14.Padding.Small)),
			left = UDim.new(0, math.max(var13.left, var14.Padding.XLarge)),
			right = UDim.new(0, math.max(var13.right, var14.Padding.XLarge))
		}
	}, {
		StickerSizeSlider = reactModule.createElement(slider, {
			LayoutOrder = 1,
			knob = reactModule.createElement(knob, { size = foundationModule.Enums.InputSize.Large }),
			knobVisibility = foundationModule.Enums.Visibility.Always,
			onValueChanged = var17,
			size = foundationModule.Enums.InputSize.XSmall,
			range = NumberRange.new(constantsModule.StickerOverlay.MinStickerSize, constantsModule.StickerOverlay.MaxStickerSize),
			value = math.clamp(var16 or constantsModule.StickerOverlay.DefaultStickerSize, constantsModule.StickerOverlay.MinStickerSize, constantsModule.StickerOverlay.MaxStickerSize),
			variant = foundationModule.Enums.SliderVariant.Standard
		}),
		Nav = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row flex-x-between align-x-center align-y-center gap-medium size-full-0 auto-y"
		}, {
			BackButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var15.GeneralCtaBack,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = var18,
				size = foundationModule.Enums.InputSize.Medium
			}),
			StickerRow = reactModule.createElement(scrollView, {
				LayoutOrder = 2,
				flexItem = { FlexMode = Enum.UIFlexMode.Fill },
				Size = UDim2.fromOffset(0, var14.Size.Size_1000),
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = if var21 then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, var14.Padding.Small),
					SortOrder = Enum.SortOrder.LayoutOrder
				},
				scroll = {
					ScrollingDirection = Enum.ScrollingDirection.X,
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					CanvasSize = UDim2.fromOffset(0, 0),
					scrollBarVisibility = if var21 then foundationModule.Enums.Visibility.None else foundationModule.Enums.Visibility.Auto
				}
			}, useMemo(function() --[[ line: 137 ]]
				-- upvalues: reactionType (copy), reactionAssets (copy), reactModule (copy), stickerPickerItemModule (copy), var20 (ref)
				local t = {}
				local var33 = 0
				
				for i, v in reactionType do
					local stickerImageUri = reactionAssets.getStickerImageUri(v)
					
					if stickerImageUri ~= nil then
						var33 += 1
						table.insert(t, reactModule.createElement(stickerPickerItemModule, {
							key = v,
							layoutOrder = var33,
							stickerURI = stickerImageUri,
							onStickerSelected = var20
						}))
					end
				end
				return t
			end, { var20 })),
			DoneButton = reactModule.createElement(button, {
				LayoutOrder = 3,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var15.GeneralCtaDone,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = var19,
				size = foundationModule.Enums.InputSize.Medium
			})
		})
	})
end