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

return function(p1)
	-- upvalues: useState (ref), reactModule (ref), cryoModule (ref), t (ref), fixFocusWhenInGameMenuIsOpen (ref), guiService (ref), promptConnectionsModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var1, var2 = useState({ promptType = nil, promptData = nil, promptQueue = {} })
	local promptData = var1.promptData
	local promptType = var1.promptType
	local var3 = reactModule.useCallback(function()
		-- upvalues: cryoModule (copy), var1 (ref), var2 (ref)
		if cryoModule.isEmpty(var1.promptQueue) then
			var2({ promptType = nil, promptData = {}, promptQueue = {} })
			
			return
		end
		var2(cryoModule.Dictionary.join(var1, {
			promptType = var1.promptQueue[1].promptType,
			promptData = var1.promptQueue[1].promptData,
			promptQueue = cryoModule.List.removeIndex(var1.promptQueue, 1)
		}))
	end, { var1, var2 })
	local var4 = nil
	
	if promptType then
		local var5 = t[promptType]
		
		if var5 then
			var4 = reactModule.createElement(var5, {
				enableInputDelayed = p1.enableInputDelayed,
				promptData = promptData,
				closePrompt = var3,
				overrideUseWideMode = p1.overrideUseWideMode
			})
		else
			error(`Unexpected prompt type: {promptType}!`)
		end
	end
	local var6 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var1 (ref), var2 (ref), cryoModule (copy)
		if var1.promptType == nil then
			var2({
				promptType = "PromptRsvp",
				promptData = { eventId = p2, eventDetails = p3 },
				promptQueue = {}
			})
			
			return
		end
		var2(cryoModule.Dictionary.join(var1, {
			promptQueue = cryoModule.List.join(var1.promptQueue, {
				{
					promptType = "PromptRsvp",
					promptData = { eventId = p2, eventDetails = p3 }
				}
			})
		}))
	end, { var1, var2 })
	local var7 = nil
	local _ = nil
	
	if fixFocusWhenInGameMenuIsOpen then
		local var8, var9 = reactModule.useState(guiService.MenuIsOpen)
		var7 = var8
		local var10 = var9
		reactModule.useEffect(function()
			-- upvalues: var4 (write), var10 (write), guiService (copy)
			if var4 then
				var10(guiService.MenuIsOpen)
				local menuOpenedConnection = guiService.MenuOpened:Connect(function()
					-- upvalues: var10 (copy)
					var10(true)
				end)
				local menuClosedConnection = guiService.MenuClosed:Connect(function()
					-- upvalues: var10 (copy)
					var10(false)
				end)
				
				return function()
					-- upvalues: menuOpenedConnection (ref), menuClosedConnection (ref)
					menuOpenedConnection:Disconnect()
					menuClosedConnection:Disconnect()
				end
			end
		end, { var4 })
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		PromptConnections = reactModule.createElement(promptConnectionsModule, { openRsvpPrompt = var6, closePrompt = var3 }),
		FocusNavigationCoreScriptsWrapper = if var4 then reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
			isFocusable = if fixFocusWhenInGameMenuIsOpen then not var7 else nil
		}, { Prompt = var4 }) else nil
	})
end