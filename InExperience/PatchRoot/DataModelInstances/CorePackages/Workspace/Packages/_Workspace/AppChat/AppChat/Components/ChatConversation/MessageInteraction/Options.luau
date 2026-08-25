local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local builderIconsModule = require(parent.BuilderIcons)
local cryoModule = require(parent.Cryo)
local optionsEnumModule = require(script.Parent.OptionsEnum)
local fFlagAppChatEnableMessageContextMenuModule = require(appChat.Flags.FFlagAppChatEnableMessageContextMenu)
local t = {
	LayoutOrder = 1,
	isIncoming = false,
	handleEvent = function(_, _, _) end,
	emitImpressionTelemetryEvent = function() end
}

function Options(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), optionsEnumModule (ref), foundationModule (ref), builderIconsModule (ref), fFlagAppChatEnableMessageContextMenuModule (ref)
	local var8 = cryoModule.Dictionary.union(t, p0)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref)
		var8.emitImpressionTelemetryEvent()
	end, {})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row auto-xy gap-xxsmall",
		LayoutOrder = var8.LayoutOrder
	}, {
		Reply = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var8 (ref), reactModule (copy), optionsEnumModule (copy)
				var8.handleEvent(reactModule.Event.Activated, nil, optionsEnumModule.Reply)
			end, { var8.handleEvent }),
			icon = builderIconsModule.Icon.ArrowThickToRight,
			variant = foundationModule.Enums.ButtonVariant.Standard,
			size = foundationModule.Enums.InputSize.Medium,
			LayoutOrder = if var8.isIncoming then 1 else -1
		}),
		MessageContextMenu = if fFlagAppChatEnableMessageContextMenuModule then reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var8 (ref), reactModule (copy), optionsEnumModule (copy)
				var8.handleEvent(reactModule.Event.Activated, nil, optionsEnumModule.MessageContextMenu)
			end, { var8.handleEvent }),
			icon = builderIconsModule.Icon.ThreeDotsHorizontal,
			variant = foundationModule.Enums.ButtonVariant.Standard,
			size = foundationModule.Enums.InputSize.Medium,
			LayoutOrder = if var8.isIncoming then 2 else -2
		}) else nil
	})
end

return reactModule.memo(Options)