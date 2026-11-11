local Parent = script:FindFirstAncestor("PeopleReactView").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCursorFunction = FoundationModule.Hooks.useCursor
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FlagsService = require(Parent.PeopleService).getService("Flags")
local GetFFlagAddPeoplePageCardLayoutFunction = FlagsService.GetFFlagAddPeoplePageCardLayout
local GetFFlagNewPeoplePageIconsFunction = FlagsService.GetFFlagNewPeoplePageIcons

local function useIconName(Frame, p1, p2)
	-- upvalues: ReactModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: Frame (copy), p1 (copy), p2 (copy)
		return if Frame.animatedIcon then p1 elseif Frame.icon then if Frame.icon.off and Frame.buttonState and p2 then Frame.icon.off else Frame.icon.on else ""
	end, {
		p1,
		p2,
		Frame.icon,
		Frame.animatedIcon,
		Frame.buttonState
	})
end

local function _(IsDisabled, p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: IsDisabled (copy), p1 (copy)
		return if IsDisabled then p1.Color.Common.Shadow.Transparency else nil
	end, { IsDisabled })
end

local _ = function(p1, p2)
	-- upvalues: ReactModule (copy), GetFFlagNewPeoplePageIconsFunction (copy)
	return ReactModule.useMemo(function(): UDim2
		-- upvalues: p1 (copy), GetFFlagNewPeoplePageIconsFunction (upval), p2 (copy)
		return if p1 then if GetFFlagNewPeoplePageIconsFunction() then UDim2.fromOffset(p2.Size.Size_1800 * 2, p2.Size.Size_1000) else UDim2.new(0, p2.Size.Size_1800 * 2, 1, 0) else UDim2.fromOffset(p2.Size.Size_1000, p2.Size.Size_1000)
	end, { p1 })
end

local function MemoizedIconElement(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), UseSignalStateFunction (copy), SignalsModule (copy), useIconName (copy), ReactModule (copy), IconButton (copy), IconSize (copy), ButtonVariant (copy), Icon (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = UseSignalStateFunction(Frame.animatedIcon or SignalsModule.createSignal(""))
	local UseSignalStateResult1 = UseSignalStateFunction(Frame.buttonState or SignalsModule.createSignal(false))
	local UseSignalStateResult2 = UseSignalStateFunction(Frame.isGrayedOut or SignalsModule.createSignal(false))
	local UseIconNameResult = useIconName(Frame, UseSignalStateResult, UseSignalStateResult1)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult2 (copy), UseTokensResult (copy)
		return if UseSignalStateResult2 then UseTokensResult.Color.Common.Shadow.Transparency else nil
	end, { UseSignalStateResult2 })
	local UseMemoResult1 = if Frame.isBuilderIcon then nil else UseMemoResult
	
	return ReactModule.useMemo(function()
		-- upvalues: UseIconNameResult (copy), Frame (copy), ReactModule (upval), IconButton (upval), IconSize (upval), ButtonVariant (upval), UseSignalStateResult2 (copy), Icon (upval), UseMemoResult1 (copy)
		return if UseIconNameResult and UseIconNameResult ~= "" then if Frame.isBuilderIcon then ReactModule.createElement(IconButton, {
			Selectable = false,
			icon = UseIconNameResult,
			size = IconSize.Medium,
			LayoutOrder = Frame.LayoutOrder,
			variant = ButtonVariant.Utility,
			isDisabled = UseSignalStateResult2,
			onActivated = Frame.onActivated,
			ref = Frame.onMount
		}) else ReactModule.createElement(Icon, {
			name = UseIconNameResult,
			size = IconSize.Medium,
			LayoutOrder = Frame.LayoutOrder,
			style = { Transparency = UseMemoResult1 }
		}) else nil
	end, {
		Frame.isBuilderIcon, UseIconNameResult, Frame.LayoutOrder,
		UseSignalStateResult2, Frame.onActivated, Frame.onMount, UseMemoResult1
	})
end

local _ = function(Text, p1, p2, OnActivated, LayoutOrder)
	-- upvalues: ReactModule (copy), Button (copy), FillBehavior (copy), ButtonVariant (copy)
	return if Text then ReactModule.createElement(Button, {
		Selectable = false,
		text = Text,
		fillBehavior = FillBehavior.Fill,
		variant = if p1 then ButtonVariant.Text else p2,
		onActivated = OnActivated,
		LayoutOrder = LayoutOrder
	}) else nil
end

return function(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), UseSignalStateFunction (copy), SignalsModule (copy), ReactModule (copy), GetFFlagNewPeoplePageIconsFunction (copy), UseCursorFunction (copy), Button (copy), FillBehavior (copy), ButtonVariant (copy), View (copy), GetFFlagAddPeoplePageCardLayoutFunction (copy), MemoizedIconElement (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = UseSignalStateFunction(Frame.isDisabled or SignalsModule.createSignal(false))
	local UseSignalStateResult1 = UseSignalStateFunction(type(Frame.text) == "function" and Frame.text or SignalsModule.createSignal(Frame.text))
	local UseSignalStateResult2 = UseSignalStateFunction(type(Frame.buttonVariant) == "function" and Frame.buttonVariant or SignalsModule.createSignal(Frame.buttonVariant))
	local HasText = Frame.text ~= nil
	local OnActivated = Frame.onActivated
	
	return ReactModule.createElement(View, {
		tag = if GetFFlagAddPeoplePageCardLayoutFunction() then {
			["radius-medium row align-y-center align-x-center"] = true,
			["bg-action-standard"] = not Frame.text and not Frame.isBackgroundTransparent
		} else {
			["radius-medium row align-y-center align-x-center"] = Frame.text ~= nil,
			["radius-medium row align-y-center align-x-center bg-action-standard"] = Frame.text == nil
		},
		Size = ReactModule.useMemo(function(): UDim2
			-- upvalues: HasText (copy), GetFFlagNewPeoplePageIconsFunction (upval), UseTokensResult (copy)
			return if HasText then if GetFFlagNewPeoplePageIconsFunction() then UDim2.fromOffset(UseTokensResult.Size.Size_1800 * 2, UseTokensResult.Size.Size_1000) else UDim2.new(0, UseTokensResult.Size.Size_1800 * 2, 1, 0) else UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000)
		end, { HasText }),
		LayoutOrder = Frame.LayoutOrder,
		onActivated = Frame.onActivated,
		isDisabled = UseSignalStateResult,
		selection = {
			SelectionImageObject = UseCursorFunction({
				radius = UDim.new(0, UseTokensResult.Radius.Medium),
				offset = UseTokensResult.Size.Size_150,
				borderWidth = UseTokensResult.Stroke.Thicker
			})
		},
		ref = Frame.onMount
	}, {
		Icon = ReactModule.createElement(MemoizedIconElement, {
			icon = Frame.icon,
			animatedIcon = Frame.animatedIcon,
			buttonState = Frame.buttonState,
			LayoutOrder = Frame.LayoutOrder,
			isGrayedOut = Frame.isGrayedOut,
			isBuilderIcon = Frame.isBuilderIcon,
			onActivated = Frame.onActivated,
			onMount = Frame.onMount
		}),
		Text = if UseSignalStateResult1 then ReactModule.createElement(Button, {
			Selectable = false,
			LayoutOrder = 2,
			text = UseSignalStateResult1,
			fillBehavior = FillBehavior.Fill,
			variant = if UseSignalStateResult then ButtonVariant.Text else UseSignalStateResult2,
			onActivated = OnActivated
		}) else nil
	})
end