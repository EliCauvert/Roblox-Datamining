local Parent = script:FindFirstAncestor("AppDebug").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Selection = if game:GetService("RunService"):IsStudio() then game:GetService("Selection") else nil
local _ = require(script.Parent.useTagScanner)
local UseInstanceTrackingModule = require(script.Parent.useInstanceTracking)
local UseTagColorModule = require(script.Parent.useTagColor)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseInstanceTrackingModule (copy), ReactModule (copy), Selection (copy), UseTagColorModule (copy), View (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local TagInfo = p1.tagInfo
	local UseInstanceTrackingModuleResult = UseInstanceTrackingModule(TagInfo.instance)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Selection (upval), TagInfo (copy)
		if Selection and TagInfo.instance then
			Selection:Set({ TagInfo.instance })
		end
		print(`[TagAnnotation] Selected: {TagInfo.testId}`)
		print(`  Class: {TagInfo.className}`)
		print(`  Path: {TagInfo.path}`)
		
		if TagInfo.instance then
			print(`  Instance: {TagInfo.instance:GetFullName()}`)
		end
	end, { TagInfo })
	local UseTagColorModuleResult = UseTagColorModule(TagInfo.testId)
	local Emphasis = UseTokensResult.LightMode.Content.Emphasis
	local List = { TagInfo.testId }
	
	if p1.showClassName then
		table.insert(List, `[{TagInfo.className}]`)
	end
	if p1.showPosition then
		table.insert(List, `({math.floor(UseInstanceTrackingModuleResult.position.X)},{math.floor(UseInstanceTrackingModuleResult.position.Y)})`)
	end
	return ReactModule.createElement(View, {
		tag = "size-0-0 auto-xy padding-x-xsmall padding-y-xxsmall radius-small",
		ZIndex = 9999,
		Position = UDim2.fromOffset(UseInstanceTrackingModuleResult.position.X, UseInstanceTrackingModuleResult.position.Y - 20),
		Visible = UseInstanceTrackingModuleResult.isVisible,
		backgroundStyle = {
			Color3 = UseTagColorModuleResult.Color3,
			Transparency = 1 - p1.opacity
		},
		onActivated = UseResult,
		stateLayer = {}
	}, {
		Label = ReactModule.createElement(Text, {
			tag = "size-0-0 auto-xy",
			Text = table.concat(List, " "),
			textStyle = Emphasis,
			fontStyle = { FontSize = 11, Font = Enum.Font.RobotoMono }
		})
	})
end