local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local View = FoundationModule.View
local UseCallbackFunction = ReactModule.useCallback
local UseDeviceInsetsFunction = require(Parent.MomentsCommon).Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CreationFlowContextModule = require(MomentsCreationFlow.Context.CreationFlowContext)
local CreationFlowLocalizationModule = require(MomentsCreationFlow.Enums.CreationFlowLocalization)

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), ReactModule (copy), CreationFlowContextModule (copy), UseCallbackFunction (copy), View (copy), Button (copy), FoundationModule (copy), CreationFlowLocalizationModule (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseContextResult = ReactModule.useContext(CreationFlowContextModule)
	
	return ReactModule.createElement(View, {
		tag = "align-x-center auto-y align-y-bottom anchor-bottom-center col gap-large position-bottom-center size-full-0",
		LayoutOrder = p1.layoutOrder
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.Small),
			PaddingBottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Small))),
			PaddingLeft = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
			PaddingRight = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
		}),
		Nav = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
		}, {
			BackButton = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseContextResult.getLocalization(CreationFlowLocalizationModule.GeneralCtaBack),
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = UseCallbackFunction(function()
					-- upvalues: p1 (copy)
					if p1.onTextOverlayDiscard then
						p1.onTextOverlayDiscard()
					end
				end, { p1.onTextOverlayDiscard }),
				size = FoundationModule.Enums.InputSize.Medium
			}),
			DoneButton = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseContextResult.getLocalization(CreationFlowLocalizationModule.GeneralCtaDone),
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = UseCallbackFunction(function()
					-- upvalues: p1 (copy)
					if p1.onTextOverlaySave then
						p1.onTextOverlaySave()
					end
				end, { p1.onTextOverlaySave }),
				size = FoundationModule.Enums.InputSize.Medium
			})
		})
	})
end