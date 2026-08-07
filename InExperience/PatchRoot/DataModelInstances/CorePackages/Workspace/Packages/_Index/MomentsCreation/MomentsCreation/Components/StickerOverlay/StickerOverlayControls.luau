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
local slider = foundationModule.Slider
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = signalsReactModule.useSignalState
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

return function(p0) --[[ line: 54 | named "StickerOverlayControls" ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), useMemo (ref), signalsModule (ref), constantsModule (ref), useSignalState (ref), useCallback (ref), dashModule (ref), makeDefaultStickerOverlayEditModule (ref), makeCreationEventFieldsModule (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), eventNames (ref), reactionType (ref), reactionAssets (ref), reactModule (ref), stickerPickerItemModule (ref), view (ref), slider (ref), knob (ref), foundationModule (ref), button (ref)
	local controller = p0.controller
	local var13 = useDeviceInsets()
	local var14 = useTokens()
	local var15 = useCreationFlowStringsModule()
	local var16 = useCallback(function(p1) --[[ line: 92 ]]
		-- upvalues: controller (ref), makeDefaultStickerOverlayEditModule (copy), dashModule (copy), makeCreationEventFieldsModule (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), eventNames (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		activeSession.update({
			dashModule.join(if draft then draft[1] else makeDefaultStickerOverlayEditModule(), { stickerURI = p1 })
		})
		local t = { stickerURI = p1 }
		
		for i, v in makeCreationEventFieldsModule.makeToolFieldFromKind("sticker") do
			t[i] = v
		end
		for i_1, v_1 in makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)) do
			t[i_1] = v_1
		end
		fireAnalyticsEventModule(eventNames.EditingFlowStickerSelected, t)
	end, { controller })
	
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
			onValueChanged = useCallback(function(p2) --[[ line: 71 ]]
				-- upvalues: controller (ref), dashModule (copy)
				local activeSession = controller.getActiveSession(false)
				
				if activeSession == nil then return end
				local draft = activeSession.getDraft(false)
				local var22 = draft and draft[1]
				
				if var22 == nil then
					return
				end
				activeSession.update({ dashModule.joinDeep(var22, { stickerSize = p2 }) })
			end, { controller }),
			size = foundationModule.Enums.InputSize.XSmall,
			range = NumberRange.new(constantsModule.StickerOverlay.MinStickerSize, constantsModule.StickerOverlay.MaxStickerSize),
			value = math.clamp(useSignalState(useMemo(function() --[[ line: 61 ]]
				-- upvalues: signalsModule (copy), controller (ref), constantsModule (copy)
				return signalsModule.createComputed(function(p3) --[[ line: 62 ]]
					-- upvalues: controller (copy), constantsModule (copy)
					local activeSession = controller.getActiveSession(p3)
					local var24 = if activeSession ~= nil then nil else activeSession.getDraft(p3)
					local var25 = var24 and var24[1]
					
					return if var25 == nil then constantsModule.StickerOverlay.DefaultStickerSize else var25.stickerSize
				end)
			end, { controller })) or constantsModule.StickerOverlay.DefaultStickerSize, constantsModule.StickerOverlay.MinStickerSize, constantsModule.StickerOverlay.MaxStickerSize),
			variant = foundationModule.Enums.SliderVariant.Standard
		}),
		Nav = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row flex-x-between align-x-center align-y-center gap-small size-full-0 auto-y"
		}, {
			BackButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var15.GeneralCtaBack,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function() --[[ line: 84 ]]
					-- upvalues: controller (ref)
					controller.discardActiveTool()
				end, { controller }),
				size = foundationModule.Enums.InputSize.Medium
			}),
			StickerRow = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row flex-x-between align-x-center align-y-center gap-small auto-xy"
			}, useMemo(function() --[[ line: 119 ]]
				-- upvalues: reactionType (copy), reactionAssets (copy), reactModule (copy), stickerPickerItemModule (copy), var16 (ref)
				local t = {}
				local var27 = 0
				
				for i, v in reactionType do
					local stickerImageUri = reactionAssets.getStickerImageUri(v)
					
					if stickerImageUri ~= nil then
						var27 += 1
						table.insert(t, reactModule.createElement(stickerPickerItemModule, {
							key = v,
							layoutOrder = var27,
							stickerURI = stickerImageUri,
							onStickerSelected = var16
						}))
					end
				end
				return t
			end, { var16 })),
			DoneButton = reactModule.createElement(button, {
				LayoutOrder = 3,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var15.GeneralCtaDone,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function() --[[ line: 88 ]]
					-- upvalues: controller (ref)
					controller.commitActiveTool()
				end, { controller }),
				size = foundationModule.Enums.InputSize.Medium
			})
		})
	})
end