local parent = script:FindFirstAncestor("PeopleReactView").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local signalsModule = require(parent.Signals)
local peopleServiceModule = require(parent.PeopleService)
local view = foundationModule.View
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local useCursor = foundationModule.Hooks.useCursor
local useSignalState = signalsReactModule.useSignalState
local flags = peopleServiceModule.getService("Flags")
local getFFlagAddPeoplePageCardLayout = flags.GetFFlagAddPeoplePageCardLayout
local getFFlagNewPeoplePageIcons = flags.GetFFlagNewPeoplePageIcons

local function useIconName(p1, p2, p3)
	-- upvalues: reactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), p2 (ref), p3 (ref)
		return if p1.animatedIcon then p2 elseif p1.icon then if not (not p1.icon.off or not p1.buttonState) then if p3 then p1.icon.off else p1.icon.on else p1.icon.on else ""
	end, {
		p2,
		p3,
		p1.icon,
		p1.animatedIcon,
		p1.buttonState
	})
end

local function _(value, p1)
	-- upvalues: reactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: value (ref), p1 (ref)
		return if value then p1.Color.Common.Shadow.Transparency else nil
	end, { value })
end

local _ = function(p1, p2)
	-- upvalues: reactModule (ref), getFFlagNewPeoplePageIcons (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), getFFlagNewPeoplePageIcons (copy), p2 (ref)
		return if p1 then if getFFlagNewPeoplePageIcons() then UDim2.fromOffset(p2.Size.Size_1800 * 2, p2.Size.Size_1000) else UDim2.new(0, p2.Size.Size_1800 * 2, 1, 0) else UDim2.fromOffset(p2.Size.Size_1000, p2.Size.Size_1000)
	end, { p1 })
end

local function MemoizedIconElement(p1)
	-- upvalues: useTokens (ref), useSignalState (ref), signalsModule (ref), useIconName (ref), reactModule (ref), iconButton (ref), iconSize (ref), buttonVariant (ref), icon (ref)
	local var1 = useTokens()
	local var2 = useSignalState(p1.isGrayedOut or signalsModule.createSignal(false))
	local var3 = useIconName(p1, useSignalState(p1.animatedIcon or signalsModule.createSignal("")), useSignalState(p1.buttonState or signalsModule.createSignal(false)))
	local var4 = if p1.isBuilderIcon then nil else reactModule.useMemo(function()
		-- upvalues: var2 (ref), var1 (ref)
		return if var2 then var1.Color.Common.Shadow.Transparency else nil
	end, { var2 })
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), p1 (ref), reactModule (copy), iconButton (copy), iconSize (copy), buttonVariant (copy), var2 (ref), icon (copy), var4 (ref)
		return if not (not var3 or var3 == "") then if p1.isBuilderIcon then reactModule.createElement(iconButton, {
			Selectable = false,
			icon = var3,
			size = iconSize.Medium,
			LayoutOrder = p1.LayoutOrder,
			variant = buttonVariant.Utility,
			isDisabled = var2,
			onActivated = p1.onActivated,
			ref = p1.onMount
		}) else reactModule.createElement(icon, {
			name = var3,
			size = iconSize.Medium,
			LayoutOrder = p1.LayoutOrder,
			style = { Transparency = var4 }
		}) else nil
	end, {
		p1.isBuilderIcon, var3, p1.LayoutOrder, var2, p1.onActivated, p1.onMount,
		var4
	})
end

local _ = function(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), button (ref), fillBehavior (ref), buttonVariant (ref)
	return if p1 then reactModule.createElement(button, {
		Selectable = false,
		text = p1,
		fillBehavior = fillBehavior.Fill,
		variant = if p2 then buttonVariant.Text else p3,
		onActivated = p4,
		LayoutOrder = p5
	}) else nil
end

return function(p1)
	-- upvalues: useTokens (ref), useSignalState (ref), signalsModule (ref), reactModule (ref), getFFlagNewPeoplePageIcons (ref), useCursor (ref), button (ref), fillBehavior (ref), buttonVariant (ref), view (ref), getFFlagAddPeoplePageCardLayout (ref), MemoizedIconElement (ref)
	local var1 = useTokens()
	local var2 = useSignalState(p1.isDisabled or signalsModule.createSignal(false))
	local var3 = useSignalState(if type(p1.text) == "function" then p1.text else signalsModule.createSignal(p1.text))
	local var4 = p1.text ~= nil
	
	return reactModule.createElement(view, {
		tag = if getFFlagAddPeoplePageCardLayout() then {
			["radius-medium row align-y-center align-x-center"] = true,
			["bg-action-standard"] = not p1.text and not p1.isBackgroundTransparent
		} else {
			["radius-medium row align-y-center align-x-center"] = p1.text ~= nil,
			["radius-medium row align-y-center align-x-center bg-action-standard"] = p1.text == nil
		},
		Size = reactModule.useMemo(function()
			-- upvalues: var4 (ref), getFFlagNewPeoplePageIcons (copy), var1 (ref)
			return if var4 then if getFFlagNewPeoplePageIcons() then UDim2.fromOffset(var1.Size.Size_1800 * 2, var1.Size.Size_1000) else UDim2.new(0, var1.Size.Size_1800 * 2, 1, 0) else UDim2.fromOffset(var1.Size.Size_1000, var1.Size.Size_1000)
		end, { var4 }),
		LayoutOrder = p1.LayoutOrder,
		onActivated = p1.onActivated,
		isDisabled = var2,
		selection = {
			SelectionImageObject = useCursor({
				radius = UDim.new(0, var1.Radius.Medium),
				offset = var1.Size.Size_150,
				borderWidth = var1.Stroke.Thicker
			})
		},
		ref = p1.onMount
	}, {
		Icon = reactModule.createElement(MemoizedIconElement, {
			icon = p1.icon,
			animatedIcon = p1.animatedIcon,
			buttonState = p1.buttonState,
			LayoutOrder = p1.LayoutOrder,
			isGrayedOut = p1.isGrayedOut,
			isBuilderIcon = p1.isBuilderIcon,
			onActivated = p1.onActivated,
			onMount = p1.onMount
		}),
		Text = if not var3 then nil else reactModule.createElement(button, {
			Selectable = false,
			LayoutOrder = 2,
			text = var3,
			fillBehavior = fillBehavior.Fill,
			variant = if var2 then buttonVariant.Text else useSignalState(if type(p1.buttonVariant) == "function" then p1.buttonVariant else signalsModule.createSignal(p1.buttonVariant)),
			onActivated = p1.onActivated
		})
	})
end