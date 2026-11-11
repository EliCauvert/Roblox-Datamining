local Parent = script:FindFirstAncestor("AppDebug").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(script.Parent.useTagScanner)
local UseInstanceTrackingModule = require(script.Parent.useInstanceTracking)
local UseTagColorModule = require(script.Parent.useTagColor)
local TagAnnotationTooltipModule = require(script.Parent.TagAnnotationTooltip)

local function _(Text: string, Text1: string): boolean
	return not Text1 or Text1 == "" or string.find(string.lower(Text), string.lower(Text1), 1, true) ~= nil
end

local function TagHighlight(p1)
	-- upvalues: UseTokensFunction (copy), UseInstanceTrackingModule (copy), UseTagColorModule (copy), ReactModule (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local UseInstanceTrackingModuleResult = UseInstanceTrackingModule(p1.tagInfo.instance)
	local UseTagColorModuleResult = UseTagColorModule(p1.tagInfo.testId)
	
	return ReactModule.createElement(View, {
		Position = UDim2.fromOffset(UseInstanceTrackingModuleResult.position.X, UseInstanceTrackingModuleResult.position.Y),
		Size = UDim2.fromOffset(UseInstanceTrackingModuleResult.size.X, UseInstanceTrackingModuleResult.size.Y),
		Visible = UseInstanceTrackingModuleResult.isVisible,
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Small),
		stroke = {
			Color = UseTagColorModuleResult.Color3,
			Thickness = UseTokensResult.Stroke.Standard,
			Transparency = UseTagColorModuleResult.Transparency
		}
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), TagHighlight (copy), TagAnnotationTooltipModule (copy), View (copy)
	local Elements = {}
	
	for i, TagInfo in ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		local List = {}
		
		for _, tag in p1.tags do
			if tag.instance and tag.instance.Parent ~= nil then
				local TestId: string = tag.testId
				local FilterPattern: string = p1.filterPattern
				
				if not FilterPattern or FilterPattern == "" or string.find(string.lower(TestId), string.lower(FilterPattern), 1, true) ~= nil then
					table.insert(List, tag)
				end
			end
		end
		return List
	end, { p1.tags, p1.filterPattern }) do
		Elements[`highlight-{i}-{TagInfo.testId}`] = ReactModule.createElement(TagHighlight, { tagInfo = TagInfo })
		Elements[`tooltip-{i}-{TagInfo.testId}`] = ReactModule.createElement(TagAnnotationTooltipModule, {
			tagInfo = TagInfo,
			showClassName = p1.showClassName,
			showPosition = p1.showPosition,
			opacity = p1.tooltipOpacity,
			highlightOnHover = p1.highlightOnHover
		})
	end
	return ReactModule.createElement(View, { tag = "size-full" }, Elements)
end