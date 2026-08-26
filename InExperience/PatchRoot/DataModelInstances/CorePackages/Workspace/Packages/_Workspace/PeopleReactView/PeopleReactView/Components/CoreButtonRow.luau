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

local function MemoizedButton(p1)
	-- upvalues: reactModule (ref), fFlagEnablePeoplePageButtonOnMount (ref), coreButtonModule (ref)
	local config = p1.config
	local var1 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), config (ref), fFlagEnablePeoplePageButtonOnMount (copy)
		p1.onButtonMount(p2, config.id)
		
		if fFlagEnablePeoplePageButtonOnMount and p2 and config.onMount then
			config.onMount()
		end
	end, { config.onMount, p1.onButtonMount, config.id })
	
	return reactModule.useMemo(function()
		-- upvalues: reactModule (copy), coreButtonModule (copy), config (ref), var1 (ref)
		return reactModule.createElement(coreButtonModule, {
			text = config.text,
			icon = { on = config.onIcon, off = config.offIcon },
			animatedIcon = config.animatedIcon,
			buttonState = config.buttonState,
			isNewIcon = config.isNewIcon,
			LayoutOrder = config.layoutOrder,
			onActivated = config.onActivated,
			onMount = var1
		})
	end, {
		config.text, config.onIcon, config.offIcon, config.animatedIcon,
		config.buttonState, config.isNewIcon, config.layoutOrder, config.onActivated,
		var1
	})
end

return function(p1)
	-- upvalues: coreButtonConfigsModule (ref), reactModule (ref), peopleServiceModule (ref), MemoizedButton (ref), view (ref), getFFlagAddPeoplePageCardLayout (ref)
	local var1 = coreButtonConfigsModule(p1.chromeEnabled, p1.buttonActivatedTable)
	local var2 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("FocusNavigationService")
	end, {})
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef({})
	local var5 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var4 (ref)
		if p2 then
			var4.current[p3] = p2
			
			return
		end
		var4.current[p3] = nil
	end, {})
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), peopleServiceModule (copy), var2 (ref)
		var3.current = p2
		
		if p2 then
			var2.registerScrollCallback(-1, function()
				-- upvalues: peopleServiceModule (copy), var3 (copy)
				local var7 = peopleServiceModule.getService("SettingsHubService").hubRef()
				
				if var7 and var7.ScrollToFrame and var3.current then
					var7:ScrollToFrame(var3.current, true)
				end
			end)
		end
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var4 (ref), var2 (ref)
		local t = {}
		
		for i, v in ipairs(var1) do
			if v.shouldShow() then
				local id = var4.current[v.id]
				
				if id then
					table.insert(t, id)
				end
			end
		end
		if #t > 0 then
			table.sort(t, function(p2, p3)
				return p2.LayoutOrder < p3.LayoutOrder
			end)
			var2.registerButtonRow(-1, t, 0)
		end
	end, {
		var2,
		reactModule.useMemo(function()
			-- upvalues: var1 (ref)
			local t = {}
			
			for i, v in ipairs(var1) do
				if v.shouldShow() then
					table.insert(t, v.id)
				end
			end
			table.sort(t)
			
			return table.concat(t, ",")
		end, { var1 })
	})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return function()
			-- upvalues: var2 (copy)
			var2.unregisterScrollCallback(-1)
			var2.unregisterButtonRow(-1)
		end
	end, { var2 })
	local var7 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), reactModule (copy), MemoizedButton (copy), var5 (ref)
		local t = {}
		
		for i, v in ipairs(var1) do
			if v.shouldShow() then
				table.insert(t, reactModule.createElement(MemoizedButton, { key = v.id, config = v, onButtonMount = var5 }))
			end
		end
		return t
	end, { var1, var5 })
	
	if #var7 == 0 then
		return nil
	end
	local function _()
		-- upvalues: var7 (ref)
		local t = {}
		
		for i, v in ipairs(var7) do
			t["Button" .. i] = v
		end
		return t
	end
	
	local createElement = reactModule.createElement
	local t = {
		tag = "size-full-0 auto-y row gap-large",
		LayoutOrder = if getFFlagAddPeoplePageCardLayout() then p1.LayoutOrder else 1,
		ref = var6
	}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in ipairs(var7) do
		t_2["Button" .. i] = v
	end
	-- Unknown statement at pc 0: <SetList>
	
	return createElement(view, t, t_1)
end