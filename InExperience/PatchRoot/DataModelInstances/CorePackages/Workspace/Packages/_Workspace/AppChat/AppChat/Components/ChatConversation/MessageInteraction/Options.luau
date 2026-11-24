local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local BuilderIconsModule = require(Parent.BuilderIcons)
local CryoModule = require(Parent.Cryo)
local OptionsEnumModule = require(script.Parent.OptionsEnum)
local FFlagAppChatEnableMessageContextMenuModule = require(AppChat.Flags.FFlagAppChatEnableMessageContextMenu)
local FFlagAppChatEnableReactions = require(Parent.SharedFlags).FFlagAppChatEnableReactions
local SignalsMigrationConfigModule = require(AppChat.Flags.SignalsMigrationConfig)
local config = {
	LayoutOrder = 1,
	isIncoming = false,
	handleEvent = function(_, _, _) end,
	emitImpressionTelemetryEvent = function() end
}

function Options(p1)
	-- upvalues: CryoModule (copy), config (copy), FoundationModule (copy), ReactModule (copy), OptionsEnumModule (copy), FFlagAppChatEnableReactions (copy), BuilderIconsModule (copy), FFlagAppChatEnableMessageContextMenuModule (copy), SignalsMigrationConfigModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	ReactModule.useEffect(function()
		-- upvalues: UnionResult (copy)
		UnionResult.emitImpressionTelemetryEvent()
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UnionResult (copy), ReactModule (upval), OptionsEnumModule (upval)
		UnionResult.handleEvent(ReactModule.Event.Activated, nil, OptionsEnumModule.MessageContextMenu)
	end, { UnionResult.handleEvent })
	local UseResult1 = if FFlagAppChatEnableReactions then ReactModule.useCallback(function()
		-- upvalues: UnionResult (copy), ReactModule (upval), OptionsEnumModule (upval)
		UnionResult.handleEvent(ReactModule.Event.Activated, nil, OptionsEnumModule.Reaction)
	end, { UnionResult.handleEvent }) else nil
	local config1 = {
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
		Reaction = if UnionResult.showReactionButton and UseResult1 then ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			onActivated = UseResult1,
			icon = BuilderIconsModule.Icon.CircleFaceEmoji,
			variant = FoundationModule.Enums.ButtonVariant.Standard,
			size = FoundationModule.Enums.InputSize.Medium,
			LayoutOrder = if UnionResult.isIncoming then 2 else -2
		}) else nil,
		MessageContextMenu = if FFlagAppChatEnableMessageContextMenuModule then ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			onActivated = UseResult,
			icon = BuilderIconsModule.Icon.ThreeDotsHorizontal,
			variant = FoundationModule.Enums.ButtonVariant.Standard,
			size = FoundationModule.Enums.InputSize.Medium,
			LayoutOrder = if UnionResult.isIncoming then 2 else -2
		}) else nil
	}
	
	return if SignalsMigrationConfigModule.shouldUseViewRecyclerMessageList then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(),
		LayoutOrder = UnionResult.LayoutOrder
	}, {
		Buttons = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.new()
		}, CryoModule.Dictionary.join(config1, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, UseTokensResult.Gap.XXSmall)
			})
		}))
	}) else ReactModule.createElement(FoundationModule.View, {
		tag = "row auto-xy gap-xxsmall",
		LayoutOrder = UnionResult.LayoutOrder
	}, config1)
end

return ReactModule.memo(Options)