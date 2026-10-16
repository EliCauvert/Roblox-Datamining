local Songbird = script:FindFirstAncestor("Songbird")
local CryoModule = require(Songbird.Parent.Cryo)
local ReactModule = require(Songbird.Parent.React)
local FoundationModule = require(Songbird.Parent.Foundation)
local UseCallbackFunction = ReactModule.useCallback
local CreateNextOrderFunction = require(Songbird.Parent.ReactUtils).createNextOrder
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = { iconSize = FoundationModule.Enums.IconSize.Medium }

return function(p1) --[[ Line: 31 | Named "SubmenuButton" ]]
	-- upvalues: CryoModule (copy), config (copy), CreateNextOrderFunction (copy), UseTokensFunction (copy), UseCallbackFunction (copy), FoundationModule (copy), ReactModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local NextOrder = CreateNextOrderFunction()
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y row gap-small padding-small align-y-center radius-medium",
		onStateChanged = UseCallbackFunction(function(Pressed) --[[ Line: 37 ]]
			-- upvalues: FoundationModule (upval), JoinResult (copy)
			if Pressed == FoundationModule.Enums.ControlState.Pressed and JoinResult.onActivated then
				JoinResult.onActivated()
			end
		end, { JoinResult.onActivated }),
		LayoutOrder = JoinResult.LayoutOrder
	}, {
		Icon = if JoinResult.icon then ReactModule.createElement(FoundationModule.Icon, {
			name = JoinResult.icon,
			size = JoinResult.iconSize,
			style = UseTokensResult.Color.Content.Emphasis,
			LayoutOrder = NextOrder()
		}) else nil,
		Text = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy content-default text-label-large",
			Text = JoinResult.text,
			LayoutOrder = NextOrder()
		})
	})
end