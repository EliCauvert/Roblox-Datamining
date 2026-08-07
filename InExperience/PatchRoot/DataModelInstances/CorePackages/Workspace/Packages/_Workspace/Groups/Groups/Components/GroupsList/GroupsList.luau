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

local function renderSkeletons() --[[ line: 33 ]]
	-- upvalues: reactModule (ref), groupListItemSkeletonModule (ref)
	local t = {}
	
	for i = 1, 3 do
		t[`Skeleton_{i}`] = reactModule.createElement(groupListItemSkeletonModule, { layoutOrder = i })
	end
	return t
end

return function(p0) --[[ line: 43 | named "GroupsList" ]]
	-- upvalues: useLocalization (ref), textKeysModule (ref), frozen (ref), reactModule (ref), view (ref), renderSkeletons (ref), scrollView (ref), scrollBarVisibility (ref), groupsListSectionModule (ref), groupsListHeaderModule (ref), groupsListToolbarModule (ref), text (ref)
	local var11 = useLocalization({
		primaryHeading = textKeysModule.HeadingPrimary,
		myGroupsHeading = textKeysModule.HeadingMyGroups,
		loadFailure = textKeysModule.MessageLoadGroupListError,
		notInGroups = textKeysModule.MessageNotInAnyGroups,
		noResults = textKeysModule.MessageNoGroupsFound
	})
	local groupsList = p0.groupsList or frozen
	local var13, var14 = reactModule.useState("")
	local var15 = reactModule.useRef(nil)
	local var16 = reactModule.useMemo(function() --[[ line: 56 ]]
		-- upvalues: groupsList (ref)
		for i, v in ipairs(groupsList) do
			if v.isPrimary then
				return v
			end
		end
		return nil
	end, { groupsList })
	local var17 = reactModule.useMemo(function() --[[ line: 65 ]]
		-- upvalues: var16 (ref), groupsList (ref)
		if not var16 then
			return groupsList
		end
		local t = {}
		
		for i, v in ipairs(groupsList) do
			if v ~= var16 then
				table.insert(t, v)
			end
		end
		return t
	end, { groupsList, var16 })
	local var18 = reactModule.useMemo(function() --[[ line: 79 ]]
		-- upvalues: var16 (ref)
		return if var16 then { var16 } else {}
	end, { var16 })
	reactModule.useEffect(function() --[[ line: 86 ]]
		-- upvalues: var13 (ref), var15 (ref)
		if var13 ~= "" and var15.current then
			var15.current.CanvasPosition = Vector2.new(0, 0)
		end
	end, { var13 })
	local var19 = var13 ~= ""
	local var20 = reactModule.useMemo(function() --[[ line: 94 ]]
		-- upvalues: var19 (ref), var13 (ref), groupsList (ref)
		if not var19 then
			return nil
		end
		local lowerText = string.lower(var13)
		local t = {}
		
		for i, v in ipairs(groupsList) do
			if string.find(string.lower(v.name or ""), lowerText, 1, true) then
				t[v.id] = true
			end
		end
		return t
	end, { groupsList, var13 })
	local var21 = var19 and (var20 ~= nil and next(var20) == nil)
	local var22 = reactModule.useMemo(function() --[[ line: 111 ]]
		-- upvalues: p0 (ref), var11 (ref), groupsList (ref), var21 (ref)
		return if p0.isLoading or not p0.groupsList then nil elseif p0.loadFailure then var11.loadFailure elseif #groupsList == 0 then var11.notInGroups elseif var21 then var11.noResults else nil
	end, {
		p0.isLoading, p0.groupsList, p0.loadFailure, var11, groupsList, var21
	})
	local var23 = if p0.isLoading and #groupsList == 0 then reactModule.createElement(view, {
		tag = "col padding-small gap-small",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, renderSkeletons()) elseif if #var18 <= 0 then #var17 > 0 else true then reactModule.createElement(scrollView, {
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(1, 0, 0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			scrollBarVisibility = scrollBarVisibility.Auto,
			VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
		},
		scrollingFrameRef = var15,
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
				heading = var11.primaryHeading,
				groups = var18,
				visibleIds = if var19 then var20 else nil
			}),
			OtherGroupsSection = reactModule.createElement(groupsListSectionModule, {
				layoutOrder = 2,
				showRank = true,
				showMemberCount = true,
				heading = if #var18 > 0 then var11.myGroupsHeading else nil,
				groups = var17,
				visibleIds = if var19 then var20 else nil
			})
		})
	}) else nil
	
	return reactModule.createElement(view, {
		tag = "col gap-xlarge",
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Header = reactModule.createElement(groupsListHeaderModule, { layoutOrder = 1 }),
		Toolbar = reactModule.createElement(groupsListToolbarModule, {
			layoutOrder = 2,
			canCreateGroup = p0.canCreateGroup,
			onSearchTextChanged = var14
		}),
		Disclaimer = var22 and reactModule.createElement(text, {
			LayoutOrder = 3,
			tag = "content-muted text-align-x-left text-body-medium",
			Text = var22
		}) or nil,
		List = var23 and reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = "fill",
			Size = UDim2.new(1, 0, 1, 0)
		}, { ListContent = var23 }) or nil
	})
end