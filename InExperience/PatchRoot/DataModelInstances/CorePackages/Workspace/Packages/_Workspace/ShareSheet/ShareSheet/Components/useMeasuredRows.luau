local Parent = script:FindFirstAncestor("ShareSheet").Parent
local AppCompositionModule = require(Parent.AppComposition)
local DisplayModule = require(Parent.Display)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetShareSheetRowLayoutModule = require(script.Parent.getShareSheetRowLayout)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function()
	-- upvalues: UseTokensFunction (copy), SignalsReactModule (copy), DisplayModule (copy), ReactModule (copy), SignalsModule (copy), AppCompositionModule (copy), GetShareSheetRowLayoutModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(DisplayModule.GetDisplayStore().getDisplaySize)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(0)
		
		return { get = Signal, set = Signal2 }
	end, {})
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.get)
	local UseCompositionLayoutResult = AppCompositionModule.useCompositionLayout(UseMemoResult.get)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseMemoResult (copy)
		UseMemoResult.set(Frame.AbsoluteSize.X)
	end, { UseMemoResult })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult1 (copy), GetShareSheetRowLayoutModule (upval), UseCompositionLayoutResult (copy), UseSignalStateResult (copy), UseTokensResult (copy), UseResult (copy)
		return {
			isLayoutReady = UseSignalStateResult1 > 0,
			layout = GetShareSheetRowLayoutModule(UseSignalStateResult1, UseCompositionLayoutResult, UseSignalStateResult, UseTokensResult.Size.Size_1700),
			onAbsoluteSizeChanged = UseResult
		}
	end, {
		UseCompositionLayoutResult,
		UseSignalStateResult,
		UseSignalStateResult1,
		UseResult,
		UseTokensResult
	})
end