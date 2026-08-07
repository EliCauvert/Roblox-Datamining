local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local peopleServiceModule = require(parent.PeopleService)
local view = foundationModule.View
local useSignalState = require(parent.SignalsReact).useSignalState
local personRowModule = require(peopleReactView.Components.List.PersonRow)
local lazyPersonRowModule = require(peopleReactView.Components.List.LazyPersonRow)
local _ = require(peopleReactView.Stores.GetScrollingFrameStore)
local flags = peopleServiceModule.getService("Flags")
local getFFlagAddPeoplePageCardLayout = flags.GetFFlagAddPeoplePageCardLayout
local fFlagEnablePeopleListLazyRender = flags.FFlagEnablePeopleListLazyRender
local fFlagPeoplePageRemoveUseMemoElements = flags.FFlagPeoplePageRemoveUseMemoElements

local function MemoizedPersonRow(p0) --[[ line: 32 ]]
	-- upvalues: reactModule (ref), fFlagEnablePeopleListLazyRender (ref), lazyPersonRowModule (ref), personRowModule (ref)
	return reactModule.useMemo(function() --[[ line: 37 ]]
		-- upvalues: fFlagEnablePeopleListLazyRender (copy), reactModule (copy), lazyPersonRowModule (copy), p0 (ref), personRowModule (copy)
		return if fFlagEnablePeopleListLazyRender then reactModule.createElement(lazyPersonRowModule, {
			key = tostring(p0.person.UserId),
			person = p0.person,
			layoutOrder = p0.index,
			scrollingFrameStore = p0.scrollingFrameStore
		}) else reactModule.createElement(personRowModule, {
			key = tostring(p0.person.UserId),
			person = p0.person,
			layoutOrder = p0.index
		})
	end, { p0.person.UserId, p0.index, p0.scrollingFrameStore })
end

local function buildPersonRows(p1, p2, p3, p4) --[[ line: 57 ]]
	-- upvalues: reactModule (ref), MemoizedPersonRow (ref), fFlagEnablePeopleListLazyRender (ref)
	local t = {}
	local t_1 = {}
	local var12 = 0
	
	if not next(p3) then
		for i, v in p1 do
			p3[v.UserId] = (i - 1) * math.floor(100000 / #p1)
		end
	end
	local var15, userId
	for i, v in p1 do
		if p2[v.UserId] then
			t[v.UserId] = p2[v.UserId]
			t_1[v.UserId] = p3[v.UserId]
			var12 = p3[v.UserId]
		else
			local var13 = 0
			
			if i ~= 1 then
				local var14 = i + 1
				var15 = 100000
				while var14 <= #p1 do
					userId = p1[var14].UserId
					
					if not p3[userId] then
						var14 += 1
						continue
					end
					var15 = p3[userId]
					break
				end
				var13 = math.floor((var12 + var15) / 2)
			end
			t[v.UserId] = reactModule.createElement(MemoizedPersonRow, {
				person = v,
				index = var13,
				scrollingFrameStore = if fFlagEnablePeopleListLazyRender then p4 else nil
			})
			t_1[v.UserId] = var13
			var12 = var13
		end
	end
	return t, t_1
end

local function PeopleList(p5) --[[ line: 122 ]]
	-- upvalues: reactModule (ref), peopleServiceModule (ref), useSignalState (ref), buildPersonRows (ref), fFlagEnablePeopleListLazyRender (ref), view (ref), getFFlagAddPeoplePageCardLayout (ref)
	local var16 = useSignalState(reactModule.useMemo(function() --[[ line: 123 ]]
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleListStore")
	end, {}).people)
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef({})
	local var19 = reactModule.useRef({})
	local var20, var21 = buildPersonRows(var16, var18.current, var19.current, if fFlagEnablePeopleListLazyRender then p5.scrollingFrameStore else nil)
	var18.current = var20
	var19.current = var21
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = if getFFlagAddPeoplePageCardLayout() then p5.LayoutOrder else 2
	}, {
		PeopleList = reactModule.createElement(view, { tag = "size-full-0 col gap-small auto-y", ref = var17 }, { var18.current })
	})
end

return if fFlagPeoplePageRemoveUseMemoElements then reactModule.memo(PeopleList) else PeopleList