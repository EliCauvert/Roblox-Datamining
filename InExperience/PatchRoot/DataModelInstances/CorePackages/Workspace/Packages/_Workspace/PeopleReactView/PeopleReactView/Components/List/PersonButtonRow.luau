local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local peopleServiceModule = require(parent.PeopleService)
local view = require(parent.Foundation).View
local personButtonModule = require(peopleReactView.Components.Buttons.PersonButton)
local useDeviceOrientation = robloxAppHooksModule.useDeviceOrientation
local personButtonConfigsModule = require(peopleReactView.Configs.PersonButtonConfigs)
local getFFlagAddPeoplePageCardLayout = peopleServiceModule.getService("Flags").GetFFlagAddPeoplePageCardLayout

local function MemoizedButton(p0) --[[ line: 22 ]]
	-- upvalues: getFFlagAddPeoplePageCardLayout (ref), reactModule (ref), peopleServiceModule (ref), personButtonModule (ref)
	local config = p0.config
	local var8 = if getFFlagAddPeoplePageCardLayout() then reactModule.useMemo(function() --[[ line: 30 ]]
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("Constants")
	end, {}) else nil
	local var9 = reactModule.useCallback(function(p1) --[[ line: 35 ]]
		-- upvalues: p0 (ref)
		p0.onButtonMount(p1, p0.buttonId)
	end, { p0.onButtonMount })
	local var10 = if getFFlagAddPeoplePageCardLayout() then reactModule.useCallback(function() --[[ line: 40 ]]
		-- upvalues: config (ref), var8 (ref)
		if config.id == var8.PERSON_BUTTONS.BLOCK_PLAYER then
			config.onActivated("ingame_menu")
			
			return
		elseif config.id == var8.PERSON_BUTTONS.REPORT_PLAYER then
			config.onActivated("MenuPlayerList")
			
			return
		end
		config.onActivated(var8.ANALYTICS.ENTRY_POINT.PEOPLE_LIST)
	end, { config.id, config.onActivated }) else nil
	
	return reactModule.useMemo(function() --[[ line: 51 ]]
		-- upvalues: reactModule (copy), personButtonModule (copy), config (ref), getFFlagAddPeoplePageCardLayout (copy), var10 (ref), var9 (ref)
		return reactModule.createElement(personButtonModule, {
			text = config.text,
			icon = { on = config.onIcon, off = config.offIcon },
			animatedIcon = config.animatedIcon,
			buttonState = config.buttonState,
			LayoutOrder = config.layoutOrder,
			onActivated = if getFFlagAddPeoplePageCardLayout() then var10 else config.onActivated,
			isGrayedOut = config.isGrayedOut,
			isDisabled = config.isDisabled,
			isBuilderIcon = config.isBuilderIcon,
			buttonVariant = config.buttonVariant,
			onMount = var9
		})
	end, {
		config.text, config.onIcon, config.offIcon, config.animatedIcon,
		config.buttonState, config.layoutOrder, config.onActivated, config.isGrayedOut,
		config.isDisabled, config.isBuilderIcon, config.buttonVariant, var9
	})
end

return function(p2) --[[ line: 85 ]]
	-- upvalues: personButtonConfigsModule (ref), useDeviceOrientation (ref), robloxAppEnumsModule (ref), reactModule (ref), peopleServiceModule (ref), getFFlagAddPeoplePageCardLayout (ref), MemoizedButton (ref), view (ref)
	local var11 = personButtonConfigsModule(p2.userId)
	local var12 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait
	local var13 = reactModule.useMemo(function() --[[ line: 90 ]]
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("FocusNavigationService")
	end, {})
	local var14 = reactModule.useRef({})
	local var15 = reactModule.useCallback(function(p3, p4) --[[ line: 96 ]]
		-- upvalues: var14 (ref)
		if p3 then
			var14.current[p4] = p3
			
			return
		end
		var14.current[p4] = nil
	end, {})
	reactModule.useEffect(function() --[[ line: 123 ]]
		-- upvalues: getFFlagAddPeoplePageCardLayout (copy), var11 (ref), var14 (ref), p2 (ref), var13 (ref)
		local t = {}
		
		if getFFlagAddPeoplePageCardLayout() then
			for i, v in var11 do
				if v.shouldShow() then
					local id = var14.current[v.id]
					
					if id then
						table.insert(t, id)
					end
				end
			end
		else
			for i, v in ipairs(var11) do
				if v.shouldShow() then
					local id = var14.current[v.id]
					
					if id then
						table.insert(t, id)
					end
				end
			end
		end
		if #t > 0 then
			table.sort(t, function(p5, p6) --[[ line: 148 ]]
				return p5.LayoutOrder < p6.LayoutOrder
			end)
			var13.registerButtonRow(p2.userId, t, p2.index or 0)
		end
	end, {
		p2.userId,
		p2.index,
		var13,
		reactModule.useMemo(function() --[[ line: 104 ]]
			-- upvalues: getFFlagAddPeoplePageCardLayout (copy), var11 (ref)
			local t = {}
			
			if getFFlagAddPeoplePageCardLayout() then
				for i, v in var11 do
					if v.shouldShow() then
						table.insert(t, v.id)
					end
				end
			else
				for i, v in ipairs(var11) do
					if v.shouldShow() then
						table.insert(t, v.id)
					end
				end
			end
			table.sort(t)
			
			return table.concat(t, ",")
		end, { var11 })
	})
	reactModule.useEffect(function() --[[ line: 158 ]]
		-- upvalues: var13 (ref), p2 (ref)
		return function() --[[ line: 159 ]]
			-- upvalues: var13 (copy), p2 (copy)
			var13.handlePersonRemoved(p2.userId)
			var13.unregisterButtonRow(p2.userId)
		end
	end, { p2.userId, var13 })
	local var16 = reactModule.useMemo(function() --[[ line: 165 ]]
		-- upvalues: var13 (ref), p2 (ref)
		return var13.hasSelectablePlatformButton(p2.userId)
	end, { p2.userId, var13 })
	local var17 = reactModule.useMemo(function() --[[ line: 169 ]]
		-- upvalues: var16 (ref)
		return if var16 then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop
	end, { var16 })
	
	if not reactModule.useMemo(function() --[[ line: 174 ]]
		-- upvalues: getFFlagAddPeoplePageCardLayout (copy), var11 (ref)
		if getFFlagAddPeoplePageCardLayout() then
			for i, v in var11 do
				if v.shouldShow() then
					return true
				end
			end
		else
			for i, v in ipairs(var11) do
				if v.shouldShow() then
					return true
				end
			end
		end
		return false
	end, { var11 }) then
		return nil
	end
	local t = {}
	
	if getFFlagAddPeoplePageCardLayout() then
		for i, v in var11 do
			if v.shouldShow() then
				table.insert(t, reactModule.createElement(MemoizedButton, {
					key = v.id,
					config = v,
					buttonId = v.id,
					onButtonMount = var15
				}))
			end
		end
	else
		for i, v in ipairs(var11) do
			if v.shouldShow() then
				table.insert(t, reactModule.createElement(MemoizedButton, {
					key = v.id,
					config = v,
					buttonId = v.id,
					onButtonMount = var15
				}))
			end
		end
	end
	return reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = {
			["auto-xy row"] = true,
			["gap-small"] = var12,
			["gap-medium"] = not var12
		},
		selectionGroup = {
			SelectionBehaviorLeft = var17,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}, t)
end