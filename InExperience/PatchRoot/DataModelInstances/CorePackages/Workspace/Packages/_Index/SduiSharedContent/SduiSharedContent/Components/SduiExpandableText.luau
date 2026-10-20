local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local ReportUnifiedLoggingActionFunction = require(Parent.SduiCoreSystem).reportUnifiedLoggingAction
local ExpandableText = require(Parent.AppBlox).ExpandableText
local View = require(Parent.Foundation).View

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ReportUnifiedLoggingActionFunction (copy), View (copy), ExpandableText (copy)
	local LayoutOrder = p1.layoutOrder
	local config = {
		text = p1.text,
		LayoutOrder = if p1.headerComponent and p1.text and p1.text ~= "" then 2 else LayoutOrder,
		compactNumberOfLines = p1.compactNumberOfLines,
		fontStyle = p1.fontStyle,
		textStyle = p1.textStyle,
		pressedTextStyle = p1.pressedTextStyle,
		expandedInitially = p1.expandedInitially,
		avoidBlankLineClip = p1.avoidBlankLineClip,
		onExpandChanged = ReactModule.useCallback(function(IsExpanded)
			-- upvalues: p1 (copy), ReportUnifiedLoggingActionFunction (upval)
			if p1.onExpandChanged then
				p1.onExpandChanged(IsExpanded)
			end
			ReportUnifiedLoggingActionFunction(p1.sduiContext, {
				actionType = "ExpandableTextToggle",
				actionParams = { isExpanded = IsExpanded }
			}, p1.analyticsContext)
		end, { p1.onExpandChanged, p1.analyticsContext, p1.sduiContext }),
		selectable = p1.selectable
	}
	
	return if p1.headerComponent and p1.text and p1.text ~= "" then ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = LayoutOrder
	}, {
		Header = ReactModule.cloneElement(p1.headerComponent, { layoutOrder = 1 }),
		Content = ReactModule.createElement(ExpandableText, config)
	}) else ReactModule.createElement(ExpandableText, config)
end)