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

local function _(p1)
	return if typeof(p1) == "table" then p1 else { [p1] = true }
end

local _ = function(value, p1, p2)
	-- upvalues: popoverSide (ref)
	if not value or not value.current then return end
	if p2 == popoverSide.Top then
		value.current.NextSelectionUp = p1
		
		return
	elseif p2 == popoverSide.Bottom then
		value.current.NextSelectionDown = p1
	end
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: constantsModule (ref), reactModule (ref), useLocalization (ref), popoverSide (ref), cryoModule (ref), traversalTelemetryModule (ref), iconName (ref), view (ref), icon (ref), menu (ref), popoverAlign (ref)
	local var1 = if p1.idleButtonStateIsDown ~= nil then constantsModule.DEFAULT_CHEVRON_BUTTON_STATE else p1.idleButtonStateIsDown
	local var2, var3 = reactModule.useState(false)
	local var4 = if var2 then not var1 else not var2 and var1
	local var5 = useLocalization({ history = "CoreScripts.TopBar.Traversal.History" })
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useCallback(function(p3)
		-- upvalues: var6 (ref), p1 (ref), popoverSide (copy)
		local menuSide = p1.menuSide
		
		if var6 then
			if not var6.current then return end
			if menuSide == popoverSide.Top then
				var6.current.NextSelectionUp = p3
				
				return
			elseif menuSide == popoverSide.Bottom then
				var6.current.NextSelectionDown = p3
			end
		end
	end, { p1.menuSide })
	local var8 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), cryoModule (copy)
		local var9
		if p1.historyButtonTags then
			local historyButtonTags = p1.historyButtonTags
			var9 = if typeof(historyButtonTags) == "table" then historyButtonTags else { [historyButtonTags] = true }
		else
			var9 = {}
		end
		return cryoModule.Dictionary.join({
			["row auto-xy align-y-center align-x-center radius-medium"] = true
		}, var9)
	end, { p1.historyButtonTags })
	local var9 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var2 (ref), var3 (ref)
		if p1.onMenuToggled then
			p1.onMenuToggled(not var2)
		end
		var3(not var2)
	end, { var2, p1.onMenuToggled })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), p1 (ref)
		var3(false)
		
		if p1.onMenuToggled then
			p1.onMenuToggled(false)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var10 (ref)
		if p1.closeMenuConn then
			local var11 = p1.closeMenuConn(var10)
			
			return function()
				-- upvalues: var11 (ref)
				for i, v in var11 do
					v:Disconnect()
				end
			end
		end
	end, { p1.closeMenuConn, var10 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: traversalTelemetryModule (copy), var10 (ref), p1 (ref)
		traversalTelemetryModule.sendHistoryMenuHistoryClick({ integration_id = "history_landing", event_type = "click" })
		var10()
		p1.onHistorySelected()
	end, { var10, p1.onHistorySelected })
	
	return reactModule.createElement(view, { tag = "auto-xy" }, {
		ChevronButton = reactModule.createElement(view, {
			testId = "--chevron-button",
			tag = var8,
			onActivated = function()
				-- upvalues: traversalTelemetryModule (copy), var2 (ref), var9 (ref)
				traversalTelemetryModule.sendHistoryMenuButtonActionEvent({
					integration_id = "history_chevron",
					event_type = if not var2 then "open" else "close"
				})
				var9()
			end,
			ref = var6
		}, {
			Chevron = reactModule.createElement(icon, {
				name = if var4 then iconName.ChevronLargeDown else iconName.ChevronLargeUp
			})
		}),
		Menu = reactModule.createElement(menu, {
			align = popoverAlign.Start,
			anchorRef = p2 or var6,
			isOpen = var2,
			items = reactModule.useMemo(function()
				-- upvalues: cryoModule (copy), p1 (ref), var5 (ref), iconName (copy), var12 (ref)
				return cryoModule.List.join(cryoModule.List.map(p1.historyItems, function(p3)
					return { id = p3.universeId, text = p3.text, icon = p3.icon }
				end), {
					{
						id = "history",
						text = var5.history,
						icon = iconName.ClockSpinReverse,
						onActivated = var12
					}
				})
			end, { p1.historyItems }),
			onActivated = reactModule.useCallback(function(p3)
				-- upvalues: traversalTelemetryModule (copy), var10 (ref), p1 (ref)
				traversalTelemetryModule.sendHistoryMenuItemClick({
					integration_id = "history_dropdown",
					event_type = "click",
					destination_universe_id = tostring(p3)
				})
				var10()
				
				if p1.onMenuItemSelected then
					p1.onMenuItemSelected(p3)
					
					return
				end
			end, { var10, p1.onMenuItemSelected }),
			onPressedOutside = var10,
			side = p1.menuSide,
			size = p1.menuSize,
			width = if p2 and p2.current then UDim.new(0, p2.current.AbsoluteSize.X) else nil,
			ref = var7
		})
	})
end))