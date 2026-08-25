local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local list = foundationModule.List
local text = foundationModule.Text
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize

local function GameConfigurationListItem(p0)
	-- upvalues: reactModule (ref), icon (ref), iconSize (ref), list (ref)
	local row = p0.row
	local var3 = row.isDisabled == true
	local onActivated = row.onActivated
	local createElement = reactModule.createElement
	createElement = createElement(list.Item, {
		LayoutOrder = p0.LayoutOrder,
		title = row.title,
		description = row.description,
		trailing = if row.trailingIcon then reactModule.createElement(icon, {
			tag = "auto-xy content-default",
			name = row.trailingIcon,
			size = iconSize.Large,
			testId = `{p0.testId}-trailing-icon`
		}) else nil,
		onActivated = if onActivated == nil or var3 then nil else reactModule.useCallback(function()
			-- upvalues: onActivated (ref)
			if onActivated ~= nil then
				onActivated()
			end
		end, { onActivated }),
		testId = p0.testId
	})
	
	return if var3 then reactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		GroupTransparency = 0.5,
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, { Item = createElement }) else createElement
end

return function(p1)
	-- upvalues: reactModule (ref), GameConfigurationListItem (ref), view (ref), text (ref), list (ref), inputSize (ref)
	local testId = p1.testId or "game-configuration-list"
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-xsmall size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-large text-align-x-left content-default",
				Text = p1.title,
				testId = `{testId}-title`
			}),
			Body = if p1.body then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
				Text = p1.body,
				testId = `{testId}-body`
			}) else nil
		}),
		Rows = reactModule.createElement(list.Root, {
			LayoutOrder = 2,
			isContained = true,
			hasDivider = { hasDivider = true, isInset = false },
			size = inputSize.Medium
		}, reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), GameConfigurationListItem (copy), testId (ref)
			local t = {}
			
			for i, v in p1.rows do
				t[v.id] = reactModule.createElement(GameConfigurationListItem, { LayoutOrder = i, row = v, testId = `{testId}-row-{v.id}` })
			end
			return t
		end, { p1.rows, testId }))
	})
end