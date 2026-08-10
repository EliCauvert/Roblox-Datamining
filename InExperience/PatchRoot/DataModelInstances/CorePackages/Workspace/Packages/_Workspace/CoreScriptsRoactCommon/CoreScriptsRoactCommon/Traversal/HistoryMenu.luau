local parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local constantsModule = require(script.Parent.Constants)
local traversalTelemetryModule = require(script.Parent.TraversalTelemetry)
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local menu = foundationModule.Menu
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local view = foundationModule.View
local useLocalization = localizationModule.Hooks.useLocalization

local function _(p0) --[[ line: 39 | named "formatTags" ]]
	return if typeof(p0) == "table" then p0 else { [p0] = true }
end

local _ = function(value, p1, p2) --[[ line: 46 | named "setMenuSelection" ]]
	-- upvalues: popoverSide (ref)
	if not value or not value.current then return end
	if p2 == popoverSide.Top then
		value.current.NextSelectionUp = p1
		
		return
	elseif p2 == popoverSide.Bottom then
		value.current.NextSelectionDown = p1
	end
end

return reactModule.memo(reactModule.forwardRef(function(p3, p4) --[[ line: 61 | named "HistoryMenu" ]]
	-- upvalues: constantsModule (ref), reactModule (ref), useLocalization (ref), popoverSide (ref), cryoModule (ref), traversalTelemetryModule (ref), iconName (ref), view (ref), icon (ref), menu (ref), popoverAlign (ref)
	local var6 = if p3.idleButtonStateIsDown ~= nil then constantsModule.DEFAULT_CHEVRON_BUTTON_STATE else p3.idleButtonStateIsDown
	local var7, var8 = reactModule.useState(false)
	local var9 = if var7 then not var6 else not var7 and var6
	local var10 = useLocalization({ history = "CoreScripts.TopBar.Traversal.History" })
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useCallback(function(p5) --[[ line: 76 ]]
		-- upvalues: var11 (ref), p3 (ref), popoverSide (copy)
		local menuSide = p3.menuSide
		
		if var11 then
			if not var11.current then return end
			if menuSide == popoverSide.Top then
				var11.current.NextSelectionUp = p5
				
				return
			elseif menuSide == popoverSide.Bottom then
				var11.current.NextSelectionDown = p5
			end
		end
	end, { p3.menuSide })
	local var13 = reactModule.useMemo(function() --[[ line: 80 ]]
		-- upvalues: p3 (ref), cryoModule (copy)
		local var17
		if p3.historyButtonTags then
			local historyButtonTags = p3.historyButtonTags
			var17 = if typeof(historyButtonTags) == "table" then historyButtonTags else { [historyButtonTags] = true }
		else
			var17 = {}
		end
		return cryoModule.Dictionary.join({
			["row auto-xy align-y-center align-x-center radius-medium"] = true
		}, var17)
	end, { p3.historyButtonTags })
	local var14 = reactModule.useCallback(function() --[[ line: 87 ]]
		-- upvalues: p3 (ref), var7 (ref), var8 (ref)
		if p3.onMenuToggled then
			p3.onMenuToggled(not var7)
		end
		var8(not var7)
	end, { var7, p3.onMenuToggled })
	local var15 = reactModule.useCallback(function() --[[ line: 95 ]]
		-- upvalues: var8 (ref), p3 (ref)
		var8(false)
		
		if p3.onMenuToggled then
			p3.onMenuToggled(false)
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 101 ]]
		-- upvalues: p3 (ref), var15 (ref)
		if p3.closeMenuConn then
			local var18 = p3.closeMenuConn(var15)
			
			return function() --[[ line: 107 ]]
				-- upvalues: var18 (ref)
				for i, v in var18 do
					v:Disconnect()
				end
			end
		end
	end, { p3.closeMenuConn, var15 })
	local var16 = reactModule.useCallback(function() --[[ line: 128 ]]
		-- upvalues: traversalTelemetryModule (copy), var15 (ref), p3 (ref)
		traversalTelemetryModule.sendHistoryMenuHistoryClick({ integration_id = "history_landing", event_type = "click" })
		var15()
		p3.onHistorySelected()
	end, { var15, p3.onHistorySelected })
	
	return reactModule.createElement(view, { tag = "auto-xy" }, {
		ChevronButton = reactModule.createElement(view, {
			testId = "--chevron-button",
			tag = var13,
			onActivated = function() --[[ line: 162 ]]
				-- upvalues: traversalTelemetryModule (copy), var7 (ref), var14 (ref)
				traversalTelemetryModule.sendHistoryMenuButtonActionEvent({
					integration_id = "history_chevron",
					event_type = if not var7 then "open" else "close"
				})
				var14()
			end,
			ref = var11
		}, {
			Chevron = reactModule.createElement(icon, {
				name = if var9 then iconName.ChevronLargeDown else iconName.ChevronLargeUp
			})
		}),
		Menu = reactModule.createElement(menu, {
			align = popoverAlign.Start,
			anchorRef = p4 or var11,
			isOpen = var7,
			items = reactModule.useMemo(function() --[[ line: 138 ]]
				-- upvalues: cryoModule (copy), p3 (ref), var10 (ref), iconName (copy), var16 (ref)
				return cryoModule.List.join(cryoModule.List.map(p3.historyItems, function(p6) --[[ line: 139 ]]
					return { id = p6.universeId, text = p6.text, icon = p6.icon }
				end), {
					{
						id = "history",
						text = var10.history,
						icon = iconName.ClockSpinReverse,
						onActivated = var16
					}
				})
			end, { p3.historyItems }),
			onActivated = reactModule.useCallback(function(p7) --[[ line: 114 ]]
				-- upvalues: traversalTelemetryModule (copy), var15 (ref), p3 (ref)
				traversalTelemetryModule.sendHistoryMenuItemClick({
					integration_id = "history_dropdown",
					event_type = "click",
					destination_universe_id = tostring(p7)
				})
				var15()
				
				if p3.onMenuItemSelected then
					p3.onMenuItemSelected(p7)
					
					return
				end
			end, { var15, p3.onMenuItemSelected }),
			onPressedOutside = var15,
			side = p3.menuSide,
			size = p3.menuSize,
			width = if p4 and p4.current then UDim.new(0, p4.current.AbsoluteSize.X) else nil,
			ref = var12
		})
	})
end))