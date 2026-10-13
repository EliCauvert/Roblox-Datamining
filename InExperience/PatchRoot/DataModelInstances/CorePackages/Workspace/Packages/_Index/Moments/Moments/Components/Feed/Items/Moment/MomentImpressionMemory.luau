local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local verticalPagerModule = require(moments.Components.VerticalPager)
local useSignalState = require(parent.SignalsReact).useSignalState
local useVerticalPager = verticalPagerModule.useVerticalPager
local usePagerItem = verticalPagerModule.usePagerItem
local var1 = reactModule.createContext(nil)

return table.freeze({
	Provider = function(p1)
		-- upvalues: useVerticalPager (ref), usePagerItem (ref), reactModule (ref), signalsModule (ref), useSignalState (ref), var1 (ref)
		local var2 = useVerticalPager()
		local item = usePagerItem().item
		local var3 = reactModule.useRef({})
		local var4 = reactModule.useCallback(function(p2)
			-- upvalues: var3 (ref)
			local var5 = var3.current[p2]
			
			if var5 == nil then
				var5 = { current = false }
				var3.current[p2] = var5
			end
			return var5
		end, {})
		local var5 = useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), item (ref), var2 (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: item (copy), var2 (copy)
				return item ~= nil and var2.store.getCurrentItem(p2) == item
			end)
		end, { var2, item }))
		reactModule.useEffect(function()
			-- upvalues: var5 (ref), var3 (ref)
			if var5 then return end
			for i, v in var3.current do
				v.current = false
			end
		end, { var5 })
		
		return reactModule.createElement(var1.Provider, { value = var4 }, p1.children)
	end,
	useImpressionRef = function(p2)
		-- upvalues: reactModule (ref), var1 (ref)
		local var6 = reactModule.useContext(var1)
		
		return if var6 == nil then reactModule.useRef(false) else var6(p2)
	end
})