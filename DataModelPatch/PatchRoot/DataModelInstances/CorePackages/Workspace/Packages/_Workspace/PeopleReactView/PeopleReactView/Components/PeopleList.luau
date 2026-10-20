local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local PeopleServiceModule = require(Parent.PeopleService)
local View = require(Parent.Foundation).View
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local PersonRowModule = require(PeopleReactView.Components.List.PersonRow)
local LazyPersonRowModule = require(PeopleReactView.Components.List.LazyPersonRow)
local _ = require(PeopleReactView.Stores.GetScrollingFrameStore)
local FlagsService = PeopleServiceModule.getService("Flags")
local GetFFlagAddPeoplePageCardLayoutFunction = FlagsService.GetFFlagAddPeoplePageCardLayout
local FFlagEnablePeopleListLazyRender = FlagsService.FFlagEnablePeopleListLazyRender

local function MemoizedPersonRow(p1)
	-- upvalues: ReactModule (copy), FFlagEnablePeopleListLazyRender (copy), LazyPersonRowModule (copy), PersonRowModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: FFlagEnablePeopleListLazyRender (upval), ReactModule (upval), LazyPersonRowModule (upval), p1 (copy), PersonRowModule (upval)
		return if FFlagEnablePeopleListLazyRender then ReactModule.createElement(LazyPersonRowModule, {
			key = tostring(p1.person.UserId),
			person = p1.person,
			layoutOrder = p1.index,
			scrollingFrameStore = p1.scrollingFrameStore
		}) else ReactModule.createElement(PersonRowModule, {
			key = tostring(p1.person.UserId),
			person = p1.person,
			layoutOrder = p1.index
		})
	end, { p1.person.UserId, p1.index, p1.scrollingFrameStore })
end

local function buildPersonRows(List, Current, Current1, ScrollingFrameStore)
	-- upvalues: ReactModule (copy), MemoizedPersonRow (copy), FFlagEnablePeopleListLazyRender (copy)
	local Elements = {}
	local t = {}
	local v1 = 0
	
	if not next(Current1) then
		for i, Player in List do
			Current1[Player.UserId] = (i - 1) * math.floor(100000 / #List)
		end
	end
	local UserId = nil
	local v2 = nil
	for i1, Player1 in List do
		if Current[Player1.UserId] then
			Elements[Player1.UserId] = Current[Player1.UserId]
			t[Player1.UserId] = Current1[Player1.UserId]
			v1 = Current1[Player1.UserId]
		else
			local Floored = 0
			
			if i1 ~= 1 then
				local NewI = i1 + 1
				v2 = 100000
				while NewI <= #List do
					UserId = List[NewI].UserId
					
					if not Current1[UserId] then
						NewI += 1
						continue
					end
					v2 = Current1[UserId]
					break
				end
				Floored = math.floor((v1 + v2) / 2)
			end
			Elements[Player1.UserId] = ReactModule.createElement(MemoizedPersonRow, {
				person = Player1,
				index = Floored,
				scrollingFrameStore = if FFlagEnablePeopleListLazyRender then ScrollingFrameStore else nil
			})
			t[Player1.UserId] = Floored
			v1 = Floored
		end
	end
	return Elements, t
end

local function PeopleList(Frame)
	-- upvalues: ReactModule (copy), PeopleServiceModule (copy), UseSignalStateFunction (copy), buildPersonRows (copy), FFlagEnablePeopleListLazyRender (copy), View (copy), GetFFlagAddPeoplePageCardLayoutFunction (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef({})
	UseRefResult1.current, UseRefResult2.current = buildPersonRows(UseSignalStateFunction(ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("PeopleListStore")
	end, {}).people), UseRefResult1.current, UseRefResult2.current, if FFlagEnablePeopleListLazyRender then Frame.scrollingFrameStore else nil)
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = if GetFFlagAddPeoplePageCardLayoutFunction() then Frame.LayoutOrder else 2
	}, {
		PeopleList = ReactModule.createElement(View, {
			tag = "size-full-0 col gap-small auto-y",
			ref = UseRefResult
		}, { UseRefResult1.current })
	})
end

return if FlagsService.FFlagPeoplePageRemoveUseMemoElements then ReactModule.memo(PeopleList) else PeopleList