local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local VerticalPagerModule = require(Moments.Components.VerticalPager)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseVerticalPagerFunction = VerticalPagerModule.useVerticalPager
local UsePagerItemFunction = VerticalPagerModule.usePagerItem
local Context = ReactModule.createContext(nil)

return table.freeze({
	Provider = function(p1) --[[ Line: 39 ]]
		-- upvalues: UseVerticalPagerFunction (copy), UsePagerItemFunction (copy), ReactModule (copy), SignalsModule (copy), UseSignalStateFunction (copy), Context (copy)
		local UseVerticalPagerResult = UseVerticalPagerFunction()
		local Item = UsePagerItemFunction().item
		local UseRefResult = ReactModule.useRef({})
		local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 44 ]]
			-- upvalues: UseRefResult (copy)
			local CurrentEntry = UseRefResult.current[p2]
			
			if CurrentEntry == nil then
				CurrentEntry = { current = false }
				UseRefResult.current[p2] = CurrentEntry
			end
			return CurrentEntry
		end, {})
		local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function() --[[ Line: 53 ]]
			-- upvalues: SignalsModule (upval), Item (copy), UseVerticalPagerResult (copy)
			return SignalsModule.createComputed(function(p2): boolean --[[ Line: 54 ]]
				-- upvalues: Item (upval), UseVerticalPagerResult (upval)
				return Item ~= nil and UseVerticalPagerResult.store.getCurrentItem(p2) == Item
			end)
		end, { UseVerticalPagerResult, Item })))
		ReactModule.useEffect(function() --[[ Line: 60 ]]
			-- upvalues: UseSignalStateResult (copy), UseRefResult (copy)
			if UseSignalStateResult then return end
			for _, value in UseRefResult.current do
				value.current = false
			end
		end, { UseSignalStateResult })
		
		return ReactModule.createElement(Context.Provider, { value = UseResult }, p1.children)
	end,
	useImpressionRef = function(p2) --[[ Line: 76 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		local UseRefResult = ReactModule.useRef(false)
		
		return if UseContextResult == nil then UseRefResult else UseContextResult(p2)
	end
})