-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:50 2026 Pacific Standard Time.

local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local button = foundationModule.Button
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)
local creationFlowLocalizationModule = require(momentsCreationFlow.Enums.CreationFlowLocalization)

return function(p0) --[[ line: 25 ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), reactModule (ref), creationFlowContextModule (ref), useCallback (ref), view (ref), button (ref), foundationModule (ref), creationFlowLocalizationModule (ref)
	local var6 = useDeviceInsets()
	local var7 = useTokens()
	local var8 = reactModule.useContext(creationFlowContextModule)
	
	return reactModule.createElement(view, {
		tag = "align-x-center auto-y align-y-bottom anchor-bottom-center col gap-large position-bottom-center size-full-0",
		LayoutOrder = p0.layoutOrder
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var7.Padding.Small),
			PaddingBottom = UDim.new(0, math.max(var6.bottom, var7.Padding.Small)),
			PaddingLeft = UDim.new(0, math.max(var6.left, var7.Padding.XLarge)),
			PaddingRight = UDim.new(0, math.max(var6.right, var7.Padding.XLarge))
		}),
		Nav = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
		}, {
			BackButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var8.getLocalization(creationFlowLocalizationModule.GeneralCtaBack),
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function() --[[ line: 30 ]]
					-- upvalues: p0 (ref)
					if p0.onTextOverlayDiscard then
						p0.onTextOverlayDiscard()
					end
				end, { p0.onTextOverlayDiscard }),
				size = foundationModule.Enums.InputSize.Medium
			}),
			DoneButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var8.getLocalization(creationFlowLocalizationModule.GeneralCtaDone),
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function() --[[ line: 36 ]]
					-- upvalues: p0 (ref)
					if p0.onTextOverlaySave then
						p0.onTextOverlaySave()
					end
				end, { p0.onTextOverlaySave }),
				size = foundationModule.Enums.InputSize.Medium
			})
		})
	})
end