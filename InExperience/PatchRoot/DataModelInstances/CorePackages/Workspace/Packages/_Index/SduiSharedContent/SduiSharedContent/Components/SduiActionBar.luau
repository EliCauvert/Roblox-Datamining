local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local getSduiComponentWrapper = require(parent.SduiCoreSystem).getSduiComponentWrapper
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return reactModule.memo(function(p0) --[[ line: 45 | named "SduiActionBar" ]]
	-- upvalues: getSduiComponentWrapper (ref), reactModule (ref), view (ref), fFlagSduiExperienceDetailsSupport (ref)
	if p0.items == nil or #p0.items == 0 then
		return nil
	end
	local t = {}
	
	for i, v in p0.items do
		t["item_" .. tostring(i)] = reactModule.createElement(getSduiComponentWrapper(v), {
			componentConfig = v,
			sduiContext = p0.sduiContext,
			extraLocalProps = { layoutOrder = i }
		})
	end
	return if p0.footer == nil then reactModule.createElement(view, {
		tag = p0.rowTag or "row size-full-0 auto-y gap-small",
		size = p0.size,
		anchorPoint = p0.anchorPoint,
		position = p0.position,
		LayoutOrder = p0.layoutOrder,
		testId = p0.testId
	}, t) else reactModule.createElement(view, {
		tag = p0.wrapperTag or "col size-full-0 auto-y gap-small",
		size = p0.size,
		anchorPoint = p0.anchorPoint,
		position = p0.position,
		LayoutOrder = p0.layoutOrder,
		testId = p0.testId
	}, {
		ItemsRow = reactModule.createElement(view, {
			layoutOrder = 1,
			tag = p0.rowTag or "row size-full-0 auto-y gap-small"
		}, t),
		Footer = if fFlagSduiExperienceDetailsSupport then p0.footer else reactModule.createElement(view, { tag = "size-full-0 auto-y", layoutOrder = 2 }, p0.footer)
	})
end)