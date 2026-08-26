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

local function MemoizedPersonRow(p1)
	-- upvalues: reactModule (ref), fFlagEnablePeopleListLazyRender (ref), lazyPersonRowModule (ref), personRowModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: fFlagEnablePeopleListLazyRender (copy), reactModule (copy), lazyPersonRowModule (copy), p1 (ref), personRowModule (copy)
		return if fFlagEnablePeopleListLazyRender then reactModule.createElement(lazyPersonRowModule, {
			key = tostring(p1.person.UserId),
			person = p1.person,
			layoutOrder = p1.index,
			scrollingFrameStore = p1.scrollingFrameStore
		}) else reactModule.createElement(personRowModule, {
			key = tostring(p1.person.UserId),
			person = p1.person,
			layoutOrder = p1.index
		})
	end, { p1.person.UserId, p1.index, p1.scrollingFrameStore })
end

local function buildPersonRows(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), MemoizedPersonRow (ref), fFlagEnablePeopleListLazyRender (ref)
	local t = {}
	local t_1 = {}
	local var1 = 0
	
	if not next(p3) then
		for i, v in p1 do
			p3[v.UserId] = (i - 1) * math.floor(100000 / #p1)
		end
	end
	local var2, userId
	for i, v in p1 do
		if p2[v.UserId] then
			t[v.UserId] = p2[v.UserId]
			t_1[v.UserId] = p3[v.UserId]
			var1 = p3[v.UserId]
		else
			local var3 = 0
			
			if i ~= 1 then
				local var4 = i + 1
				var2 = 100000
				while var4 <= #p1 do
					userId = p1[var4].UserId
					
					if not p3[userId] then
						var4 += 1
						continue
					end
					var2 = p3[userId]
					break
				end
				var3 = math.floor((var1 + var2) / 2)
			end
			t[v.UserId] = reactModule.createElement(MemoizedPersonRow, {
				person = v,
				index = var3,
				scrollingFrameStore = if fFlagEnablePeopleListLazyRender then p4 else nil
			})
			t_1[v.UserId] = var3
			var1 = var3
		end
	end
	return t, t_1
end

local function PeopleList(p5)
	-- upvalues: reactModule (ref), peopleServiceModule (ref), useSignalState (ref), buildPersonRows (ref), fFlagEnablePeopleListLazyRender (ref), view (ref), getFFlagAddPeoplePageCardLayout (ref)
	local var5 = useSignalState(reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleListStore")
	end, {}).people)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef({})
	local var8 = reactModule.useRef({})
	local var9, var10 = buildPersonRows(var5, var7.current, var8.current, if fFlagEnablePeopleListLazyRender then p5.scrollingFrameStore else nil)
	var7.current = var9
	var8.current = var10
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = if getFFlagAddPeoplePageCardLayout() then p5.LayoutOrder else 2
	}, {
		PeopleList = reactModule.createElement(view, { tag = "size-full-0 col gap-small auto-y", ref = var6 }, { var7.current })
	})
end

return if fFlagPeoplePageRemoveUseMemoElements then reactModule.memo(PeopleList) else PeopleList