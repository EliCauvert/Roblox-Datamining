local parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local constantsModule = require(script.Parent.Constants)
local flagsModule = require(script.Parent.Flags)
local traversalTelemetryModule = require(script.Parent.TraversalTelemetry)
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local menu = foundationModule.Menu
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local view = foundationModule.View
local useLocalization = localizationModule.Hooks.useLocalization
local fFlagTraversalHistoryMenuFocusNavFix = flagsModule.FFlagTraversalHistoryMenuFocusNavFix
local fFlagFixTraversalHistoryMenuFixesV3 = flagsModule.FFlagFixTraversalHistoryMenuFixesV3

local function _(p0) --[[ line: 43 | named "formatTags" ]]
	return if typeof(p0) == "table" then p0 else { [p0] = true }
end

local _ = function(value, p1, p2) --[[ line: 50 | named "setMenuSelection" ]]
	-- upvalues: popoverSide (ref)
	if not value or not value.current then return end
	if p2 == popoverSide.Top then
		value.current.NextSelectionUp = p1
		
		return
	elseif p2 == popoverSide.Bottom then
		value.current.NextSelectionDown = p1
	end
end

return reactModule.memo(reactModule.forwardRef(function(p3, p4) --[[ line: 65 | named "HistoryMenu" ]]
	-- upvalues: fFlagFixTraversalHistoryMenuFixesV3 (ref), reactModule (ref), constantsModule (ref), useLocalization (ref), popoverSide (ref), cryoModule (ref), fFlagTraversalHistoryMenuFocusNavFix (ref), traversalTelemetryModule (ref), iconName (ref), view (ref), icon (ref), menu (ref), popoverAlign (ref)
	local var7 = if not fFlagFixTraversalHistoryMenuFixesV3 then reactModule.useRef(nil) else nil
	local var8 = if p3.idleButtonStateIsDown ~= nil then constantsModule.DEFAULT_CHEVRON_BUTTON_STATE else p3.idleButtonStateIsDown
	local var9, var10 = reactModule.useState(false)
	local var11 = if var9 then not var8 else not var9 and var8
	local var12 = useLocalization({ history = "CoreScripts.TopBar.Traversal.History" })
	local var13 = if fFlagFixTraversalHistoryMenuFixesV3 then reactModule.useRef(nil) else nil
	local var14 = if fFlagFixTraversalHistoryMenuFixesV3 then reactModule.useCallback(function(p5) --[[ line: 88 ]]
		-- upvalues: var13 (ref), p3 (ref), popoverSide (copy)
		local menuSide = p3.menuSide
		
		if var13 then
			if not var13.current then return end
			if menuSide == popoverSide.Top then
				var13.current.NextSelectionUp = p5
				
				return
			elseif menuSide == popoverSide.Bottom then
				var13.current.NextSelectionDown = p5
			end
		end
	end, { p3.menuSide }) else nil
	local var15 = reactModule.useMemo(function() --[[ line: 93 ]]
		-- upvalues: p3 (ref), cryoModule (copy)
		local var19
		if p3.historyButtonTags then
			local historyButtonTags = p3.historyButtonTags
			var19 = if typeof(historyButtonTags) == "table" then historyButtonTags else { [historyButtonTags] = true }
		else
			var19 = {}
		end
		return cryoModule.Dictionary.join({
			["row auto-xy align-y-center align-x-center radius-medium"] = true
		}, var19)
	end, { p3.historyButtonTags })
	local var16 = reactModule.useCallback(function() --[[ line: 100 ]]
		-- upvalues: p3 (ref), var9 (ref), var10 (ref)
		if p3.onMenuToggled then
			p3.onMenuToggled(not var9)
		end
		var10(not var9)
	end, { var9, p3.onMenuToggled })
	local var17 = reactModule.useCallback(function() --[[ line: 108 ]]
		-- upvalues: var10 (ref), fFlagTraversalHistoryMenuFocusNavFix (copy), p3 (ref)
		var10(false)
		
		if fFlagTraversalHistoryMenuFocusNavFix and p3.onMenuToggled then
			p3.onMenuToggled(false)
		end
	end, {})
	
	if fFlagTraversalHistoryMenuFocusNavFix then
		reactModule.useEffect(function() --[[ line: 116 ]]
			-- upvalues: p3 (ref), var17 (ref)
			if p3.closeMenuConn then
				local var20 = p3.closeMenuConn(var17)
				
				return function() --[[ line: 122 ]]
					-- upvalues: var20 (ref)
					for i, v in var20 do
						v:Disconnect()
					end
				end
			end
		end, { p3.closeMenuConn, var17 })
	else
		reactModule.useEffect(function() --[[ line: 129 ]]
			-- upvalues: p3 (ref), var17 (ref)
			if p3.forceMenuClose then
				var17()
			end
		end, { p3.forceMenuClose, var17 })
	end
	local var18 = reactModule.useCallback(function() --[[ line: 150 ]]
		-- upvalues: traversalTelemetryModule (copy), var17 (ref), p3 (ref)
		traversalTelemetryModule.sendHistoryMenuHistoryClick({ integration_id = "history_landing", event_type = "click" })
		var17()
		p3.onHistorySelected()
	end, { var17, p3.onHistorySelected })
	
	return reactModule.createElement(view, { tag = "auto-xy" }, {
		ChevronButton = reactModule.createElement(view, {
			testId = "--chevron-button",
			tag = var15,
			onActivated = function() --[[ line: 184 ]]
				-- upvalues: traversalTelemetryModule (copy), var9 (ref), var16 (ref)
				traversalTelemetryModule.sendHistoryMenuButtonActionEvent({
					integration_id = "history_chevron",
					event_type = if not var9 then "open" else "close"
				})
				var16()
			end,
			ref = if fFlagFixTraversalHistoryMenuFixesV3 then var13 elseif p4 then nil else var7
		}, {
			Chevron = reactModule.createElement(icon, {
				name = if var11 then iconName.ChevronLargeDown else iconName.ChevronLargeUp
			})
		}),
		Menu = reactModule.createElement(menu, {
			align = popoverAlign.Start,
			anchorRef = p4 or (if fFlagFixTraversalHistoryMenuFixesV3 then var13 else var7),
			isOpen = var9,
			items = reactModule.useMemo(function() --[[ line: 160 ]]
				-- upvalues: cryoModule (copy), p3 (ref), var12 (ref), iconName (copy), var18 (ref)
				return cryoModule.List.join(cryoModule.List.map(p3.historyItems, function(p6) --[[ line: 161 ]]
					return { id = p6.universeId, text = p6.text, icon = p6.icon }
				end), {
					{
						id = "history",
						text = var12.history,
						icon = iconName.ClockSpinReverse,
						onActivated = var18
					}
				})
			end, { p3.historyItems }),
			onActivated = reactModule.useCallback(function(p7) --[[ line: 136 ]]
				-- upvalues: traversalTelemetryModule (copy), var17 (ref), p3 (ref)
				traversalTelemetryModule.sendHistoryMenuItemClick({
					integration_id = "history_dropdown",
					event_type = "click",
					destination_universe_id = tostring(p7)
				})
				var17()
				
				if p3.onMenuItemSelected then
					p3.onMenuItemSelected(p7)
					
					return
				end
			end, { var17, p3.onMenuItemSelected }),
			onPressedOutside = var17,
			side = p3.menuSide,
			size = p3.menuSize,
			width = if fFlagFixTraversalHistoryMenuFixesV3 and p4 and p4.current then UDim.new(0, p4.current.AbsoluteSize.X) else nil,
			ref = if fFlagFixTraversalHistoryMenuFixesV3 then var14 else nil
		})
	})
end))