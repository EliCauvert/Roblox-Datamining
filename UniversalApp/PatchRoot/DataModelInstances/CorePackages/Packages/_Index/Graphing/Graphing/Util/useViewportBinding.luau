local Graphing = script:FindFirstAncestor("Graphing")
local Parent = Graphing.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local CanvasContextModule = require(Graphing.CanvasContext)
local _ = require(Graphing.Types)

return {
	useViewportBinding = function(Callback, List) --[[ Line: 10 ]]
		-- upvalues: ReactModule (copy), CanvasContextModule (copy), SignalsModule (copy), SignalsReactModule (copy)
		local UseContextResult = ReactModule.useContext(CanvasContextModule)
		local ViewportRectGetterFunction = UseContextResult.viewportRectGetter
		local List1 = { ViewportRectGetterFunction }
		
		if List then
			for _, value in List do
				table.insert(List1, value)
			end
		end
		return SignalsReactModule.useSignalBinding((ReactModule.useMemo(function() --[[ Line: 21 ]]
			-- upvalues: SignalsModule (upval), ViewportRectGetterFunction (copy), Callback (copy), UseContextResult (copy)
			return SignalsModule.createComputed(function(p1) --[[ Line: 22 ]]
				-- upvalues: ViewportRectGetterFunction (upval), Callback (upval), UseContextResult (upval)
				ViewportRectGetterFunction(p1)
				
				return Callback(UseContextResult)
			end)
		end, List1)))
	end,
	useViewportVisibility = function(Callback, List) --[[ Line: 31 ]]
		-- upvalues: ReactModule (copy), CanvasContextModule (copy), SignalsModule (copy), SignalsReactModule (copy)
		local UseContextResult = ReactModule.useContext(CanvasContextModule)
		local ViewportRectGetterFunction = UseContextResult.viewportRectGetter
		local List1 = { ViewportRectGetterFunction }
		
		if List then
			for _, value in List do
				table.insert(List1, value)
			end
		end
		return SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 42 ]]
			-- upvalues: SignalsModule (upval), ViewportRectGetterFunction (copy), Callback (copy), UseContextResult (copy)
			return SignalsModule.createComputed(function(p1) --[[ Line: 43 ]]
				-- upvalues: ViewportRectGetterFunction (upval), Callback (upval), UseContextResult (upval)
				ViewportRectGetterFunction(p1)
				
				return Callback(UseContextResult)
			end)
		end, List1)))
	end
}