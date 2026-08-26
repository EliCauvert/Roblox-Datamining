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

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), reactModule (ref), creationFlowContextModule (ref), useCallback (ref), view (ref), button (ref), foundationModule (ref), creationFlowLocalizationModule (ref)
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local var3 = reactModule.useContext(creationFlowContextModule)
	
	return reactModule.createElement(view, {
		tag = "align-x-center auto-y align-y-bottom anchor-bottom-center col gap-large position-bottom-center size-full-0",
		LayoutOrder = p1.layoutOrder
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var2.Padding.Small),
			PaddingBottom = UDim.new(0, math.max(var1.bottom, var2.Padding.Small)),
			PaddingLeft = UDim.new(0, math.max(var1.left, var2.Padding.XLarge)),
			PaddingRight = UDim.new(0, math.max(var1.right, var2.Padding.XLarge))
		}),
		Nav = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
		}, {
			BackButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var3.getLocalization(creationFlowLocalizationModule.GeneralCtaBack),
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function()
					-- upvalues: p1 (ref)
					if p1.onTextOverlayDiscard then
						p1.onTextOverlayDiscard()
					end
				end, { p1.onTextOverlayDiscard }),
				size = foundationModule.Enums.InputSize.Medium
			}),
			DoneButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var3.getLocalization(creationFlowLocalizationModule.GeneralCtaDone),
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function()
					-- upvalues: p1 (ref)
					if p1.onTextOverlaySave then
						p1.onTextOverlaySave()
					end
				end, { p1.onTextOverlaySave }),
				size = foundationModule.Enums.InputSize.Medium
			})
		})
	})
end