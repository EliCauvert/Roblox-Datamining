local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetBreakpointFromRowWidthModule = require(AvatarExperienceCatalog.Utils.getBreakpointFromRowWidth)
local GetUIScaleFromTokensModule = require(AvatarExperienceCatalog.Utils.getUIScaleFromTokens)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local GetAXMarketplaceWidgetStoreModule = require(AvatarExperienceCatalog.Stores.GetAXMarketplaceWidgetStore)

return function(p1)
	-- upvalues: UseTokensFunction (copy), GetUIScaleFromTokensModule (copy), GetAXMarketplaceWidgetStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy), GetBreakpointFromRowWidthModule (copy)
	local UIScaleFromTokensModule = GetUIScaleFromTokensModule((UseTokensFunction()))
	local Delay = if p1 == nil then 0.2 else p1
	local UseSignalStateResult = UseSignalStateFunction(GetAXMarketplaceWidgetStoreModule(false).getScreenSize)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
				UseRefResult.current = nil
			end
		end
	end, {})
	
	return if UseStateResult == nil then UseSignalStateResult else UseStateResult, (ReactModule.useCallback(function(Frame)
		-- upvalues: GetBreakpointFromRowWidthModule (upval), UIScaleFromTokensModule (copy), UseRefResult (copy), Delay (copy), UseStateResult2 (copy)
		local BreakpointFromRowWidthModule = GetBreakpointFromRowWidthModule(Frame.AbsoluteSize.X, UIScaleFromTokensModule)
		
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		UseRefResult.current = task.delay(Delay, function()
			-- upvalues: UseRefResult (upval), UseStateResult2 (upval), BreakpointFromRowWidthModule (copy)
			UseRefResult.current = nil
			UseStateResult2(BreakpointFromRowWidthModule)
		end)
	end, { UIScaleFromTokensModule, Delay }))
end