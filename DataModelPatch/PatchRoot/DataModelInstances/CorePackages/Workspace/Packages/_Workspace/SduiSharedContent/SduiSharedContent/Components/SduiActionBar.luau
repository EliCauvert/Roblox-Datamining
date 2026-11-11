local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return ReactModule.memo(function(p1)
	-- upvalues: GetSduiComponentWrapperFunction (copy), ReactModule (copy), View (copy), FFlagSduiExperienceDetailsSupport (copy)
	if p1.items == nil or #p1.items == 0 then
		return nil
	end
	local Elements = {}
	
	for LayoutOrder, item in p1.items do
		Elements["item_" .. tostring(LayoutOrder)] = ReactModule.createElement(GetSduiComponentWrapperFunction(item), {
			componentConfig = item,
			sduiContext = p1.sduiContext,
			extraLocalProps = { layoutOrder = LayoutOrder }
		})
	end
	return if p1.footer == nil then ReactModule.createElement(View, {
		tag = p1.rowTag or "row size-full-0 auto-y gap-small",
		size = p1.size,
		anchorPoint = p1.anchorPoint,
		position = p1.position,
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId
	}, Elements) else ReactModule.createElement(View, {
		tag = p1.wrapperTag or "col size-full-0 auto-y gap-small",
		size = p1.size,
		anchorPoint = p1.anchorPoint,
		position = p1.position,
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId
	}, {
		ItemsRow = ReactModule.createElement(View, {
			layoutOrder = 1,
			tag = p1.rowTag or "row size-full-0 auto-y gap-small"
		}, Elements),
		Footer = if FFlagSduiExperienceDetailsSupport then p1.footer else ReactModule.createElement(View, { tag = "size-full-0 auto-y", layoutOrder = 2 }, p1.footer)
	})
end)