local Parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ConstantsModule = require(script.Parent.Constants)
local TraversalTelemetryModule = require(script.Parent.TraversalTelemetry)
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local Menu = FoundationModule.Menu
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

local function _(p1)
	return if typeof(p1) == "table" then p1 else { [p1] = true }
end

local _ = function(p1, NextSelectionDown, Bottom)
	-- upvalues: PopoverSide (copy)
	if not p1 or not p1.current then return end
	if Bottom == PopoverSide.Top then
		p1.current.NextSelectionUp = NextSelectionDown
		
		return
	end
	if Bottom == PopoverSide.Bottom then
		p1.current.NextSelectionDown = NextSelectionDown
	end
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: ConstantsModule (copy), ReactModule (copy), UseLocalizationFunction (copy), PopoverSide (copy), CryoModule (copy), TraversalTelemetryModule (copy), IconName (copy), View (copy), Icon (copy), Menu (copy), PopoverAlign (copy)
	local DEFAULTCHEVRONBUTTONSTATE = if p1.idleButtonStateIsDown == nil then ConstantsModule.DEFAULT_CHEVRON_BUTTON_STATE else p1.idleButtonStateIsDown
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local NoDEFAULTCHEVRONBUTTONSTATE = UseStateResult and not DEFAULTCHEVRONBUTTONSTATE or not UseStateResult and DEFAULTCHEVRONBUTTONSTATE
	local UseLocalizationResult = UseLocalizationFunction({ history = "CoreScripts.TopBar.Traversal.History" })
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(NextSelectionDown)
		-- upvalues: UseRefResult (copy), p1 (copy), PopoverSide (upval)
		local MenuSide = p1.menuSide
		
		if UseRefResult then
			if not UseRefResult.current then return end
			if MenuSide == PopoverSide.Top then
				UseRefResult.current.NextSelectionUp = NextSelectionDown
				
				return
			end
			if MenuSide == PopoverSide.Bottom then
				UseRefResult.current.NextSelectionDown = NextSelectionDown
			end
		end
	end, { p1.menuSide })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), CryoModule (upval)
		local HistoryButtonTags1 = nil
		if p1.historyButtonTags then
			local HistoryButtonTags = p1.historyButtonTags
			HistoryButtonTags1 = if typeof(HistoryButtonTags) == "table" then HistoryButtonTags else { [HistoryButtonTags] = true }
		else
			HistoryButtonTags1 = {}
		end
		return CryoModule.Dictionary.join({
			["row auto-xy align-y-center align-x-center radius-medium"] = true
		}, HistoryButtonTags1)
	end, { p1.historyButtonTags })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseStateResult (copy), UseStateResult2 (copy)
		if p1.onMenuToggled then
			p1.onMenuToggled(not UseStateResult)
		end
		UseStateResult2(not UseStateResult)
	end, { UseStateResult, p1.onMenuToggled })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(false)
		
		if p1.onMenuToggled then
			p1.onMenuToggled(false)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseResult2 (copy)
		if not p1.closeMenuConn then return end
		local CloseMenuConnResult = p1.closeMenuConn(UseResult2)
		
		return function()
			-- upvalues: CloseMenuConnResult (copy)
			for _, Connection in CloseMenuConnResult do
				Connection:Disconnect()
			end
		end
	end, { p1.closeMenuConn, UseResult2 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: TraversalTelemetryModule (upval), UseResult2 (copy), p1 (copy)
		TraversalTelemetryModule.sendHistoryMenuHistoryClick({ integration_id = "history_landing", event_type = "click" })
		UseResult2()
		p1.onHistorySelected()
	end, { UseResult2, p1.onHistorySelected })
	
	return ReactModule.createElement(View, { tag = "auto-xy" }, {
		ChevronButton = ReactModule.createElement(View, {
			testId = "--chevron-button",
			tag = UseMemoResult,
			onActivated = function()
				-- upvalues: TraversalTelemetryModule (upval), UseStateResult (copy), UseResult1 (copy)
				TraversalTelemetryModule.sendHistoryMenuButtonActionEvent({
					integration_id = "history_chevron",
					event_type = if UseStateResult then "close" else "open"
				})
				UseResult1()
			end,
			ref = UseRefResult
		}, {
			Chevron = ReactModule.createElement(Icon, {
				name = if NoDEFAULTCHEVRONBUTTONSTATE then IconName.ChevronLargeDown else IconName.ChevronLargeUp
			})
		}),
		Menu = ReactModule.createElement(Menu, {
			align = PopoverAlign.Start,
			anchorRef = p2 or UseRefResult,
			isOpen = UseStateResult,
			items = ReactModule.useMemo(function()
				-- upvalues: CryoModule (upval), p1 (copy), UseLocalizationResult (copy), IconName (upval), UseResult3 (copy)
				return (CryoModule.List.join(CryoModule.List.map(p1.historyItems, function(p3)
					return { id = p3.universeId, text = p3.text, icon = p3.icon }
				end), {
					{
						id = "history",
						text = UseLocalizationResult.history,
						icon = IconName.ClockSpinReverse,
						onActivated = UseResult3
					}
				}))
			end, { p1.historyItems }),
			onActivated = ReactModule.useCallback(function(p3)
				-- upvalues: TraversalTelemetryModule (upval), UseResult2 (copy), p1 (copy)
				TraversalTelemetryModule.sendHistoryMenuItemClick({
					integration_id = "history_dropdown",
					event_type = "click",
					destination_universe_id = tostring(p3)
				})
				UseResult2()
				
				if p1.onMenuItemSelected then
					p1.onMenuItemSelected(p3)
					
					return
				end
			end, { UseResult2, p1.onMenuItemSelected }),
			onPressedOutside = UseResult2,
			side = p1.menuSide,
			size = p1.menuSize,
			width = if p2 and p2.current then UDim.new(0, p2.current.AbsoluteSize.X) else nil,
			ref = UseResult
		})
	})
end))