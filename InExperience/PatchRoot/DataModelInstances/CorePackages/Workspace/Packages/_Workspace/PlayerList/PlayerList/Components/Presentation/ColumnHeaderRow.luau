local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local _ = require(parent.Common.computeStatColumns)
local ROW_FLEX_TAG = require(parent.Common.Constants).ROW_FLEX_TAG

return reactModule.memo(function(p0) --[[ line: 15 | named "ColumnHeaderRow" ]]
	-- upvalues: reactModule (ref), view (ref), text (ref), ROW_FLEX_TAG (ref)
	local t = {
		PeopleHeader = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill size-0-full clip" }, {
			Label = reactModule.createElement(text, {
				Text = "People",
				tag = "size-full text-caption-small text-align-x-left content-emphasis"
			})
		})
	}
	
	for i, v in ipairs(p0.statColumns or {}) do
		t[`StatHeader_{v.name}`] = reactModule.createElement(view, {
			tag = "clip",
			Size = UDim2.fromOffset(p0.statWidth, p0.headerHeight),
			LayoutOrder = i + 1
		}, {
			Label = reactModule.createElement(text, {
				tag = "size-full text-caption-small text-align-x-left content-emphasis",
				Text = v.name
			})
		})
	end
	return reactModule.createElement(view, {
		Size = UDim2.new(1, 0, 0, p0.headerHeight),
		LayoutOrder = p0.layoutOrder,
		tag = ROW_FLEX_TAG
	}, t)
end)