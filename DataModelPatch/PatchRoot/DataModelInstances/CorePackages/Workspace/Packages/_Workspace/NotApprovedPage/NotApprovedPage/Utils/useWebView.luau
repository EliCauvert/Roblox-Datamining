local Parent = script:FindFirstAncestor("NotApprovedPage").Parent
local ReactModule = require(Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseCallbackFunction = ReactModule.useCallback
local UseRefFunction = ReactModule.useRef
local GetFFlagEnableUnifiedWebViewsFunction = require(Parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local WebViewService = game:GetService("WebViewService")

return function(Detail, Title)
	-- upvalues: UseDispatchFunction (copy), UseRefFunction (copy), UseCallbackFunction (copy), GetFFlagEnableUnifiedWebViewsFunction (copy), WebViewService (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), UseEffectFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = UseRefFunction(nil)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
	end, { UseRefResult })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (upval), UseCallbackResult (copy), UseRefResult (copy), WebViewService (upval), Detail (copy), Title (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		if GetFFlagEnableUnifiedWebViewsFunction() then
			UseCallbackResult()
			UseRefResult.current = WebViewService.OnWindowClosed:Connect(function()
				-- upvalues: WebViewService (upval), UseCallbackResult (upval)
				WebViewService:CloseWindow()
				UseCallbackResult()
			end)
			WebViewService:OpenWindow(Detail, Title, true)
			
			return
		end
		local config = {
			name = AppPage.GenericWebPage,
			detail = Detail,
			extraProps = { title = Title }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, { Detail, Title, UseCallbackResult })
	UseEffectFunction(function()
		-- upvalues: UseCallbackResult (copy)
		return function()
			-- upvalues: UseCallbackResult (upval)
			UseCallbackResult()
		end
	end, { UseCallbackResult })
	
	return UseCallbackResult1
end