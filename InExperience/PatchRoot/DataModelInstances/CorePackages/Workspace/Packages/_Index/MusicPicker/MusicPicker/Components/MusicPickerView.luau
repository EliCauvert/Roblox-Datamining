local musicPicker = script:FindFirstAncestor("MusicPicker")
local parent = musicPicker.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local useStyleTags = foundationModule.Hooks.useStyleTags
local useTokens = foundationModule.Hooks.useTokens
local musicPickerListModule = require(musicPicker.Components.MusicPickerList)
local musicPickerTabStripModule = require(musicPicker.Components.MusicPickerTabStrip)
local _ = require(musicPicker.Types.MusicPickerTypes)
local magnifyingGlass = builderIconsModule.Icon.MagnifyingGlass
local x = builderIconsModule.Icon.X

local function _(p1, p2)
	for i, v in p1 do
		if v.id == p2 then
			return v
		end
	end
	return if #p1 > 0 then p1[1] else nil
end

return function(p3)
	-- upvalues: useTokens (ref), useStyleTags (ref), reactModule (ref), musicPickerListModule (ref), musicPickerTabStripModule (ref), view (ref), foundationModule (ref), text (ref), iconButton (ref), x (ref), icon (ref), magnifyingGlass (ref)
	local var1
	local var2 = useTokens()
	local var3 = useStyleTags("fill size-0-full text-body-large text-align-x-left text-align-y-center text-no-wrap clip gui-object-defaults")
	local emphasis = var2.Color.Content.Emphasis
	local _ = nil
	
	if p3.mode == "search" then
		var1 = reactModule.createElement(musicPickerListModule, {
			LayoutOrder = 1,
			content = p3.searchContent,
			onSelect = p3.onSelect
		})
	else
		local var4
		local tabs = p3.tabs
		local activeTabId = p3.activeTabId
		
		for i, v in tabs do
			if v.id == activeTabId then
				var4 = v
				local t = {}
				
				if p3.showTabs ~= false then
					t.TabStrip = reactModule.createElement(musicPickerTabStripModule, {
						LayoutOrder = 1,
						tabs = p3.tabs,
						activeTabId = p3.activeTabId,
						onTabSelected = p3.onTabSelected
					})
				end
				if var4 ~= nil then
					t.Content = reactModule.createElement(musicPickerListModule, {
						LayoutOrder = 2,
						content = var4.content,
						onSelect = p3.onSelect
					})
				end
				var1 = reactModule.createElement(reactModule.Fragment, nil, t)
			end
		end
		var4 = if #tabs > 0 then tabs[1] else nil
	end
	local safeAreaInsets = p3.safeAreaInsets
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-top gap-small position-bottom-center anchor-bottom-center size-full-0 radius-medium bg-surface-100",
		ZIndex = 5,
		onActivated = function() end,
		Size = UDim2.fromScale(1, 0.666666666667),
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		padding = {
			top = UDim.new(0, var2.Padding.Medium),
			left = UDim.new(0, math.max(if safeAreaInsets ~= nil then 0 else safeAreaInsets.left, var2.Padding.XLarge)),
			right = UDim.new(0, math.max(if safeAreaInsets ~= nil then 0 else safeAreaInsets.right, var2.Padding.XLarge))
		}
	}, {
		DragHandle = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "radius-circle bg-surface-300",
			Size = UDim2.fromOffset(32, 4)
		}),
		ModalHeaderBar = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row flex-x-between align-x-center align-y-center size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small text-align-x-left text-align-y-top text-truncate-end content-emphasis",
				Text = p3.titleText
			}),
			CloseButton = reactModule.createElement(iconButton, {
				LayoutOrder = 2,
				icon = x,
				onActivated = p3.onClose,
				size = foundationModule.Enums.IconSize.Small,
				variant = foundationModule.Enums.ButtonVariant.Utility
			})
		}),
		SearchBar = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row align-y-center gap-large size-full-1000 padding-x-medium stroke-standard stroke-emphasis",
			cornerRadius = UDim.new(0.5, 0)
		}, {
			SearchIcon = reactModule.createElement(icon, {
				name = magnifyingGlass,
				size = foundationModule.Enums.IconSize.Medium,
				style = emphasis
			}),
			Input = reactModule.createElement("TextBox", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClearTextOnFocus = false,
				MultiLine = false,
				PlaceholderColor3 = emphasis.Color3,
				PlaceholderText = p3.searchPlaceholder,
				Text = p3.searchText,
				TextColor3 = emphasis.Color3,
				TextTransparency = emphasis.Transparency,
				[reactModule.Tag] = var3,
				[reactModule.Change.Text] = function(p4)
					-- upvalues: p3 (ref)
					p3.onSearchChanged(p4.Text)
				end,
				[reactModule.Event.FocusLost] = function(_, p4)
					-- upvalues: p3 (ref)
					if p4 then
						p3.onSubmitSearch()
					end
				end
			})
		}),
		Body = reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = "col align-x-center align-y-top gap-xsmall size-full",
			flexItem = { FlexMode = Enum.UIFlexMode.Shrink }
		}, var1)
	})
end