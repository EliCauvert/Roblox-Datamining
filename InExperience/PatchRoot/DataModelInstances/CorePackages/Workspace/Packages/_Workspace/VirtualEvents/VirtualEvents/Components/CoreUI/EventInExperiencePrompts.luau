local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local UseStateFunction = ReactModule.useState
local PromptConnectionsModule = require(Parent.Components.CoreUI.PromptConnections)
local FocusNavigationUtilsModule = require(Parent1.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FixFocusWhenInGameMenuIsOpen = game:DefineFastFlag("FixFocusWhenInGameMenuIsOpen", false)
local config = {
	PromptRsvp = require(Parent.Components.CoreUI.RsvpPrompt)
}

return function(p1) --[[ Line: 52 ]]
	-- upvalues: UseStateFunction (copy), ReactModule (copy), CryoModule (copy), config (copy), FixFocusWhenInGameMenuIsOpen (copy), GuiService (copy), PromptConnectionsModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction({ promptType = nil, promptData = nil, promptQueue = {} })
	local PromptData = UseStateResult.promptData
	local PromptType = UseStateResult.promptType
	local UseResult = ReactModule.useCallback(function() --[[ Line: 62 ]]
		-- upvalues: CryoModule (upval), UseStateResult (copy), UseStateResult2 (copy)
		if CryoModule.isEmpty(UseStateResult.promptQueue) then
			UseStateResult2({ promptType = nil, promptData = {}, promptQueue = {} })
			
			return
		else
			UseStateResult2(CryoModule.Dictionary.join(UseStateResult, {
				promptType = UseStateResult.promptQueue[1].promptType,
				promptData = UseStateResult.promptQueue[1].promptData,
				promptQueue = CryoModule.List.removeIndex(UseStateResult.promptQueue, 1)
			}))
		end
	end, { UseStateResult, UseStateResult2 })
	local Element = nil
	
	if PromptType then
		local Entry = config[PromptType]
		
		if Entry then
			Element = ReactModule.createElement(Entry, {
				enableInputDelayed = p1.enableInputDelayed,
				promptData = PromptData,
				closePrompt = UseResult,
				overrideUseWideMode = p1.overrideUseWideMode
			})
		else
			error(`Unexpected prompt type: {PromptType}!`)
		end
	end
	local UseResult1 = ReactModule.useCallback(function(EventId, EventDetails) --[[ Line: 93 ]]
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), CryoModule (upval)
		if UseStateResult.promptType == nil then
			UseStateResult2({
				promptType = "PromptRsvp",
				promptData = { eventId = EventId, eventDetails = EventDetails },
				promptQueue = {}
			})
			
			return
		else
			UseStateResult2(CryoModule.Dictionary.join(UseStateResult, {
				promptQueue = CryoModule.List.join(UseStateResult.promptQueue, {
					{
						promptType = "PromptRsvp",
						promptData = { eventId = EventId, eventDetails = EventDetails }
					}
				})
			}))
		end
	end, { UseStateResult, UseStateResult2 })
	local v1 = nil
	local UseStateResult2_1 = nil
	
	if FixFocusWhenInGameMenuIsOpen then
		v1, UseStateResult2_1 = ReactModule.useState(GuiService.MenuIsOpen)
		ReactModule.useEffect(function() --[[ Line: 123 ]]
			-- upvalues: Element (ref), UseStateResult2_1 (ref), GuiService (upval)
			if not Element then return end
			UseStateResult2_1(GuiService.MenuIsOpen)
			local MenuOpenedConnection = GuiService.MenuOpened:Connect(function() --[[ Line: 131 ]]
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(true)
			end)
			local MenuClosedConnection = GuiService.MenuClosed:Connect(function() --[[ Line: 134 ]]
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(false)
			end)
			
			return function() --[[ Line: 137 ]]
				-- upvalues: MenuOpenedConnection (copy), MenuClosedConnection (copy)
				MenuOpenedConnection:Disconnect()
				MenuClosedConnection:Disconnect()
			end
		end, { Element })
	end
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		PromptConnections = ReactModule.createElement(PromptConnectionsModule, { openRsvpPrompt = UseResult1, closePrompt = UseResult }),
		FocusNavigationCoreScriptsWrapper = if Element then ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay,
			isFocusable = if FixFocusWhenInGameMenuIsOpen then not v1 else nil
		}, { Prompt = Element }) else nil
	})
end