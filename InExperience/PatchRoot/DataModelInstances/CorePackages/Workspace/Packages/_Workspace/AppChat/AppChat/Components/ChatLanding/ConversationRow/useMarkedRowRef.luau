local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local ConversationRowLookupModule = require(script.Parent.Parent.ConversationRowLookup)

return function(Callback, p1)
	-- upvalues: ViewRecyclerModule (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy), ConversationRowLookupModule (copy)
	local UseRecyclingAssignmentResult = ViewRecyclerModule.useRecyclingAssignment()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Callback (copy)
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		
		return {
			getRow = Signal,
			setRow = Signal2,
			getIsMarking = SignalsModule.createComputed(function(p2): boolean
				-- upvalues: Callback (upval)
				return Callback(p2).presentationSignal(p2).markRows == true
			end)
		}
	end, { Callback })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.getIsMarking)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: p1 (copy), UseMemoResult (copy)
		if p1 ~= nil then
			p1.current = Current
		end
		UseMemoResult.setRow(Current)
	end, { p1, UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), SignalsModule (upval), Callback (copy), UseMemoResult (copy), UseRecyclingAssignmentResult (copy), ConversationRowLookupModule (upval)
		if UseSignalStateResult then
			local Row = nil
			local Effect = SignalsModule.createEffect(function(p2)
				-- upvalues: Callback (upval), UseMemoResult (upval), UseRecyclingAssignmentResult (upval), Row (ref), ConversationRowLookupModule (upval)
				local Id = Callback(p2).id
				local Row1 = UseMemoResult.getRow(p2)
				local HasUseRecyclingAssignmentResultResult = UseRecyclingAssignmentResult(p2) ~= nil
				
				if Row ~= nil and Row ~= Row1 then
					ConversationRowLookupModule.mark(Row, nil)
				end
				Row = Row1
				
				if Row1 ~= nil then
					ConversationRowLookupModule.mark(Row1, if HasUseRecyclingAssignmentResultResult then Id else nil)
				end
			end)
			
			return function()
				-- upvalues: Effect (copy), Row (ref), ConversationRowLookupModule (upval)
				Effect()
				
				if Row ~= nil then
					ConversationRowLookupModule.mark(Row, nil)
				end
			end
		else
			return nil
		end
	end, {
		Callback,
		UseMemoResult,
		UseRecyclingAssignmentResult,
		UseSignalStateResult
	})
	
	return if UseSignalStateResult then UseResult else nil
end