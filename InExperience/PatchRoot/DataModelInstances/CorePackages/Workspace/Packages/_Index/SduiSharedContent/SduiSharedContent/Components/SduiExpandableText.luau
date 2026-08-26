local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local appBloxModule = require(parent.AppBlox)
local foundationModule = require(parent.Foundation)
local reportUnifiedLoggingAction = require(parent.SduiCoreSystem).reportUnifiedLoggingAction
local expandableText = appBloxModule.ExpandableText
local view = foundationModule.View
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), reportUnifiedLoggingAction (ref), fFlagSduiExperienceDetailsSupport (ref), view (ref), expandableText (ref)
	local layoutOrder = p1.layoutOrder
	local t = {
		text = p1.text,
		LayoutOrder = if fFlagSduiExperienceDetailsSupport and p1.headerComponent and (p1.text and p1.text ~= "") then 2 else layoutOrder,
		compactNumberOfLines = p1.compactNumberOfLines,
		fontStyle = p1.fontStyle,
		textStyle = p1.textStyle,
		pressedTextStyle = p1.pressedTextStyle,
		expandedInitially = p1.expandedInitially,
		avoidBlankLineClip = p1.avoidBlankLineClip,
		onExpandChanged = reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), reportUnifiedLoggingAction (copy)
			if p1.onExpandChanged then
				p1.onExpandChanged(p2)
			end
			reportUnifiedLoggingAction(p1.sduiContext, {
				actionType = "ExpandableTextToggle",
				actionParams = { isExpanded = p2 }
			}, p1.analyticsContext)
		end, { p1.onExpandChanged, p1.analyticsContext, p1.sduiContext }),
		selectable = if fFlagSduiExperienceDetailsSupport then p1.selectable else nil
	}
	
	return if fFlagSduiExperienceDetailsSupport and p1.headerComponent and (p1.text and p1.text ~= "") then reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = layoutOrder
	}, {
		Header = reactModule.cloneElement(p1.headerComponent, { layoutOrder = 1 }),
		Content = reactModule.createElement(expandableText, t)
	}) else reactModule.createElement(expandableText, t)
end)