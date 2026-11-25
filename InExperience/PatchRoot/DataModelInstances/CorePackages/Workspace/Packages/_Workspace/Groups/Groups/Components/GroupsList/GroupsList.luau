local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ScrollView = FoundationModule.ScrollView
local View = FoundationModule.View
local Text = FoundationModule.Text
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local TextKeysModule = require(Groups.Common.TextKeys)
local _ = require(Groups.Common.Types)
local GroupsListToolbarModule = require(script.Parent.GroupsListToolbar)
local GroupsListSectionModule = require(script.Parent.GroupsListSection)
local GroupsListHeaderModule = require(script.Parent.GroupsListHeader)
local GroupListItemSkeletonModule = require(script.Parent.GroupListItemSkeleton)
local Frozen = table.freeze({})

local function renderSkeletons()
	-- upvalues: ReactModule (copy), GroupListItemSkeletonModule (copy)
	local Elements = {}
	
	for i = 1, 3 do
		Elements[`Skeleton_{i}`] = ReactModule.createElement(GroupListItemSkeletonModule, { layoutOrder = i })
	end
	return Elements
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), Frozen (copy), ReactModule (copy), View (copy), renderSkeletons (copy), ScrollView (copy), ScrollBarVisibility (copy), GroupsListSectionModule (copy), GroupsListHeaderModule (copy), GroupsListToolbarModule (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		primaryHeading = TextKeysModule.HeadingPrimary,
		myGroupsHeading = TextKeysModule.HeadingMyGroups,
		loadFailure = TextKeysModule.MessageLoadGroupListError,
		notInGroups = TextKeysModule.MessageNotInAnyGroups,
		noResults = TextKeysModule.MessageNoGroupsFound
	})
	local GroupsList = p1.groupsList or Frozen
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GroupsList (copy)
		for _, value in ipairs(GroupsList) do
			if value.isPrimary then
				return value
			end
		end
		return nil
	end, { GroupsList })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), GroupsList (copy)
		if not UseMemoResult then
			return GroupsList
		end
		local List = {}
		
		for _, value in ipairs(GroupsList) do
			if value ~= UseMemoResult then
				table.insert(List, value)
			end
		end
		return List
	end, { GroupsList, UseMemoResult })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy)
		return if UseMemoResult then { UseMemoResult } else {}
	end, { UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult (copy)
		if UseStateResult ~= "" and UseRefResult.current then
			UseRefResult.current.CanvasPosition = Vector2.new(0, 0)
		end
	end, { UseStateResult })
	local IsNotUseStateResultMatch = UseStateResult ~= ""
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: IsNotUseStateResultMatch (copy), UseStateResult (copy), GroupsList (copy)
		if not IsNotUseStateResultMatch then
			return nil
		end
		local Lowered = string.lower(UseStateResult)
		local t = {}
		
		for _, value in ipairs(GroupsList) do
			if string.find(string.lower(value.name or ""), Lowered, 1, true) then
				t[value.id] = true
			end
		end
		return t
	end, { GroupsList, UseStateResult })
	local NoNextEntry: boolean = IsNotUseStateResultMatch and (UseMemoResult3 ~= nil and next(UseMemoResult3) == nil)
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseLocalizationResult (copy), GroupsList (copy), NoNextEntry (copy)
		return if p1.isLoading or not p1.groupsList then nil elseif p1.loadFailure then UseLocalizationResult.loadFailure elseif #GroupsList == 0 then UseLocalizationResult.notInGroups elseif NoNextEntry then UseLocalizationResult.noResults else nil
	end, {
		p1.isLoading, p1.groupsList, p1.loadFailure, UseLocalizationResult, GroupsList,
		NoNextEntry
	})
	local v1: boolean = p1.isLoading and #GroupsList == 0
	local v2: boolean = #UseMemoResult2 > 0 or #UseMemoResult1 > 0
	local Element = if v1 then ReactModule.createElement(View, {
		tag = "col padding-small gap-small",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, (renderSkeletons())) elseif v2 then ReactModule.createElement(ScrollView, {
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(1, 0, 0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			scrollBarVisibility = ScrollBarVisibility.Auto,
			VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
		},
		scrollingFrameRef = UseRefResult,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		ListWrapper = ReactModule.createElement(View, {
			tag = "col gap-xlarge",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			PrimarySection = ReactModule.createElement(GroupsListSectionModule, {
				layoutOrder = 1,
				showRank = true,
				showMemberCount = true,
				heading = UseLocalizationResult.primaryHeading,
				groups = UseMemoResult2,
				visibleIds = if IsNotUseStateResultMatch then UseMemoResult3 else nil
			}),
			OtherGroupsSection = ReactModule.createElement(GroupsListSectionModule, {
				layoutOrder = 2,
				showRank = true,
				showMemberCount = true,
				heading = if #UseMemoResult2 > 0 then UseLocalizationResult.myGroupsHeading else nil,
				groups = UseMemoResult1,
				visibleIds = if IsNotUseStateResultMatch then UseMemoResult3 else nil
			})
		})
	}) else nil
	
	return ReactModule.createElement(View, {
		tag = "col gap-xlarge",
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Header = ReactModule.createElement(GroupsListHeaderModule, { layoutOrder = 1 }),
		Toolbar = ReactModule.createElement(GroupsListToolbarModule, {
			layoutOrder = 2,
			canCreateGroup = p1.canCreateGroup,
			onSearchTextChanged = UseStateResult2
		}),
		Disclaimer = UseMemoResult4 and ReactModule.createElement(Text, {
			LayoutOrder = 3,
			tag = "content-muted text-align-x-left text-body-medium",
			Text = UseMemoResult4
		}) or nil,
		List = Element and ReactModule.createElement(View, {
			LayoutOrder = 4,
			tag = "fill",
			Size = UDim2.new(1, 0, 1, 0)
		}, { ListContent = Element }) or nil
	})
end