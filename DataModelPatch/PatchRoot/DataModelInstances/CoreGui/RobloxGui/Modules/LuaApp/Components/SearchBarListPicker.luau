local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local WithStyleFunction = UIBloxModule.Style.withStyle
local SearchConstants = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.Search.SearchConstants
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local SearchBarListPickerItemModule = require(Modules.LuaApp.Components.SearchBarListPickerItem)
local LuaAppSearchListFramesSelectable = game:DefineFastFlag("LuaAppSearchListFramesSelectable", false)
local FFlagBoldSearchListPickerSuggestionsModule = require(Modules.LuaApp.Flags.FFlagBoldSearchListPickerSuggestions)
local FFlagSearchOmniAutocompletePage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage
local SearchBarListPicker = RoactModule.PureComponent:extend("SearchBarListPicker")
local SEARCHMARGIN = if FFlagSearchOmniAutocompletePage then SearchConstants.SEARCH_MARGIN else 24
SearchBarListPicker.validateProps = TModule.strictInterface({
	items = TModule.array(TModule.any),
	width = TModule.UDim,
	height = if FFlagSearchOmniAutocompletePage then TModule.optional(TModule.UDim) else TModule.optional(TModule.number),
	layoutOrder = TModule.optional(TModule.integer),
	forwardRef = TModule.optional(TModule.table),
	BackgroundTransparency = if FFlagSearchOmniAutocompletePage then TModule.optional(TModule.number) else nil,
	removeAdditionalMargins = if FFlagSearchOmniAutocompletePage then TModule.optional(TModule.boolean) else nil,
	currentKeyword = if FFlagBoldSearchListPickerSuggestionsModule then TModule.optional(TModule.string) else nil,
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	formFactor = TModule.optional(TModule.string),
	screenHeight = TModule.optional(TModule.integer),
	topBarHeight = TModule.optional(TModule.number),
	globalGuiInset = TModule.optional(TModule.table)
})

function SearchBarListPicker.init(p1)
	-- upvalues: RoactGamepadModule (copy)
	p1.focusableRefs = RoactGamepadModule.createRefCache()
end

function SearchBarListPicker.renderWithProviders(p1, Callback)
	-- upvalues: FFlagSearchOmniAutocompletePage (copy), RoactModule (copy), LuaAppSearchListFramesSelectable (copy), Focusable (copy), SearchBarListPickerItemModule (copy), FFlagBoldSearchListPickerSuggestionsModule (copy), CursorKind (copy), WithStyleFunction (copy), SEARCHMARGIN (copy), FitChildrenModule (copy)
	local Items = p1.props.items
	local LayoutOrder = p1.props.layoutOrder
	local _UDim2 = nil
	local ScreenHeight = p1.props.screenHeight
	local TopBarHeight = p1.props.topBarHeight
	local GlobalGuiInset = p1.props.globalGuiInset
	local Height = p1.props.height
	_UDim2 = if Height then if FFlagSearchOmniAutocompletePage then UDim2.new(p1.props.width.Scale, p1.props.width.Offset, Height.Scale, Height.Offset) else UDim2.new(p1.props.width.Scale, p1.props.width.Offset, 0, Height) else UDim2.new(p1.props.width.Scale, p1.props.width.Offset, 0, ScreenHeight - GlobalGuiInset.top - TopBarHeight - GlobalGuiInset.bottom)
	local config = {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		TopPadding = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 0,
			Size = UDim2.new(1, 0, 0, 5)
		})
	}
	
	local function _(p2, p3)
		-- upvalues: p1 (copy), Items (copy)
		local v1 = p2 + p3
		
		return if v1 < 1 then p1.props.NextSelectionUp elseif #Items < v1 then p1.props.NextSelectionDown or p1.focusableRefs[p2] else p1.focusableRefs[v1]
	end
	
	local _ = function(p2: number)
		-- upvalues: Items (copy), p1 (copy)
		return p2 >= 1 and p2 <= #Items and p1.focusableRefs[p2] or nil
	end
	
	local ForwardRef = p1.props.forwardRef
	
	if LuaAppSearchListFramesSelectable and #p1.props.items > 0 then
		p1.focusableRefs[1] = ForwardRef
	end
	for LayoutOrder1, item in ipairs(Items) do
		local CreateElementFunction = RoactModule.createElement
		local FocusableEntry = Focusable[SearchBarListPickerItemModule]
		local config1 = {
			item = item,
			layoutOrder = LayoutOrder1,
			separatorEnabled = LayoutOrder1 < #Items,
			currentKeyword = if FFlagBoldSearchListPickerSuggestionsModule then p1.props.currentKeyword else nil
		}
		local NextSelectionUp = nil
		
		if LuaAppSearchListFramesSelectable then
			local NewLayoutOrder = LayoutOrder1 + -1
			NextSelectionUp = if NewLayoutOrder < 1 then p1.props.NextSelectionUp elseif #Items < NewLayoutOrder then p1.props.NextSelectionDown or p1.focusableRefs[LayoutOrder1] else p1.focusableRefs[NewLayoutOrder]
		else
			local LayoutOrderDelta = LayoutOrder1 - 1
			NextSelectionUp = LayoutOrderDelta >= 1 and LayoutOrderDelta <= #Items and p1.focusableRefs[LayoutOrderDelta] or nil
		end
		config1.NextSelectionUp = NextSelectionUp
		local NextSelectionUp1 = nil
		
		if LuaAppSearchListFramesSelectable then
			local NewLayoutOrder = LayoutOrder1 + 1
			NextSelectionUp1 = if NewLayoutOrder < 1 then p1.props.NextSelectionUp elseif #Items < NewLayoutOrder then p1.props.NextSelectionDown or p1.focusableRefs[LayoutOrder1] else p1.focusableRefs[NewLayoutOrder]
		else
			local Smallest = math.min(#Items, LayoutOrder1 + 1)
			NextSelectionUp1 = Smallest >= 1 and Smallest <= #Items and p1.focusableRefs[Smallest] or nil
		end
		config1.NextSelectionDown = NextSelectionUp1
		config1.NextSelectionRight = if LuaAppSearchListFramesSelectable then p1.props.NextSelectionRight else LayoutOrder1 >= 1 and LayoutOrder1 <= #Items and p1.focusableRefs[LayoutOrder1] or nil
		config1.NextSelectionLeft = if LuaAppSearchListFramesSelectable then p1.props.NextSelectionLeft else LayoutOrder1 >= 1 and LayoutOrder1 <= #Items and p1.focusableRefs[LayoutOrder1] or nil
		config1.SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
		config1[RoactModule.Ref] = LayoutOrder1 >= 1 and LayoutOrder1 <= #Items and p1.focusableRefs[LayoutOrder1] or nil
		config[LayoutOrder1] = CreateElementFunction(FocusableEntry, config1)
	end
	return WithStyleFunction(function(p2)
		-- upvalues: FFlagSearchOmniAutocompletePage (upval), p1 (copy), _UDim2 (ref), SEARCHMARGIN (upval), RoactModule (upval), Focusable (upval), LayoutOrder (copy), LuaAppSearchListFramesSelectable (upval), Items (copy), ForwardRef (copy), FitChildrenModule (upval), config (copy)
		local BackgroundTransparency = FFlagSearchOmniAutocompletePage and p1.props.BackgroundTransparency or p2.Theme.BackgroundDefault.Transparency
		local _UDim = if FFlagSearchOmniAutocompletePage and p1.props.removeAdditionalMargins then _UDim2 else _UDim2 + UDim2.fromOffset(SEARCHMARGIN * 2, 0)
		local _UDim2_1: UDim2 = if FFlagSearchOmniAutocompletePage and p1.props.removeAdditionalMargins then UDim2.new(1, 0, 1, 0) else _UDim2 - UDim2.new(0, SEARCHMARGIN * 2, 0, 0)
		
		return RoactModule.createElement(Focusable.Frame, {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = if FFlagSearchOmniAutocompletePage then _UDim else _UDim2 + UDim2.fromOffset(SEARCHMARGIN * 2, 0),
			BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
			BackgroundTransparency = if FFlagSearchOmniAutocompletePage then BackgroundTransparency else p2.Theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			LayoutOrder = if FFlagSearchOmniAutocompletePage then LayoutOrder else nil,
			NextSelectionLeft = if LuaAppSearchListFramesSelectable then nil else p1.props.NextSelectionLeft,
			NextSelectionRight = if LuaAppSearchListFramesSelectable then nil else p1.props.NextSelectionRight,
			NextSelectionUp = if LuaAppSearchListFramesSelectable then nil else p1.props.NextSelectionUp,
			NextSelectionDown = if LuaAppSearchListFramesSelectable then nil else p1.props.NextSelectionDown,
			defaultChild = if Items and #Items > 0 then p1.focusableRefs[1] else nil,
			[RoactModule.Ref] = if LuaAppSearchListFramesSelectable then nil else ForwardRef,
			SelectionGroup = if LuaAppSearchListFramesSelectable then true else nil,
			SelectionBehaviorDown = if LuaAppSearchListFramesSelectable then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if LuaAppSearchListFramesSelectable then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if LuaAppSearchListFramesSelectable then Enum.SelectionBehavior.Stop else nil
		}, {
			list = RoactModule.createElement(FitChildrenModule.FitScrollingFrame, {
				BorderSizePixel = 0,
				ScrollBarThickness = 0,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.fromScale(0.5, 0),
				BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
				BackgroundTransparency = if FFlagSearchOmniAutocompletePage then BackgroundTransparency else p2.Theme.BackgroundDefault.Transparency,
				LayoutOrder = LayoutOrder,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ElasticBehavior = Enum.ElasticBehavior.Always,
				Size = if FFlagSearchOmniAutocompletePage then _UDim2_1 else _UDim2 - UDim2.new(0, SEARCHMARGIN * 2, 0, 0),
				fitFields = { CanvasSize = FitChildrenModule.FitAxis.Height },
				Selectable = not LuaAppSearchListFramesSelectable and nil
			}, config)
		})
	end)
end

function SearchBarListPicker.render(p2)
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(function(p3)
		-- upvalues: p2 (copy)
		return p2:renderWithProviders(p3)
	end)
end

local v1 = RoactRoduxModule.connect(function(p2, _)
	return {
		formFactor = p2.FormFactor,
		screenHeight = p2.ScreenSize.Y,
		topBarHeight = p2.TopBar.topBarHeight,
		globalGuiInset = p2.GlobalGuiInset
	}
end)(SearchBarListPicker)

return RoactModule.forwardRef(function(p2, ForwardRef)
	-- upvalues: RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p2, { forwardRef = ForwardRef }))
end)