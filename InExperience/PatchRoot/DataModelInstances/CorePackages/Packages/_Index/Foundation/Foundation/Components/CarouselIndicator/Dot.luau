local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.Otter)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local stateLayerModeModule = require(foundation.Enums.StateLayerMode)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return reactModule.memo(reactModule.forwardRef(function(vectorA, vectorB)
	-- upvalues: useTokensModule (ref), reactOtterModule (ref), reactModule (ref), stateLayerModeModule (ref), viewModule (ref)
	local var1 = useTokensModule()
	local contrast = var1.Color.System.Contrast
	local var2 = if vectorA.isActive then contrast.Transparency or 0 else 0.78
	local uDim = UDim.new(0, var1.Radius.Circle)
	local var3, var4 = reactOtterModule.useAnimatedBinding(vectorA.scale)
	local var5, var6 = reactOtterModule.useAnimatedBinding(var2)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), reactOtterModule (copy), vectorA (ref)
		var4(reactOtterModule.ease(vectorA.scale, vectorA.scaleEaseConfig))
	end, { vectorA.scale, vectorA.scaleEaseConfig })
	local var7 = reactModule.useMemo(function()
		-- upvalues: vectorA (ref)
		return {
			Selectable = vectorA.Selectable,
			NextSelectionUp = vectorA.NextSelectionUp,
			NextSelectionDown = vectorA.NextSelectionDown,
			NextSelectionLeft = vectorA.NextSelectionLeft,
			NextSelectionRight = vectorA.NextSelectionRight
		}
	end, {
		vectorA.Selectable,
		vectorA.NextSelectionUp,
		vectorA.NextSelectionDown,
		vectorA.NextSelectionLeft,
		vectorA.NextSelectionRight
	})
	local var8 = reactModule.useCallback(function()
		-- upvalues: vectorA (ref)
		if vectorA.onActivated ~= nil and not vectorA.isActive then
			vectorA.onActivated(vectorA.page)
		end
	end, { vectorA.isActive, vectorA.onActivated, vectorA.page })
	local var9 = reactModule.useMemo(function()
		-- upvalues: vectorA (ref), stateLayerModeModule (copy)
		return {
			mode = if vectorA.isActive then stateLayerModeModule.Inverse else stateLayerModeModule.Default
		}
	end, { vectorA.isActive })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), reactOtterModule (copy), var2 (ref), vectorA (ref)
		var6(reactOtterModule.ease(var2, vectorA.colorEaseConfig))
	end, { var2, vectorA.colorEaseConfig })
	
	return reactModule.createElement(viewModule, {
		LayoutOrder = vectorA.LayoutOrder,
		Size = UDim2.fromOffset(vectorA.maxSize, vectorA.maxSize),
		backgroundStyle = var5:map(function(p1)
			-- upvalues: contrast (ref)
			return { Color3 = contrast.Color3, Transparency = p1 }
		end),
		cornerRadius = uDim,
		onActivated = if vectorA.onActivated then var8 else nil,
		selection = var7,
		stateLayer = var9,
		ref = vectorB,
		testId = vectorA.testId,
		scale = var3
	})
end))