local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local StateLayerModeModule = require(Foundation.Enums.StateLayerMode)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return ReactModule.memo(ReactModule.forwardRef(function(Frame, Ref) --[[ Line: 25 | Named "Dot" ]]
	-- upvalues: UseTokensModule (copy), ReactOtterModule (copy), ReactModule (copy), StateLayerModeModule (copy), ViewModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Contrast = UseTokensModuleResult.Color.System.Contrast
	local Transparency = if Frame.isActive then Contrast.Transparency or 0 else 0.78
	local _UDim = UDim.new(0, UseTokensModuleResult.Radius.Circle)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(Frame.scale)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(Transparency)
	ReactModule.useEffect(function() --[[ Line: 34 ]]
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), Frame (copy)
		UseAnimatedBindingResult2(ReactOtterModule.ease(Frame.scale, Frame.scaleEaseConfig))
	end, { Frame.scale, Frame.scaleEaseConfig })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 39 ]]
		-- upvalues: Frame (copy)
		return {
			Selectable = Frame.Selectable,
			NextSelectionUp = Frame.NextSelectionUp,
			NextSelectionDown = Frame.NextSelectionDown,
			NextSelectionLeft = Frame.NextSelectionLeft,
			NextSelectionRight = Frame.NextSelectionRight
		}
	end, {
		Frame.Selectable,
		Frame.NextSelectionUp,
		Frame.NextSelectionDown,
		Frame.NextSelectionLeft,
		Frame.NextSelectionRight
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 57 ]]
		-- upvalues: Frame (copy)
		if Frame.onActivated ~= nil and not Frame.isActive then
			Frame.onActivated(Frame.page)
		end
	end, { Frame.isActive, Frame.onActivated, Frame.page })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 65 ]]
		-- upvalues: Frame (copy), StateLayerModeModule (upval)
		return {
			mode = if Frame.isActive then StateLayerModeModule.Inverse else StateLayerModeModule.Default
		}
	end, { Frame.isActive })
	ReactModule.useEffect(function() --[[ Line: 71 ]]
		-- upvalues: UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval), Transparency (copy), Frame (copy)
		UseAnimatedBindingResult2_1(ReactOtterModule.ease(Transparency, Frame.colorEaseConfig))
	end, { Transparency, Frame.colorEaseConfig })
	
	return ReactModule.createElement(ViewModule, {
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromOffset(Frame.maxSize, Frame.maxSize),
		backgroundStyle = UseAnimatedBindingResult1:map(function(Transparency) --[[ Line: 78 ]]
			-- upvalues: Contrast (copy)
			return { Color3 = Contrast.Color3, Transparency = Transparency }
		end),
		cornerRadius = _UDim,
		onActivated = if Frame.onActivated then UseResult else nil,
		selection = UseMemoResult,
		stateLayer = UseMemoResult1,
		ref = Ref,
		testId = Frame.testId,
		scale = UseAnimatedBindingResult
	})
end))