local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local text = foundationModule.Text
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local textKeysModule = require(groups.Common.TextKeys)
local _ = require(groups.Common.Types)
local groupsListToolbarModule = require(script.Parent.GroupsListToolbar)
local groupsListSectionModule = require(script.Parent.GroupsListSection)
local groupsListHeaderModule = require(script.Parent.GroupsListHeader)
local groupListItemSkeletonModule = require(script.Parent.GroupListItemSkeleton)
local frozen = table.freeze({})

local function renderSkeletons()
	-- upvalues: reactModule (ref), groupListItemSkeletonModule (ref)
	local t = {}
	
	for i = 1, 3 do
		t[`Skeleton_{i}`] = reactModule.createElement(groupListItemSkeletonModule, { layoutOrder = i })
	end
	return t
end

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), frozen (ref), reactModule (ref), view (ref), renderSkeletons (ref), scrollView (ref), scrollBarVisibility (ref), groupsListSectionModule (ref), groupsListHeaderModule (ref), groupsListToolbarModule (ref), text (ref)
	local var1 = useLocalization({
		primaryHeading = textKeysModule.HeadingPrimary,
		myGroupsHeading = textKeysModule.HeadingMyGroups,
		loadFailure = textKeysModule.MessageLoadGroupListError,
		notInGroups = textKeysModule.MessageNotInAnyGroups,
		noResults = textKeysModule.MessageNoGroupsFound
	})
	local groupsList = p1.groupsList or frozen
	local var2, var3 = reactModule.useState("")
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useMemo(function()
		-- upvalues: groupsList (ref)
		for i, v in ipairs(groupsList) do
			if v.isPrimary then
				return v
			end
		end
		return nil
	end, { groupsList })
	local var6 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), groupsList (ref)
		if not var5 then
			return groupsList
		end
		local t = {}
		
		for i, v in ipairs(groupsList) do
			if v ~= var5 then
				table.insert(t, v)
			end
		end
		return t
	end, { groupsList, var5 })
	local var7 = reactModule.useMemo(function()
		-- upvalues: var5 (ref)
		return if var5 then { var5 } else {}
	end, { var5 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var4 (ref)
		if var2 ~= "" and var4.current then
			var4.current.CanvasPosition = Vector2.new(0, 0)
		end
	end, { var2 })
	local var8 = var2 ~= ""
	local var9 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), var2 (ref), groupsList (ref)
		if not var8 then
			return nil
		end
		local lowerText = string.lower(var2)
		local t = {}
		
		for i, v in ipairs(groupsList) do
			if string.find(string.lower(v.name or ""), lowerText, 1, true) then
				t[v.id] = true
			end
		end
		return t
	end, { groupsList, var2 })
	local var10 = var8 and (var9 ~= nil and next(var9) == nil)
	local var11 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var1 (ref), groupsList (ref), var10 (ref)
		return if p1.isLoading or not p1.groupsList then nil elseif p1.loadFailure then var1.loadFailure elseif #groupsList == 0 then var1.notInGroups elseif var10 then var1.noResults else nil
	end, {
		p1.isLoading, p1.groupsList, p1.loadFailure, var1, groupsList, var10
	})
	local var12 = if p1.isLoading and #groupsList == 0 then reactModule.createElement(view, {
		tag = "col padding-small gap-small",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, renderSkeletons()) elseif if #var7 <= 0 then #var6 > 0 else true then reactModule.createElement(scrollView, {
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(1, 0, 0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			scrollBarVisibility = scrollBarVisibility.Auto,
			VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
		},
		scrollingFrameRef = var4,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		ListWrapper = reactModule.createElement(view, {
			tag = "col gap-xlarge",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			PrimarySection = reactModule.createElement(groupsListSectionModule, {
				layoutOrder = 1,
				showRank = true,
				showMemberCount = true,
				heading = var1.primaryHeading,
				groups = var7,
				visibleIds = if var8 then var9 else nil
			}),
			OtherGroupsSection = reactModule.createElement(groupsListSectionModule, {
				layoutOrder = 2,
				showRank = true,
				showMemberCount = true,
				heading = if #var7 > 0 then var1.myGroupsHeading else nil,
				groups = var6,
				visibleIds = if var8 then var9 else nil
			})
		})
	}) else nil
	
	return reactModule.createElement(view, {
		tag = "col gap-xlarge",
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Header = reactModule.createElement(groupsListHeaderModule, { layoutOrder = 1 }),
		Toolbar = reactModule.createElement(groupsListToolbarModule, {
			layoutOrder = 2,
			canCreateGroup = p1.canCreateGroup,
			onSearchTextChanged = var3
		}),
		Disclaimer = var11 and reactModule.createElement(text, {
			LayoutOrder = 3,
			tag = "content-muted text-align-x-left text-body-medium",
			Text = var11
		}) or nil,
		List = var12 and reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = "fill",
			Size = UDim2.new(1, 0, 1, 0)
		}, { ListContent = var12 }) or nil
	})
end