local Parent = script:FindFirstAncestor("AppShortcutBar").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.FocusNavigationUtils)

return function()
	-- upvalues: SignalsModule (copy), ReactModule (copy), SignalsReactModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	
	local function updateButtonHoldState(p1, p2)
		-- upvalues: Signal2 (copy)
		Signal2(function(Tbl)
			-- upvalues: p1 (copy), p2 (copy)
			if Tbl[p1] == p2 then
				return Tbl
			else
				local Copy = table.clone(Tbl)
				Copy[p1] = p2
				
				return Copy
			end
		end)
	end
	
	return {
		getButtonHoldState = Signal,
		setButtonHoldState = Signal2,
		useDispatchButtonHoldStarted = function()
			-- upvalues: ReactModule (upval), Signal2 (copy), updateButtonHoldState (copy)
			return (ReactModule.useCallback(function(p1, p2)
				-- upvalues: Signal2 (upval)
				Signal2(function(Tbl)
					-- upvalues: p1 (copy), p2 (copy)
					if Tbl[p1] == p2 then
						return Tbl
					else
						local Copy = table.clone(Tbl)
						Copy[p1] = p2
						
						return Copy
					end
				end)
			end, { updateButtonHoldState }))
		end,
		useDispatchButtonHoldEnded = function()
			-- upvalues: ReactModule (upval), Signal2 (copy), updateButtonHoldState (copy)
			return (ReactModule.useCallback(function(p1)
				-- upvalues: Signal2 (upval)
				local v1 = nil
				Signal2(function(Tbl)
					-- upvalues: p1 (copy), v1 (copy)
					if Tbl[p1] == v1 then
						return Tbl
					else
						local Copy = table.clone(Tbl)
						Copy[p1] = v1
						
						return Copy
					end
				end)
			end, { updateButtonHoldState }))
		end,
		useHeldProgressByEvent = function()
			-- upvalues: SignalsReactModule (upval), Signal (copy)
			return SignalsReactModule.useSignalState(Signal)
		end
	}
end