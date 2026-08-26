local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local foundationModule = require(parent.Foundation)
local peopleServiceModule = require(parent.PeopleService)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View
local personButtonModule = require(peopleReactView.Components.Buttons.PersonButton)
local muteVolumeButtonModule = require(peopleReactView.Components.Buttons.MuteVolumeButton)
local useDeviceOrientation = robloxAppHooksModule.useDeviceOrientation
local useSignalState = signalsReactModule.useSignalState
local personButtonConfigsModule = require(peopleReactView.Configs.PersonButtonConfigs)
local flags = peopleServiceModule.getService("Flags")
local getFFlagAddPeoplePageCardLayout = flags.GetFFlagAddPeoplePageCardLayout
local fFlagVoiceVolumeControlsPerUserPlayerListButton = flags.FFlagVoiceVolumeControlsPerUserPlayerListButton

local function MemoizedButton(p1)
	-- upvalues: getFFlagAddPeoplePageCardLayout (ref), reactModule (ref), peopleServiceModule (ref), personButtonModule (ref)
	local config = p1.config
	local var1 = if getFFlagAddPeoplePageCardLayout() then reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("Constants")
	end, {}) else nil
	local var2 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		p1.onButtonMount(p2, p1.buttonId)
	end, { p1.onButtonMount })
	local var3 = if getFFlagAddPeoplePageCardLayout() then reactModule.useCallback(function()
		-- upvalues: config (ref), var1 (ref)
		if config.id == var1.PERSON_BUTTONS.BLOCK_PLAYER then
			config.onActivated("ingame_menu")
			
			return
		elseif config.id == var1.PERSON_BUTTONS.REPORT_PLAYER then
			config.onActivated("MenuPlayerList")
			
			return
		end
		config.onActivated(var1.ANALYTICS.ENTRY_POINT.PEOPLE_LIST)
	end, { config.id, config.onActivated }) else nil
	
	return reactModule.useMemo(function()
		-- upvalues: reactModule (copy), personButtonModule (copy), config (ref), getFFlagAddPeoplePageCardLayout (copy), var3 (ref), var2 (ref)
		return reactModule.createElement(personButtonModule, {
			text = config.text,
			icon = { on = config.onIcon, off = config.offIcon },
			animatedIcon = config.animatedIcon,
			buttonState = config.buttonState,
			LayoutOrder = config.layoutOrder,
			onActivated = if getFFlagAddPeoplePageCardLayout() then var3 else config.onActivated,
			isGrayedOut = config.isGrayedOut,
			isDisabled = config.isDisabled,
			isBuilderIcon = config.isBuilderIcon,
			buttonVariant = config.buttonVariant,
			onMount = var2
		})
	end, {
		config.text, config.onIcon, config.offIcon, config.animatedIcon,
		config.buttonState, config.layoutOrder, config.onActivated, config.isGrayedOut,
		config.isDisabled, config.isBuilderIcon, config.buttonVariant, var2
	})
end

return function(p1)
	-- upvalues: personButtonConfigsModule (ref), useDeviceOrientation (ref), robloxAppEnumsModule (ref), reactModule (ref), peopleServiceModule (ref), fFlagVoiceVolumeControlsPerUserPlayerListButton (ref), useSignalState (ref), getFFlagAddPeoplePageCardLayout (ref), muteVolumeButtonModule (ref), MemoizedButton (ref), view (ref)
	local var1 = personButtonConfigsModule(p1.userId)
	local var2 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait
	local var3 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("FocusNavigationService")
	end, {})
	local var4 = if fFlagVoiceVolumeControlsPerUserPlayerListButton then reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("Constants")
	end, {}) else nil
	local var5 = if fFlagVoiceVolumeControlsPerUserPlayerListButton then useSignalState((if fFlagVoiceVolumeControlsPerUserPlayerListButton then reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleVoiceChatStore")
	end, {}) else nil).getShowVolumeControl) else false
	local var6 = reactModule.useRef({})
	local var7 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var6 (ref)
		if p2 then
			var6.current[p3] = p2
			
			return
		end
		var6.current[p3] = nil
	end, {})
	local var8 = reactModule.useMemo(function()
		-- upvalues: getFFlagAddPeoplePageCardLayout (copy), var1 (ref)
		local t = {}
		
		if getFFlagAddPeoplePageCardLayout() then
			for i, v in var1 do
				if v.shouldShow() then
					table.insert(t, v.id)
				end
			end
		else
			for i, v in ipairs(var1) do
				if v.shouldShow() then
					table.insert(t, v.id)
				end
			end
		end
		table.sort(t)
		
		return table.concat(t, ",")
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), var6 (ref), var5 (ref), var4 (ref), getFFlagAddPeoplePageCardLayout (copy), var1 (ref), p1 (ref), var3 (ref)
		local t = {}
		
		if fFlagVoiceVolumeControlsPerUserPlayerListButton then
			local function _(p2)
				-- upvalues: var6 (copy), t (ref), var5 (copy), var4 (copy)
				if not p2.shouldShow() then return end
				local id = var6.current[p2.id]
				
				if id then
					table.insert(t, id)
				end
				if var5 and p2.id == var4.PERSON_BUTTONS.MUTE_PLAYER then
					local var9 = var6.current[p2.id .. "_volume"]
					
					if var9 then
						table.insert(t, var9)
					end
				end
			end
			
			if getFFlagAddPeoplePageCardLayout() then
				for i, v in var1 do
					if v.shouldShow() then
						local id = var6.current[v.id]
						
						if id then
							table.insert(t, id)
						end
						if var5 and v.id == var4.PERSON_BUTTONS.MUTE_PLAYER then
							local var9 = var6.current[v.id .. "_volume"]
							
							if var9 then
								table.insert(t, var9)
							end
						end
					end
				end
			else
				for i, v in ipairs(var1) do
					if v.shouldShow() then
						local id = var6.current[v.id]
						
						if id then
							table.insert(t, id)
						end
						if var5 and v.id == var4.PERSON_BUTTONS.MUTE_PLAYER then
							local var10 = var6.current[v.id .. "_volume"]
							
							if var10 then
								table.insert(t, var10)
							end
						end
					end
				end
			end
		elseif getFFlagAddPeoplePageCardLayout() then
			for i, v in var1 do
				if v.shouldShow() then
					local id = var6.current[v.id]
					
					if id then
						table.insert(t, id)
					end
				end
			end
		else
			for i, v in ipairs(var1) do
				if v.shouldShow() then
					local id = var6.current[v.id]
					
					if id then
						table.insert(t, id)
					end
				end
			end
		end
		if #t > 0 then
			table.sort(t, function(p2, p3)
				return p2.LayoutOrder < p3.LayoutOrder
			end)
			var3.registerButtonRow(p1.userId, t, p1.index or 0)
		end
	end, if fFlagVoiceVolumeControlsPerUserPlayerListButton then {
		p1.userId,
		p1.index,
		var3,
		var8,
		var5
	} else { p1.userId, p1.index, var3, var8 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), p1 (ref)
		return function()
			-- upvalues: var3 (copy), p1 (copy)
			var3.handlePersonRemoved(p1.userId)
			var3.unregisterButtonRow(p1.userId)
		end
	end, { p1.userId, var3 })
	local var11 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), p1 (ref)
		return var3.hasSelectablePlatformButton(p1.userId)
	end, { p1.userId, var3 })
	local var12 = reactModule.useMemo(function()
		-- upvalues: var11 (ref)
		return if var11 then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop
	end, { var11 })
	
	if not reactModule.useMemo(function()
		-- upvalues: getFFlagAddPeoplePageCardLayout (copy), var1 (ref)
		if getFFlagAddPeoplePageCardLayout() then
			for i, v in var1 do
				if v.shouldShow() then
					return true
				end
			end
		else
			for i, v in ipairs(var1) do
				if v.shouldShow() then
					return true
				end
			end
		end
		return false
	end, { var1 }) then
		return nil
	end
	local t = {}
	
	if getFFlagAddPeoplePageCardLayout() then
		for i, v in var1 do
			if v.shouldShow() then
				if fFlagVoiceVolumeControlsPerUserPlayerListButton and var5 and v.id == var4.PERSON_BUTTONS.MUTE_PLAYER then
					table.insert(t, reactModule.createElement(muteVolumeButtonModule, {
						key = v.id,
						config = v,
						userId = p1.userId,
						entryPoint = var4.ANALYTICS.ENTRY_POINT.PEOPLE_LIST,
						muteButtonName = v.id,
						volumeButtonName = v.id .. "_volume",
						onButtonMount = var7
					}))
				else
					table.insert(t, reactModule.createElement(MemoizedButton, {
						key = v.id,
						config = v,
						buttonId = v.id,
						onButtonMount = var7
					}))
				end
			end
		end
	else
		for i, v in ipairs(var1) do
			if v.shouldShow() then
				if fFlagVoiceVolumeControlsPerUserPlayerListButton and var5 and v.id == var4.PERSON_BUTTONS.MUTE_PLAYER then
					table.insert(t, reactModule.createElement(muteVolumeButtonModule, {
						key = v.id,
						config = v,
						userId = p1.userId,
						entryPoint = var4.ANALYTICS.ENTRY_POINT.PEOPLE_LIST,
						muteButtonName = v.id,
						volumeButtonName = v.id .. "_volume",
						onButtonMount = var7
					}))
				else
					table.insert(t, reactModule.createElement(MemoizedButton, {
						key = v.id,
						config = v,
						buttonId = v.id,
						onButtonMount = var7
					}))
				end
			end
		end
	end
	return reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = {
			["auto-xy row"] = true,
			["gap-small"] = var2,
			["gap-medium"] = not var2
		},
		selectionGroup = {
			SelectionBehaviorLeft = var12,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}, t)
end