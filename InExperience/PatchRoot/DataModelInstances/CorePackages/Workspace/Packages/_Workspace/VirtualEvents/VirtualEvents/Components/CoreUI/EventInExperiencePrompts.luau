local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local useState = reactModule.useState
local promptConnectionsModule = require(parent.Components.CoreUI.PromptConnections)
local rsvpPromptModule = require(parent.Components.CoreUI.RsvpPrompt)
local focusNavigationUtilsModule = require(parent_1.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local fixFocusWhenInGameMenuIsOpen = game:DefineFastFlag("FixFocusWhenInGameMenuIsOpen", false)
local _ = { PromptRsvp = "PromptRsvp" }
local t = { PromptRsvp = rsvpPromptModule }

return function(p0) --[[ line: 52 ]]
	-- upvalues: useState (ref), reactModule (ref), cryoModule (ref), t (ref), fixFocusWhenInGameMenuIsOpen (ref), guiService (ref), promptConnectionsModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var8, var9 = useState({ promptType = nil, promptData = nil, promptQueue = {} })
	local promptData = var8.promptData
	local promptType = var8.promptType
	local var10 = reactModule.useCallback(function() --[[ line: 62 ]]
		-- upvalues: cryoModule (copy), var8 (ref), var9 (ref)
		if cryoModule.isEmpty(var8.promptQueue) then
			var9({ promptType = nil, promptData = {}, promptQueue = {} })
			
			return
		end
		var9(cryoModule.Dictionary.join(var8, {
			promptType = var8.promptQueue[1].promptType,
			promptData = var8.promptQueue[1].promptData,
			promptQueue = cryoModule.List.removeIndex(var8.promptQueue, 1)
		}))
	end, { var8, var9 })
	local var11 = nil
	
	if promptType then
		local var12 = t[promptType]
		
		if var12 then
			var11 = reactModule.createElement(var12, {
				enableInputDelayed = p0.enableInputDelayed,
				promptData = promptData,
				closePrompt = var10,
				overrideUseWideMode = p0.overrideUseWideMode
			})
		else
			error(`Unexpected prompt type: {promptType}!`)
		end
	end
	local var13 = reactModule.useCallback(function(p1, p2) --[[ line: 93 ]]
		-- upvalues: var8 (ref), var9 (ref), cryoModule (copy)
		if var8.promptType == nil then
			var9({
				promptType = "PromptRsvp",
				promptData = { eventId = p1, eventDetails = p2 },
				promptQueue = {}
			})
			
			return
		end
		var9(cryoModule.Dictionary.join(var8, {
			promptQueue = cryoModule.List.join(var8.promptQueue, {
				{
					promptType = "PromptRsvp",
					promptData = { eventId = p1, eventDetails = p2 }
				}
			})
		}))
	end, { var8, var9 })
	local var14 = nil
	local _ = nil
	
	if fixFocusWhenInGameMenuIsOpen then
		local var15, var16 = reactModule.useState(guiService.MenuIsOpen)
		var14 = var15
		local var17 = var16
		reactModule.useEffect(function() --[[ line: 123 ]]
			-- upvalues: var11 (write), var17 (write), guiService (copy)
			if var11 then
				var17(guiService.MenuIsOpen)
				local menuOpenedConnection = guiService.MenuOpened:Connect(function() --[[ line: 131 ]]
					-- upvalues: var17 (copy)
					var17(true)
				end)
				local menuClosedConnection = guiService.MenuClosed:Connect(function() --[[ line: 134 ]]
					-- upvalues: var17 (copy)
					var17(false)
				end)
				
				return function() --[[ line: 137 ]]
					-- upvalues: menuOpenedConnection (ref), menuClosedConnection (ref)
					menuOpenedConnection:Disconnect()
					menuClosedConnection:Disconnect()
				end
			end
		end, { var11 })
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		PromptConnections = reactModule.createElement(promptConnectionsModule, { openRsvpPrompt = var13, closePrompt = var10 }),
		FocusNavigationCoreScriptsWrapper = if var11 then reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
			isFocusable = if fixFocusWhenInGameMenuIsOpen then not var14 else nil
		}, { Prompt = var11 }) else nil
	})
end