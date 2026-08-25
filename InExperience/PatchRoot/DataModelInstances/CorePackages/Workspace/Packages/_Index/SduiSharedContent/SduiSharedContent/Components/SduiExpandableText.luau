local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local appBloxModule = require(parent.AppBlox)
local foundationModule = require(parent.Foundation)
local reportUnifiedLoggingAction = require(parent.SduiCoreSystem).reportUnifiedLoggingAction
local expandableText = appBloxModule.ExpandableText
local view = foundationModule.View
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), reportUnifiedLoggingAction (ref), fFlagSduiExperienceDetailsSupport (ref), view (ref), expandableText (ref)
	local layoutOrder = p0.layoutOrder
	local t = {
		text = p0.text,
		LayoutOrder = if fFlagSduiExperienceDetailsSupport and p0.headerComponent and (p0.text and p0.text ~= "") then 2 else layoutOrder,
		compactNumberOfLines = p0.compactNumberOfLines,
		fontStyle = p0.fontStyle,
		textStyle = p0.textStyle,
		pressedTextStyle = p0.pressedTextStyle,
		expandedInitially = p0.expandedInitially,
		avoidBlankLineClip = p0.avoidBlankLineClip,
		onExpandChanged = reactModule.useCallback(function(p1)
			-- upvalues: p0 (ref), reportUnifiedLoggingAction (copy)
			if p0.onExpandChanged then
				p0.onExpandChanged(p1)
			end
			reportUnifiedLoggingAction(p0.sduiContext, {
				actionType = "ExpandableTextToggle",
				actionParams = { isExpanded = p1 }
			}, p0.analyticsContext)
		end, { p0.onExpandChanged, p0.analyticsContext, p0.sduiContext }),
		selectable = if fFlagSduiExperienceDetailsSupport then p0.selectable else nil
	}
	
	return if fFlagSduiExperienceDetailsSupport and p0.headerComponent and (p0.text and p0.text ~= "") then reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = layoutOrder
	}, {
		Header = reactModule.cloneElement(p0.headerComponent, { layoutOrder = 1 }),
		Content = reactModule.createElement(expandableText, t)
	}) else reactModule.createElement(expandableText, t)
end)