local Graphing = script:FindFirstAncestor("Graphing")
local Parent = Graphing.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local CanvasContextModule = require(Graphing.CanvasContext)
local _ = require(Graphing.Types)

return {
	useViewportBinding = function(Callback, List)
		-- upvalues: ReactModule (copy), CanvasContextModule (copy), SignalsModule (copy), SignalsReactModule (copy)
		local UseContextResult = ReactModule.useContext(CanvasContextModule)
		local ViewportRectGetterFunction = UseContextResult.viewportRectGetter
		local List1 = { ViewportRectGetterFunction }
		
		if List then
			for _, value in List do
				table.insert(List1, value)
			end
		end
		return SignalsReactModule.useSignalBinding((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), ViewportRectGetterFunction (copy), Callback (copy), UseContextResult (copy)
			return SignalsModule.createComputed(function(p1)
				-- upvalues: ViewportRectGetterFunction (upval), Callback (upval), UseContextResult (upval)
				ViewportRectGetterFunction(p1)
				
				return Callback(UseContextResult)
			end)
		end, List1)))
	end,
	useViewportVisibility = function(Callback, List)
		-- upvalues: ReactModule (copy), CanvasContextModule (copy), SignalsModule (copy), SignalsReactModule (copy)
		local UseContextResult = ReactModule.useContext(CanvasContextModule)
		local ViewportRectGetterFunction = UseContextResult.viewportRectGetter
		local List1 = { ViewportRectGetterFunction }
		
		if List then
			for _, value in List do
				table.insert(List1, value)
			end
		end
		return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), ViewportRectGetterFunction (copy), Callback (copy), UseContextResult (copy)
			return SignalsModule.createComputed(function(p1)
				-- upvalues: ViewportRectGetterFunction (upval), Callback (upval), UseContextResult (upval)
				ViewportRectGetterFunction(p1)
				
				return Callback(UseContextResult)
			end)
		end, List1)))
	end
}