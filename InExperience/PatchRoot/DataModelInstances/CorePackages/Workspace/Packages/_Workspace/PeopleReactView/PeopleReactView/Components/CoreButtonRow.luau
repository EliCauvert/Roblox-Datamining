local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local peopleServiceModule = require(parent.PeopleService)
local view = foundationModule.View
local coreButtonModule = require(peopleReactView.Components.Buttons.CoreButton)
local coreButtonConfigsModule = require(peopleReactView.Configs.CoreButtonConfigs)
local flags = peopleServiceModule.getService("Flags")
local getFFlagAddPeoplePageCardLayout = flags.GetFFlagAddPeoplePageCardLayout
local fFlagEnablePeoplePageButtonOnMount = flags.FFlagEnablePeoplePageButtonOnMount

local function MemoizedButton(p0) --[[ line: 21 ]]
	-- upvalues: reactModule (ref), fFlagEnablePeoplePageButtonOnMount (ref), coreButtonModule (ref)
	local config = p0.config
	local var8 = reactModule.useCallback(function(p1) --[[ line: 27 ]]
		-- upvalues: p0 (ref), config (ref), fFlagEnablePeoplePageButtonOnMount (copy)
		p0.onButtonMount(p1, config.id)
		
		if fFlagEnablePeoplePageButtonOnMount and p1 and config.onMount then
			config.onMount()
		end
	end, { config.onMount, p0.onButtonMount, config.id })
	
	return reactModule.useMemo(function() --[[ line: 34 ]]
		-- upvalues: reactModule (copy), coreButtonModule (copy), config (ref), var8 (ref)
		return reactModule.createElement(coreButtonModule, {
			text = config.text,
			icon = { on = config.onIcon, off = config.offIcon },
			animatedIcon = config.animatedIcon,
			buttonState = config.buttonState,
			isNewIcon = config.isNewIcon,
			LayoutOrder = config.layoutOrder,
			onActivated = config.onActivated,
			onMount = var8
		})
	end, {
		config.text, config.onIcon, config.offIcon, config.animatedIcon,
		config.buttonState, config.isNewIcon, config.layoutOrder, config.onActivated,
		var8
	})
end

return function(p2) --[[ line: 62 ]]
	-- upvalues: coreButtonConfigsModule (ref), reactModule (ref), peopleServiceModule (ref), MemoizedButton (ref), view (ref), getFFlagAddPeoplePageCardLayout (ref)
	local var9 = coreButtonConfigsModule(p2.chromeEnabled, p2.buttonActivatedTable)
	local var10 = reactModule.useMemo(function() --[[ line: 67 ]]
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("FocusNavigationService")
	end, {})
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef({})
	local var13 = reactModule.useCallback(function(p3, p4) --[[ line: 77 ]]
		-- upvalues: var12 (ref)
		if p3 then
			var12.current[p4] = p3
			
			return
		end
		var12.current[p4] = nil
	end, {})
	local var14 = reactModule.useCallback(function(p5) --[[ line: 85 ]]
		-- upvalues: var11 (ref), peopleServiceModule (copy), var10 (ref)
		var11.current = p5
		
		if p5 then
			var10.registerScrollCallback(-1, function() --[[ line: 89 ]]
				-- upvalues: peopleServiceModule (copy), var11 (copy)
				local var19 = peopleServiceModule.getService("SettingsHubService").hubRef()
				
				if var19 and var19.ScrollToFrame and var11.current then
					var19:ScrollToFrame(var11.current, true)
				end
			end)
		end
	end, { var10 })
	reactModule.useEffect(function() --[[ line: 112 ]]
		-- upvalues: var9 (ref), var12 (ref), var10 (ref)
		local t = {}
		
		for i, v in ipairs(var9) do
			if v.shouldShow() then
				local id = var12.current[v.id]
				
				if id then
					table.insert(t, id)
				end
			end
		end
		if #t > 0 then
			table.sort(t, function(p6, p7) --[[ line: 126 ]]
				return p6.LayoutOrder < p7.LayoutOrder
			end)
			var10.registerButtonRow(-1, t, 0)
		end
	end, {
		var10,
		reactModule.useMemo(function() --[[ line: 101 ]]
			-- upvalues: var9 (ref)
			local t = {}
			
			for i, v in ipairs(var9) do
				if v.shouldShow() then
					table.insert(t, v.id)
				end
			end
			table.sort(t)
			
			return table.concat(t, ",")
		end, { var9 })
	})
	reactModule.useEffect(function() --[[ line: 135 ]]
		-- upvalues: var10 (ref)
		return function() --[[ line: 136 ]]
			-- upvalues: var10 (copy)
			var10.unregisterScrollCallback(-1)
			var10.unregisterButtonRow(-1)
		end
	end, { var10 })
	local var15 = reactModule.useMemo(function() --[[ line: 143 ]]
		-- upvalues: var9 (ref), reactModule (copy), MemoizedButton (copy), var13 (ref)
		local t = {}
		
		for i, v in ipairs(var9) do
			if v.shouldShow() then
				table.insert(t, reactModule.createElement(MemoizedButton, { key = v.id, config = v, onButtonMount = var13 }))
			end
		end
		return t
	end, { var9, var13 })
	
	if #var15 == 0 then
		return nil
	end
	local function _() --[[ line: 169 | named "getButtonElements" ]]
		-- upvalues: var15 (ref)
		local t = {}
		
		for i, v in ipairs(var15) do
			t["Button" .. i] = v
		end
		return t
	end
	
	local createElement = reactModule.createElement
	local t = {
		tag = "size-full-0 auto-y row gap-large",
		LayoutOrder = if getFFlagAddPeoplePageCardLayout() then p2.LayoutOrder else 1,
		ref = var14
	}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in ipairs(var15) do
		t_2["Button" .. i] = v
	end
	-- Unknown statement at pc 0: <SetList>
	
	return createElement(view, t, t_1)
end