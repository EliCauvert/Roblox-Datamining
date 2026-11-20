local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local RecycledFeedConstantsModule = require(script.Parent.RecycledFeedConstants)
local RecycledFeedRowContextModule = require(script.Parent.RecycledFeedRowContext)
local _ = require(script.Parent.RecycledFeedTypes)

return function(p1)
	-- upvalues: SignalsReactModule (copy), ViewRecyclerModule (copy), ReactModule (copy), RecycledFeedRowContextModule (copy), RecycledFeedConstantsModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.itemSignal)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ViewRecyclerModule.useRecyclingIndex()))
	local UseContextResult = ReactModule.useContext(RecycledFeedRowContextModule)
	local OnRowCommittedFunction = UseContextResult.onRowCommitted
	local UseRefResult = ReactModule.useRef(nil)
	local ItemsByKeyEntry = UseContextResult.itemsByKey[UseSignalStateResult.key]
	local RowView = UseContextResult.rowViews[UseSignalStateResult.kind]
	local IsKindMatch: boolean = ItemsByKeyEntry ~= nil and ItemsByKeyEntry.kind == UseSignalStateResult.kind
	local NoRowView: boolean = IsKindMatch and RowView == nil
	local HasRowView: boolean = IsKindMatch and RowView ~= nil
	local Payload = if HasRowView then ItemsByKeyEntry.payload else nil
	ReactModule.useEffect(function()
		-- upvalues: NoRowView (copy), UseSignalStateResult (copy)
		if NoRowView then
			warn(`RecycledFeed: no row view for kind "{UseSignalStateResult.kind}"`)
		end
	end, { NoRowView, UseSignalStateResult.kind })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), RecycledFeedConstantsModule (upval), UseSignalStateResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current:SetAttribute(RecycledFeedConstantsModule.ROW_KEY_ATTRIBUTE, UseSignalStateResult.key)
		end
	end, { UseSignalStateResult.key })
	ReactModule.useEffect(function()
		-- upvalues: OnRowCommittedFunction (copy)
		OnRowCommittedFunction()
	end, {
		UseSignalStateResult.key,
		OnRowCommittedFunction,
		Payload
	})
	local ClearRemovedRows = ItemsByKeyEntry == nil and UseContextResult.clearRemovedRows
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: HasRowView (copy), ReactModule (upval), RowView (copy), UseSignalStateResult (copy), Payload (copy), ClearRemovedRows (copy), UseRefResult1 (copy)
		return if HasRowView then ReactModule.createElement(RowView, { itemKey = UseSignalStateResult.key, payload = Payload }) elseif ClearRemovedRows then nil else UseRefResult1.current
	end, {
		HasRowView,
		ClearRemovedRows,
		UseSignalStateResult.key,
		RowView,
		Payload
	})
	UseRefResult1.current = UseMemoResult
	
	return {
		name = UseSignalStateResult.key,
		layoutOrder = UseSignalStateResult1 or 0,
		frameRef = UseRefResult,
		content = UseMemoResult
	}
end