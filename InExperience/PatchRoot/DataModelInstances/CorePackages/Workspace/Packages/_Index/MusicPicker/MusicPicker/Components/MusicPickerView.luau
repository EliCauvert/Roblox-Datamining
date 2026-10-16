local MusicPicker = script:FindFirstAncestor("MusicPicker")
local Parent = MusicPicker.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseStyleTagsFunction = FoundationModule.Hooks.useStyleTags
local UseTokensFunction = FoundationModule.Hooks.useTokens
local MusicPickerListModule = require(MusicPicker.Components.MusicPickerList)
local MusicPickerTabStripModule = require(MusicPicker.Components.MusicPickerTabStrip)
local _ = require(MusicPicker.Types.MusicPickerTypes)
local MagnifyingGlass = BuilderIconsModule.Icon.MagnifyingGlass
local X = BuilderIconsModule.Icon.X

local function _(Entry, Id) --[[ Line: 52 | Named "findActiveTab" ]]
	for _, value in Entry do
		if value.id == Id then
			return value
		end
	end
	return if #Entry > 0 then Entry[1] else nil
end

return function(p1) --[[ Line: 61 | Named "MusicPickerView" ]]
	-- upvalues: UseTokensFunction (copy), UseStyleTagsFunction (copy), ReactModule (copy), MusicPickerListModule (copy), MusicPickerTabStripModule (copy), View (copy), FoundationModule (copy), Text (copy), IconButton (copy), X (copy), Icon (copy), MagnifyingGlass (copy)
	local UseTokensResult = UseTokensFunction()
	local FillSize0FullTextBodyLargeTextAlignXLeftTextAlignYCenterTextNoWrapClipGuiObjectDefaults = UseStyleTagsFunction("fill size-0-full text-body-large text-align-x-left text-align-y-center text-no-wrap clip gui-object-defaults")
	local Emphasis = UseTokensResult.Color.Content.Emphasis
	local Element = nil
	
	if p1.mode == "search" then
		Element = ReactModule.createElement(MusicPickerListModule, {
			LayoutOrder = 1,
			content = p1.searchContent,
			onSelect = p1.onSelect
		})
	else
		local Tabs = p1.tabs
		local ActiveTabId = p1.activeTabId
		local tab1 = nil
		
		for _, tab in Tabs do
			if tab.id == ActiveTabId then
				tab1 = tab
				local t = {}
				
				if p1.showTabs ~= false then
					t.TabStrip = ReactModule.createElement(MusicPickerTabStripModule, {
						LayoutOrder = 1,
						tabs = p1.tabs,
						activeTabId = p1.activeTabId,
						onTabSelected = p1.onTabSelected
					})
				end
				if tab1 ~= nil then
					t.Content = ReactModule.createElement(MusicPickerListModule, {
						LayoutOrder = 2,
						content = tab1.content,
						onSelect = p1.onSelect
					})
				end
				Element = ReactModule.createElement(ReactModule.Fragment, nil, t)
			else
				continue
			end
		end
		tab1 = if #Tabs > 0 then Tabs[1] else nil
	end
	local SafeAreaInsets = p1.safeAreaInsets
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-top gap-small position-bottom-center anchor-bottom-center size-full-0 radius-medium bg-surface-100",
		ZIndex = 5,
		onActivated = function() --[[ Line: 111 ]] end,
		Size = UDim2.fromScale(1, 0.6666666666666666),
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		padding = {
			top = UDim.new(0, UseTokensResult.Padding.Medium),
			left = UDim.new(0, (math.max(if SafeAreaInsets == nil then 0 else SafeAreaInsets.left, UseTokensResult.Padding.XLarge))),
			right = UDim.new(0, (math.max(if SafeAreaInsets == nil then 0 else SafeAreaInsets.right, UseTokensResult.Padding.XLarge)))
		}
	}, {
		DragHandle = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "radius-circle bg-surface-300",
			Size = UDim2.fromOffset(32, 4)
		}),
		ModalHeaderBar = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row flex-x-between align-x-center align-y-center size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small text-align-x-left text-align-y-top text-truncate-end content-emphasis",
				Text = p1.titleText
			}),
			CloseButton = ReactModule.createElement(IconButton, {
				LayoutOrder = 2,
				icon = X,
				onActivated = p1.onClose,
				size = FoundationModule.Enums.IconSize.Small,
				variant = FoundationModule.Enums.ButtonVariant.Utility
			})
		}),
		SearchBar = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "row align-y-center gap-large size-full-1000 padding-x-medium stroke-standard stroke-emphasis",
			cornerRadius = UDim.new(0.5, 0)
		}, {
			SearchIcon = ReactModule.createElement(Icon, {
				name = MagnifyingGlass,
				size = FoundationModule.Enums.IconSize.Medium,
				style = Emphasis
			}),
			Input = ReactModule.createElement("TextBox", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClearTextOnFocus = false,
				MultiLine = false,
				PlaceholderColor3 = Emphasis.Color3,
				PlaceholderText = p1.searchPlaceholder,
				Text = p1.searchText,
				TextColor3 = Emphasis.Color3,
				TextTransparency = Emphasis.Transparency,
				[ReactModule.Tag] = FillSize0FullTextBodyLargeTextAlignXLeftTextAlignYCenterTextNoWrapClipGuiObjectDefaults,
				[ReactModule.Change.Text] = function(p2) --[[ Line: 101 ]]
					-- upvalues: p1 (copy)
					p1.onSearchChanged(p2.Text)
				end,
				[ReactModule.Event.FocusLost] = function(_, p2) --[[ Line: 104 ]]
					-- upvalues: p1 (copy)
					if p2 then
						p1.onSubmitSearch()
					end
				end
			})
		}),
		Body = ReactModule.createElement(View, {
			LayoutOrder = 4,
			tag = "col align-x-center align-y-top gap-xsmall size-full",
			flexItem = { FlexMode = Enum.UIFlexMode.Shrink }
		}, Element)
	})
end