local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local getSduiComponentWrapper = require(parent.SduiCoreSystem).getSduiComponentWrapper
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return reactModule.memo(function(p1)
	-- upvalues: getSduiComponentWrapper (ref), reactModule (ref), view (ref), fFlagSduiExperienceDetailsSupport (ref)
	if p1.items == nil or #p1.items == 0 then
		return nil
	end
	local t = {}
	
	for i, v in p1.items do
		t["item_" .. tostring(i)] = reactModule.createElement(getSduiComponentWrapper(v), {
			componentConfig = v,
			sduiContext = p1.sduiContext,
			extraLocalProps = { layoutOrder = i }
		})
	end
	return if p1.footer == nil then reactModule.createElement(view, {
		tag = p1.rowTag or "row size-full-0 auto-y gap-small",
		size = p1.size,
		anchorPoint = p1.anchorPoint,
		position = p1.position,
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId
	}, t) else reactModule.createElement(view, {
		tag = p1.wrapperTag or "col size-full-0 auto-y gap-small",
		size = p1.size,
		anchorPoint = p1.anchorPoint,
		position = p1.position,
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId
	}, {
		ItemsRow = reactModule.createElement(view, {
			layoutOrder = 1,
			tag = p1.rowTag or "row size-full-0 auto-y gap-small"
		}, t),
		Footer = if fFlagSduiExperienceDetailsSupport then p1.footer else reactModule.createElement(view, { tag = "size-full-0 auto-y", layoutOrder = 2 }, p1.footer)
	})
end)