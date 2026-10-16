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

function Options(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), optionsEnumModule (ref), foundationModule (ref), builderIconsModule (ref), fFlagAppChatEnableMessageContextMenuModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		var1.emitImpressionTelemetryEvent()
	end, {})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row auto-xy gap-xxsmall",
		LayoutOrder = var1.LayoutOrder
	}, {
		Reply = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var1 (ref), reactModule (copy), optionsEnumModule (copy)
				var1.handleEvent(reactModule.Event.Activated, nil, optionsEnumModule.Reply)
			end, { var1.handleEvent }),
			icon = builderIconsModule.Icon.ArrowThickToRight,
			variant = foundationModule.Enums.ButtonVariant.Standard,
			size = foundationModule.Enums.InputSize.Medium,
			LayoutOrder = if var1.isIncoming then 1 else -1
		}),
		MessageContextMenu = if fFlagAppChatEnableMessageContextMenuModule then reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var1 (ref), reactModule (copy), optionsEnumModule (copy)
				var1.handleEvent(reactModule.Event.Activated, nil, optionsEnumModule.MessageContextMenu)
			end, { var1.handleEvent }),
			icon = builderIconsModule.Icon.ThreeDotsHorizontal,
			variant = foundationModule.Enums.ButtonVariant.Standard,
			size = foundationModule.Enums.InputSize.Medium,
			LayoutOrder = if var1.isIncoming then 2 else -2
		}) else nil
	})
end

return reactModule.memo(Options)