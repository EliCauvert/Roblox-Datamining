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

local function MemoizedButton(p0)
	-- upvalues: getFFlagAddPeoplePageCardLayout (ref), reactModule (ref), peopleServiceModule (ref), personButtonModule (ref)
	local config = p0.config
	local var12 = if getFFlagAddPeoplePageCardLayout() then reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("Constants")
	end, {}) else nil
	local var13 = reactModule.useCallback(function(p1)
		-- upvalues: p0 (ref)
		p0.onButtonMount(p1, p0.buttonId)
	end, { p0.onButtonMount })
	local var14 = if getFFlagAddPeoplePageCardLayout() then reactModule.useCallback(function()
		-- upvalues: config (ref), var12 (ref)
		if config.id == var12.PERSON_BUTTONS.BLOCK_PLAYER then
			config.onActivated("ingame_menu")
			
			return
		elseif config.id == var12.PERSON_BUTTONS.REPORT_PLAYER then
			config.onActivated("MenuPlayerList")
			
			return
		end
		config.onActivated(var12.ANALYTICS.ENTRY_POINT.PEOPLE_LIST)
	end, { config.id, config.onActivated }) else nil
	
	return reactModule.useMemo(function()
		-- upvalues: reactModule (copy), personButtonModule (copy), config (ref), getFFlagAddPeoplePageCardLayout (copy), var14 (ref), var13 (ref)
		return reactModule.createElement(personButtonModule, {
			text = config.text,
			icon = { on = config.onIcon, off = config.offIcon },
			animatedIcon = config.animatedIcon,
			buttonState = config.buttonState,
			LayoutOrder = config.layoutOrder,
			onActivated = if getFFlagAddPeoplePageCardLayout() then var14 else config.onActivated,
			isGrayedOut = config.isGrayedOut,
			isDisabled = config.isDisabled,
			isBuilderIcon = config.isBuilderIcon,
			buttonVariant = config.buttonVariant,
			onMount = var13
		})
	end, {
		config.text, config.onIcon, config.offIcon, config.animatedIcon,
		config.buttonState, config.layoutOrder, config.onActivated, config.isGrayedOut,
		config.isDisabled, config.isBuilderIcon, config.buttonVariant, var13
	})
end

return function(p2)
	-- upvalues: personButtonConfigsModule (ref), useDeviceOrientation (ref), robloxAppEnumsModule (ref), reactModule (ref), peopleServiceModule (ref), fFlagVoiceVolumeControlsPerUserPlayerListButton (ref), useSignalState (ref), getFFlagAddPeoplePageCardLayout (ref), muteVolumeButtonModule (ref), MemoizedButton (ref), view (ref)
	local var15 = personButtonConfigsModule(p2.userId)
	local var16 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait
	local var17 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("FocusNavigationService")
	end, {})
	local var18 = if fFlagVoiceVolumeControlsPerUserPlayerListButton then reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("Constants")
	end, {}) else nil
	local var19 = if fFlagVoiceVolumeControlsPerUserPlayerListButton then useSignalState((if fFlagVoiceVolumeControlsPerUserPlayerListButton then reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleVoiceChatStore")
	end, {}) else nil).getShowVolumeControl) else false
	local var20 = reactModule.useRef({})
	local var21 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var20 (ref)
		if p3 then
			var20.current[p4] = p3
			
			return
		end
		var20.current[p4] = nil
	end, {})
	local var22 = reactModule.useMemo(function()
		-- upvalues: getFFlagAddPeoplePageCardLayout (copy), var15 (ref)
		local t = {}
		
		if getFFlagAddPeoplePageCardLayout() then
			for i, v in var15 do
				if v.shouldShow() then
					table.insert(t, v.id)
				end
			end
		else
			for i, v in ipairs(var15) do
				if v.shouldShow() then
					table.insert(t, v.id)
				end
			end
		end
		table.sort(t)
		
		return table.concat(t, ",")
	end, { var15 })
	reactModule.useEffect(function()
		-- upvalues: fFlagVoiceVolumeControlsPerUserPlayerListButton (copy), var20 (ref), var19 (ref), var18 (ref), getFFlagAddPeoplePageCardLayout (copy), var15 (ref), p2 (ref), var17 (ref)
		local t = {}
		
		if fFlagVoiceVolumeControlsPerUserPlayerListButton then
			local function _(p5)
				-- upvalues: var20 (copy), t (ref), var19 (copy), var18 (copy)
				if not p5.shouldShow() then return end
				local id = var20.current[p5.id]
				
				if id then
					table.insert(t, id)
				end
				if var19 and p5.id == var18.PERSON_BUTTONS.MUTE_PLAYER then
					local var30 = var20.current[p5.id .. "_volume"]
					
					if var30 then
						table.insert(t, var30)
					end
				end
			end
			
			if getFFlagAddPeoplePageCardLayout() then
				for i, v in var15 do
					if v.shouldShow() then
						local id = var20.current[v.id]
						
						if id then
							table.insert(t, id)
						end
						if var19 and v.id == var18.PERSON_BUTTONS.MUTE_PLAYER then
							local var28 = var20.current[v.id .. "_volume"]
							
							if var28 then
								table.insert(t, var28)
							end
						end
					end
				end
			else
				for i, v in ipairs(var15) do
					if v.shouldShow() then
						local id = var20.current[v.id]
						
						if id then
							table.insert(t, id)
						end
						if var19 and v.id == var18.PERSON_BUTTONS.MUTE_PLAYER then
							local var29 = var20.current[v.id .. "_volume"]
							
							if var29 then
								table.insert(t, var29)
							end
						end
					end
				end
			end
		elseif getFFlagAddPeoplePageCardLayout() then
			for i, v in var15 do
				if v.shouldShow() then
					local id = var20.current[v.id]
					
					if id then
						table.insert(t, id)
					end
				end
			end
		else
			for i, v in ipairs(var15) do
				if v.shouldShow() then
					local id = var20.current[v.id]
					
					if id then
						table.insert(t, id)
					end
				end
			end
		end
		if #t > 0 then
			table.sort(t, function(p6, p7)
				return p6.LayoutOrder < p7.LayoutOrder
			end)
			var17.registerButtonRow(p2.userId, t, p2.index or 0)
		end
	end, if fFlagVoiceVolumeControlsPerUserPlayerListButton then {
		p2.userId,
		p2.index,
		var17,
		var22,
		var19
	} else { p2.userId, p2.index, var17, var22 })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), p2 (ref)
		return function()
			-- upvalues: var17 (copy), p2 (copy)
			var17.handlePersonRemoved(p2.userId)
			var17.unregisterButtonRow(p2.userId)
		end
	end, { p2.userId, var17 })
	local var23 = reactModule.useMemo(function()
		-- upvalues: var17 (ref), p2 (ref)
		return var17.hasSelectablePlatformButton(p2.userId)
	end, { p2.userId, var17 })
	local var24 = reactModule.useMemo(function()
		-- upvalues: var23 (ref)
		return if var23 then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop
	end, { var23 })
	
	if not reactModule.useMemo(function()
		-- upvalues: getFFlagAddPeoplePageCardLayout (copy), var15 (ref)
		if getFFlagAddPeoplePageCardLayout() then
			for i, v in var15 do
				if v.shouldShow() then
					return true
				end
			end
		else
			for i, v in ipairs(var15) do
				if v.shouldShow() then
					return true
				end
			end
		end
		return false
	end, { var15 }) then
		return nil
	end
	local t = {}
	
	if getFFlagAddPeoplePageCardLayout() then
		for i, v in var15 do
			if v.shouldShow() then
				if fFlagVoiceVolumeControlsPerUserPlayerListButton and var19 and v.id == var18.PERSON_BUTTONS.MUTE_PLAYER then
					table.insert(t, reactModule.createElement(muteVolumeButtonModule, {
						key = v.id,
						config = v,
						userId = p2.userId,
						entryPoint = var18.ANALYTICS.ENTRY_POINT.PEOPLE_LIST,
						muteButtonName = v.id,
						volumeButtonName = v.id .. "_volume",
						onButtonMount = var21
					}))
				else
					table.insert(t, reactModule.createElement(MemoizedButton, {
						key = v.id,
						config = v,
						buttonId = v.id,
						onButtonMount = var21
					}))
				end
			end
		end
	else
		for i, v in ipairs(var15) do
			if v.shouldShow() then
				if fFlagVoiceVolumeControlsPerUserPlayerListButton and var19 and v.id == var18.PERSON_BUTTONS.MUTE_PLAYER then
					table.insert(t, reactModule.createElement(muteVolumeButtonModule, {
						key = v.id,
						config = v,
						userId = p2.userId,
						entryPoint = var18.ANALYTICS.ENTRY_POINT.PEOPLE_LIST,
						muteButtonName = v.id,
						volumeButtonName = v.id .. "_volume",
						onButtonMount = var21
					}))
				else
					table.insert(t, reactModule.createElement(MemoizedButton, {
						key = v.id,
						config = v,
						buttonId = v.id,
						onButtonMount = var21
					}))
				end
			end
		end
	end
	return reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = {
			["auto-xy row"] = true,
			["gap-small"] = var16,
			["gap-medium"] = not var16
		},
		selectionGroup = {
			SelectionBehaviorLeft = var24,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}, t)
end