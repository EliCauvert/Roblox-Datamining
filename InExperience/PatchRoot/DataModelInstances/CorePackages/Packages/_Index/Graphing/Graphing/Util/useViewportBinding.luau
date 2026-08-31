local graphing = script:FindFirstAncestor("Graphing")
local parent = graphing.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local canvasContextModule = require(graphing.CanvasContext)
local _ = require(graphing.Types)

return {
	useViewportBinding = function(p1, p2)
		-- upvalues: reactModule (ref), canvasContextModule (ref), signalsModule (ref), signalsReactModule (ref)
		local var1 = reactModule.useContext(canvasContextModule)
		local viewportRectGetter = var1.viewportRectGetter
		local list = { viewportRectGetter }
		
		if p2 then
			for i, v in p2 do
				table.insert(list, v)
			end
		end
		return signalsReactModule.useSignalBinding(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), viewportRectGetter (ref), p1 (ref), var1 (ref)
			return signalsModule.createComputed(function(p3)
				-- upvalues: viewportRectGetter (copy), p1 (copy), var1 (copy)
				viewportRectGetter(p3)
				
				return p1(var1)
			end)
		end, list))
	end,
	useViewportVisibility = function(p3, p4)
		-- upvalues: reactModule (ref), canvasContextModule (ref), signalsModule (ref), signalsReactModule (ref)
		local var2 = reactModule.useContext(canvasContextModule)
		local viewportRectGetter = var2.viewportRectGetter
		local list = { viewportRectGetter }
		
		if p4 then
			for i, v in p4 do
				table.insert(list, v)
			end
		end
		return signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), viewportRectGetter (ref), p3 (ref), var2 (ref)
			return signalsModule.createComputed(function(p5)
				-- upvalues: viewportRectGetter (copy), p3 (copy), var2 (copy)
				viewportRectGetter(p5)
				
				return p3(var2)
			end)
		end, list))
	end
}