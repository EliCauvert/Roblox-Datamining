local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local peopleServiceModule = require(parent.PeopleService)
local view = foundationModule.View
local coreButtonModule = require(peopleReactView.Components.Buttons.CoreButton)
local coreButtonConfigsModule = require(peopleReactView.Configs.CoreButtonConfigs)
local getFFlagAddPeoplePageCardLayout = peopleServiceModule.getService("Flags").GetFFlagAddPeoplePageCardLayout

local function MemoizedButton(p0) --[[ line: 19 ]]
	-- upvalues: reactModule (ref), coreButtonModule (ref)
	local config = p0.config
	local var7 = reactModule.useCallback(function(p1) --[[ line: 25 ]]
		-- upvalues: p0 (ref), config (ref)
		p0.onButtonMount(p1, config.id)
	end, { p0.onButtonMount, config.id })
	
	return reactModule.useMemo(function() --[[ line: 29 ]]
		-- upvalues: reactModule (copy), coreButtonModule (copy), config (ref), var7 (ref)
		return reactModule.createElement(coreButtonModule, {
			text = config.text,
			icon = { on = config.onIcon, off = config.offIcon },
			animatedIcon = config.animatedIcon,
			buttonState = config.buttonState,
			isNewIcon = config.isNewIcon,
			LayoutOrder = config.layoutOrder,
			onActivated = config.onActivated,
			onMount = var7
		})
	end, {
		config.text, config.onIcon, config.offIcon, config.animatedIcon,
		config.buttonState, config.isNewIcon, config.layoutOrder, config.onActivated,
		var7
	})
end

return function(p2) --[[ line: 57 ]]
	-- upvalues: coreButtonConfigsModule (ref), reactModule (ref), peopleServiceModule (ref), MemoizedButton (ref), view (ref), getFFlagAddPeoplePageCardLayout (ref)
	local var8 = coreButtonConfigsModule(p2.chromeEnabled, p2.buttonActivatedTable)
	local var9 = reactModule.useMemo(function() --[[ line: 62 ]]
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("FocusNavigationService")
	end, {})
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef({})
	local var12 = reactModule.useCallback(function(p3, p4) --[[ line: 72 ]]
		-- upvalues: var11 (ref)
		if p3 then
			var11.current[p4] = p3
			
			return
		end
		var11.current[p4] = nil
	end, {})
	local var13 = reactModule.useCallback(function(p5) --[[ line: 80 ]]
		-- upvalues: var10 (ref), peopleServiceModule (copy), var9 (ref)
		var10.current = p5
		
		if p5 then
			var9.registerScrollCallback(-1, function() --[[ line: 84 ]]
				-- upvalues: peopleServiceModule (copy), var10 (copy)
				local var18 = peopleServiceModule.getService("SettingsHubService").hubRef()
				
				if var18 and var18.ScrollToFrame and var10.current then
					var18:ScrollToFrame(var10.current, true)
				end
			end)
		end
	end, { var9 })
	reactModule.useEffect(function() --[[ line: 107 ]]
		-- upvalues: var8 (ref), var11 (ref), var9 (ref)
		local t = {}
		
		for i, v in ipairs(var8) do
			if v.shouldShow() then
				local id = var11.current[v.id]
				
				if id then
					table.insert(t, id)
				end
			end
		end
		if #t > 0 then
			table.sort(t, function(p6, p7) --[[ line: 121 ]]
				return p6.LayoutOrder < p7.LayoutOrder
			end)
			var9.registerButtonRow(-1, t, 0)
		end
	end, {
		var9,
		reactModule.useMemo(function() --[[ line: 96 ]]
			-- upvalues: var8 (ref)
			local t = {}
			
			for i, v in ipairs(var8) do
				if v.shouldShow() then
					table.insert(t, v.id)
				end
			end
			table.sort(t)
			
			return table.concat(t, ",")
		end, { var8 })
	})
	reactModule.useEffect(function() --[[ line: 130 ]]
		-- upvalues: var9 (ref)
		return function() --[[ line: 131 ]]
			-- upvalues: var9 (copy)
			var9.unregisterScrollCallback(-1)
			var9.unregisterButtonRow(-1)
		end
	end, { var9 })
	local var14 = reactModule.useMemo(function() --[[ line: 138 ]]
		-- upvalues: var8 (ref), reactModule (copy), MemoizedButton (copy), var12 (ref)
		local t = {}
		
		for i, v in ipairs(var8) do
			if v.shouldShow() then
				table.insert(t, reactModule.createElement(MemoizedButton, { key = v.id, config = v, onButtonMount = var12 }))
			end
		end
		return t
	end, { var8, var12 })
	
	if #var14 == 0 then
		return nil
	end
	local function _() --[[ line: 164 | named "getButtonElements" ]]
		-- upvalues: var14 (ref)
		local t = {}
		
		for i, v in ipairs(var14) do
			t["Button" .. i] = v
		end
		return t
	end
	
	local createElement = reactModule.createElement
	local t = {
		tag = "size-full-0 auto-y row gap-large",
		LayoutOrder = if getFFlagAddPeoplePageCardLayout() then p2.LayoutOrder else 1,
		ref = var13
	}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in ipairs(var14) do
		t_2["Button" .. i] = v
	end
	-- Unknown statement at pc 0: <SetList>
	
	return createElement(view, t, t_1)
end