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

local function useIconName(p0, p1, p2)
	-- upvalues: reactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p0 (ref), p1 (ref), p2 (ref)
		return if p0.animatedIcon then p1 elseif p0.icon then if not (not p0.icon.off or not p0.buttonState) then if p2 then p0.icon.off else p0.icon.on else p0.icon.on else ""
	end, {
		p1,
		p2,
		p0.icon,
		p0.animatedIcon,
		p0.buttonState
	})
end

local function _(value, p3)
	-- upvalues: reactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: value (ref), p3 (ref)
		return if value then p3.Color.Common.Shadow.Transparency else nil
	end, { value })
end

local _ = function(p4, p5)
	-- upvalues: reactModule (ref), getFFlagNewPeoplePageIcons (ref)
	return reactModule.useMemo(function()
		-- upvalues: p4 (ref), getFFlagNewPeoplePageIcons (copy), p5 (ref)
		return if p4 then if getFFlagNewPeoplePageIcons() then UDim2.fromOffset(p5.Size.Size_1800 * 2, p5.Size.Size_1000) else UDim2.new(0, p5.Size.Size_1800 * 2, 1, 0) else UDim2.fromOffset(p5.Size.Size_1000, p5.Size.Size_1000)
	end, { p4 })
end

local function MemoizedIconElement(p6)
	-- upvalues: useTokens (ref), useSignalState (ref), signalsModule (ref), useIconName (ref), reactModule (ref), iconButton (ref), iconSize (ref), buttonVariant (ref), icon (ref)
	local var8 = useTokens()
	local var9 = useSignalState(p6.isGrayedOut or signalsModule.createSignal(false))
	local var10 = useIconName(p6, useSignalState(p6.animatedIcon or signalsModule.createSignal("")), useSignalState(p6.buttonState or signalsModule.createSignal(false)))
	local var11 = if p6.isBuilderIcon then nil else reactModule.useMemo(function()
		-- upvalues: var9 (ref), var8 (ref)
		return if var9 then var8.Color.Common.Shadow.Transparency else nil
	end, { var9 })
	
	return reactModule.useMemo(function()
		-- upvalues: var10 (ref), p6 (ref), reactModule (copy), iconButton (copy), iconSize (copy), buttonVariant (copy), var9 (ref), icon (copy), var11 (ref)
		return if not (not var10 or var10 == "") then if p6.isBuilderIcon then reactModule.createElement(iconButton, {
			Selectable = false,
			icon = var10,
			size = iconSize.Medium,
			LayoutOrder = p6.LayoutOrder,
			variant = buttonVariant.Utility,
			isDisabled = var9,
			onActivated = p6.onActivated,
			ref = p6.onMount
		}) else reactModule.createElement(icon, {
			name = var10,
			size = iconSize.Medium,
			LayoutOrder = p6.LayoutOrder,
			style = { Transparency = var11 }
		}) else nil
	end, {
		p6.isBuilderIcon, var10, p6.LayoutOrder, var9, p6.onActivated, p6.onMount,
		var11
	})
end

local _ = function(p7, p8, p9, p10, p11)
	-- upvalues: reactModule (ref), button (ref), fillBehavior (ref), buttonVariant (ref)
	return if p7 then reactModule.createElement(button, {
		Selectable = false,
		text = p7,
		fillBehavior = fillBehavior.Fill,
		variant = if p8 then buttonVariant.Text else p9,
		onActivated = p10,
		LayoutOrder = p11
	}) else nil
end

return function(p12)
	-- upvalues: useTokens (ref), useSignalState (ref), signalsModule (ref), reactModule (ref), getFFlagNewPeoplePageIcons (ref), useCursor (ref), button (ref), fillBehavior (ref), buttonVariant (ref), view (ref), getFFlagAddPeoplePageCardLayout (ref), MemoizedIconElement (ref)
	local var12 = useTokens()
	local var13 = useSignalState(p12.isDisabled or signalsModule.createSignal(false))
	local var14 = useSignalState(if type(p12.text) == "function" then p12.text else signalsModule.createSignal(p12.text))
	local var15 = p12.text ~= nil
	
	return reactModule.createElement(view, {
		tag = if getFFlagAddPeoplePageCardLayout() then {
			["radius-medium row align-y-center align-x-center"] = true,
			["bg-action-standard"] = not p12.text and not p12.isBackgroundTransparent
		} else {
			["radius-medium row align-y-center align-x-center"] = p12.text ~= nil,
			["radius-medium row align-y-center align-x-center bg-action-standard"] = p12.text == nil
		},
		Size = reactModule.useMemo(function()
			-- upvalues: var15 (ref), getFFlagNewPeoplePageIcons (copy), var12 (ref)
			return if var15 then if getFFlagNewPeoplePageIcons() then UDim2.fromOffset(var12.Size.Size_1800 * 2, var12.Size.Size_1000) else UDim2.new(0, var12.Size.Size_1800 * 2, 1, 0) else UDim2.fromOffset(var12.Size.Size_1000, var12.Size.Size_1000)
		end, { var15 }),
		LayoutOrder = p12.LayoutOrder,
		onActivated = p12.onActivated,
		isDisabled = var13,
		selection = {
			SelectionImageObject = useCursor({
				radius = UDim.new(0, var12.Radius.Medium),
				offset = var12.Size.Size_150,
				borderWidth = var12.Stroke.Thicker
			})
		},
		ref = p12.onMount
	}, {
		Icon = reactModule.createElement(MemoizedIconElement, {
			icon = p12.icon,
			animatedIcon = p12.animatedIcon,
			buttonState = p12.buttonState,
			LayoutOrder = p12.LayoutOrder,
			isGrayedOut = p12.isGrayedOut,
			isBuilderIcon = p12.isBuilderIcon,
			onActivated = p12.onActivated,
			onMount = p12.onMount
		}),
		Text = if not var14 then nil else reactModule.createElement(button, {
			Selectable = false,
			LayoutOrder = 2,
			text = var14,
			fillBehavior = fillBehavior.Fill,
			variant = if var13 then buttonVariant.Text else useSignalState(if type(p12.buttonVariant) == "function" then p12.buttonVariant else signalsModule.createSignal(p12.buttonVariant)),
			onActivated = p12.onActivated
		})
	})
end