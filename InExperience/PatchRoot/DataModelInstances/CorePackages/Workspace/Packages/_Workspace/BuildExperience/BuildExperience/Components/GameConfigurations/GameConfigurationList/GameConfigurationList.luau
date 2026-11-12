local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local List = FoundationModule.List
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize

local function GameConfigurationListItem(Frame: Frame)
	-- upvalues: ReactModule (copy), Icon (copy), IconSize (copy), List (copy)
	local Row = Frame.row
	local IsIsDisabled = Row.isDisabled == true
	local OnActivatedFunction = Row.onActivated
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: OnActivatedFunction (copy)
		if OnActivatedFunction ~= nil then
			OnActivatedFunction()
		end
	end, { OnActivatedFunction })
	local Element = ReactModule.createElement(List.Item, {
		LayoutOrder = Frame.LayoutOrder,
		title = Row.title,
		description = Row.description,
		trailing = if Row.trailingIcon then ReactModule.createElement(Icon, {
			tag = "auto-xy content-default",
			name = Row.trailingIcon,
			size = IconSize.Large,
			testId = `{Frame.testId}-trailing-icon`
		}) else nil,
		onActivated = if OnActivatedFunction == nil or IsIsDisabled then nil else UseResult,
		testId = Frame.testId
	})
	
	return if IsIsDisabled then ReactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		GroupTransparency = 0.5,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, { Item = Element }) else Element
end

return function(p1)
	-- upvalues: ReactModule (copy), GameConfigurationListItem (copy), View (copy), Text (copy), List (copy), InputSize (copy)
	local TestId = p1.testId or "game-configuration-list"
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-xsmall size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-large text-align-x-left content-default",
				Text = p1.title,
				testId = `{TestId}-title`
			}),
			Body = if p1.body then ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
				Text = p1.body,
				testId = `{TestId}-body`
			}) else nil
		}),
		Rows = ReactModule.createElement(List.Root, {
			LayoutOrder = 2,
			isContained = true,
			hasDivider = { hasDivider = true, isInset = false },
			size = InputSize.Medium
		}, (ReactModule.useMemo(function()
			-- upvalues: p1 (copy), ReactModule (upval), GameConfigurationListItem (upval), TestId (copy)
			local Elements = {}
			
			for LayoutOrder, row in p1.rows do
				Elements[row.id] = ReactModule.createElement(GameConfigurationListItem, {
					LayoutOrder = LayoutOrder,
					row = row,
					testId = `{TestId}-row-{row.id}`
				})
			end
			return Elements
		end, { p1.rows, TestId })))
	})
end