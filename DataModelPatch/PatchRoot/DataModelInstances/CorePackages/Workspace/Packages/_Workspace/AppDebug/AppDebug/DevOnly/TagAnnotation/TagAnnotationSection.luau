local Selection = if game:GetService("RunService"):IsStudio() then game:GetService("Selection") else nil
local Parent = script:FindFirstAncestor("AppDebug").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ScrollView = FoundationModule.ScrollView
local SearchInput = FoundationModule.SearchInput
local SegmentedControl = FoundationModule.SegmentedControl
local Text = FoundationModule.Text
local View = FoundationModule.View
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ParentModule = require(script.Parent)
local TagAnnotationPortalModule = require(script.Parent.TagAnnotationPortal)
local DebugPanelSection = require(Parent.DebugPanel).DebugPanelSection
local Segments = {
	{ id = "hidden", text = "Hidden" },
	{ id = "overlay", text = "Overlay" },
	{ id = "list", text = "List" }
}

local function shortPath(Text: string, p1): string
	local List = {}
	
	for i in string.gmatch(Text, "[^/]+") do
		table.insert(List, i)
	end
	if #List <= p1 then
		return Text
	end
	local List1 = {}
	
	for i1 = #List - p1 + 1, #List do
		table.insert(List1, List[i1])
	end
	return "…/" .. table.concat(List1, "/")
end

local function groupAndFilter(Tags, Text: string)
	local Lowered = if Text and Text ~= "" then string.lower(Text) else nil
	local t = {}
	local List = {}
	
	for _, tag in Tags do
		if string.sub(tag.testId, 1, 5) ~= "type=" and (not Lowered or string.find(string.lower(tag.testId), Lowered, 1, true)) then
			if not t[tag.testId] then
				t[tag.testId] = {}
				table.insert(List, tag.testId)
			end
			table.insert(t[tag.testId], tag)
		end
	end
	table.sort(List)
	
	return t, List
end

local function _(p2, p3, p4): string
	return `{p2} <font color="#{p4:ToHex()}">({p3})</font>`
end

local function TagRow(p2)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Selection (copy), View (copy), Text (copy)
	local TagInfo = p2.tagInfo
	
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y padding-x-xsmall padding-y-xxsmall radius-small bg-surface-100",
		LayoutOrder = p2.layoutOrder,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: Selection (upval), TagInfo (copy)
			if Selection and TagInfo.instance then
				Selection:Set({ TagInfo.instance })
			end
			print("[TagAnnotation] " .. TagInfo.testId)
			print("  Class: " .. TagInfo.className)
			print("  Path:  " .. TagInfo.path)
		end, { TagInfo }),
		stateLayer = {}
	}, {
		Label = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y padding-xsmall text-label-small text-align-x-left content-emphasis",
			RichText = true,
			Text = `{p2.label} <font color="#{UseTokensFunction().Color.Content.Muted.Color3:ToHex()}">({TagInfo.className})</font>`
		})
	})
end

local function TagAnnotationListPanel(p2)
	-- upvalues: UseTokensFunction (copy), ParentModule (copy), ReactModule (copy), groupAndFilter (copy), TagRow (copy), shortPath (copy), DebugPanelSection (copy), View (copy), SearchInput (copy), InputSize (copy), ScrollView (copy)
	local UseTokensResult = UseTokensFunction()
	local UseContextResult = ParentModule.useContext()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseContextResult.config.filterPattern or "")
	local UseResult = ReactModule.useCallback(function(p3)
		-- upvalues: UseStateResult2 (copy), UseContextResult (copy)
		UseStateResult2(p3)
		UseContextResult.setFilterPattern(if p3 == "" then nil else p3)
	end, { UseContextResult.setFilterPattern })
	local GroupAndFilterResult, GroupAndFilterResult2 = groupAndFilter(p2.tags, UseStateResult)
	local Elements = {}
	
	for LayoutOrder, value in GroupAndFilterResult2 do
		local GroupAndFilterResultEntry = GroupAndFilterResult[value]
		
		if #GroupAndFilterResultEntry == 1 then
			Elements["s-" .. value] = ReactModule.createElement(TagRow, {
				tagInfo = GroupAndFilterResultEntry[1],
				label = GroupAndFilterResultEntry[1].testId,
				layoutOrder = LayoutOrder
			})
			continue
		end
		local Elements1 = {}
		
		for LayoutOrder1, TagInfo in GroupAndFilterResultEntry do
			Elements1["i-" .. LayoutOrder1] = ReactModule.createElement(TagRow, {
				tagInfo = TagInfo,
				label = shortPath(TagInfo.path, 3),
				layoutOrder = LayoutOrder1
			})
		end
		Elements["g-" .. value] = ReactModule.createElement(DebugPanelSection, {
			depth = 1,
			defaultCollapsed = true,
			title = value .. " (" .. #GroupAndFilterResultEntry .. ")",
			layoutOrder = LayoutOrder
		}, Elements1)
	end
	return ReactModule.createElement(View, { tag = "col gap-small size-full-0 auto-y" }, {
		SearchBox = ReactModule.createElement(SearchInput, {
			LayoutOrder = 0,
			text = UseStateResult,
			placeholder = `filter… ({#GroupAndFilterResult2}/{#p2.tags})`,
			onChanged = UseResult,
			size = InputSize.Small,
			width = UDim.new(1, 0)
		}),
		Rows = ReactModule.createElement(ScrollView, {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 300),
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, UseTokensResult.Gap.XXSmall)
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, Elements)
	})
end

local function TagAnnotationContent()
	-- upvalues: ParentModule (copy), ReactModule (copy), View (copy), SegmentedControl (copy), Segments (copy), InputSize (copy), TagAnnotationListPanel (copy)
	local UseContextResult = ParentModule.useContext()
	local DisplayMode = UseContextResult.config.displayMode
	local UseTagScannerResult = ParentModule.useTagScanner()
	
	return ReactModule.createElement(View, { tag = "col gap-small size-full-0 auto-y" }, {
		Controls = ReactModule.createElement(SegmentedControl, {
			LayoutOrder = 0,
			segments = Segments,
			value = DisplayMode,
			onActivated = ReactModule.useCallback(function(p3)
				-- upvalues: UseContextResult (copy)
				UseContextResult.setDisplayMode(p3)
			end, { UseContextResult.setDisplayMode }),
			size = InputSize.XSmall
		}),
		List = if DisplayMode == "list" then ReactModule.createElement(TagAnnotationListPanel, { LayoutOrder = 1, tags = UseTagScannerResult.tags }) else nil
	})
end

return require(Parent.DebugPanel).registerSection({
	id = "app-debug.tagAnnotation",
	order = 0,
	path = { "Tag Annotations" },
	component = function()
		-- upvalues: ReactModule (copy), ParentModule (copy), TagAnnotationPortalModule (copy), TagAnnotationContent (copy)
		return ReactModule.createElement(ParentModule.Provider, nil, {
			Portal = ReactModule.createElement(TagAnnotationPortalModule),
			Inner = ReactModule.createElement(TagAnnotationContent)
		})
	end
})