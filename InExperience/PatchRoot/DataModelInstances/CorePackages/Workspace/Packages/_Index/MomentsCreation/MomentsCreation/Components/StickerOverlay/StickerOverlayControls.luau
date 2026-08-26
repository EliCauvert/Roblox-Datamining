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

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), useMemo (ref), signalsModule (ref), constantsModule (ref), useSignalState (ref), useCallback (ref), dashModule (ref), makeDefaultStickerOverlayEditModule (ref), makeCreationEventFieldsModule (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), eventNames (ref), useFormFactor (ref), formFactor (ref), reactionType (ref), reactionAssets (ref), reactModule (ref), stickerPickerItemModule (ref), view (ref), slider (ref), knob (ref), foundationModule (ref), button (ref), scrollView (ref)
	local controller = p1.controller
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local var3 = useCreationFlowStringsModule()
	local var4 = useSignalState(useMemo(function()
		-- upvalues: signalsModule (copy), controller (ref), constantsModule (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: controller (copy), constantsModule (copy)
			local activeSession = controller.getActiveSession(p2)
			local var5 = if activeSession ~= nil then nil else activeSession.getDraft(p2)
			local var6 = var5 and var5[1]
			
			return if var6 == nil then constantsModule.StickerOverlay.DefaultStickerSize else var6.stickerSize
		end)
	end, { controller }))
	local var5 = useCallback(function(p2)
		-- upvalues: controller (ref), dashModule (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var6 = draft and draft[1]
		
		if var6 == nil then
			return
		end
		activeSession.update({ dashModule.joinDeep(var6, { stickerSize = p2 }) })
	end, { controller })
	local var6 = useCallback(function()
		-- upvalues: controller (ref)
		controller.discardActiveTool()
	end, { controller })
	local var7 = useCallback(function()
		-- upvalues: controller (ref)
		controller.commitActiveTool()
	end, { controller })
	local var8 = useCallback(function(p2)
		-- upvalues: controller (ref), dashModule (copy), makeDefaultStickerOverlayEditModule (copy), makeCreationEventFieldsModule (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), eventNames (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var9 = draft and draft[1]
		
		if var9 ~= nil and var9.stickerURI == p2 then
			activeSession.update({ dashModule.join(var9, { stickerURI = dashModule.None }) })
			
			return
		end
		activeSession.update({
			dashModule.join(var9 or makeDefaultStickerOverlayEditModule(), { stickerURI = p2 })
		})
		local t = { stickerURI = p2 }
		
		for i, v in makeCreationEventFieldsModule.makeToolFieldFromKind("sticker") do
			t[i] = v
		end
		for i_1, v_1 in makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)) do
			t[i_1] = v_1
		end
		fireAnalyticsEventModule(eventNames.EditingFlowStickerSelected, t)
	end, { controller })
	local var10 = useFormFactor() == formFactor.Wide
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		padding = {
			top = UDim.new(0, var2.Padding.Small),
			bottom = UDim.new(0, math.max(var1.bottom, var2.Padding.Small)),
			left = UDim.new(0, math.max(var1.left, var2.Padding.XLarge)),
			right = UDim.new(0, math.max(var1.right, var2.Padding.XLarge))
		}
	}, {
		StickerSizeSlider = reactModule.createElement(slider, {
			LayoutOrder = 1,
			knob = reactModule.createElement(knob, { size = foundationModule.Enums.InputSize.Large }),
			knobVisibility = foundationModule.Enums.Visibility.Always,
			onValueChanged = var5,
			size = foundationModule.Enums.InputSize.XSmall,
			range = NumberRange.new(constantsModule.StickerOverlay.MinStickerSize, constantsModule.StickerOverlay.MaxStickerSize),
			value = math.clamp(var4 or constantsModule.StickerOverlay.DefaultStickerSize, constantsModule.StickerOverlay.MinStickerSize, constantsModule.StickerOverlay.MaxStickerSize),
			variant = foundationModule.Enums.SliderVariant.Standard
		}),
		Nav = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row flex-x-between align-x-center align-y-center gap-medium size-full-0 auto-y"
		}, {
			BackButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var3.GeneralCtaBack,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = var6,
				size = foundationModule.Enums.InputSize.Medium
			}),
			StickerRow = reactModule.createElement(scrollView, {
				LayoutOrder = 2,
				flexItem = { FlexMode = Enum.UIFlexMode.Fill },
				Size = UDim2.fromOffset(0, var2.Size.Size_1000),
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = if var10 then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, var2.Padding.Small),
					SortOrder = Enum.SortOrder.LayoutOrder
				},
				scroll = {
					ScrollingDirection = Enum.ScrollingDirection.X,
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					CanvasSize = UDim2.fromOffset(0, 0),
					scrollBarVisibility = if var10 then foundationModule.Enums.Visibility.None else foundationModule.Enums.Visibility.Auto
				}
			}, useMemo(function()
				-- upvalues: reactionType (copy), reactionAssets (copy), reactModule (copy), stickerPickerItemModule (copy), var8 (ref)
				local t = {}
				local var11 = 0
				
				for i, v in reactionType do
					local stickerImageUri = reactionAssets.getStickerImageUri(v)
					
					if stickerImageUri ~= nil then
						var11 += 1
						table.insert(t, reactModule.createElement(stickerPickerItemModule, {
							key = v,
							layoutOrder = var11,
							stickerURI = stickerImageUri,
							onStickerSelected = var8
						}))
					end
				end
				return t
			end, { var8 })),
			DoneButton = reactModule.createElement(button, {
				LayoutOrder = 3,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var3.GeneralCtaDone,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = var7,
				size = foundationModule.Enums.InputSize.Medium
			})
		})
	})
end