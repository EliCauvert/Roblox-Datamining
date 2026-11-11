local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local BuilderIconsModule = require(Parent.BuilderIcons)
local CryoModule = require(Parent.Cryo)
local OptionsEnumModule = require(script.Parent.OptionsEnum)
local FFlagAppChatEnableMessageContextMenuModule = require(AppChat.Flags.FFlagAppChatEnableMessageContextMenu)
local config = {
	LayoutOrder = 1,
	isIncoming = false,
	handleEvent = function(_, _, _) end,
	emitImpressionTelemetryEvent = function() end
}

function Options(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), OptionsEnumModule (copy), FoundationModule (copy), BuilderIconsModule (copy), FFlagAppChatEnableMessageContextMenuModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	ReactModule.useEffect(function()
		-- upvalues: UnionResult (copy)
		UnionResult.emitImpressionTelemetryEvent()
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UnionResult (copy), ReactModule (upval), OptionsEnumModule (upval)
		UnionResult.handleEvent(ReactModule.Event.Activated, nil, OptionsEnumModule.MessageContextMenu)
	end, { UnionResult.handleEvent })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row auto-xy gap-xxsmall",
		LayoutOrder = UnionResult.LayoutOrder
	}, {
		Reply = ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UnionResult (copy), ReactModule (upval), OptionsEnumModule (upval)
				UnionResult.handleEvent(ReactModule.Event.Activated, nil, OptionsEnumModule.Reply)
			end, { UnionResult.handleEvent }),
			icon = BuilderIconsModule.Icon.ArrowThickToRight,
			variant = FoundationModule.Enums.ButtonVariant.Standard,
			size = FoundationModule.Enums.InputSize.Medium,
			LayoutOrder = if UnionResult.isIncoming then 1 else -1
		}),
		MessageContextMenu = if FFlagAppChatEnableMessageContextMenuModule then ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			onActivated = UseResult,
			icon = BuilderIconsModule.Icon.ThreeDotsHorizontal,
			variant = FoundationModule.Enums.ButtonVariant.Standard,
			size = FoundationModule.Enums.InputSize.Medium,
			LayoutOrder = if UnionResult.isIncoming then 2 else -2
		}) else nil
	})
end

return ReactModule.memo(Options)